class MechanicalEngine {
  void start() {
    print('Engine started');
  }
}

class Car {
  final MechanicalEngine _engine = MechanicalEngine();

  void start() {
    _engine.start();
    print('Car started');
  }
}
