/*
Generics are a way to make the code more reusable and type-safe.
Generics allow you to define a class, function, or interface that can work with any data type.
Generics are used to create reusable components that can work with any data type and provide type safety.

*/

void main() {
  // BAD
  double doubleValue = eitherIntOrDoubleBAD(WhatToReturn.double) as double;
  int intValue = eitherIntOrDoubleBAD(WhatToReturn.int) as int;

  // GOOD
  print(doTypeMatch(4, 1.5));
  print(doTypeMatch(4, ''));
  print(doTypeMatch(4, 4));

  double a = eitherIntOrdDouble();
  int b = eitherIntOrdDouble();

  sum add = (num a, num b) => a + b;
}

// BAD

enum WhatToReturn { int, double }

num eitherIntOrDoubleBAD(WhatToReturn whatToReturn) {
  switch (whatToReturn) {
    case WhatToReturn.int:
      print('This is an integer');
      return 1;
    case WhatToReturn.double:
      print('This is a double');
      return 1.0;
  }
}

// Example 1: Generic Function
// A generic function is a function that can work with any data type.
// The syntax for a generic function is to use angle brackets (<>) to define the type parameter.
// The type parameter is a placeholder for the actual data type.

// Here is an examples of generic functions:

bool doTypeMatch<L, R>(L l, R r) => L == R;

T eitherIntOrdDouble<T extends num>() {
  switch (T) {
    case int:
      print('This is an integer');
      return 1 as T;
    case double:
      print('This is a double');
      return 1.0 as T;

    default:
      print("This is not a number");
      return 0 as T;
  }
}

typedef sum<T extends num> = T Function(T, T);
