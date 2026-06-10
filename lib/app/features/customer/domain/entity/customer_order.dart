import 'dart:io';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_shipping.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_order_item.dart';

part 'customer_order.g.dart';
part 'customer_order.freezed.dart';

@freezed
sealed class CustomerOrder with _$CustomerOrder {
  const factory CustomerOrder.createParam({
    required String addressId,
    String? shippingKey,
    String? biteshipRateKey,
    String? merchantAccountId,
    String? notes,
    required String paymentProof,
    required List<String> cartIds,
    String? promotionId,
    String? promotionCode,
  }) = CustomerOrderCreateParam;

  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory CustomerOrder.getPromotionParam({
    required List<String> cartIds,
    String? addressId,
    String? shippingKey,
    String? biteshipRateKey,
  }) = CustomerOrderGetPromotionParam;



  const factory CustomerOrder.completeParam({
    required String orderId,
    required List<CustomerOrderCompleteReviewParam> reviews,
  }) = CustomerOrderCompleteParam;

  const factory CustomerOrder.completeReviewParam({
    required String orderItemId,
    required int rating,
    String? review,
    @JsonKey(includeFromJson: false, includeToJson: false)
    @Default([]) List<File> images,
  }) = CustomerOrderCompleteReviewParam;

  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory CustomerOrder.entity({
    String? id,
    String? invoiceNumber,
    String? invoiceUrl,
    String? merchantId,
    int? customerId,
    String? customerAddressId,
    String? merchantAccountId,
    int? subtotal,
    int? shippingCost,
    int? serviceFee,
    String? promotionId,
    String? promotionCode,
    String? promotionTitle,
    String? promotionType,
    int? promotionDiscount,
    dynamic promotion,
    List<dynamic>? promotions,
    int? total,
    int? paidAmount,
    String? paymentProof,
    String? type,
    String? status,
    String? statusLabel,
    String? notes,
    String? cancelReason,
    String? customerBank,
    String? customerAccountNumber,
    String? customerAccountName,
    String? refundProof,
    dynamic customer,
    dynamic customerAddress,
    dynamic merchantAccount,
    dynamic merchant,
    List<CustomerOrderItemEntity>? items,
    List<dynamic>? reviews,
    bool? needsReview,
    CustomerShippingEntity? shipping,
    String? paidAt,
    String? cancelledAt,
    String? completedAt,
    String? createdAt,
    String? updatedAt,
  }) = CustomerOrderEntity;

  factory CustomerOrder.fromJson(Map<String, dynamic> json) =>
      _$CustomerOrderFromJson(json);
}



extension CustomerOrderCompleteParamX on CustomerOrderCompleteParam {
  Future<FormData> toFormData() async {
    final formData = FormData();
    for (int i = 0; i < reviews.length; i++) {
      final reviewItem = reviews[i];
      formData.fields.add(MapEntry('reviews[$i][order_item_id]', reviewItem.orderItemId));
      formData.fields.add(MapEntry('reviews[$i][rating]', reviewItem.rating.toString()));
      if (reviewItem.review != null && reviewItem.review!.isNotEmpty) {
        formData.fields.add(MapEntry('reviews[$i][review]', reviewItem.review!));
      }
      for (int j = 0; j < reviewItem.images.length; j++) {
        final image = reviewItem.images[j];
        final ext = image.path.split('.').last;
        formData.files.add(MapEntry(
          'reviews[$i][images][]',
          await MultipartFile.fromFile(image.path, filename: 'review_${i}_$j.$ext'),
        ));
      }
    }
    return formData;
  }
}
