import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_merchant.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_merchant_get_use_case.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_merchant_get_category_use_case.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_merchant_update_use_case.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_category.dart';
import 'package:warunk/core/network/data_state.dart';

part 'merchant_edit_profil_event.dart';
part 'merchant_edit_profil_state.dart';

class MerchantEditProfilBloc
    extends Bloc<MerchantEditProfilEvent, MerchantEditProfilState> {
  final MerchantMerchantGetUseCase _getUseCase;
  final MerchantMerchantUpdateUseCase _updateUseCase;
  final MerchantMerchantGetCategoryUseCase _getCategoryUseCase;

  MerchantEditProfilBloc({
    required MerchantMerchantGetUseCase getUseCase,
    required MerchantMerchantUpdateUseCase updateUseCase,
    required MerchantMerchantGetCategoryUseCase getCategoryUseCase,
  }) : _getUseCase = getUseCase,
       _updateUseCase = updateUseCase,
       _getCategoryUseCase = getCategoryUseCase,
       super(const MerchantEditProfilState()) {
    on<MerchantEditProfilEventGet>(_onGet);
    on<MerchantEditProfilEventNameChanged>(_onNameChanged);
    on<MerchantEditProfilEventWhatsappChanged>(_onWhatsappChanged);
    on<MerchantEditProfilEventCategoryChanged>(_onCategoryChanged);
    on<MerchantEditProfilEventPhotoPicked>(_onPhotoPicked);
    on<MerchantEditProfilEventSubmit>(_onSubmit);
  }

  Future<void> _onGet(
    MerchantEditProfilEventGet event,
    Emitter<MerchantEditProfilState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    final response = await _getUseCase.call();
    final categoryResponse = await _getCategoryUseCase.call();
    
    List<MerchantCategoryEntity> categories = [];
    if (categoryResponse is SuccessState && categoryResponse.data != null) {
      categories = categoryResponse.data!;
    }

    if (response is SuccessState) {
      final merchant = response.data;
      if (merchant != null) {
        MerchantCategoryEntity? selectedCategory;
        try {
          selectedCategory = categories.firstWhere((element) => element.id == merchant.merchantCategory || element.name == merchant.merchantCategory);
        } catch (_) {}

        emit(
          state.copyWith(
            name: merchant.name,
            whatsappNumber: merchant.phone ?? '',
            merchantCategoryId: merchant.merchantCategory ?? '',
            selectedCategory: selectedCategory,
            categories: categories,
            photoUrl: merchant.photo,
            isInitialLoaded: true,
          ),
        );
      } else {
        emit(state.copyWith(isInitialLoaded: true, categories: categories));
      }
    } else {
      emit(
        state.copyWith(errorMessage: response.message, isInitialLoaded: true),
      );
    }

    emit(state.copyWith(isLoading: false));
  }

  void _onNameChanged(
    MerchantEditProfilEventNameChanged event,
    Emitter<MerchantEditProfilState> emit,
  ) {
    emit(state.copyWith(name: event.value));
  }

  void _onWhatsappChanged(
    MerchantEditProfilEventWhatsappChanged event,
    Emitter<MerchantEditProfilState> emit,
  ) {
    emit(state.copyWith(whatsappNumber: event.value));
  }

  void _onCategoryChanged(
    MerchantEditProfilEventCategoryChanged event,
    Emitter<MerchantEditProfilState> emit,
  ) {
    emit(state.copyWith(merchantCategoryId: event.value?.name ?? '', selectedCategory: event.value));
  }

  Future<void> _onPhotoPicked(
    MerchantEditProfilEventPhotoPicked event,
    Emitter<MerchantEditProfilState> emit,
  ) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      emit(state.copyWith(photoFile: File(pickedFile.path)));
    }
  }

  Future<void> _onSubmit(
    MerchantEditProfilEventSubmit event,
    Emitter<MerchantEditProfilState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    final String slug = state.name.toLowerCase().replaceAll(' ', '-');

    final param = MerchantMerchantUpdateParam(
      photo: state.photoFile,
      name: state.name,
      slug: slug,
      merchantCategoryName: state.merchantCategoryId.isNotEmpty
          ? state.merchantCategoryId
          : null,
      whatsappNumber: state.whatsappNumber,
    );

    final response = await _updateUseCase.call(param: param);

    if (response is SuccessState) {
      emit(state.copyWith(isSuccess: true));
    } else {
      emit(state.copyWith(errorMessage: response.message));
    }

    emit(state.copyWith(isLoading: false));
  }
}
