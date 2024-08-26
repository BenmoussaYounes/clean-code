// Functions that use the Future API register callbacks that handle the value (or the error) that completes a Future.
//* For example:  myFunc().then(processValue).catchError(handleError);
// Chained then() and catchError() invocations are a common pattern when dealing with Futures,
// and can be thought of as the rough equivalent of try-catch blocks.

//! Error handling within then()
//* For more granular error handling, you can register a second (onError) callback within then() to handle Futures completed with errors
//* Register the optional onError callback only if you want to differentiate between an error forwarded to then(), and an error generated within then():

//   asyncErrorFunction().then(successCallback, onError: (e) {
//   handleError(e); // Original error.
//   anotherAsyncErrorFunction(); // Oops, new error.
// }).catchError(handleError); // Error from within then() handled.

//? In the example above, asyncErrorFunction()'s Future's error is handled with the onError callback;
//? anotherAsyncErrorFunction() causes then()'s Future to complete with an error; this error is handled by catchError().

//! Errors in the middle of a long chain
//   one() // Future completes with "from one".
//       .then((_) => two()) // Future completes with two()'s error.
//       .then((_) => three()) // Future completes with two()'s error.
//       .then((_) => four()) // Future completes with two()'s error.
//       .then((value) => value.length) // Future completes with two()'s error.
//       .catchError((e) {
//     print('Got error: $e'); // Finally, callback fires.
//     return 42; // Future completes with 42.
//   }).then((value) {
//     print('The value is $value');
//   });
// }

// Output of this program:
//   Got error: error from two
//   The value is 42

//! Handling specific errors
//* What if we want to catch a specific error? Or catch more than one error?
//* catchError() takes an optional named argument, test, that allows us to query the kind of error thrown.

// handleAuthResponse(const {'username': 'dash', 'age': 3})
//     .then((_) => ...)
//     .catchError(handleFormatException, test: (e) => e is FormatException)
//     .catchError(handleAuthorizationException,
//         test: (e) => e is AuthorizationException);

//! Async try-catch-finally using whenComplete()
//* If then().catchError() mirrors a try-catch, whenComplete() is the equivalent of 'finally'.
//* The callback registered within whenComplete() is called when whenComplete()'s receiver completes,
//* whether it does so with a value or with an error:

// final server = connectToServer();
// server
//     .post(myUrl, fields: const {'name': 'Dash', 'profession': 'mascot'})
//     .then(handleResponse)
//     .catchError(handleError)
//     .whenComplete(server.close);
//?     Future completes with the same error:
//     .then((_) => print("Won't reach here"))
//?     Error is handled here:
//     .catchError(handleError);

//! Potential problem: failing to register error handlers early
//* It is crucial that error handlers are installed before a Future completes:
//* this avoids scenarios where a Future completes with an error, the error handler is not yet attached, and the error accidentally propagates
//   Future<Object> future = asyncErrorFunction();

//!  BAD: Too late to handle asyncErrorFunction() exception.
//   Future.delayed(const Duration(milliseconds: 500), () {
//     future.then(...).catchError(...);
//   });
// }

// In the code above, catchError() is not registered until half a second after asyncErrorFunction() is called, and the error goes unhandled.
// The problem goes away if asyncErrorFunction() is called within the Future.delayed() callback:

// Future.delayed(const Duration(milliseconds: 500), () {
//   asyncErrorFunction()
//       .then(...)
//       .catchError(...); // We get here.
// });

//! Potential problem: accidentally mixing synchronous and asynchronous errors

// Future<int> parseAndRead(Map<String, dynamic> data) {
//!   final filename = obtainFilename(data); // Could throw.
//   final file = File(filename);
//   return file.readAsString().then((contents) {
//     return parseFileData(contents); // Could throw.
//   });
// }

//* Two functions in that code could potentially throw synchronously: obtainFilename() and parseFileData().
//* Because parseFileData() executes inside a then() callback, its error does not leak out of the function.
//* Instead, then()'s Future completes with parseFileData()'s error, the error eventually completes parseAndRead()'s
//* Future, and the error can be successfully handled by catchError().
//* But obtainFilename() is not called within a then() callback; if it throws, a synchronous error propagates:

// parseAndRead(data).catchError((e) {
//   print('Inside catchError');
//   print(e);
//   return -1;
// });

// Program Output:
//   Unhandled exception:
//   <error from obtainFilename>
//   ...

//! Solution: Using Future.sync() to wrap your code
// A common pattern for ensuring that no synchronous error is accidentally thrown from a function is to wrap the function body inside a new Future. sync() callback:

// Future<int> parseAndRead(Map<String, dynamic> data) {
//   return Future.sync(() {
//     final filename = obtainFilename(data); // Could throw.
//     final file = File(filename);
//     return file.readAsString().then((contents) {
//       return parseFileData(contents); // Could throw.
//     });
//   });
// }

//* If the callback returns a non-Future value, Future.sync()'s Future completes with that value.
//* If the callback throws (as it does in the example above), the Future completes with an error.
//* If the callback itself returns a Future, the value or the error of that Future completes Future.sync()'s Future.

// Future.sync() makes your code resilient against uncaught exceptions.
// If your function has a lot of code packed into it, chances are that you could be doing something dangerous without realizing it:

// Future fragileFunc() {
//   return Future.sync(() {
//     final x = someFunc(); // Unexpectedly throws in some rare cases.
//     var y = 10 / x; // x should not equal 0.
//     ...
//   });
// }

//? Future.sync() not only allows you to handle errors you know might occur,
//? but also prevents errors from accidentally leaking out of your function.

void main() {
  //? The registered callbacks fire based on the following rules: then()'s callback fires if it is invoked on a Future that completes with a value;
  //? catchError()'s callback fires if it is invoked on a Future that completes with an error.
  // Future.delayed() is a Future that completes after a specified duration.
  Future.delayed(Duration(seconds: 3), () => 42)
      .then((value) => print('The value is $value'),
          onError: (error) => print('An error occurred: $error'))
      .catchError((error) => print('An error occurred: $error'));
  // The value is 42
}
