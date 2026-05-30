import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_profil_update_param.dart';
import 'package:warunk/app/features/customer/domain/use_case/customer_profil_update_use_case.dart';
import 'package:warunk/core/helper/shared_preferences_helper.dart';
import 'package:warunk/core/constants/constant.dart';
import 'customer_edit_profil_event.dart';
import 'customer_edit_profil_state.dart';

class CustomerEditProfilBloc
    extends Bloc<CustomerEditProfilEvent, CustomerEditProfilState> {
  final CustomerProfilUpdateUseCase _updateUseCase;

  CustomerEditProfilBloc({required CustomerProfilUpdateUseCase updateUseCase})
    : _updateUseCase = updateUseCase,
      super(const CustomerEditProfilState()) {
    on<CustomerEditProfilEventLoad>(_onLoad);
    on<CustomerEditProfilEventNameChanged>(_onNameChanged);
    on<CustomerEditProfilEventEmailChanged>(_onEmailChanged);
    on<CustomerEditProfilEventPhoneChanged>(_onPhoneChanged);
    on<CustomerEditProfilEventPhotoPicked>(_onPhotoPicked);
    on<CustomerEditProfilEventSave>(_onSave);
  }

  Future<void> _onLoad(
    CustomerEditProfilEventLoad event,
    Emitter<CustomerEditProfilState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    final name = await SharedPreferencesHelper.getString(PREF_NAME) ?? '';
    final phone = await SharedPreferencesHelper.getString(PREF_PHONE) ?? '';
    final email = await SharedPreferencesHelper.getString(PREF_EMAIL) ?? '';
    final photo = await SharedPreferencesHelper.getString(PREF_PHOTO) ?? '';

    emit(
      state.copyWith(
        isLoading: false,
        name: name,
        email: email,
        phone: phone,
        photoUrl: photo,
      ),
    );
  }

  void _onNameChanged(
    CustomerEditProfilEventNameChanged event,
    Emitter<CustomerEditProfilState> emit,
  ) {
    emit(state.copyWith(name: event.value));
  }

  void _onEmailChanged(
    CustomerEditProfilEventEmailChanged event,
    Emitter<CustomerEditProfilState> emit,
  ) {
    emit(state.copyWith(email: event.value));
  }

  void _onPhoneChanged(
    CustomerEditProfilEventPhoneChanged event,
    Emitter<CustomerEditProfilState> emit,
  ) {
    emit(state.copyWith(phone: event.value));
  }

  Future<void> _onPhotoPicked(
    CustomerEditProfilEventPhotoPicked event,
    Emitter<CustomerEditProfilState> emit,
  ) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      emit(state.copyWith(photoFile: File(pickedFile.path)));
    }
  }

  Future<void> _onSave(
    CustomerEditProfilEventSave event,
    Emitter<CustomerEditProfilState> emit,
  ) async {
    emit(state.copyWith(isSaving: true, errorMessage: null, isSuccess: false));

    if (state.name.isEmpty || state.email.isEmpty) {
      emit(
        state.copyWith(
          isSaving: false,
          errorMessage: 'Nama dan Email tidak boleh kosong.',
        ),
      );
      return;
    }

    final param = CustomerProfilUpdateParam(
      name: state.name,
      email: state.email,
      phone: state.phone,
      photo: state.photoFile,
    );

    final response = await _updateUseCase.call(param: param);

    if (response.success) {
      // Update local storage
      await SharedPreferencesHelper.setString(PREF_NAME, state.name);
      await SharedPreferencesHelper.setString(PREF_EMAIL, state.email);
      await SharedPreferencesHelper.setString(PREF_PHONE, state.phone);
      emit(
        state.copyWith(isSaving: false, isSuccess: true, errorMessage: null),
      );
    } else {
      emit(state.copyWith(isSaving: false, errorMessage: response.message));
    }
  }
}
