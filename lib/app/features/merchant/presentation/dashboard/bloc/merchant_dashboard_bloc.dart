import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_dashboard.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_merchant.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_dashboard_get_use_case.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_merchant_get_use_case.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_setting_get_customer_service_whatsapp_use_case.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_setting_get_customer_service_chat_url_use_case.dart';
import 'package:warunk/core/network/data_state.dart';

part 'merchant_dashboard_event.dart';
part 'merchant_dashboard_state.dart';

class MerchantDashboardBloc
    extends Bloc<MerchantDashboardEvent, MerchantDashboardState> {
  final MerchantDashboardGetUseCase getUseCase;
  final MerchantMerchantGetUseCase getMerchantUseCase;
  final MerchantSettingGetCustomerServiceWhatsAppUseCase getWhatsAppUseCase;
  final MerchantSettingGetCustomerServiceChatUrlUseCase getChatUrlUseCase;

  MerchantDashboardBloc({
    required this.getUseCase,
    required this.getMerchantUseCase,
    required this.getWhatsAppUseCase,
    required this.getChatUrlUseCase,
  })
    : super(const MerchantDashboardState()) {
    on<MerchantDashboardEventGet>(_onGet);
    on<MerchantDashboardEventPeriodChanged>((event, emit) {
      emit(state.copyWith(selectedPeriod: event.period));
    });
    on<MerchantDashboardEventGetWhatsAppNumber>(_onGetWhatsAppNumber);
    on<MerchantDashboardEventResetWhatsAppNavigation>(_onResetWhatsAppNavigation);
    on<MerchantDashboardEventGetChatUrl>(_onGetChatUrl);
    on<MerchantDashboardEventResetChatUrlNavigation>(_onResetChatUrlNavigation);
  }

  Future<void> _onGet(
    MerchantDashboardEventGet event,
    Emitter<MerchantDashboardState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    
    // Fetch both dashboard and merchant data concurrently
    final results = await Future.wait([
      getUseCase(),
      getMerchantUseCase(),
    ]);
    
    final dashboardResult = results[0];
    final merchantResult = results[1];

    if (dashboardResult is SuccessState) {
      final data = dashboardResult.data as MerchantDashboard;
      final labels = data.salesSeries.map((e) {
        // e.date example: "2026-06-12", we can take last part or keep as is. Let's just use day.
        final parts = e.date.split('-');
        if (parts.length == 3) {
          return parts[2];
        }
        return e.date;
      }).toList();

      final sales = data.salesSeries.map((e) => e.revenue.toDouble()).toList();

      // calculate sales growth
      double todaySales = data.metrics.todayRevenue.toDouble();
      double yesterdaySales = data.metrics.yesterdayRevenue.toDouble();
      double growth = 0;
      if (yesterdaySales > 0) {
        growth = ((todaySales - yesterdaySales) / yesterdaySales) * 100;
      }

      final merchant = merchantResult is SuccessState
          ? (merchantResult.data as MerchantMerchantEntity?)
          : null;

      final hasProvince = merchant?.province?.trim().isNotEmpty ?? false;
      final hasCity = merchant?.city?.trim().isNotEmpty ?? false;
      final hasDistrict = merchant?.district?.trim().isNotEmpty ?? false;
      final hasAddressDetail =
          merchant?.address?.trim().isNotEmpty ?? false;
      final hasPostalCode =
          merchant?.postalCode?.trim().isNotEmpty ?? false;

      final hasAddress = hasProvince &&
          hasCity &&
          hasDistrict &&
          hasAddressDetail &&
          hasPostalCode;

      final addressParts = [
        if (hasAddressDetail) merchant!.address!.trim(),
        if (hasDistrict) merchant!.district!.trim(),
        if (hasCity) merchant!.city!.trim(),
        if (hasProvince) merchant!.province!.trim(),
        if (hasPostalCode) merchant!.postalCode!.trim(),
      ];
      final merchantAddress =
          addressParts.isNotEmpty ? addressParts.join(', ') : '';

      final opDays = data.merchantInfo.operationalDays.trim();
      final opTime = data.merchantInfo.operationalTime.trim();

      final hasOperationalHours = (merchant != null &&
              ((merchant.isOpenAllDay ?? false) ||
                  (merchant.isOpen24Hours ?? false) ||
                  merchant.merchantOpens.isNotEmpty ||
                  (merchant.timeOpen != null &&
                      merchant.timeOpen!.trim().isNotEmpty))) ||
          (opDays.isNotEmpty &&
              opDays != '-' &&
              opTime.isNotEmpty &&
              opTime != '-');

      String merchantTime = '';
      if (opDays.isNotEmpty &&
          opTime.isNotEmpty &&
          opDays != '-' &&
          opTime != '-') {
        merchantTime = '$opDays • $opTime';
      } else if (opDays.isNotEmpty && opDays != '-') {
        merchantTime = opDays;
      } else if (opTime.isNotEmpty && opTime != '-') {
        merchantTime = opTime;
      }

      emit(
        state.copyWith(
          isLoading: false,
          salesData: sales,
          salesLabels: labels,
          newOrders: data.metrics.todayOrders, // fallback
          activeProducts: data.metrics.activeProducts,
          totalProducts: data.metrics.activeProducts, // they don't have total
          todaySales: todaySales,
          salesGrowth: growth,
          balance: data.merchantInfo.balance.toDouble(),
          recentOrders: data.recentOrders,
          merchantName: data.merchantInfo.name,
          merchantPhoto: data.merchantInfo.photo,
          merchantCategory: data.merchantInfo.category,
          merchantAddress: merchantAddress,
          hasAddress: hasAddress,
          hasOperationalHours: hasOperationalHours,
          merchantTime: merchantTime,
          hasWelcomePopup: data.hasWelcomePopup,
          merchantStatus: merchant?.status,
          merchantReportReason: merchant?.reportReason,
          merchantReportDate: merchant?.reportedAt,
          isVerified: merchant?.isVerified ?? false,
        ),
      );
    } else {
      emit(state.copyWith(isLoading: false, errorMessage: dashboardResult.message));
    }
  }

  Future<void> _onGetWhatsAppNumber(
    MerchantDashboardEventGetWhatsAppNumber event,
    Emitter<MerchantDashboardState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    final result = await getWhatsAppUseCase();
    if (result is SuccessState && result.data != null) {
      emit(state.copyWith(
        isLoading: false,
        whatsAppNumber: result.data,
        shouldLaunchWhatsApp: true,
      ));
    } else {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: result.message.isNotEmpty ? result.message : 'Gagal mengambil nomor WhatsApp',
      ));
    }
  }

  void _onResetWhatsAppNavigation(
    MerchantDashboardEventResetWhatsAppNavigation event,
    Emitter<MerchantDashboardState> emit,
  ) {
    emit(state.copyWith(shouldLaunchWhatsApp: false));
  }

  Future<void> _onGetChatUrl(
    MerchantDashboardEventGetChatUrl event,
    Emitter<MerchantDashboardState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    final result = await getChatUrlUseCase();
    if (result is SuccessState && result.data != null) {
      emit(state.copyWith(
        isLoading: false,
        chatUrl: result.data,
        shouldLaunchChatUrl: true,
      ));
    } else {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: result.message.isNotEmpty ? result.message : 'Gagal mengambil tautan chat',
      ));
    }
  }

  void _onResetChatUrlNavigation(
    MerchantDashboardEventResetChatUrlNavigation event,
    Emitter<MerchantDashboardState> emit,
  ) {
    emit(state.copyWith(shouldLaunchChatUrl: false));
  }
}
