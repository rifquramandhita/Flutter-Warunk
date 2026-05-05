part of 'customer_navigation_bloc.dart';

final class CustomerNavigationState extends Equatable {
  final bool isLoading;
  final String? errorMessage;
  final int currentIndex;

  const CustomerNavigationState({
    this.isLoading = false,
    this.errorMessage,
    this.currentIndex = 0,
  });

  CustomerNavigationState copyWith({
    bool? isLoading,
    String? errorMessage,
    int? currentIndex,
  }) {
    return CustomerNavigationState(
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
