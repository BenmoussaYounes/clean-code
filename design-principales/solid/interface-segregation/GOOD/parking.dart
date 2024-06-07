abstract class ParkingLot {
  void parkCar();
  void unParkCar();
}

class FreeParking extends ParkingLot {
  @override
  void parkCar() {
    print('Car is parked');
  }

  @override
  void unParkCar() {
    print('Car is unparked');
  }
}

abstract class PaidParking extends ParkingLot {
  void doPayment();
  int calculateFee();
}

class HourlyPaidParking extends PaidParking {
  @override
  int calculateFee() {
    return 10;
  }

  @override
  void doPayment() {
    print('Payment done');
  }

  @override
  void parkCar() {
    print('Car is parked');
  }

  @override
  void unParkCar() {
    print('Car is unparked');
  }
}

class MonthlyPaidParking extends PaidParking {
  @override
  int calculateFee() {
    return 200;
  }

  @override
  void doPayment() {
    print('Payment done');
  }

  @override
  void parkCar() {
    print('Car is parked');
  }

  @override
  void unParkCar() {
    print('Car is unparked');
  }
}
