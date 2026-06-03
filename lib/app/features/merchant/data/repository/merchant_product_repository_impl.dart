import 'dart:io';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:warunk/app/features/merchant/data/source/merchant_product_api_service.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_product.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_product_category.dart';
import 'package:warunk/app/features/merchant/domain/repository/merchant_product_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class MerchantProductRepositoryImpl implements MerchantProductRepository {
  final MerchantProductApiService api;

  MerchantProductRepositoryImpl({required this.api});

  @override
  Future<DataState<List<MerchantProductCategoryEntity>>> getCategories() {
    return handleResponse(() => api.getCategories(), (responseData) {
      return List<MerchantProductCategoryEntity>.from(
        responseData['product_categories']
            .map((e) => MerchantProductCategoryEntity.fromJson(e)),
      );
    });
  }

  @override
  Future<DataState<List<MerchantProductEntity>>> get() {
    return handleResponse(() => api.get(), (responseData) {
      return List<MerchantProductEntity>.from(
        responseData['products'].map((e) => MerchantProductEntity.fromJson(e)),
      );
    });
  }

  @override
  Future<DataState<MerchantProductEntity>> getById(String id) {
    return handleResponse(() => api.getById(id), (responseData) {
      return MerchantProductEntity.fromJson(responseData['product']);
    });
  }

  @override
  Future<DataState<MerchantProductEntity>> send(
    MerchantProductSendParam param,
  ) {
    return handleResponse(
      () async {
        final map = param.toJson()
          ..remove('send_id')
          ..remove('images')
          ..remove('variants');

        final formData = FormData.fromMap(map);

        if (param.sendImages != null) {
          int uploadIndex = 0;
          for (final imagePath in param.sendImages!) {
            final file = File(imagePath);
            if (await file.exists()) {
              formData.files.add(
                MapEntry(
                  'images[$uploadIndex][file]',
                  await MultipartFile.fromFile(
                    imagePath,
                    filename: imagePath.split('/').last,
                  ),
                ),
              );
              formData.fields.add(
                MapEntry(
                  'images[$uploadIndex][alt_text]',
                  '${param.name} $uploadIndex',
                ),
              );
              formData.fields.add(
                MapEntry(
                  'images[$uploadIndex][sort_order]',
                  '${uploadIndex + 1}',
                ),
              );
              uploadIndex++;
            }
          }
        }

        if (param.sendVariants != null) {
          for (int i = 0; i < param.sendVariants!.length; i++) {
            final variant = param.sendVariants![i];
            formData.fields.add(
              MapEntry('variants[$i][sku]', variant.sku ?? ''),
            );
            formData.fields.add(
              MapEntry('variants[$i][price]', variant.price.toString()),
            );
            formData.fields.add(
              MapEntry('variants[$i][stock]', variant.stock.toString()),
            );
            formData.fields.add(
              MapEntry(
                'variants[$i][min_purchase]',
                variant.minPurchase.toString(),
              ),
            );

            if (variant.weight != null) {
              formData.fields.add(
                MapEntry('variants[$i][weight]', variant.weight.toString()),
              );
            }
            if (variant.length != null) {
              formData.fields.add(
                MapEntry('variants[$i][length]', variant.length.toString()),
              );
            }
            if (variant.width != null) {
              formData.fields.add(
                MapEntry('variants[$i][width]', variant.width.toString()),
              );
            }
            if (variant.height != null) {
              formData.fields.add(
                MapEntry('variants[$i][height]', variant.height.toString()),
              );
            }

            variant.variantCombination.forEach((key, value) {
              formData.fields.add(
                MapEntry(
                  'variants[$i][variant_combination][$key]',
                  value.toString(),
                ),
              );
            });
          }
        }

        if (param.sendId != null) {
          return await api.update(param.sendId!, formData);
        } else {
          return await api.create(formData);
        }
      },
      (responseData) {
        dynamic productData;
        if (responseData.containsKey('data') &&
            responseData['data'] is Map &&
            responseData['data'].containsKey('product')) {
          var pData = responseData['data']['product'];
          if (pData is List && pData.isNotEmpty) {
            productData = pData[0];
          } else {
            productData = pData;
          }
        } else if (responseData.containsKey('product')) {
          productData = responseData['product'];
        } else {
          productData = responseData; // fallback
        }

        if (productData == null) {
          throw Exception("Product data is null");
        }
        return MerchantProductEntity.fromJson(productData);
      },
    );
  }

  @override
  Future<DataState<List<String>>> downloadImages(List<String> urls) async {
    final List<String> localImagePaths = [];
    try {
      final tempDir = await getTemporaryDirectory();
      final dio = Dio();
      for (final url in urls) {
        if (url.isNotEmpty) {
          final uri = Uri.parse(url);
          final fileName = uri.pathSegments.isNotEmpty
              ? uri.pathSegments.last
              : 'image_${DateTime.now().millisecondsSinceEpoch}.jpg';
          final file = File('${tempDir.path}/$fileName');

          if (await file.exists()) {
            localImagePaths.add(file.path);
          } else {
            try {
              await dio.download(url, file.path);
              localImagePaths.add(file.path);
            } catch (e) {
              // Ignore or handle
            }
          }
        }
      }
      return SuccessState(
        data: localImagePaths.isNotEmpty ? localImagePaths : urls,
      );
    } catch (e) {
      return ErrorState(message: e.toString());
    }
  }

  @override
  Future<DataState<bool>> publish(String id) {
    return handleResponse(
      () => api.publish(id),
      (responseData) => true,
    );
  }

  @override
  Future<DataState<bool>> unpublish(String id) {
    return handleResponse(
      () => api.unpublish(id),
      (responseData) => true,
    );
  }
}
