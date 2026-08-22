import 'package:equatable/equatable.dart';

class SalesProfilState extends Equatable {
  final bool isLoading;
  final String? errorMessage;

  const SalesProfilState({
    this.isLoading = false,
    this.errorMessage,
  });

  SalesProfilState copyWith({
    bool? isLoading,
    String? errorMessage,
  }) {
    return SalesProfilState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [isLoading, errorMessage];
}
