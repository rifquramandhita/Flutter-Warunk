import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_merchant.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_merchant_get_use_case.dart';
import 'package:warunk/core/constants/constant.dart';
import 'package:warunk/core/helper/shared_preferences_helper.dart';
import 'package:warunk/core/network/data_state.dart';

part 'merchant_profil_event.dart';
part 'merchant_profil_state.dart';

class MerchantProfilBloc
    extends Bloc<MerchantProfilEvent, MerchantProfilState> {
  final MerchantMerchantGetUseCase _useCase;

  MerchantProfilBloc({required MerchantMerchantGetUseCase useCase})
    : _useCase = useCase,
      super(const MerchantProfilState()) {
    on<MerchantProfilEventGet>(_onGet);
    on<MerchantProfilEventEditTapped>(_onEditTapped);
    on<MerchantLaunchUrlEvent>(_onLaunchUrl);
  }

  void _onEditTapped(
    MerchantProfilEventEditTapped event,
    Emitter<MerchantProfilState> emit,
  ) {
    // TODO: navigate to edit profile page
  }

  Future<void> _onGet(
    MerchantProfilEventGet event,
    Emitter<MerchantProfilState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    final response = await _useCase.call();

    if (response is SuccessState) {
      final merchant = response.data;
      final name = await SharedPreferencesHelper.getString(PREF_NAME) ?? '-';
      final email = await SharedPreferencesHelper.getString(PREF_EMAIL) ?? '-';
      final phone = await SharedPreferencesHelper.getString(PREF_PHONE) ?? '-';

      if (merchant != null) {
        emit(
          state.copyWith(
            name: name,
            email: email,
            phone: phone,
            merchant: merchant,
          ),
        );
      }
    } else {
      emit(state.copyWith(errorMessage: response.message));
    }

    emit(state.copyWith(isLoading: false));
  }

  Future<void> _onLaunchUrl(
    MerchantLaunchUrlEvent event,
    Emitter<MerchantProfilState> emit,
  ) async {
    try {
      final uri = Uri.parse(event.url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        emit(state.copyWith(errorMessage: 'Tidak dapat membuka tautan'));
      }
    } catch (e) {
      emit(state.copyWith(errorMessage: 'Terjadi kesalahan: ${e.toString()}'));
    }
  }
}
