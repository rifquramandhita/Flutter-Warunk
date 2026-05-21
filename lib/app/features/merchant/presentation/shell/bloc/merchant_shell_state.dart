part of 'merchant_shell_bloc.dart';

class MerchantShellState {
  final int currentIndex;
  const MerchantShellState({this.currentIndex = 0});

  MerchantShellState copyWith({int? currentIndex}) =>
      MerchantShellState(currentIndex: currentIndex ?? this.currentIndex);
}
