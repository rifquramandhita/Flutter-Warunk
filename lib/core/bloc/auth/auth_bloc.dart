import 'package:equatable/equatable.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/merchant/presentation/shell/bloc/merchant_shell_bloc.dart';
import 'package:warunk/core/constants/constant.dart';
import 'package:warunk/core/dependency/dependency.dart';
import 'package:warunk/core/enum/role.dart';
import 'package:warunk/core/helper/shared_preferences_helper.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState()) {
    on<AuthEventInitial>(_onInitial);
    on<AuthEventCheck>(_onCheck);
  }

  Future<void> _onInitial(
    AuthEventInitial event,
    Emitter<AuthState> emit,
  ) async {
    await Future.delayed(const Duration(seconds: 3));
    add(AuthEventCheck());
  }

  Future<void> _onCheck(AuthEventCheck event, Emitter<AuthState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      final token = await SharedPreferencesHelper.getString(PREF_AUTH);
      if (token != null && token.isNotEmpty) {
        final name = await SharedPreferencesHelper.getString(PREF_NAME) ?? '';
        final email = await SharedPreferencesHelper.getString(PREF_EMAIL) ?? '';
        final photoUrl =
            await SharedPreferencesHelper.getString(PREF_PHOTO) ?? '';
        final role = await SharedPreferencesHelper.getString(PREF_ROLE) ?? '';

        if (!kDebugMode) {
          if (email.isNotEmpty) {
            await FirebaseCrashlytics.instance.setUserIdentifier(email);
          }
          await FirebaseCrashlytics.instance.setCustomKey('name', name);
          await FirebaseCrashlytics.instance.setCustomKey('email', email);
          await FirebaseCrashlytics.instance.setCustomKey('role', role);
        }

        emit(
          state.copyWith(
            name: name,
            email: email,
            photoUrl: photoUrl,
            isAuthenticated: true,
            isLoading: false,
            role: RoleEnum.fromString(role),
          ),
        );
      } else {
        if (!kDebugMode) {
          await FirebaseCrashlytics.instance.setUserIdentifier('');
        }
        if (sl.isRegistered<MerchantShellBloc>()) {
          sl<MerchantShellBloc>().add(MerchantShellEventReset());
        }
        emit(
          state.copyWith(
            isAuthenticated: false,
            isLoading: false,
            role: RoleEnum.customer,
          ),
        );
        emit(state.copyWith(isAuthenticated: false, isLoading: false));
      }
    } catch (_) {
      if (!kDebugMode) {
        await FirebaseCrashlytics.instance.setUserIdentifier('');
      }
      emit(
        state.copyWith(
          isAuthenticated: false,
          isLoading: false,
          role: RoleEnum.customer,
        ),
      );
    }
  }
}
