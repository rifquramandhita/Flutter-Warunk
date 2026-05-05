part of 'merchant_navigation_bloc.dart';

sealed class MerchantNavigationEvent {}

class MerchantNavigationTabChanged extends MerchantNavigationEvent {
  final int index;
  MerchantNavigationTabChanged(this.index);
}
