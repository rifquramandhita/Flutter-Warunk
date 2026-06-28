part of 'customer_home_bloc.dart';

sealed class CustomerHomeEvent {}

final class CustomerHomeBannerChanged extends CustomerHomeEvent {
  final int index;
  CustomerHomeBannerChanged(this.index);
}

final class CustomerHomeGetCategoriesStarted extends CustomerHomeEvent {}

final class CustomerHomeGetNearbyStarted extends CustomerHomeEvent {}
