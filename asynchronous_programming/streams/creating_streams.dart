//! Creating streams
//* Streams can be created in several ways:
//* Transforming existing streams.
//* Creating a stream from scratch by using an async* function.
//* Creating a stream by using a StreamController.

// In addition to StreamController you can instantiate a Stream directly with one of its named constructors:

//* Stream.fromFuture() Returns a stream that fires one event (whatever the Future completes to.)

//* Stream.fromIterable() Returns a stream that converts the Iterable elements to a sequence of events.

//* Stream.periodic() Returns a stream that fires a computed event periodically.

//! Transforming an existing stream

// The common case for creating streams is that you already have a stream,
// and you want to create a new stream based on the original stream's events.

import 'dart:async';

/// Splits a stream of consecutive strings into lines.
///
/// The input string is provided in smaller chunks through
/// the `source` stream.
Stream<String> lines(Stream<String> source) async* {
  // Stores any partial line from the previous chunk.
  var partial = '';
  // Wait until a new chunk is available, then process it.
  await for (final chunk in source) {
    var lines = chunk.split('\n');
    lines[0] = partial + lines[0]; // Prepend partial line.
    partial = lines.removeLast(); // Remove new partial line.
    for (final line in lines) {
      yield line; // Add lines to output stream.
    }
  }
  // Add final partial line to output stream, if any.
  if (partial.isNotEmpty) yield partial;
}

// For example, assume you have a stream, counterStream, that emits an increasing counter every second
void main() {
  var counterStream =
      Stream<int>.periodic(const Duration(seconds: 1), (x) => x).take(15);

  counterStream.forEach(print); // Print an integer every second, 15 times.

  // To transform the stream events, you can invoke a transforming method such as map() on the stream before listening to it.
  // The method returns a new stream.

  var doubleCounterStream = counterStream.map((int x) => x * 2);
  doubleCounterStream.forEach(print);
}

//! Creating a stream from scratch

// One way to create a new stream is with an asynchronous generator (async*) function.
// The stream is created when the function is called, and the function's body starts running when the stream is listened to.
// When the function returns, the stream closes.
// Until the function returns, it can emit events on the stream by using yield or yield* statements.

Stream<int> timedCounter(Duration interval, [int? maxCount]) async* {
  int i = 0;
  while (true) {
    await Future.delayed(interval);
    yield i++;
    if (i == maxCount) break;
  }
}

// This function returns a Stream. When that stream is listened to, the body starts running.
// When the listener cancels (by invoking cancel() on the StreamSubscription object returned by the listen() method),
// then the next time the body reaches a yield statement, the yield instead acts as a return statement.
// Any enclosing finally block is executed, and the function exits. If the function attempts to yield a value before exiting,
// that fails and acts as a return.

// When the function finally exits, the future returned by the cancel() method completes.
// If the function exits with an error, the future completes with that error; otherwise, it completes with null.

// Another, more useful example is a function that converts a sequence of futures to a stream:

Stream<T> streamFromFutures<T>(Iterable<Future<T>> futures) async* {
  for (final future in futures) {
    var result = await future;
    yield result;
  }
}

//! Using a StreamController

// If the events of your stream comes from different parts of your program, and not just from a stream or futures
// that can traversed by an async function, then use a StreamController to create and populate the stream.

// The following example shows a basic, though flawed, usage of StreamController to implement the
// timedCounter() function from the previous examples.
// NOTE: This implementation is FLAWED!
// It starts before it has subscribers, and it doesn't implement pause.
Stream<int> timedCounter2(Duration interval, [int? maxCount]) {
  var controller = StreamController<int>();
  int counter = 0;
  void tick(Timer timer) {
    counter++;
    controller.add(counter); // Ask stream to send counter values as event.
    if (maxCount != null && counter >= maxCount) {
      timer.cancel();
      controller.close(); // Ask stream to shut down and tell listeners.
    }
  }

  Timer.periodic(interval, tick); // BAD: Starts before it has subscribers.
  return controller.stream;
}

// As before, you can use the stream returned by timedCounter() like this:
// Stream<int> counterStream = timedCounter(const Duration(seconds: 1), 15);
// counterStream.listen(print); // Print an integer every second, 15 times.

//! This implementation of timedCounter() has a couple of problems:

// It starts producing events before it has subscribers.
// It keeps producing events even if the subscriber requests a pause.

// To fix both of these problems we need to specify callbacks such as onListen and onPause when creating the StreamController.

//! Waiting for a subscription

// As a rule, streams should wait for subscribers before starting their work. An async* function does this automatically,
// but when using a StreamController, you are in full control and can add events even when you shouldn't.

//! When a stream has no subscriber, its StreamController buffers events, which can lead to a memory leak if the stream never gets a subscriber.

void listenAfterDelay() async {
  var counterStream = timedCounter(const Duration(seconds: 1), 15);
  await Future.delayed(const Duration(seconds: 5));

  // After 5 seconds, add a listener.
  await for (final n in counterStream) {
    print(n); // Print an integer every second, 15 times.
  }
}

// When this code runs, nothing is printed for the first 5 seconds, although the stream is doing work.
// Then the listener is added, and the first 5 or so events are printed all at once, since they were buffered by the StreamController.
// To be notified of subscriptions, specify an onListen argument when you create the StreamController.

//! Honoring the pause state

// Avoid producing events when the listener has requested a pause. An async* function automatically
// pauses at a yield statement while the stream subscription is paused.
// A StreamController, on the other hand, buffers events during the pause.

void listenWithPause() {
  var counterStream = timedCounter(const Duration(seconds: 1), 15);
  late StreamSubscription<int> subscription;

  subscription = counterStream.listen((int counter) {
    print(counter); // Print an integer every second.
    if (counter == 5) {
      // After 5 ticks, pause for five seconds, then resume.
      subscription.pause(Future.delayed(const Duration(seconds: 5)));
    }
  });
}

// When the five seconds of pause are up, the events fired during that time are all received at once.
// That happens because the stream's source doesn't honor pauses and keeps adding events to the stream.

//? TO fix all this we should use the StreamController with the onListen and onPause arguments.

Stream<int> timedCounterFixed(Duration interval, [int? maxCount]) {
  late StreamController<int> controller;
  Timer? timer;
  int counter = 0;

  void tick(_) {
    counter++;
    controller.add(counter); // Ask stream to send counter values as event.
    if (counter == maxCount) {
      timer?.cancel();
      controller.close(); // Ask stream to shut down and tell listeners.
    }
  }

  void startTimer() {
    timer = Timer.periodic(interval, tick);
  }

  void stopTimer() {
    timer?.cancel();
    timer = null;
  }

  controller = StreamController<int>(
      onListen: startTimer,
      onPause: stopTimer,
      onResume: startTimer,
      onCancel: stopTimer);

  return controller.stream;
}

// You must use all of the listeners—onListen, onCancel, onPause, and onResume—to be notified of changes in pause state. 
// The reason is that if the subscription and pause states both change at the same time, only the onListen or onCancel callback is called.

//! Final hints
//? for more infos check : https://dart.dev/libraries/async/creating-streams#using-a-streamcontroller