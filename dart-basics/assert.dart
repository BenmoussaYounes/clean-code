/*
Assert is used to check if a condition is true. If the condition is false, the program will throw an exception.
*/

void main() {
  var x = 10;
  assert(x == 10);
  print('x is $x');

  int a = 9;
  assert(a > 10, 'Value of a should be greater than 10');
  print("Value of a is $a");
}
