part of 'sales_shell_bloc.dart';

abstract class SalesShellEvent extends Equatable {
  const SalesShellEvent();

  @override
  List<Object> get props => [];
}

class SalesShellTabChanged extends SalesShellEvent {
  final int index;
  const SalesShellTabChanged(this.index);

  @override
  List<Object> get props => [index];
}
