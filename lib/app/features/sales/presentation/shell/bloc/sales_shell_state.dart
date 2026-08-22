part of 'sales_shell_bloc.dart';

class SalesShellState extends Equatable {
  final int currentIndex;

  const SalesShellState({
    this.currentIndex = 0,
  });

  SalesShellState copyWith({
    int? currentIndex,
  }) {
    return SalesShellState(
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }

  @override
  List<Object?> get props => [currentIndex];
}
