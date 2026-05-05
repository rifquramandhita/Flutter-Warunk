
abstract class CustomerProfileEvent {}

class CustomerLoadProfile extends CustomerProfileEvent {}

class CustomerUpdateProfileField extends CustomerProfileEvent {
  final String field;
  final String value;
  CustomerUpdateProfileField(this.field, this.value);
}

class CustomerSaveProfile extends CustomerProfileEvent {}
