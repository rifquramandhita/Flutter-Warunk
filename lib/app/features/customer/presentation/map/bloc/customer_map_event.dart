import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_merchant.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_merchant_category.dart';

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

class CustomerMapSelectedStoreChanged extends CustomerMapEvent {
  final CustomerMerchantEntity? store;
  CustomerMapSelectedStoreChanged(this.store);
}

class CustomerMapMarkerInitialized extends CustomerMapEvent {
  final BitmapDescriptor marker;
  CustomerMapMarkerInitialized(this.marker);
}

class CustomerMapCategorySelected extends CustomerMapEvent {
  final CustomerMerchantCategoryEntity? category;
  CustomerMapCategorySelected(this.category);
}

class CustomerMapDistanceSelected extends CustomerMapEvent {
  final double distance;
  CustomerMapDistanceSelected(this.distance);
}
