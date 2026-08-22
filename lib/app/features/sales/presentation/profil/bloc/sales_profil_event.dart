import 'package:equatable/equatable.dart';

abstract class SalesProfilEvent extends Equatable {
  const SalesProfilEvent();

  @override
  List<Object> get props => [];
}

class SalesLoadProfilData extends SalesProfilEvent {}

class SalesLaunchUrlEvent extends SalesProfilEvent {
  final String url;
  const SalesLaunchUrlEvent(this.url);

  @override
  List<Object> get props => [url];
}
