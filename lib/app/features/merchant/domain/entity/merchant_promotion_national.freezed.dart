// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'merchant_promotion_national.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
MerchantPromotionNational _$MerchantPromotionNationalFromJson(
  Map<String, dynamic> json
) {
    return MerchantPromotionNationalEntity.fromJson(
      json
    );
}

/// @nodoc
mixin _$MerchantPromotionNational {

 String get id; String get title; String? get description; String? get code; bool get isShow; bool get isPromotionNational; bool get isAllMerchant; bool get isPublic; bool get isOpenToJoin; bool get hasJoined; String? get joinUrl; String get type; String get typeLabel; String get discountType; String get discountTypeLabel; num get discount; String get discountLabel; num get minPurchase; String get minPurchaseLabel; num? get maxDiscount; String? get maxDiscountLabel; bool get isUnlimitedUse; int? get maxUse; String get quotaLabel; String get periodLabel; DateTime get datetimeStart; DateTime get datetimeEnd; String? get bannerImage; String get detailUrl; String get chatMessage;

  /// Serializes this MerchantPromotionNational to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantPromotionNational&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.code, code) || other.code == code)&&(identical(other.isShow, isShow) || other.isShow == isShow)&&(identical(other.isPromotionNational, isPromotionNational) || other.isPromotionNational == isPromotionNational)&&(identical(other.isAllMerchant, isAllMerchant) || other.isAllMerchant == isAllMerchant)&&(identical(other.isPublic, isPublic) || other.isPublic == isPublic)&&(identical(other.isOpenToJoin, isOpenToJoin) || other.isOpenToJoin == isOpenToJoin)&&(identical(other.hasJoined, hasJoined) || other.hasJoined == hasJoined)&&(identical(other.joinUrl, joinUrl) || other.joinUrl == joinUrl)&&(identical(other.type, type) || other.type == type)&&(identical(other.typeLabel, typeLabel) || other.typeLabel == typeLabel)&&(identical(other.discountType, discountType) || other.discountType == discountType)&&(identical(other.discountTypeLabel, discountTypeLabel) || other.discountTypeLabel == discountTypeLabel)&&(identical(other.discount, discount) || other.discount == discount)&&(identical(other.discountLabel, discountLabel) || other.discountLabel == discountLabel)&&(identical(other.minPurchase, minPurchase) || other.minPurchase == minPurchase)&&(identical(other.minPurchaseLabel, minPurchaseLabel) || other.minPurchaseLabel == minPurchaseLabel)&&(identical(other.maxDiscount, maxDiscount) || other.maxDiscount == maxDiscount)&&(identical(other.maxDiscountLabel, maxDiscountLabel) || other.maxDiscountLabel == maxDiscountLabel)&&(identical(other.isUnlimitedUse, isUnlimitedUse) || other.isUnlimitedUse == isUnlimitedUse)&&(identical(other.maxUse, maxUse) || other.maxUse == maxUse)&&(identical(other.quotaLabel, quotaLabel) || other.quotaLabel == quotaLabel)&&(identical(other.periodLabel, periodLabel) || other.periodLabel == periodLabel)&&(identical(other.datetimeStart, datetimeStart) || other.datetimeStart == datetimeStart)&&(identical(other.datetimeEnd, datetimeEnd) || other.datetimeEnd == datetimeEnd)&&(identical(other.bannerImage, bannerImage) || other.bannerImage == bannerImage)&&(identical(other.detailUrl, detailUrl) || other.detailUrl == detailUrl)&&(identical(other.chatMessage, chatMessage) || other.chatMessage == chatMessage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,title,description,code,isShow,isPromotionNational,isAllMerchant,isPublic,isOpenToJoin,hasJoined,joinUrl,type,typeLabel,discountType,discountTypeLabel,discount,discountLabel,minPurchase,minPurchaseLabel,maxDiscount,maxDiscountLabel,isUnlimitedUse,maxUse,quotaLabel,periodLabel,datetimeStart,datetimeEnd,bannerImage,detailUrl,chatMessage]);

@override
String toString() {
  return 'MerchantPromotionNational(id: $id, title: $title, description: $description, code: $code, isShow: $isShow, isPromotionNational: $isPromotionNational, isAllMerchant: $isAllMerchant, isPublic: $isPublic, isOpenToJoin: $isOpenToJoin, hasJoined: $hasJoined, joinUrl: $joinUrl, type: $type, typeLabel: $typeLabel, discountType: $discountType, discountTypeLabel: $discountTypeLabel, discount: $discount, discountLabel: $discountLabel, minPurchase: $minPurchase, minPurchaseLabel: $minPurchaseLabel, maxDiscount: $maxDiscount, maxDiscountLabel: $maxDiscountLabel, isUnlimitedUse: $isUnlimitedUse, maxUse: $maxUse, quotaLabel: $quotaLabel, periodLabel: $periodLabel, datetimeStart: $datetimeStart, datetimeEnd: $datetimeEnd, bannerImage: $bannerImage, detailUrl: $detailUrl, chatMessage: $chatMessage)';
}


}




