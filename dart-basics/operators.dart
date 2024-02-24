void main() {
  // 1 Arithmetic operators
  int a = 12;
  int b = 6;
  print("a + b = ${a + b}");

  print("a - b = ${a - b}");

  print("a * b = ${a * b}");

  print("a / b = ${a / b}");

  print("a ~/ b = ${a ~/ b}");

  print("a % b = ${a % b}");

  // 2 relational operators

  print("a == b = ${a == b}");

  print("a != b = ${a != b}");

  print("a > b = ${a > b}");

  print("a < b = ${a < b}");

  print("a >= b = ${a >= b}");

  print("a <= b = ${a <= b}");

  // 3 Type test operators

  var name = 'Ali';

  print("name is String: ${name is String}");

  var dynamicName;

  dynamicName = 12;
  print("dynamicName is int: ${dynamicName is int}");

  dynamicName = 12.0;
  print("dynamicName is double: ${dynamicName is double}");

  dynamicName = true;
  print("dynamicName is bool: ${dynamicName is bool}");

  // 4 Assignment operators

  int c = 12;
  int d = 6;
  c += d;
  print("c += d: $c");

  c -= d;
  print("c -= d: $c");

  c *= d;
  print("c *= d: $c");

  double c2 = 12;
  c2 /= d;
  print("c /= d: $c2");

  c ~/= d;
  print("c ~/= d: $c");

  c %= d;
  print("c %= d: $c");

  // 5 Logical operators

  bool e = true;
  bool f = false;

  print("e && f: ${e && f}");

  print("e || f: $e || $f }");

  print("!e: ${!e}");

  // 6 Bitwise and shift operators

  int g = 12;
  int h = 6;

  print("g & h: ${g & h}");

  print("g | h: ${g | h}");

  print("g ^ h: ${g ^ h}");

  print("g << h: ${g << h}");

  print("g >> h: ${g >> h}");
}
