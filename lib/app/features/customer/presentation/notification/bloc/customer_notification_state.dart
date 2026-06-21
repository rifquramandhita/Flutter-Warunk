part of 'customer_notification_bloc.dart';

class CustomerNotificationState extends Equatable {
  final List<CustomerNotifItemEntity> items;
  final bool isLoading;
  final String? errorMessage;

  int get unreadCount => items.where((n) => !n.isRead).length;

  const CustomerNotificationState({
    required this.items,
    this.isLoading = false,
    this.errorMessage,
  });

  CustomerNotificationState copyWith({
    List<CustomerNotifItemEntity>? items,
    bool? isLoading,
    String? errorMessage,
  }) =>
      CustomerNotificationState(
        items: items ?? this.items,
        isLoading: isLoading ?? this.isLoading,
        errorMessage: errorMessage,
      );

  @override
  List<Object?> get props => [items, isLoading, errorMessage];
}
