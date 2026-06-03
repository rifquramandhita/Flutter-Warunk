import 'package:warunk/app/features/merchant/domain/entity/merchant_product.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_product_category.dart';
import 'package:warunk/core/network/data_state.dart';

abstract class MerchantProductRepository {
  Future<DataState<List<MerchantProductCategoryEntity>>> getCategories();
  Future<DataState<List<MerchantProductEntity>>> get();
  Future<DataState<MerchantProductEntity>> getById(String id);
  Future<DataState<MerchantProductEntity>> send(MerchantProductSendParam param);
  Future<DataState<List<String>>> downloadImages(List<String> urls);
  Future<DataState<bool>> publish(String id);
  Future<DataState<bool>> unpublish(String id);
}

