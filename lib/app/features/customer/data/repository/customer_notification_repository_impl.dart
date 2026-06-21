import 'package:warunk/app/features/customer/data/source/customer_notification_api_service.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_notification_response.dart';
import 'package:warunk/app/features/customer/domain/repository/customer_notification_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class CustomerNotificationRepositoryImpl implements CustomerNotificationRepository {
  final CustomerNotificationApiService _apiService;

  CustomerNotificationRepositoryImpl({
    required CustomerNotificationApiService apiService,
  }) : _apiService = apiService;

  @override
  Future<DataState<CustomerNotificationResponseEntity>> getNotifications({int? page}) {
    return handleResponse(
      () => _apiService.getNotifications(page: page),
      (json) => CustomerNotificationResponseEntity.fromJson(json as Map<String, dynamic>),
    );
  }
}
