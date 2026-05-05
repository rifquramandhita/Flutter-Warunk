
abstract class CustomerAddressEvent {}

class CustomerLoadAddresses extends CustomerAddressEvent {}

class CustomerSelectAddress extends CustomerAddressEvent {
  final String id;
  CustomerSelectAddress(this.id);
}
