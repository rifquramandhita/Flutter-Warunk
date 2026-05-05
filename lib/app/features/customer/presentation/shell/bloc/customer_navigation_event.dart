part of 'customer_navigation_bloc.dart';

sealed class CustomerNavigationEvent {}

final class CustomerNavigationTabChanged extends CustomerNavigationEvent {
  final int index;
  CustomerNavigationTabChanged(this.index);
}
