// GOOD Example
abstract class Car {
  void start();

  void stop();
}

class Engine {
  void turnOn() {
    // Turn on the engine
  }

  void turnOff() {
    // Turn off the engine
  }
}

class GasCar implements Car {
  Engine _engine;
  GasCar(this._engine);
  @override
  void start() {
    _engine.turnOn();
  }

  @override
  void stop() {
    _engine.turnOff();
  }
}

class ElectricalMotor {
  void turnOn() {
    // Turn on the electric engine
  }

  void turnOff() {
    // Turn off the electric engine
  }
}

class ElectricCar implements Car {
  ElectricalMotor _motor;
  ElectricCar(this._motor);
  @override
  void start() {
    _motor.turnOn();
  }

  @override
  void stop() {
    _motor.turnOff();
  }
}
