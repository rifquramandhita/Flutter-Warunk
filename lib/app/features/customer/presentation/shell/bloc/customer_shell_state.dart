part of 'customer_shell_bloc.dart';

final class CustomerShellState extends Equatable {
  final bool isLoading;
  final String? errorMessage;
  final int currentIndex;
  final int cartCount;

  const CustomerShellState({
    this.isLoading = false,
    this.errorMessage,
    this.currentIndex = 0,
    this.cartCount = 0,
  });

  CustomerShellState copyWith({
    bool? isLoading,
    String? errorMessage,
    int? currentIndex,
    int? cartCount,
  }) {
    return CustomerShellState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      currentIndex: currentIndex ?? this.currentIndex,
      cartCount: cartCount ?? this.cartCount,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    errorMessage,
    currentIndex,
    cartCount,
  ];
}
