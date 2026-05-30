abstract class CustomerAddressEvent {}

class CustomerAddressEventLoadAddresses extends CustomerAddressEvent {}

class CustomerAddressEventSelectAddress extends CustomerAddressEvent {
  final String id;
  CustomerAddressEventSelectAddress(this.id);
}
