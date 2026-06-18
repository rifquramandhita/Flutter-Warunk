import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:warunk/app/features/auth/domain/use_case/auth_login_use_case.dart';
import 'package:warunk/core/bloc/auth/auth_bloc.dart';
import 'package:warunk/core/constants/constant.dart';
import 'package:warunk/core/helper/shared_preferences_helper.dart';
import 'package:warunk/core/enum/role.dart';
import 'auth_login_event.dart';
import 'auth_login_state.dart';

class AuthLoginBloc extends Bloc<AuthLoginEvent, AuthLoginState> {
  final AuthBloc _authBloc;
  final AuthLoginUseCase _useCase;

  AuthLoginBloc({required AuthBloc authBloc, required AuthLoginUseCase useCase})
    : _authBloc = authBloc,
      _useCase = useCase,
      super(const AuthLoginState()) {
    on<AuthEmailChanged>(_onEmailChanged);
    on<AuthPasswordChanged>(_onPasswordChanged);
    on<AuthObscurePasswordToggled>(_onObscurePasswordToggled);
    on<AuthRoleSelected>(_onRoleSelected);
    on<AuthLoginSubmitted>(_onLoginSubmitted);
    on<AuthGoogleLoginSubmitted>(_onGoogleLoginSubmitted);
  }

  void _onEmailChanged(AuthEmailChanged event, Emitter<AuthLoginState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _onPasswordChanged(
    AuthPasswordChanged event,
    Emitter<AuthLoginState> emit,
  ) {
    emit(state.copyWith(password: event.password));
  }

  void _onObscurePasswordToggled(
    AuthObscurePasswordToggled event,
    Emitter<AuthLoginState> emit,
  ) {
    emit(state.copyWith(obscurePassword: !state.obscurePassword));
  }

  void _onRoleSelected(AuthRoleSelected event, Emitter<AuthLoginState> emit) {
    emit(state.copyWith(role: event.role));
  }

  Future<void> _onLoginSubmitted(
    AuthLoginSubmitted event,
    Emitter<AuthLoginState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    final response = await _useCase(
      email: state.email,
      password: state.password,
      role: state.role.value,
    );
    if (response.success) {
      _authBloc.add(AuthEventCheck());
    } else {
      emit(state.copyWith(errorMessage: response.message));
    }

    emit(state.copyWith(isLoading: false));
  }

  Future<void> _onGoogleLoginSubmitted(
    AuthGoogleLoginSubmitted event,
    Emitter<AuthLoginState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    try {
      final googleSignIn = GoogleSignIn();
      final googleUser = await googleSignIn.signIn();

      if (googleUser != null) {
        final response = await _useCase(
          email: googleUser.email,
          password: null,
          role: state.role.value,
        );
        if (response.success) {
          _authBloc.add(AuthEventCheck());
        } else {
          emit(state.copyWith(errorMessage: response.message));
        }
      }
    } catch (e) {
      emit(state.copyWith(errorMessage: 'Gagal login dengan Google: $e'));
    }
    emit(state.copyWith(isLoading: false));
  }
}
