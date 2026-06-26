import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_dashboard.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_dashboard_get_use_case.dart';
import 'package:warunk/core/network/data_state.dart';

part 'merchant_dashboard_event.dart';
part 'merchant_dashboard_state.dart';

class MerchantDashboardBloc
    extends Bloc<MerchantDashboardEvent, MerchantDashboardState> {
  final MerchantDashboardGetUseCase getUseCase;

  MerchantDashboardBloc({required this.getUseCase})
    : super(const MerchantDashboardState()) {
    on<MerchantDashboardEventGet>(_onGet);
    on<MerchantDashboardEventPeriodChanged>((event, emit) {
      emit(state.copyWith(selectedPeriod: event.period));
    });
  }

  Future<void> _onGet(
    MerchantDashboardEventGet event,
    Emitter<MerchantDashboardState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    final result = await getUseCase();
    if (result is SuccessState) {
      final data = result.data!;
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
          merchantName: result.data!.merchantInfo.name,
          merchantPhoto: result.data!.merchantInfo.photo,
          merchantCategory: result.data!.merchantInfo.category,
          merchantTime:
              '${result.data!.merchantInfo.operationalDays} • ${result.data!.merchantInfo.operationalTime}',
        ),
      );
    } else {
      emit(state.copyWith(isLoading: false, errorMessage: result.message));
    }
  }
}
