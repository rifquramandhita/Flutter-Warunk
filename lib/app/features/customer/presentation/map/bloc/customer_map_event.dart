abstract class CustomerMapEvent {}

class CustomerLoadMapData extends CustomerMapEvent {}

class CustomerMapFilterChanged extends CustomerMapEvent {
  final String filter;
  CustomerMapFilterChanged(this.filter);
}

class CustomerMapSearchQueryChanged extends CustomerMapEvent {
  final String query;
  CustomerMapSearchQueryChanged(this.query);
}
