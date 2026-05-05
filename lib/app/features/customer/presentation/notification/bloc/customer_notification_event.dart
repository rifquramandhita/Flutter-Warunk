part of 'customer_notification_bloc.dart';

abstract class CustomerNotificationEvent {}

class CustomerNotificationTabChanged extends CustomerNotificationEvent {
  final int tab;
  CustomerNotificationTabChanged(this.tab);
}

class CustomerNotificationRead extends CustomerNotificationEvent {
  final String id;
  CustomerNotificationRead(this.id);
}

class CustomerNotificationMarkAllRead extends CustomerNotificationEvent {}
