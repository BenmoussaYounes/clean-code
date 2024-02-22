void main() {
  // Built-in types

  // int
  // int is a whole number
  int age = 12;
  print("age: $age");

  int hex = 0xDEADBEEF;

  // double
  // double is a floating-point number
  double height = 1.75;
  print("height: $height");

  double exponents = 1.42e5;

  // String
  // String is a sequence of characters
  String name = 'Ali';
  print("name: $name");

  String s1 = '''
You can create
multi-line strings like this one.
''';

  String s2 = """This is also a
multi-line string.""";

  String s = 'string interpolation';

  print('You can use $s for string interpolation.');

  // bool
  // bool is a type that represents true or false
  bool isStudent = true;
  print("isStudent: $isStudent");

  // List
  // List is a collection of items
  List<String> names = ['Ali', 'Ahmed', 'Sara'];
  print("names: $names");

  // Map
  // Map is a collection of key-value pairs
  Map<String, int> ages = {'Ali': 12, 'Ahmed': 15, 'Sara': 10};
  print("ages: $ages");

  // Set
  // Set is a collection of unique items
  Set<String> uniqueNames = {'Ali', 'Ahmed', 'Sara'};
  print("uniqueNames: $uniqueNames");

  // Function
  void printName(String name) {
    print("name: $name");
  }

  printName('Ali');

  // Null
  // Null is a type that represents the absence of a value
  int? nullableAge;
  print("nullableAge: $nullableAge");
}
