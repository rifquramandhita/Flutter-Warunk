part of 'merchant_shell_bloc.dart';

class MerchantShellState {
  final int currentIndex;
  final int waitingOrderCount;

  const MerchantShellState({
    this.currentIndex = 0,
    this.waitingOrderCount = 0,
  });

  MerchantShellState copyWith({
    int? currentIndex,
    int? waitingOrderCount,
  }) =>
      MerchantShellState(
        currentIndex: currentIndex ?? this.currentIndex,
        waitingOrderCount: waitingOrderCount ?? this.waitingOrderCount,
      );
}
