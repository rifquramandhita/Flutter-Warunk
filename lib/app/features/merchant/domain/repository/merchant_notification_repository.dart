import 'package:warunk/app/features/merchant/domain/entity/merchant_notification_response.dart';
import 'package:warunk/core/network/data_state.dart';

abstract class MerchantNotificationRepository {
  Future<DataState<MerchantNotificationResponseEntity>> getNotifications({
    int? page,
  });
}
