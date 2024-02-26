/*
Inheritance is a mechanism in which one class acquires the properties and behavior of another class.
- the class that is inherited from is called the superclass or parent class
- the class that inherits is called the subclass or child class

In Dart, a class can inherit from another class using the extends keyword.
- a subclass inherits all the fields and methods of the superclass
- a subclass can override methods and properties of the superclass
- a subclass can also have its own fields and methods

The syntax for inheritance is:
class Subclass extends Superclass {
  fields and methods
}
*/
class animal {
  void breathe() {
    print('breathing...');
  }
}

class mammal extends animal {
  void walk() {
    print('walking...');
  }
}

class fish extends animal {
  void swim() {
    print('swimming...');
  }
}

// The mammal class inherits the breathe method from the animal class.
// The fish class also inherits the breathe method from the animal class.
// The mammal class has its own walk method, and the fish class has its own swim method.

// The following example demonstrates inheritance in Dart:
class Person {
  String name;
  int _age;

  Person(this.name, this._age);

  // methods

  void showName() {
    print(name);
  }

  void showAge() {
    print(_age);
  }
}

class Employee extends Person {
  String company;

  Employee(String name, int age, this.company) : super(name, age);

  void showCompany() {
    print(company);
  }

  void showAge() {
    print('My Age is : $_age');
  }
}

void main() {
  var employee = Employee('Alice', 25, 'Google');
  employee.showName();
  employee.showAge();
  employee.showCompany();

  // A c = B();
  // c.showA();

  B b = B();
  b.showA();
}

class A {
  A() {
    print('A Constructor');
  }
  // Indirect Super class ( for c )
  int a = 10;
  void showA() {
    print('A');
  }
}

class B extends A {
  B() {}
  // Direct Super class ( for c )
  void showB() {
    print('B');
    super.showA(); // calling super class method
    this.a = 20;
    super.a = 30; // GOOD PRACTICE
  }

  // Overriding method there is no need to use @override
  void showA() {
    print('B');
  }
}

class C extends B {
  C() {}
  // Sub class
  void showC() {
    print('C');
  }
}
