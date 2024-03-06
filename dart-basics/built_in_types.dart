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

  // record
  // A record is not a "collection type"
  // It is basically a very short and dynamic way to declare a class that holds fields and nothing else.
  // Records automatically define hashCode and == methods based on the structure of their fields.

  ({int r, int b, int g}) rgb = (r: 255, b: 255, g: 255);

  print("rgb: $rgb");
  print("rgb.r: ${rgb.r}");
  print("rgb.g: ${rgb.g}");
  print("rgb.b: ${rgb.b}");

  print("is equal to another record: ${rgb == (r: 255, b: 255, g: 255)}");
  print("is identical to another record: ${identical(rgb, (
        r: 255,
        b: 255,
        g: 255
      ))}");

  // Symbol
  // A Symbol is an immutable, non-nullable instance of the type Symbol.
  // A Symbol is used to represent an operator or identifier declared in a Dart program.
  // You might never need to use symbols, but they’re necessary for APIs that refer to identifiers by name,
  // because minification changes identifier names but not identifier symbols.

  Symbol sy1 = #main;
  Symbol sy2 = #main;
  Symbol sy3 = #notMain;

  print("sy1: $sy1");
  print("sy2: $sy2");
  print("sy1 == sy2: ${sy1 == sy2}");
  print(
      "identical(sy1, sy2): ${identical(sy1, sy2)}"); // true because symbols are immutable and equal symbols are identical
  print("sy1 == sy3: ${sy1 == sy3}");
  print(
      "identical(sy1, sy3): ${identical(sy1, sy3)}"); // false because symbols are immutable and equal symbols are identical

  // Runes
  // A Rune is an integer representing a Unicode code point.
  // In Dart, a string is a sequence of UTF-16 code units.
  // You can use the characters property to get the Unicode code points of a string.
  // You can also use the runes property to get the runes of a string.

  Runes input = new Runes('Hello, world! 👋');
  print("input: $input");
}
