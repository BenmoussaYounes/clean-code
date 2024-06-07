abstract class Animal {
  void eat();
  void sleep();
}

abstract class FlyableAnimal implements Animal {
  void fly();
}

abstract class SwimmableAnimal implements Animal {
  void swim();
}

class Dog implements Animal {
  @override
  void eat() {
    print('Dog is eating');
  }

  @override
  void sleep() {
    print('Dog is sleeping');
  }
}

class Bird implements FlyableAnimal {
  @override
  void eat() {
    print('Bird is eating');
  }

  @override
  void sleep() {
    print('Bird is sleeping');
  }

  @override
  void fly() {
    print('Bird is flying');
  }
}

class Fish implements Animal, SwimmableAnimal {
  @override
  void eat() {
    print('Fish is eating');
  }

  @override
  void sleep() {
    print('Fish is sleeping');
  }

  @override
  void swim() {
    print('Fish is swimming');
  }
}
