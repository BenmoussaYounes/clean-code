void main() {
  //?  note
  //? function sum(int a, int b){ } a and b are parameters
  //? sum(5, 3); 5 and 3 are arguments

  //? when a function is defined inside another function, it is called a nested function
  //? when a function is passed as an argument to another function, it is called a callback function
  //? when a function contains references to variables (it "closes over" those variables), it is called a closure

  // function with no parameters and no return value
  void greet() {
    print('Hello');
  }

  greet();

  // function with parameters and no return value
  void greetWithName(String name) {
    print('Hello $name');
  }

  greetWithName('Ali');

  // function with parameters and return value
  int add(int a, int b) {
    return a + b;
  }

  int result = add(5, 3);
  print('The result is $result');

  // function with optional parameters
  void greetWithNameOptional(String name, [String? title]) {
    if (title != null) {
      print('Hello $title $name');
    } else {
      print('Hello $name');
    }
  }

  greetWithNameOptional('Ali');
  greetWithNameOptional('Ali', 'Mr.');

  // function with named parameters
  void greetWithNameNamed({required String name, String? title}) {
    if (title != null) {
      print('Hello $title $name');
    } else {
      print('Hello $name');
    }
  }

  greetWithNameNamed(name: 'Ali');
  greetWithNameNamed(name: 'Ali', title: 'Mr.');

  // function with default parameters
  void greetWithNameDefault({String name = 'Ali', String title = 'Mr.'}) {
    print('Hello $title $name');
  }

  greetWithNameDefault();

  // function with return type
  String upperName(String name) {
    return name.toUpperCase();
  }

  String upper = upperName('Ali');
  print('The name is $upper');

  // function with arrow syntax
  int multiply(int a, int b) => a * b;
  int result2 = multiply(5, 3);
  print('The result is $result2');

  // Higher-Order Functions
  int higherOrderFunction(int x, Function(int) function) {
    return function(x);
  }

  int result3 = higherOrderFunction(5, (int x) => x * x);

  // function as a parameter
  void printGreet(String Function(String) greetFunction, String name) {
    print(greetFunction(name));
  }

  printGreet(upperName, 'Ali');

  // function as a return value
  String Function(String) getGreet(String title) {
    return (String name) => 'Hello $title $name';
  }

  String Function(String) greetFunction = getGreet('Mr.');
  print(greetFunction('Ali'));

  // anonymous function
  List<String> names = ['Ali', 'Ahmed', 'Sara'];
  names.forEach((name) {
    print(name);
  });

  //? CLOSURE
  //? In Dart, a closure is a special kind of box called a “function”.
  //? You can put some toys (variables) inside the function
  //? and when you use the function later, it will remember those toys.

  //? Closure in JavaScript is a function that has access to the variables in the scope in which it was created
  //? This means that a closure can remember and use variables from its outer scope, even after the outer scope is no longer accessible.
  //? In Dart, a closure is a function object that has access to variables in its lexical scope, even if the function is used outside of its original scope.
  // example 1
  Function makeAdder(int addBy) {
    return (int i) => i + addBy;
  }

  Function add2 = makeAdder(2);
  print(add2(3)); // 5

  // example 2
  Function makeMultiplier(int multiplyBy) {
    return (int i) => i * multiplyBy;
  }

  Function multiplyBy3 = makeMultiplier(3);
  print(multiplyBy3(3)); // 9

  // example 3
  Function makeGreet(String title) {
    return (String name) => 'Hello $title $name';
  }

  Function greetMr = makeGreet('Mr.');
  print(greetMr('Ali')); // Hello Mr. Ali

  // example 4
  var a = "A";
  Function addA = (String b) => a + b;
  print(addA("B")); // prints "AB"

  // function as a variable
  Function greetFunction2 = upperName;
  print(greetFunction2('Ali'));
}
