class Dog {
  void makeSound() {
    print('Bark');
  }
}

class Cat {
  void makeSound() {
    print('Meow');
  }
}

class Cow {
  void makeSound() {
    print('Moo');
  }
}

class MakeAnimalsSound {
  void makeSound(List<dynamic> animals) {
    for (var animal in animals) {
      if (animal is Dog) {
        animal.makeSound();
      } else if (animal is Cat) {
        animal.makeSound();
      } else if (animal is Cow) {
        animal.makeSound();
      }
    }
  }
}

void main() {
  var makeAnimalsSound = MakeAnimalsSound();
  makeAnimalsSound.makeSound([Dog(), Cat(), Cow()]);
}
