import 'package:warunk/app/features/customer/data/source/customer_promotion_information_api_service.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_promotion_information.dart';
import 'package:warunk/app/features/customer/domain/repository/customer_promotion_information_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class CustomerPromotionInformationRepositoryImpl implements CustomerPromotionInformationRepository {
  final CustomerPromotionInformationApiService _apiService;

  CustomerPromotionInformationRepositoryImpl({required CustomerPromotionInformationApiService apiService})
      : _apiService = apiService;

  @override
  Future<DataState<List<CustomerPromotionInformationEntity>>> getPromotions() {
    return handleResponse(() => _apiService.get(), (json) {
      if (json is Map<String, dynamic> && json['items'] is List) {
        return (json['items'] as List)
            .map(
              (e) => CustomerPromotionInformationEntity.fromJson(e as Map<String, dynamic>),
            )
            .toList();
      }
      return <CustomerPromotionInformationEntity>[];
    });
  }
}
