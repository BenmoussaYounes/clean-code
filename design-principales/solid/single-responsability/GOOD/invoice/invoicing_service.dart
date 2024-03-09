import 'delivery_provider.dart';
import 'invoice.dart';
import 'invoice_delivery_service.dart';
import 'invoice_email_delivery_provider.dart';
import 'invoice_factory.dart';
import 'order.dart';
import 'order_repository.dart';

class InvoicingService {
  generateAndSendInvoices(int orderId) {
    // find order by id
    OrderRepository orderRepository = OrderRepository();
    Order order = orderRepository.findOrderById(orderId);

    // Generate invoice
    InvoiceFactory invoiceFactory = InvoiceFactory();
    Invoice invoice = invoiceFactory.generateInvoice(order);

    // deliver invoice
    DeliveryProvider deliveryProvider = InvoiceEmailDeliveryProvider();
    InvoiceDeliveryService deliveryService = InvoiceDeliveryService();
    deliveryService.deliver(invoice, deliveryProvider);
  }
}
