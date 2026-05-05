part of 'customer_notification_bloc.dart';

class CustomerNotificationState {
  final int selectedTab; // 0=Semua, 1=Transaksi, 2=Promo
  final List<CustomerNotifItemEntity> items;

  int get unreadCount => items.where((n) => !n.isRead).length;

  List<CustomerNotifItemEntity> get filtered {
    if (selectedTab == 1) return items.where((n) => n.type == NotifType.transaction).toList();
    if (selectedTab == 2) return items.where((n) => n.type == NotifType.promo).toList();
    return items;
  }

  const CustomerNotificationState({this.selectedTab = 0, required this.items});

  CustomerNotificationState copyWith({int? selectedTab, List<CustomerNotifItemEntity>? items}) =>
      CustomerNotificationState(
        selectedTab: selectedTab ?? this.selectedTab,
        items: items ?? this.items,
      );
}
