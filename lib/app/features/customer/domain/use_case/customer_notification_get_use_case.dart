import 'package:warunk/app/features/customer/domain/entity/customer_notification_response.dart';
import 'package:warunk/app/features/customer/domain/repository/customer_notification_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class CustomerNotificationGetUseCase {
  final CustomerNotificationRepository _repository;

  CustomerNotificationGetUseCase({
    required CustomerNotificationRepository repository,
  }) : _repository = repository;

  Future<DataState<CustomerNotificationResponseEntity>> call({int? page}) {
    return _repository.getNotifications(page: page);
  }
}
