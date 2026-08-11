import 'package:warunk/app/features/merchant/domain/repository/merchant_setting_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class MerchantSettingGetCustomerServiceChatUrlUseCase {
  final MerchantSettingRepository repository;

  MerchantSettingGetCustomerServiceChatUrlUseCase(this.repository);

  Future<DataState<String>> call() {
    return repository.getSetting('support.customer_service_chat_url');
  }
}
