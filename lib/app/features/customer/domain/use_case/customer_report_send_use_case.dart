import 'package:warunk/app/features/customer/domain/entity/customer_report_send_param.dart';
import 'package:warunk/app/features/customer/domain/repository/customer_merchant_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class CustomerReportSendUseCase {
  final CustomerMerchantRepository _repository;

  CustomerReportSendUseCase({required CustomerMerchantRepository repository})
    : _repository = repository;

  Future<DataState<bool>> call(CustomerReportSendParam param) {
    return _repository.sendReport(param);
  }
}
