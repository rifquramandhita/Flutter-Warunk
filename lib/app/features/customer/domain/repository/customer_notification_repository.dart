import 'package:warunk/app/features/customer/domain/entity/customer_notification_response.dart';
import 'package:warunk/core/network/data_state.dart';

abstract class CustomerNotificationRepository {
  Future<DataState<CustomerNotificationResponseEntity>> getNotifications({int? page});
}
