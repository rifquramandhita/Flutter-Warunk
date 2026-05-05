import 'package:equatable/equatable.dart';

class CustomerProfilState extends Equatable {
  final bool isLoading;
  final String? errorMessage;
  final String name;
  final String phone;
  final String location;
  final int transactionCount;
  final int voucherCount;
  final int favoriteCount;
  final int unreadNotifications;

  const CustomerProfilState({
    this.isLoading = false,
    this.errorMessage,
    this.name = '',
    this.phone = '',
    this.location = '',
    this.transactionCount = 0,
    this.voucherCount = 0,
    this.favoriteCount = 0,
    this.unreadNotifications = 0,
  });

  CustomerProfilState copyWith({
    bool? isLoading,
    String? errorMessage,
    String? name,
    String? phone,
    String? location,
    int? transactionCount,
    int? voucherCount,
    int? favoriteCount,
    int? unreadNotifications,
  }) {
    return CustomerProfilState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      location: location ?? this.location,
      transactionCount: transactionCount ?? this.transactionCount,
      voucherCount: voucherCount ?? this.voucherCount,
      favoriteCount: favoriteCount ?? this.favoriteCount,
      unreadNotifications: unreadNotifications ?? this.unreadNotifications,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    errorMessage,
    name,
    phone,
    location,
    transactionCount,
    voucherCount,
    favoriteCount,
    unreadNotifications,
  ];
}