/// Adds pattern-matching-related methods to [MerchantPromotionNational].
extension MerchantPromotionNationalPatterns on MerchantPromotionNational {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MerchantPromotionNationalEntity value)?  entity,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MerchantPromotionNationalEntity() when entity != null:
return entity(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MerchantPromotionNationalEntity value)  entity,}){
final _that = this;
switch (_that) {
case MerchantPromotionNationalEntity():
return entity(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MerchantPromotionNationalEntity value)?  entity,}){
final _that = this;
switch (_that) {
case MerchantPromotionNationalEntity() when entity != null:
return entity(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String id,  String title,  String? description,  String? code,  bool isShow,  bool isPromotionNational,  bool isAllMerchant,  bool isPublic,  bool isOpenToJoin,  bool hasJoined,  String? joinUrl,  String type,  String typeLabel,  String discountType,  String discountTypeLabel,  num discount,  String discountLabel,  num minPurchase,  String minPurchaseLabel,  num? maxDiscount,  String? maxDiscountLabel,  bool isUnlimitedUse,  int? maxUse,  String quotaLabel,  String periodLabel,  DateTime datetimeStart,  DateTime datetimeEnd,  String? bannerImage,  String detailUrl,  String chatMessage)?  entity,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MerchantPromotionNationalEntity() when entity != null:
return entity(_that.id,_that.title,_that.description,_that.code,_that.isShow,_that.isPromotionNational,_that.isAllMerchant,_that.isPublic,_that.isOpenToJoin,_that.hasJoined,_that.joinUrl,_that.type,_that.typeLabel,_that.discountType,_that.discountTypeLabel,_that.discount,_that.discountLabel,_that.minPurchase,_that.minPurchaseLabel,_that.maxDiscount,_that.maxDiscountLabel,_that.isUnlimitedUse,_that.maxUse,_that.quotaLabel,_that.periodLabel,_that.datetimeStart,_that.datetimeEnd,_that.bannerImage,_that.detailUrl,_that.chatMessage);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String id,  String title,  String? description,  String? code,  bool isShow,  bool isPromotionNational,  bool isAllMerchant,  bool isPublic,  bool isOpenToJoin,  bool hasJoined,  String? joinUrl,  String type,  String typeLabel,  String discountType,  String discountTypeLabel,  num discount,  String discountLabel,  num minPurchase,  String minPurchaseLabel,  num? maxDiscount,  String? maxDiscountLabel,  bool isUnlimitedUse,  int? maxUse,  String quotaLabel,  String periodLabel,  DateTime datetimeStart,  DateTime datetimeEnd,  String? bannerImage,  String detailUrl,  String chatMessage)  entity,}) {final _that = this;
switch (_that) {
case MerchantPromotionNationalEntity():
return entity(_that.id,_that.title,_that.description,_that.code,_that.isShow,_that.isPromotionNational,_that.isAllMerchant,_that.isPublic,_that.isOpenToJoin,_that.hasJoined,_that.joinUrl,_that.type,_that.typeLabel,_that.discountType,_that.discountTypeLabel,_that.discount,_that.discountLabel,_that.minPurchase,_that.minPurchaseLabel,_that.maxDiscount,_that.maxDiscountLabel,_that.isUnlimitedUse,_that.maxUse,_that.quotaLabel,_that.periodLabel,_that.datetimeStart,_that.datetimeEnd,_that.bannerImage,_that.detailUrl,_that.chatMessage);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String id,  String title,  String? description,  String? code,  bool isShow,  bool isPromotionNational,  bool isAllMerchant,  bool isPublic,  bool isOpenToJoin,  bool hasJoined,  String? joinUrl,  String type,  String typeLabel,  String discountType,  String discountTypeLabel,  num discount,  String discountLabel,  num minPurchase,  String minPurchaseLabel,  num? maxDiscount,  String? maxDiscountLabel,  bool isUnlimitedUse,  int? maxUse,  String quotaLabel,  String periodLabel,  DateTime datetimeStart,  DateTime datetimeEnd,  String? bannerImage,  String detailUrl,  String chatMessage)?  entity,}) {final _that = this;
switch (_that) {
case MerchantPromotionNationalEntity() when entity != null:
return entity(_that.id,_that.title,_that.description,_that.code,_that.isShow,_that.isPromotionNational,_that.isAllMerchant,_that.isPublic,_that.isOpenToJoin,_that.hasJoined,_that.joinUrl,_that.type,_that.typeLabel,_that.discountType,_that.discountTypeLabel,_that.discount,_that.discountLabel,_that.minPurchase,_that.minPurchaseLabel,_that.maxDiscount,_that.maxDiscountLabel,_that.isUnlimitedUse,_that.maxUse,_that.quotaLabel,_that.periodLabel,_that.datetimeStart,_that.datetimeEnd,_that.bannerImage,_that.detailUrl,_that.chatMessage);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class MerchantPromotionNationalEntity implements MerchantPromotionNational {
  const MerchantPromotionNationalEntity({required this.id, required this.title, this.description, this.code, required this.isShow, required this.isPromotionNational, required this.isAllMerchant, required this.isPublic, required this.isOpenToJoin, this.hasJoined = false, this.joinUrl, required this.type, required this.typeLabel, required this.discountType, required this.discountTypeLabel, required this.discount, required this.discountLabel, required this.minPurchase, required this.minPurchaseLabel, this.maxDiscount, this.maxDiscountLabel, required this.isUnlimitedUse, this.maxUse, required this.quotaLabel, required this.periodLabel, required this.datetimeStart, required this.datetimeEnd, this.bannerImage, required this.detailUrl, required this.chatMessage});
  factory MerchantPromotionNationalEntity.fromJson(Map<String, dynamic> json) => _$MerchantPromotionNationalEntityFromJson(json);

@override final  String id;
@override final  String title;
@override final  String? description;
@override final  String? code;
@override final  bool isShow;
@override final  bool isPromotionNational;
@override final  bool isAllMerchant;
@override final  bool isPublic;
@override final  bool isOpenToJoin;
@override@JsonKey() final  bool hasJoined;
@override final  String? joinUrl;
@override final  String type;
@override final  String typeLabel;
@override final  String discountType;
@override final  String discountTypeLabel;
@override final  num discount;
@override final  String discountLabel;
@override final  num minPurchase;
@override final  String minPurchaseLabel;
@override final  num? maxDiscount;
@override final  String? maxDiscountLabel;
@override final  bool isUnlimitedUse;
@override final  int? maxUse;
@override final  String quotaLabel;
@override final  String periodLabel;
@override final  DateTime datetimeStart;
@override final  DateTime datetimeEnd;
@override final  String? bannerImage;
@override final  String detailUrl;
@override final  String chatMessage;


@override
Map<String, dynamic> toJson() {
  return _$MerchantPromotionNationalEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantPromotionNationalEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.code, code) || other.code == code)&&(identical(other.isShow, isShow) || other.isShow == isShow)&&(identical(other.isPromotionNational, isPromotionNational) || other.isPromotionNational == isPromotionNational)&&(identical(other.isAllMerchant, isAllMerchant) || other.isAllMerchant == isAllMerchant)&&(identical(other.isPublic, isPublic) || other.isPublic == isPublic)&&(identical(other.isOpenToJoin, isOpenToJoin) || other.isOpenToJoin == isOpenToJoin)&&(identical(other.hasJoined, hasJoined) || other.hasJoined == hasJoined)&&(identical(other.joinUrl, joinUrl) || other.joinUrl == joinUrl)&&(identical(other.type, type) || other.type == type)&&(identical(other.typeLabel, typeLabel) || other.typeLabel == typeLabel)&&(identical(other.discountType, discountType) || other.discountType == discountType)&&(identical(other.discountTypeLabel, discountTypeLabel) || other.discountTypeLabel == discountTypeLabel)&&(identical(other.discount, discount) || other.discount == discount)&&(identical(other.discountLabel, discountLabel) || other.discountLabel == discountLabel)&&(identical(other.minPurchase, minPurchase) || other.minPurchase == minPurchase)&&(identical(other.minPurchaseLabel, minPurchaseLabel) || other.minPurchaseLabel == minPurchaseLabel)&&(identical(other.maxDiscount, maxDiscount) || other.maxDiscount == maxDiscount)&&(identical(other.maxDiscountLabel, maxDiscountLabel) || other.maxDiscountLabel == maxDiscountLabel)&&(identical(other.isUnlimitedUse, isUnlimitedUse) || other.isUnlimitedUse == isUnlimitedUse)&&(identical(other.maxUse, maxUse) || other.maxUse == maxUse)&&(identical(other.quotaLabel, quotaLabel) || other.quotaLabel == quotaLabel)&&(identical(other.periodLabel, periodLabel) || other.periodLabel == periodLabel)&&(identical(other.datetimeStart, datetimeStart) || other.datetimeStart == datetimeStart)&&(identical(other.datetimeEnd, datetimeEnd) || other.datetimeEnd == datetimeEnd)&&(identical(other.bannerImage, bannerImage) || other.bannerImage == bannerImage)&&(identical(other.detailUrl, detailUrl) || other.detailUrl == detailUrl)&&(identical(other.chatMessage, chatMessage) || other.chatMessage == chatMessage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,title,description,code,isShow,isPromotionNational,isAllMerchant,isPublic,isOpenToJoin,hasJoined,joinUrl,type,typeLabel,discountType,discountTypeLabel,discount,discountLabel,minPurchase,minPurchaseLabel,maxDiscount,maxDiscountLabel,isUnlimitedUse,maxUse,quotaLabel,periodLabel,datetimeStart,datetimeEnd,bannerImage,detailUrl,chatMessage]);

@override
String toString() {
  return 'MerchantPromotionNational.entity(id: $id, title: $title, description: $description, code: $code, isShow: $isShow, isPromotionNational: $isPromotionNational, isAllMerchant: $isAllMerchant, isPublic: $isPublic, isOpenToJoin: $isOpenToJoin, hasJoined: $hasJoined, joinUrl: $joinUrl, type: $type, typeLabel: $typeLabel, discountType: $discountType, discountTypeLabel: $discountTypeLabel, discount: $discount, discountLabel: $discountLabel, minPurchase: $minPurchase, minPurchaseLabel: $minPurchaseLabel, maxDiscount: $maxDiscount, maxDiscountLabel: $maxDiscountLabel, isUnlimitedUse: $isUnlimitedUse, maxUse: $maxUse, quotaLabel: $quotaLabel, periodLabel: $periodLabel, datetimeStart: $datetimeStart, datetimeEnd: $datetimeEnd, bannerImage: $bannerImage, detailUrl: $detailUrl, chatMessage: $chatMessage)';
}


}




// dart format on
