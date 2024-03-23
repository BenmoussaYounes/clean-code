// BAD EXAMPLE
abstract class Car {
  void turnOnEngine();
  void accelerate();
  void turnOffEngine();
}

class GasCar implements Car {
  @override
  void turnOnEngine() {
    // Turn on the gas engine
  }

  @override
  void accelerate() {
    // Accelerate the gas car
    // VRUM VRUM
  }

  @override
  void turnOffEngine() {
    // Turn off the gas engine
  }
}

class ElectricCar implements Car {
  @override
  void turnOnEngine() {
    throw UnimplementedError();
  }

  @override
  void accelerate() {
    // Electric cars accelerate differently than gas cars
  }

  @override
  void turnOffEngine() {
    throw UnimplementedError();
  }
}
