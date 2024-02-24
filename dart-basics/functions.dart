void main() {
  //  note
  // function sum(int a, int b){ } a and b are parameters
  // sum(5, 3); 5 and 3 are arguments

  // when a function is defined inside another function, it is called a nested function
  // when a function is passed as an argument to another function, it is called a callback function
  // when a function returns another function, it is called a closure

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

  // closure
  Function makeAdder(int addBy) {
    return (int i) => i + addBy;
  }

  Function add2 = makeAdder(2);
  print(add2(3)); // 5

  // function as a variable
  Function greetFunction2 = upperName;
  print(greetFunction2('Ali'));
}
