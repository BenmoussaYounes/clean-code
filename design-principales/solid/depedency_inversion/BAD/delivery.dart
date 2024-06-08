class DeliveryDriver {
  void deliver() {
    print('Delivering the package');
  }
}

class DeliveryCompany {
  // Coupling with DeliveryDriver
  final DeliveryDriver _driver = DeliveryDriver(); // Dependency

  void deliverPackage() {
    _driver.deliver();
  }
}
