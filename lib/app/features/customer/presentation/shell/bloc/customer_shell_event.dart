part of 'customer_shell_bloc.dart';

sealed class CustomerShellEvent {}

final class CustomerShellTabChanged extends CustomerShellEvent {
  final int index;
  CustomerShellTabChanged(this.index);
}
