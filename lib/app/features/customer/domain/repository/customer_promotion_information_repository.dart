import 'package:warunk/app/features/customer/domain/entity/customer_promotion_information.dart';
import 'package:warunk/core/network/data_state.dart';

abstract class CustomerPromotionInformationRepository {
  Future<DataState<List<CustomerPromotionInformationEntity>>> getPromotions();
}
