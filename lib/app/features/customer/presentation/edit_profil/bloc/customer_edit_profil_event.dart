abstract class CustomerEditProfilEvent {}

class CustomerEditProfilEventLoad extends CustomerEditProfilEvent {}

class CustomerEditProfilEventNameChanged extends CustomerEditProfilEvent {
  final String value;
  CustomerEditProfilEventNameChanged(this.value);
}

class CustomerEditProfilEventEmailChanged extends CustomerEditProfilEvent {
  final String value;
  CustomerEditProfilEventEmailChanged(this.value);
}

class CustomerEditProfilEventPhoneChanged extends CustomerEditProfilEvent {
  final String value;
  CustomerEditProfilEventPhoneChanged(this.value);
}

class CustomerEditProfilEventSave extends CustomerEditProfilEvent {}

class CustomerEditProfilEventPhotoPicked extends CustomerEditProfilEvent {}
