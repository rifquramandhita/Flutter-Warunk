part of 'customer_home_bloc.dart';

final class CustomerHomeState extends Equatable {
  final bool isLoading;
  final String? errorMessage;
  final int currentBanner;

  const CustomerHomeState({
    this.isLoading = false,
    this.errorMessage,
    this.currentBanner = 0,
  });

  CustomerHomeState copyWith({
    bool? isLoading,
    String? errorMessage,
    int? currentBanner,
  }) {
    return CustomerHomeState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      currentBanner: currentBanner ?? this.currentBanner,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    errorMessage,
    currentBanner,
  ];
}
