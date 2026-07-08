abstract class CustomerSearchEvent {}

class CustomerSearchQuerySubmitted extends CustomerSearchEvent {
  final String query;
  CustomerSearchQuerySubmitted(this.query);
}

class CustomerSearchQueryCleared extends CustomerSearchEvent {}

class CustomerSearchFilterRemoved extends CustomerSearchEvent {
  final String filter;
  CustomerSearchFilterRemoved(this.filter);
}

class CustomerSearchShowAllMerchantsToggled extends CustomerSearchEvent {}
