import 'invoice.dart';
import 'delivery_provider.dart';

class InvoiceDeliveryService {
  void deliver(Invoice invoice, DeliveryProvider deliveryProvider) {
    deliveryProvider.deliver(invoice);
  }
}
