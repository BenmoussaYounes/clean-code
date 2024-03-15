abstract class Animal {
  void makeSound();
}

class Dog implements Animal {
  @override
  void makeSound() {
    print('Bark');
  }
}

class Cat implements Animal {
  @override
  void makeSound() {
    print('Meow');
  }
}

class Cow implements Animal {
  @override
  void makeSound() {
    print('Moo');
  }
}

class MakeAnimalsSound {
  void makeSound(List<Animal> animals) {
    for (var animal in animals) {
      animal.makeSound();
    }
  }
}

void main() {
  var makeAnimalsSound = MakeAnimalsSound();
  makeAnimalsSound.makeSound([Dog(), Cat(), Cow()]);
}
