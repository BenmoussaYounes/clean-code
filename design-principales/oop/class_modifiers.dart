/*
# abstract
- To define a class that doesn't require a full, concrete implementation of its entire interface
# Base 
- can not use implements keyword with it 
# interface 
- can inherit from it ( no usage of extends / with )
# final
- can not be inherited or implement (no usage of extends / with / implements)
# sealed 
- can not be inherited ( no usage of extends/ implements ) outside of its library (file...)
 create a known, enumerable set of subtypes, use the sealed modifier. 
 This allows you to create a switch over those subtypes that is statically ensured to be exhaustive.

# mixin
A mixin declaration defines a mixin. A class declaration defines a class. 
A mixin class declaration defines a class that is usable as both a regular class and a mixin,
 with the same name and the same type.

 dart doc : https://dart.dev/language/class-modifiers#no-modifier
*/

abstract class Animal {
  void makeSound();

  void move() {
    print('The animal moves.');
  }
}

class Cat extends Animal {
  void makeSound() {
    print('Meow!');
  }
}

//

base class Vehicle {
  void drive() {
    print('The vehicle drives.');
  }
}

base class Car extends Vehicle {
  void honk() {
    print('Beep beep!');
  }
}

//

interface class Shape {
  void draw() {
    print('The shape is drawn.');
  } // cant be extended outside of its library (file...)
}

class Circle implements Shape {
  void draw() {
    print('The circle is drawn.');
  }
}

//

final class Human {
  void draw() {
    print('The shape is drawn.');
  }
} // cant be extended outside of its library (file...)

//

sealed class job {
  int salary;
  job(this.salary);
}

class teacher extends job {
  teacher(int salary) : super(salary);
}

class engineer implements job {
  int salary;
  engineer(this.salary);
}

String getJob(job job) {
  return switch (job) {
    teacher() => 'teaching',
    engineer() => 'engineering',
  };
}

//

abstract mixin class Musician {
  // No 'on' clause, but an abstract method that other types must define if
  // they want to use (mix in or extend) Musician:
  void playInstrument(String instrumentName);

  void playPiano() {
    playInstrument('Piano');
  }

  void playFlute() {
    playInstrument('Flute');
  }
}

class Virtuoso with Musician {
  // Use Musician as a mixin
  void playInstrument(String instrumentName) {
    print('Plays the $instrumentName beautifully');
  }
}

class Novice extends Musician {
  // Use Musician as a class
  void playInstrument(String instrumentName) {
    print('Plays the $instrumentName poorly');
  }
}
