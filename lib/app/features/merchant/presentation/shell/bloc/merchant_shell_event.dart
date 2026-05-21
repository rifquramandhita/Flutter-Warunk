part of 'merchant_shell_bloc.dart';

sealed class MerchantShellEvent {}

class MerchantShellEventTabChanged extends MerchantShellEvent {
  final int index;
  MerchantShellEventTabChanged(this.index);
}
