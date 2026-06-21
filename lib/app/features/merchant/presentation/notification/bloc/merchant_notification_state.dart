part of 'merchant_notification_bloc.dart';

class MerchantNotificationState extends Equatable {
  final List<MerchantNotificationEntity> items;
  final bool isLoading;
  final String? errorMessage;

  int get unreadCount => items.where((n) => !n.isRead).length;

  const MerchantNotificationState({
    required this.items,
    this.isLoading = false,
    this.errorMessage,
  });

  MerchantNotificationState copyWith({
    List<MerchantNotificationEntity>? items,
    bool? isLoading,
    String? errorMessage,
  }) =>
      MerchantNotificationState(
        items: items ?? this.items,
        isLoading: isLoading ?? this.isLoading,
        errorMessage: errorMessage,
      );

  @override
  List<Object?> get props => [items, isLoading, errorMessage];
}
