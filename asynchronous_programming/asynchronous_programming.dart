// ** Link of Documentation https://dart.dev/libraries/async/async-await
// **Why asynchronous code matters
// 
// Asynchronous operations let your program complete work while waiting for another operation to finish. 
// Here are some common asynchronous operations:

// Fetching data over a network.
// Writing to a database.
// Reading data from a file.
// Such asynchronous computations usually provide their result as a Future or, 
//if the result has multiple parts, as a Stream. 
//These computations introduce asynchrony into a program. To accommodate that initial asynchrony, 
//other plain Dart functions also need to become asynchronous.


// ** Key terms
//? synchronous operation: A synchronous operation blocks other operations from executing until it completes.
//? synchronous function: A synchronous function only performs synchronous operations.
//? asynchronous operation: Once initiated, an asynchronous operation allows other operations to execute before it completes.
//? asynchronous function: An asynchronous function performs at least one asynchronous operation and can also perform synchronous operations.