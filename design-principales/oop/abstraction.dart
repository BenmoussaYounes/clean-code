/*
Abstraction is a process of hiding the implementation details and showing only functionality to the user.
Abstraction can be achieved with either abstract classes or interfaces (or both).
An abstract class is a class that cannot be instantiated, and is used to define the structure of a class.
An interface is a reference type in Dart, similar to a class, that is used to achieve full abstraction.
An interface is a contract that defines the signature of the functionality. 
A class that implements an interface must implement all the methods and properties defined in the interface.

*/

abstract class Person {
  noAbstractMethod() {
    print("Person is walking");
  }

  abstractMethod();
}

class Kid extends Person {
  abstractMethod() {
    print("Kid is walking");
  }
}

// to implement an interface, use the implements keyword
// Person class is considered as an interface
class Adult implements Person {
  noAbstractMethod() {
    print("Adult is walking");
  }

  abstractMethod() {
    print("Adult is walking");
  }
}

void main() {
  Kid kid = Kid();
  kid.abstractMethod();
  kid.noAbstractMethod();

  Adult adult = Adult();
  adult.abstractMethod();
  adult.noAbstractMethod();

  // we can not create an instance of an abstract class
  // Person person = Person(); // Error
}
