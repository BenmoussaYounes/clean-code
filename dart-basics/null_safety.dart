void main() {
  // null safety
  // Null safety prevents errors that result from unintentional access of variables set to null.

  int? year; // nullable variable

  late int age; // late variable

  // Null-aware operators

  int? a; // = null
  a ??= 3;
  print(a); // <-- Prints 3.

  a ??= 5;
  print(a); // <-- Still prints 3.

  // Conditional property access
  String? name;

  print(name?.length); // <-- null
}
