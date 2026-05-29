import 'package:warunk/app/features/merchant/domain/entity/merchant_promotion.dart';
import 'package:warunk/app/features/merchant/domain/repository/merchant_promotion_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class MerchantPromotionSendUseCase {
  final MerchantPromotionRepository repository;

  MerchantPromotionSendUseCase(this.repository);

  Future<DataState<bool>> call({
    required MerchantPromotionSendParam request,
    String? id,
  }) {
    if (id != null && id.isNotEmpty) {
      return repository.updatePromotion(id: id, request: request);
    }
    return repository.createPromotion(request: request);
  }
}
