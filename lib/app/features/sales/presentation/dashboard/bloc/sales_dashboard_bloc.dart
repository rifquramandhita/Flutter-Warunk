import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/sales/domain/entity/sales_dashboard.dart';
import 'package:warunk/app/features/sales/domain/use_case/seller_dashboard_get_use_case.dart';
import 'package:warunk/core/network/data_state.dart';

part 'sales_dashboard_event.dart';
part 'sales_dashboard_state.dart';

class SalesDashboardBloc extends Bloc<SalesDashboardEvent, SalesDashboardState> {
  final SellerDashboardGetUseCase _getDashboardUseCase;

  SalesDashboardBloc({required SellerDashboardGetUseCase getDashboardUseCase})
      : _getDashboardUseCase = getDashboardUseCase,
        super(const SalesDashboardState()) {
    on<SalesDashboardFetchEvent>(_onFetchDashboard);
  }

  Future<void> _onFetchDashboard(
    SalesDashboardFetchEvent event,
    Emitter<SalesDashboardState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    final result = await _getDashboardUseCase(
      salesScope: event.salesScope,
      districtId: event.districtId,
      salesMetric: event.salesMetric,
      districtMetric: event.districtMetric,
      merchantMetric: event.merchantMetric,
    );

    if (result is SuccessState<SalesDashboardEntity>) {
      emit(state.copyWith(isLoading: false, data: result.data));
    } else if (result is ErrorState) {
      emit(state.copyWith(isLoading: false, errorMessage: result.message));
    }
  }
}
