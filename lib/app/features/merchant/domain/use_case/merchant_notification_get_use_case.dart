import 'package:warunk/app/features/merchant/domain/entity/merchant_notification_response.dart';
import 'package:warunk/app/features/merchant/domain/repository/merchant_notification_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class MerchantNotificationGetUseCase {
  final MerchantNotificationRepository _repository;

  MerchantNotificationGetUseCase({
    required MerchantNotificationRepository repository,
  }) : _repository = repository;

  Future<DataState<MerchantNotificationResponseEntity>> call({int? page}) {
    return _repository.getNotifications(page: page);
  }
}
