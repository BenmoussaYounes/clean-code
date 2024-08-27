//! Asynchronous programming: Streams
//* Streams provide an asynchronous sequence of data.
//* Data sequences include user-generated events and data read from files.
//* You can process a stream using either await for or listen() from the Stream API.
//* Streams provide a way to respond to errors.
//* There are two kinds of streams: single subscription or broadcast.

// A stream is a sequence of asynchronous events. It is like an asynchronous Iterable—where,
// instead of getting the next event when you ask for it,
// the stream tells you that there is an event when it is ready.

//! Receiving stream events
//  the asynchronous for loop (commonly just called await for) iterates over the events of a stream like the for loop iterates over an Iterable

// Future<int> sumStream(Stream<int> stream) async {
//   var sum = 0;
//   await for (final int value in stream) {
//     sum += value;
//   }
//   return sum;
// }

// This code simply receives each event of a stream of integer events, adds them up, and returns (a future of) the sum.
// When the loop body ends, the function is paused until the next event arrives or the stream is done.

Future<int> sumStream(Stream<int> stream) async {
  var sum = 0;
  await for (final value in stream) {
    sum += value;
  }
  return sum;
}

Stream<int> countStream(int to) async* {
  // The async* keyword is used to specify that the function is a generator.
  for (int i = 1; i <= to; i++) {
    yield i;
  }
}

// void main() async {
//   var stream = countStream(10);
//   var sum = await sumStream(stream);
//   print(sum); // 55
// }

//! Error events
// In some cases, an error happens before the stream is done
// Streams can also deliver error events like it delivers data events.
// Most streams will stop after the first error, but it is possible to have streams that deliver more than one error, and streams that deliver more data after an error event.

// Future<int> sumStream(Stream<int> stream) async {
//   var sum = 0;
//   try {
//     await for (final value in stream) {
//       sum += value;
//     }
//   } catch (e) {
//     return -1;
//   }
//   return sum;
// }

// Stream<int> countStream(int to) async* {
//   for (int i = 1; i <= to; i++) {
//     if (i == 4) {
//       throw Exception('Intentional exception');
//     } else {
//       yield i;
//     }
//   }
// }

// void main() async {
//   var stream = countStream(10);
//   var sum = await sumStream(stream);
//   print(sum); // -1
// }

//! Working with streams
// The Stream class contains a number of helper methods that can do common operations on a stream for you, similar to the methods on an Iterable.
// For example, you can find the last positive integer in a stream using lastWhere() from the Stream API.

// Future<int> lastPositive(Stream<int> stream) =>
//     stream.lastWhere((x) => x >= 0);

//! Two kinds of streams
// There are two kinds of streams.

//! Single subscription streams
// The most common kind of stream contains a sequence of events that are parts of a larger whole.
// Events need to be delivered in the correct order and without missing any of them.
//  This is the kind of stream you get when you read a file or receive a web request.

// Such a stream can only be listened to once. Listening again later could mean missing out on initial events, and then the rest of the stream makes no sense.
// When you start listening, the data will be fetched and provided in chunks.

//! Broadcast streams
// The other kind of stream is intended for individual messages that can be handled one at a time. This kind of stream can be used for mouse events in a browser, for example.
// You can start listening to such a stream at any time, and you get the events that are fired while you listen.
// More than one listener can listen at the same time, and you can listen again later after canceling a previous subscription.

//! Methods that process a stream

// The Stream class contains a number of helper methods that can do common operations on a stream for you, similar to the methods on an Iterable.
// except drain() and pipe()
// we also have methods that modify the stream, like map(), where(), expand(), and reduce().

//! handleError() function

// the first error reaching the loops will end the loop and its subscription on the stream. There is no recovering from that.
// The following code shows how to use handleError() to remove errors from a stream before using it in an await for loop.

Stream<S> mapLogErrors<S, T>(
  Stream<T> stream,
  S Function(T event) convert,
) async* {
  var streamWithoutErrors = stream.handleError((e) => print(e));
  await for (final event in streamWithoutErrors) {
    yield convert(event);
  }
}

//! The transform() function

// The transform() function is not just for error handling; it is a more generalized "map" for streams. 
// A normal map requires one value for each incoming event. However, especially for I/O streams, it might take several incoming events to produce an output event. 
// A StreamTransformer can work with that. For example, decoders like Utf8Decoder are transformers. 
// A transformer requires only one function, bind(), which can be easily implemented by an async function.

//! The listen() method

// The listen() method allows you to start listening on a stream. 
// Until you do so, the stream is an inert object describing what events you want to see. 
// When you listen, a StreamSubscription object is returned which represents the active stream producing events. 
// This is similar to how an Iterable is just a collection of objects, but the iterator is the one doing the actual iteration.
