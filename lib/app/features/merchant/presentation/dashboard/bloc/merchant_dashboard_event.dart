part of 'merchant_dashboard_bloc.dart';

sealed class MerchantDashboardEvent {}

class MerchantDashboardEventGet extends MerchantDashboardEvent {}

class MerchantDashboardEventPeriodChanged extends MerchantDashboardEvent {
  final String period; // '7 Hari', '30 Hari', dll
  MerchantDashboardEventPeriodChanged(this.period);
}

class MerchantDashboardEventGetWhatsAppNumber extends MerchantDashboardEvent {}

class MerchantDashboardEventResetWhatsAppNavigation extends MerchantDashboardEvent {}

class MerchantDashboardEventGetChatUrl extends MerchantDashboardEvent {}

class MerchantDashboardEventResetChatUrlNavigation extends MerchantDashboardEvent {}
