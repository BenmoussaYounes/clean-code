/*
* * What is a future?

# A future (lower case "f") is an instance of the Future (capitalized "F") class. A future represents the result
 of an asynchronous operation, and can have two states: uncompleted or completed.

Uncompleted is a Dart term referring to the state of a future before it has produced a value.

Uncompleted
When you call an asynchronous function, it returns an uncompleted future. 
That future is waiting for the function's asynchronous operation to finish or to throw an error

Completed
If the asynchronous operation succeeds, the future completes with a value. Otherwise, it completes with an error.

# Completing with a value
A future of type Future<T> completes with a value of type T. For example, a future with type Future<String> produces a string value. If a future doesn't produce a usable value, then the future's type is Future<void>.

# Completing with an error
If the asynchronous operation performed by the function fails for any reason, the future completes with an error.


* Quick review
? A Future<T> instance produces a value of type T.
? If a future doesn't produce a usable value, then the future's type is Future<void>.
? A future can be in one of two states: uncompleted or completed.
? When you call a function that returns a future, the function queues up work to be done and returns an uncompleted future.
? When a future's operation finishes, the future completes with a value or with an error.
* Key terms:

Future: the Dart Future class.
future: an instance of the Dart Future class.

* Working with futures: async and await
#
The async and await keywords provide a declarative way to define asynchronous functions and use their results.
Remember these two basic guidelines when using async and await:

* To define an async function, add async before the function body:
? The await keyword works only in async functions.

* Key terms
? async: You can use the async keyword before a function's body to mark it as asynchronous.
? async function: An async function is a function labeled with the async keyword.
? await: You can use the await keyword to get the completed result of an asynchronous expression.The await keyword only works within an async function.

! Execution flow with async and await
#
An async function runs synchronously until the first await keyword. This means that within an async function body,
 all synchronous code before the first await keyword executes immediately.
*/
