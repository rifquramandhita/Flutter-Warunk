import 'package:warunk/app/features/merchant/domain/repository/merchant_product_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class MerchantProductDownloadImagesUseCase {
  final MerchantProductRepository repository;

  MerchantProductDownloadImagesUseCase({required this.repository});

  Future<DataState<List<String>>> call({required List<String> urls}) {
    return repository.downloadImages(urls);
  }
}
