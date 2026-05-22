part of 'auth_bloc.dart';

sealed class AuthEvent {}

class AuthEventInitial extends AuthEvent {}

class AuthEventCheck extends AuthEvent {}
