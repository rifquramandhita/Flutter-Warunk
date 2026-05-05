part of 'merchant_dashboard_bloc.dart';

sealed class MerchantDashboardEvent {}

class MerchantDashboardPeriodChanged extends MerchantDashboardEvent {
  final String period; // '7 Hari', '30 Hari', dll
  MerchantDashboardPeriodChanged(this.period);
}
