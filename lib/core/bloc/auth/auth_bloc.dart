import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/core/constants/constant.dart';
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
    final token = await SharedPreferencesHelper.getString(PREF_AUTH);
    if (token != null && token.isNotEmpty) {
      final name = await SharedPreferencesHelper.getString(PREF_NAME) ?? '';
      final email = await SharedPreferencesHelper.getString(PREF_EMAIL) ?? '';
      final photoUrl = await SharedPreferencesHelper.getString(PREF_PHOTO) ?? '';
      emit(
        state.copyWith(
          name: name,
          email: email,
          photoUrl: photoUrl,
          isAuthenticated: true,
          isLoading: false,
        ),
      );
    } else {
      emit(state.copyWith(isAuthenticated: false, isLoading: false));
    }
  }
}
