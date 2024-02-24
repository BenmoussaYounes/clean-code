/* Object Oriented Programming (OOP)

OOP is a programming paradigm that uses objects and classes
OOP focuses on the objects that interact with one another
With OOP, we can model real-world entities as objects and classes in our code 

OOP is based on the following principles:
1. Encapsulation: the process of hiding the internal details of an object
2. Abstraction: the process of hiding the complex implementation of an object
3. Inheritance: the process of creating new classes from existing classes
4. Polymorphism: the process of using a single interface to represent different data types

class is a blueprint for creating objects
- object is an instance of a class
- class members include fields (properties) and methods (functions)
- fields are variables that hold data
- methods are functions that perform actions
- class members can be public, private, or protected


Constructors
- a special method that is called when an object is created
- used to initialize the object's fields
- if a class does not have a constructor, Dart provides a default constructor
- a class can have multiple constructors
- a constructor can be named or unnamed
- a named constructor is used to create multiple constructors in a class
- a constructor can be used to initialize the object's fields
- a constructor can be used to perform other tasks when an object is created
- a constructor can be used to create a constant object
- a constructor can be used to create a factory object
*/

class Person {
  // a class can have fields (properties) and methods (functions)

  // attributes (fields) - properties
  String name;
  int age;

  // static field
  static int count = 0;

  // default constructor
  Person({required this.name, required this.age}) {
    count++;
  }

  // behavior (methods) - functions
  void sayHello() {
    print('Hello, my name is $name');
  }

  void showAge() {
    print('I am $age years old');
  }
}

void main() {
  // create an object of the Person class
  // on the creation it called on object
  var person1 = Person(name: 'Alice', age: 25);

  // when we call the object it called an instance of the class
  person1.sayHello();
  person1.showAge();

  // create another object of the Person class
  var person2 = Person(name: 'Bob', age: 30);
  person2.sayHello();
  person2.showAge();
}
