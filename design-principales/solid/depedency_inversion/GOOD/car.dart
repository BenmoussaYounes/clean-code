abstract class Engine {
  void start();
}

class MechanicalEngine implements Engine {
  void start() {
    print('Engine started');
  }
}

class ElectricEngine implements Engine {
  void start() {
    print('Electric engine started');
  }
}

class Car {
  final Engine _engine;
  Car(this._engine); // Dependency Injection

  void start() {
    _engine.start();
    print('Car started');
  }
}

void main() {
  final Car car = Car(MechanicalEngine());
  car.start();
}
