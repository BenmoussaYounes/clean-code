void main() {
  // when initializing a variable with a value, the type is inferred
  var name = 'Ali';
  print("type of name: ${typeOf(name)}");

  // when initializing a variable without a value, the type is dynamic
  var dynamicName;

  dynamicName = 12;
  print("type of dynamicName: ${typeOf(dynamicName)}");

  dynamicName = 12.0;
  print("type of dynamicName: ${typeOf(dynamicName)}");

  dynamicName = true;
  print("type of dynamicName: ${typeOf(dynamicName)}");
}

String typeOf(var value) {
  if (value is String) {
    return 'String';
  } else if (value is int) {
    return 'int';
  } else if (value is double) {
    return 'double';
  } else if (value is bool) {
    return 'bool';
  } else if (value is List) {
    return 'List';
  } else if (value is Map) {
    return 'Map';
  } else if (value is Set) {
    return 'Set';
  } else if (value is Function) {
    return 'Function';
  } else if (value == Null) {
    return 'Null';
  } else {
    return 'Unknown';
  }
}
