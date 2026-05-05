part of 'merchant_navigation_bloc.dart';

class MerchantNavigationState {
  final int currentIndex;
  const MerchantNavigationState({this.currentIndex = 0});

  MerchantNavigationState copyWith({int? currentIndex}) =>
      MerchantNavigationState(currentIndex: currentIndex ?? this.currentIndex);
}
