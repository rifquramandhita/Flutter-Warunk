abstract class CustomerAddressEvent {}

class CustomerAddressEventLoadAddresses extends CustomerAddressEvent {}

class CustomerAddressEventSetDefaultAddress extends CustomerAddressEvent {
  final String id;
  CustomerAddressEventSetDefaultAddress(this.id);
}
