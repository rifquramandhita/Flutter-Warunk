import 'package:equatable/equatable.dart';

class SalesProfilState extends Equatable {
  final bool isLoading;
  final String? errorMessage;
  final String appVersion;

  const SalesProfilState({
    this.isLoading = false,
    this.errorMessage,
    this.appVersion = '',
  });

  SalesProfilState copyWith({
    bool? isLoading,
    String? errorMessage,
    String? appVersion,
  }) {
    return SalesProfilState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      appVersion: appVersion ?? this.appVersion,
    );
  }

  @override
  List<Object?> get props => [isLoading, errorMessage, appVersion];
}
