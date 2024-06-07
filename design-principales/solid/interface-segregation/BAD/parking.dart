abstract class ParkingLot {
  void parkCar();
  void unParkCar();
  void doPayment();
  int calculateFee();
}

class FreeParking implements ParkingLot {
  @override
  int calculateFee() {
    return 0;
  }

  @override
  void doPayment() {
    throw Exception('This is a free parking');
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
