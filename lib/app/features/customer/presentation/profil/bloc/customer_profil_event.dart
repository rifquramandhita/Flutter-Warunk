
abstract class CustomerProfilEvent {}

class CustomerLoadProfilData extends CustomerProfilEvent {}

class CustomerLaunchUrlEvent extends CustomerProfilEvent {
  final String url;

  CustomerLaunchUrlEvent(this.url);
}
