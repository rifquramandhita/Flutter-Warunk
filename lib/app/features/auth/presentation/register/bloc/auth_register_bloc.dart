import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/auth/domain/entity/register.dart';
import 'package:warunk/app/features/auth/domain/use_case/auth_register_use_case.dart';
import 'package:warunk/core/network/data_state.dart';
import 'auth_register_event.dart';
import 'auth_register_state.dart';

class AuthRegisterBloc extends Bloc<AuthRegisterEvent, AuthRegisterState> {
  final AuthRegisterUseCase _useCase;

  AuthRegisterBloc({required AuthRegisterUseCase useCase})
    : _useCase = useCase,
      super(const AuthRegisterState()) {
    on<AuthRegisterEventRoleSelected>(_onRoleSelected);
    on<AuthRegisterEventObscurePasswordToggled>(_onObscurePasswordToggled);
    on<AuthRegisterEventTermsToggled>(_onTermsToggled);
    on<AuthRegisterEventNameChanged>(_onNameChanged);
    on<AuthRegisterEventEmailChanged>(_onEmailChanged);
    on<AuthRegisterEventPhoneChanged>(_onPhoneChanged);
    on<AuthRegisterEventPasswordChanged>(_onPasswordChanged);
    on<AuthRegisterEventPasswordConfirmationChanged>(
      _onPasswordConfirmationChanged,
    );
    on<AuthRegisterEventSend>(_onSend);
  }

  void _onRoleSelected(
    AuthRegisterEventRoleSelected event,
    Emitter<AuthRegisterState> emit,
  ) {
    emit(state.copyWith(selectedRole: event.roleIndex, errorMessage: null));
  }

  void _onObscurePasswordToggled(
    AuthRegisterEventObscurePasswordToggled event,
    Emitter<AuthRegisterState> emit,
  ) {
    emit(
      state.copyWith(
        obscurePassword: !state.obscurePassword,
        errorMessage: null,
      ),
    );
  }

  void _onTermsToggled(
    AuthRegisterEventTermsToggled event,
    Emitter<AuthRegisterState> emit,
  ) {
    emit(state.copyWith(agreeToTerms: event.agreed, errorMessage: null));
  }

  void _onNameChanged(
    AuthRegisterEventNameChanged event,
    Emitter<AuthRegisterState> emit,
  ) {
    emit(state.copyWith(name: event.name, errorMessage: null));
  }

  void _onEmailChanged(
    AuthRegisterEventEmailChanged event,
    Emitter<AuthRegisterState> emit,
  ) {
    emit(state.copyWith(email: event.email, errorMessage: null));
  }

  void _onPhoneChanged(
    AuthRegisterEventPhoneChanged event,
    Emitter<AuthRegisterState> emit,
  ) {
    emit(state.copyWith(phone: event.phone, errorMessage: null));
  }

  void _onPasswordChanged(
    AuthRegisterEventPasswordChanged event,
    Emitter<AuthRegisterState> emit,
  ) {
    emit(state.copyWith(password: event.password, errorMessage: null));
  }

  void _onPasswordConfirmationChanged(
    AuthRegisterEventPasswordConfirmationChanged event,
    Emitter<AuthRegisterState> emit,
  ) {
    emit(
      state.copyWith(
        passwordConfirmation: event.passwordConfirmation,
        errorMessage: null,
      ),
    );
  }

  Future<void> _onSend(
    AuthRegisterEventSend event,
    Emitter<AuthRegisterState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    if (state.name.isEmpty ||
        state.email.isEmpty ||
        state.phone.isEmpty ||
        state.password.isEmpty ||
        state.passwordConfirmation.isEmpty) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: 'Semua field harus diisi',
        ),
      );
      return;
    }

    if (!state.agreeToTerms) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: 'Anda harus menyetujui Syarat & Ketentuan',
        ),
      );
      return;
    }

    if (state.password != state.passwordConfirmation) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: 'Password dan Konfirmasi Password tidak cocok',
        ),
      );
      return;
    }

    final param = RegisterSendParam(
      name: state.name,
      email: state.email,
      phone: state.phone,
      password: state.password,
      passwordConfirmation: state.passwordConfirmation,
    );

    final response = await _useCase.call(
      param: param,
      isCustomer: state.selectedRole == 0,
    );

    if (response is SuccessState) {
      emit(state.copyWith(isSuccess: true));
    } else {
      emit(state.copyWith(errorMessage: response.message));
    }
    emit(state.copyWith(isLoading: false));
  }
}
