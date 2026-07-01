import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:warunk/app/features/auth/domain/use_case/auth_logout_use_case.dart';
import 'package:warunk/core/bloc/auth/auth_bloc.dart';
import 'auth_logout_event.dart';
import 'auth_logout_state.dart';

class AuthLogoutBloc extends Bloc<AuthLogoutEvent, AuthLogoutState> {
  final AuthBloc _authBloc;
  final AuthLogoutUseCase _useCase;

  AuthLogoutBloc({
    required AuthBloc authBloc,
    required AuthLogoutUseCase useCase,
  }) : _authBloc = authBloc,
       _useCase = useCase,
       super(const AuthLogoutState()) {
    on<AuthLogoutEventLogout>(_onLogoutSubmitted);
  }

  Future<void> _onLogoutSubmitted(
    AuthLogoutEventLogout event,
    Emitter<AuthLogoutState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    try {
      final googleSignIn = GoogleSignIn();
      await googleSignIn.signOut();
    } catch (_) {}

    final response = await _useCase();

    // Selalu paksa isSuccess = true agar user tetap bisa logout meskipun hit API gagal (token expired, masalah koneksi, dsb)
    emit(state.copyWith(isLoading: false, isSuccess: true));
    _authBloc.add(AuthEventCheck());
  }
}
