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
- a class is a template for objects
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
  String _name; // private field ( access modifier _ )
  int age; // public field

  // static field
  static int count = 0;

  // default constructor
  Person(this._name, {required this.age}) {
    count++;
  }

  // named constructor
  Person.guest(this._name, {required this.age, required String role}) {
    print("Guest: $role");
    count++;
  }

  // Redirecting constructors
  Person.MVP(String name, int age, String role) : this(name, age: age);

  // behavior (methods) - functions
  void sayHello() {
    print('Hello, my name is $_name');
  }

  void showAge() {
    print('I am $age years old');
    _privateMethod();
  }

  // private method
  void _privateMethod() {
    print('This is a private method');
  }
}

void main() {
  // create an object of the Person class
  // on the creation it called on object
  var person1 = Person('Alice', age: 25);

  // when we call the object it called an instance of the class
  person1.sayHello();
  person1.showAge();

  // create another object of the Person class
  var person2 = Person('Bob', age: 30);
  person2.sayHello();
  person2.showAge();

  // create another object of the Person class
  var person3 = Person.guest('Charlie', age: 35, role: 'VIP');
  person3.sayHello();
}

/* 
Dart only have public and private members
protected Members allow : 
Accessing in the same class
Accessing in other classes of the same package
Accessing protected members of a class in its subclass in the same package
Accessing another class in a different package
Accessing in sub-class in a different package
*/