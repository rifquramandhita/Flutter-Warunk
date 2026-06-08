abstract class CustomerOrderSuccessEvent {}

class CustomerLoadOrderSuccessData extends CustomerOrderSuccessEvent {
  final String orderId;

  CustomerLoadOrderSuccessData(this.orderId);
}
