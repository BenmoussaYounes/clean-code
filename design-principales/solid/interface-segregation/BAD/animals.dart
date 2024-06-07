abstract class Animal {
  void eat();
  void sleep();
  void fly();
  void swim();
}

class Dog implements Animal {
  @override
  void eat() {
    print('Dog is eating');
  }

  @override
  void fly() {
    throw Exception('Dog cannot fly');
  }

  @override
  void sleep() {
    print('Dog is sleeping');
  }

  @override
  void swim() {
    print('Dog is swimming');
  }
}

class Bird implements Animal {
  @override
  void eat() {
    print('Bird is eating');
  }

  @override
  void fly() {
    print('Bird is flying');
  }

  @override
  void sleep() {
    print('Bird is sleeping');
  }

  @override
  void swim() {
    throw Exception('Bird cannot swim');
  }
}

class Fish implements Animal {
  @override
  void eat() {
    print('Fish is eating');
  }

  @override
  void fly() {
    throw Exception('Fish cannot fly');
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
