import 'package:warunk/app/features/merchant/data/source/merchant_notification_api_service.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_notification_response.dart';
import 'package:warunk/app/features/merchant/domain/repository/merchant_notification_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class MerchantNotificationRepositoryImpl implements MerchantNotificationRepository {
  final MerchantNotificationApiService _apiService;

  MerchantNotificationRepositoryImpl({
    required MerchantNotificationApiService apiService,
  }) : _apiService = apiService;

  @override
  Future<DataState<MerchantNotificationResponseEntity>> getNotifications({int? page}) {
    return handleResponse(
      () => _apiService.getNotifications(page: page),
      (json) => MerchantNotificationResponseEntity.fromJson(json as Map<String, dynamic>),
    );
  }
}
