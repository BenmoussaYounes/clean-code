/*
Polymorphism in Dart refers to the ability of objects of different classes to be treated as objects of a common superclass. 
It allows you to write code that can work with objects of different types, as long as they share a common interface or superclass.

Polymorphism is a Greek word that means "many-shaped"
*/
class Animal {
  void makeSound() {
    print('The animal makes a sound.');
  }
}

class Cat extends Animal {
  @override
  void makeSound() {
    print('Meow!');
  }
}

class Dog extends Animal {
  // there is no need to use @override for overriding methods in Dart
  void makeSound() {
    print('Woof!');
  }
}

/* 

OverLoading is Method with the same name but different signature.
with signature, we refer to the number of parameters and the type of parameters.
*/

class Bird {
  void fly() {
    print('The bird is flying.');
  }

  //! Unfortunately Dart does not support method overloading like Java or C++ :(
  // void fly(int height) {
  //   print('The bird is flying at $height feet.');
  // }
}

void main() {
  List<Animal> animals = [Cat(), Dog()];

  for (Animal animal in animals) {
    animal.makeSound(); // output: Meow! Woof!
  }
}
