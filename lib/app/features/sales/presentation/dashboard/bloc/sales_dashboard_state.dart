part of 'sales_dashboard_bloc.dart';

class SalesDashboardState extends Equatable {
  final bool isLoading;
  final String? errorMessage;
  final SalesDashboardEntity? data;

  const SalesDashboardState({
    this.isLoading = false,
    this.errorMessage,
    this.data,
  });

  SalesDashboardState copyWith({
    bool? isLoading,
    String? errorMessage,
    SalesDashboardEntity? data,
  }) {
    return SalesDashboardState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage, // Do not use fallback to allow resetting error
      data: data ?? this.data,
    );
  }

  @override
  List<Object?> get props => [isLoading, errorMessage, data];
}
