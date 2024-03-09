import 'invoice.dart';

abstract class DeliveryProvider {
  void deliver(Invoice invoice);
}
