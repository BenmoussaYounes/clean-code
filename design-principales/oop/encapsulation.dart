/* 
Encapsulation is the process of hiding the internal state of an object and requiring all interactions to be performed through an object's methods.
attributes of class will be hidden (private)
can be accessed using public methods ( getters and setters )
by default attributes should be private only if you do not have a reason to make them public or protected

What is getters and setters?
- Getters and setters are special methods that provide read and write access to an object's properties.
- Dart has the keywords get and set to define getters and setters.
- Getter is the method that read the value of field & act as the accessor.
- Setter is the method that write the value of field & act as the mutator.

Use of getters and setters:
- Validating input for a field.
- Setting or getting a computed property.
- make the field read-only. ( private field with only getter)
- make the code clean & simplified operations on object's properties.
*/

void main() {
  Student ali = Student('ali', 25);
  print(ali.studentName); // ali
  ali.studentName = 'ali ben';
  print(ali.studentName); // ali ben
}

class Student {
  String _name;
  int _age;

  Student(this._name, this._age);

  // getter
  String get studentName => _name;
  int get studentAge => _age;
  // setter
  set studentName(String name) => this._name = name;
  set studentAge(int age) => this._age = age;
}
