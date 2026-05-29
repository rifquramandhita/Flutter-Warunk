part of 'customer_shell_bloc.dart';

final class CustomerShellState extends Equatable {
  final bool isLoading;
  final String? errorMessage;
  final int currentIndex;

  const CustomerShellState({
    this.isLoading = false,
    this.errorMessage,
    this.currentIndex = 0,
  });

  CustomerShellState copyWith({
    bool? isLoading,
    String? errorMessage,
    int? currentIndex,
  }) {
    return CustomerShellState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    errorMessage,
    currentIndex,
  ];
}
