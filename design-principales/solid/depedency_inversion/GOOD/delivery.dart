abstract class Delivery {
  void deliver();
}

class DeliveryDriver implements Delivery {
  void deliver() {
    print('Delivering the package');
  }
}

class DeliveryDrone implements Delivery {
  void deliver() {
    print('Flying the package to the destination');
  }
}

class DeliveryCompany {
  final Delivery _delivery;

  DeliveryCompany(this._delivery);

  void deliverPackage() {
    _delivery.deliver();
  }
}

void main() {
  final DeliveryCompany deliveryCompany = DeliveryCompany(DeliveryDriver());
  deliveryCompany.deliverPackage();
}
