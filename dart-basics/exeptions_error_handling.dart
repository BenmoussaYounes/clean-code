void main() {
  int result = divide(12, 6);
  print("The result is $result");

  String name = upperName('Ali');
  print("The name is $name");

  // example of an unhandled exception
  int result2 = divide(12, 0);
  print("The result is $result2");

  String name2 = upperName(12);
  print("The name is $name2");
}

int divide(int a, int b) {
  try {
    return a ~/ b;
  } on UnsupportedError {
    print('Unsupported operation');
  } catch (error) {
    print("an error occurred: $error");
  } finally {
    // can be used for shared handling code
    print('This will always run');
    return 0;
  }
}

String upperName(var name) {
  try {
    return name.toUpperCase();
  } on NoSuchMethodError {
    print('No such method');
  } catch (error) {
    print("an error occurred: $error");
  } finally {
    return '';
  }
}
