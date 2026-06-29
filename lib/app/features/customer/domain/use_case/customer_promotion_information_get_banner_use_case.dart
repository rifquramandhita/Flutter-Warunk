import 'package:warunk/app/features/customer/domain/entity/customer_promotion_information.dart';
import 'package:warunk/app/features/customer/domain/repository/customer_promotion_information_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class CustomerPromotionInformationGetBannerUseCase {
  final CustomerPromotionInformationRepository _repository;

  CustomerPromotionInformationGetBannerUseCase({
    required CustomerPromotionInformationRepository repository,
  }) : _repository = repository;

  @override
  Future<DataState<List<CustomerPromotionInformationEntity>>> call({
    void params,
  }) async {
    final response = await _repository.getPromotions();

    if (response is SuccessState) {
      final banners =
          response.data?.toList() ?? [];
      return SuccessState(data: banners);
    }

    return response;
  }
}
