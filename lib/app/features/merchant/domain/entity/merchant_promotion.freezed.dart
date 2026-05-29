// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'merchant_promotion.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
MerchantPromotion _$MerchantPromotionFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'entity':
          return MerchantPromotionEntity.fromJson(
            json
          );
                case 'sendParam':
          return MerchantPromotionSendParam.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'MerchantPromotion',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$MerchantPromotion {

 String? get code; String get title; bool get isShow; String get type; Object get datetimeStart; Object get datetimeEnd; String get discountType; int get discount; int get minPurchase; int? get maxDiscount; String get eligibility; bool get isUnlimitedUse; int? get maxUse; List<dynamic> get productAssignments;

  /// Serializes this MerchantPromotion to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantPromotion&&(identical(other.code, code) || other.code == code)&&(identical(other.title, title) || other.title == title)&&(identical(other.isShow, isShow) || other.isShow == isShow)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other.datetimeStart, datetimeStart)&&const DeepCollectionEquality().equals(other.datetimeEnd, datetimeEnd)&&(identical(other.discountType, discountType) || other.discountType == discountType)&&(identical(other.discount, discount) || other.discount == discount)&&(identical(other.minPurchase, minPurchase) || other.minPurchase == minPurchase)&&(identical(other.maxDiscount, maxDiscount) || other.maxDiscount == maxDiscount)&&(identical(other.eligibility, eligibility) || other.eligibility == eligibility)&&(identical(other.isUnlimitedUse, isUnlimitedUse) || other.isUnlimitedUse == isUnlimitedUse)&&(identical(other.maxUse, maxUse) || other.maxUse == maxUse)&&const DeepCollectionEquality().equals(other.productAssignments, productAssignments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,title,isShow,type,const DeepCollectionEquality().hash(datetimeStart),const DeepCollectionEquality().hash(datetimeEnd),discountType,discount,minPurchase,maxDiscount,eligibility,isUnlimitedUse,maxUse,const DeepCollectionEquality().hash(productAssignments));

@override
String toString() {
  return 'MerchantPromotion(code: $code, title: $title, isShow: $isShow, type: $type, datetimeStart: $datetimeStart, datetimeEnd: $datetimeEnd, discountType: $discountType, discount: $discount, minPurchase: $minPurchase, maxDiscount: $maxDiscount, eligibility: $eligibility, isUnlimitedUse: $isUnlimitedUse, maxUse: $maxUse, productAssignments: $productAssignments)';
}


}




/// Adds pattern-matching-related methods to [MerchantPromotion].
extension MerchantPromotionPatterns on MerchantPromotion {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MerchantPromotionEntity value)?  entity,TResult Function( MerchantPromotionSendParam value)?  sendParam,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MerchantPromotionEntity() when entity != null:
return entity(_that);case MerchantPromotionSendParam() when sendParam != null:
return sendParam(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MerchantPromotionEntity value)  entity,required TResult Function( MerchantPromotionSendParam value)  sendParam,}){
final _that = this;
switch (_that) {
case MerchantPromotionEntity():
return entity(_that);case MerchantPromotionSendParam():
return sendParam(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MerchantPromotionEntity value)?  entity,TResult? Function( MerchantPromotionSendParam value)?  sendParam,}){
final _that = this;
switch (_that) {
case MerchantPromotionEntity() when entity != null:
return entity(_that);case MerchantPromotionSendParam() when sendParam != null:
return sendParam(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String id,  String? code,  String title,  bool isShow,  bool isPromotionNational,  bool isAllMerchant,  String type,  String typeLabel,  DateTime datetimeStart,  DateTime datetimeEnd,  String discountType,  String discountTypeLabel,  int discount,  String discountLabel,  int minPurchase,  int? maxDiscount,  String eligibility,  String eligibilityLabel,  bool isUnlimitedUse,  int? maxUse,  List<MerchantPromotionAssignmentEntity> merchantAssignments,  List<MerchantPromotionProductAssignmentEntity> productAssignments,  DateTime createdAt,  DateTime updatedAt)?  entity,TResult Function( String? code,  String title,  bool isShow,  String type,  String datetimeStart,  String datetimeEnd,  String discountType,  int discount,  int minPurchase,  int? maxDiscount,  String eligibility,  bool isUnlimitedUse,  int? maxUse,  String merchantDatetimeStart,  String merchantDatetimeEnd,  List<MerchantPromotionProductAssignmentParamEntity> productAssignments)?  sendParam,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MerchantPromotionEntity() when entity != null:
return entity(_that.id,_that.code,_that.title,_that.isShow,_that.isPromotionNational,_that.isAllMerchant,_that.type,_that.typeLabel,_that.datetimeStart,_that.datetimeEnd,_that.discountType,_that.discountTypeLabel,_that.discount,_that.discountLabel,_that.minPurchase,_that.maxDiscount,_that.eligibility,_that.eligibilityLabel,_that.isUnlimitedUse,_that.maxUse,_that.merchantAssignments,_that.productAssignments,_that.createdAt,_that.updatedAt);case MerchantPromotionSendParam() when sendParam != null:
return sendParam(_that.code,_that.title,_that.isShow,_that.type,_that.datetimeStart,_that.datetimeEnd,_that.discountType,_that.discount,_that.minPurchase,_that.maxDiscount,_that.eligibility,_that.isUnlimitedUse,_that.maxUse,_that.merchantDatetimeStart,_that.merchantDatetimeEnd,_that.productAssignments);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String id,  String? code,  String title,  bool isShow,  bool isPromotionNational,  bool isAllMerchant,  String type,  String typeLabel,  DateTime datetimeStart,  DateTime datetimeEnd,  String discountType,  String discountTypeLabel,  int discount,  String discountLabel,  int minPurchase,  int? maxDiscount,  String eligibility,  String eligibilityLabel,  bool isUnlimitedUse,  int? maxUse,  List<MerchantPromotionAssignmentEntity> merchantAssignments,  List<MerchantPromotionProductAssignmentEntity> productAssignments,  DateTime createdAt,  DateTime updatedAt)  entity,required TResult Function( String? code,  String title,  bool isShow,  String type,  String datetimeStart,  String datetimeEnd,  String discountType,  int discount,  int minPurchase,  int? maxDiscount,  String eligibility,  bool isUnlimitedUse,  int? maxUse,  String merchantDatetimeStart,  String merchantDatetimeEnd,  List<MerchantPromotionProductAssignmentParamEntity> productAssignments)  sendParam,}) {final _that = this;
switch (_that) {
case MerchantPromotionEntity():
return entity(_that.id,_that.code,_that.title,_that.isShow,_that.isPromotionNational,_that.isAllMerchant,_that.type,_that.typeLabel,_that.datetimeStart,_that.datetimeEnd,_that.discountType,_that.discountTypeLabel,_that.discount,_that.discountLabel,_that.minPurchase,_that.maxDiscount,_that.eligibility,_that.eligibilityLabel,_that.isUnlimitedUse,_that.maxUse,_that.merchantAssignments,_that.productAssignments,_that.createdAt,_that.updatedAt);case MerchantPromotionSendParam():
return sendParam(_that.code,_that.title,_that.isShow,_that.type,_that.datetimeStart,_that.datetimeEnd,_that.discountType,_that.discount,_that.minPurchase,_that.maxDiscount,_that.eligibility,_that.isUnlimitedUse,_that.maxUse,_that.merchantDatetimeStart,_that.merchantDatetimeEnd,_that.productAssignments);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String id,  String? code,  String title,  bool isShow,  bool isPromotionNational,  bool isAllMerchant,  String type,  String typeLabel,  DateTime datetimeStart,  DateTime datetimeEnd,  String discountType,  String discountTypeLabel,  int discount,  String discountLabel,  int minPurchase,  int? maxDiscount,  String eligibility,  String eligibilityLabel,  bool isUnlimitedUse,  int? maxUse,  List<MerchantPromotionAssignmentEntity> merchantAssignments,  List<MerchantPromotionProductAssignmentEntity> productAssignments,  DateTime createdAt,  DateTime updatedAt)?  entity,TResult? Function( String? code,  String title,  bool isShow,  String type,  String datetimeStart,  String datetimeEnd,  String discountType,  int discount,  int minPurchase,  int? maxDiscount,  String eligibility,  bool isUnlimitedUse,  int? maxUse,  String merchantDatetimeStart,  String merchantDatetimeEnd,  List<MerchantPromotionProductAssignmentParamEntity> productAssignments)?  sendParam,}) {final _that = this;
switch (_that) {
case MerchantPromotionEntity() when entity != null:
return entity(_that.id,_that.code,_that.title,_that.isShow,_that.isPromotionNational,_that.isAllMerchant,_that.type,_that.typeLabel,_that.datetimeStart,_that.datetimeEnd,_that.discountType,_that.discountTypeLabel,_that.discount,_that.discountLabel,_that.minPurchase,_that.maxDiscount,_that.eligibility,_that.eligibilityLabel,_that.isUnlimitedUse,_that.maxUse,_that.merchantAssignments,_that.productAssignments,_that.createdAt,_that.updatedAt);case MerchantPromotionSendParam() when sendParam != null:
return sendParam(_that.code,_that.title,_that.isShow,_that.type,_that.datetimeStart,_that.datetimeEnd,_that.discountType,_that.discount,_that.minPurchase,_that.maxDiscount,_that.eligibility,_that.isUnlimitedUse,_that.maxUse,_that.merchantDatetimeStart,_that.merchantDatetimeEnd,_that.productAssignments);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class MerchantPromotionEntity implements MerchantPromotion {
  const MerchantPromotionEntity({required this.id, this.code, required this.title, required this.isShow, required this.isPromotionNational, required this.isAllMerchant, required this.type, required this.typeLabel, required this.datetimeStart, required this.datetimeEnd, required this.discountType, required this.discountTypeLabel, required this.discount, required this.discountLabel, required this.minPurchase, this.maxDiscount, required this.eligibility, required this.eligibilityLabel, required this.isUnlimitedUse, this.maxUse, final  List<MerchantPromotionAssignmentEntity> merchantAssignments = const [], final  List<MerchantPromotionProductAssignmentEntity> productAssignments = const [], required this.createdAt, required this.updatedAt, final  String? $type}): _merchantAssignments = merchantAssignments,_productAssignments = productAssignments,$type = $type ?? 'entity';
  factory MerchantPromotionEntity.fromJson(Map<String, dynamic> json) => _$MerchantPromotionEntityFromJson(json);

 final  String id;
@override final  String? code;
@override final  String title;
@override final  bool isShow;
 final  bool isPromotionNational;
 final  bool isAllMerchant;
@override final  String type;
 final  String typeLabel;
@override final  DateTime datetimeStart;
@override final  DateTime datetimeEnd;
@override final  String discountType;
 final  String discountTypeLabel;
@override final  int discount;
 final  String discountLabel;
@override final  int minPurchase;
@override final  int? maxDiscount;
@override final  String eligibility;
 final  String eligibilityLabel;
@override final  bool isUnlimitedUse;
@override final  int? maxUse;
 final  List<MerchantPromotionAssignmentEntity> _merchantAssignments;
@JsonKey() List<MerchantPromotionAssignmentEntity> get merchantAssignments {
  if (_merchantAssignments is EqualUnmodifiableListView) return _merchantAssignments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_merchantAssignments);
}

 final  List<MerchantPromotionProductAssignmentEntity> _productAssignments;
@override@JsonKey() List<MerchantPromotionProductAssignmentEntity> get productAssignments {
  if (_productAssignments is EqualUnmodifiableListView) return _productAssignments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_productAssignments);
}

 final  DateTime createdAt;
 final  DateTime updatedAt;

@JsonKey(name: 'runtimeType')
final String $type;



@override
Map<String, dynamic> toJson() {
  return _$MerchantPromotionEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantPromotionEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&(identical(other.title, title) || other.title == title)&&(identical(other.isShow, isShow) || other.isShow == isShow)&&(identical(other.isPromotionNational, isPromotionNational) || other.isPromotionNational == isPromotionNational)&&(identical(other.isAllMerchant, isAllMerchant) || other.isAllMerchant == isAllMerchant)&&(identical(other.type, type) || other.type == type)&&(identical(other.typeLabel, typeLabel) || other.typeLabel == typeLabel)&&(identical(other.datetimeStart, datetimeStart) || other.datetimeStart == datetimeStart)&&(identical(other.datetimeEnd, datetimeEnd) || other.datetimeEnd == datetimeEnd)&&(identical(other.discountType, discountType) || other.discountType == discountType)&&(identical(other.discountTypeLabel, discountTypeLabel) || other.discountTypeLabel == discountTypeLabel)&&(identical(other.discount, discount) || other.discount == discount)&&(identical(other.discountLabel, discountLabel) || other.discountLabel == discountLabel)&&(identical(other.minPurchase, minPurchase) || other.minPurchase == minPurchase)&&(identical(other.maxDiscount, maxDiscount) || other.maxDiscount == maxDiscount)&&(identical(other.eligibility, eligibility) || other.eligibility == eligibility)&&(identical(other.eligibilityLabel, eligibilityLabel) || other.eligibilityLabel == eligibilityLabel)&&(identical(other.isUnlimitedUse, isUnlimitedUse) || other.isUnlimitedUse == isUnlimitedUse)&&(identical(other.maxUse, maxUse) || other.maxUse == maxUse)&&const DeepCollectionEquality().equals(other._merchantAssignments, _merchantAssignments)&&const DeepCollectionEquality().equals(other._productAssignments, _productAssignments)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,code,title,isShow,isPromotionNational,isAllMerchant,type,typeLabel,datetimeStart,datetimeEnd,discountType,discountTypeLabel,discount,discountLabel,minPurchase,maxDiscount,eligibility,eligibilityLabel,isUnlimitedUse,maxUse,const DeepCollectionEquality().hash(_merchantAssignments),const DeepCollectionEquality().hash(_productAssignments),createdAt,updatedAt]);

@override
String toString() {
  return 'MerchantPromotion.entity(id: $id, code: $code, title: $title, isShow: $isShow, isPromotionNational: $isPromotionNational, isAllMerchant: $isAllMerchant, type: $type, typeLabel: $typeLabel, datetimeStart: $datetimeStart, datetimeEnd: $datetimeEnd, discountType: $discountType, discountTypeLabel: $discountTypeLabel, discount: $discount, discountLabel: $discountLabel, minPurchase: $minPurchase, maxDiscount: $maxDiscount, eligibility: $eligibility, eligibilityLabel: $eligibilityLabel, isUnlimitedUse: $isUnlimitedUse, maxUse: $maxUse, merchantAssignments: $merchantAssignments, productAssignments: $productAssignments, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}




/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class MerchantPromotionSendParam implements MerchantPromotion {
  const MerchantPromotionSendParam({this.code, required this.title, required this.isShow, required this.type, required this.datetimeStart, required this.datetimeEnd, required this.discountType, required this.discount, required this.minPurchase, this.maxDiscount, required this.eligibility, required this.isUnlimitedUse, this.maxUse, required this.merchantDatetimeStart, required this.merchantDatetimeEnd, final  List<MerchantPromotionProductAssignmentParamEntity> productAssignments = const [], final  String? $type}): _productAssignments = productAssignments,$type = $type ?? 'sendParam';
  factory MerchantPromotionSendParam.fromJson(Map<String, dynamic> json) => _$MerchantPromotionSendParamFromJson(json);

@override final  String? code;
@override final  String title;
@override final  bool isShow;
@override final  String type;
@override final  String datetimeStart;
@override final  String datetimeEnd;
@override final  String discountType;
@override final  int discount;
@override final  int minPurchase;
@override final  int? maxDiscount;
@override final  String eligibility;
@override final  bool isUnlimitedUse;
@override final  int? maxUse;
 final  String merchantDatetimeStart;
 final  String merchantDatetimeEnd;
 final  List<MerchantPromotionProductAssignmentParamEntity> _productAssignments;
@override@JsonKey() List<MerchantPromotionProductAssignmentParamEntity> get productAssignments {
  if (_productAssignments is EqualUnmodifiableListView) return _productAssignments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_productAssignments);
}


@JsonKey(name: 'runtimeType')
final String $type;



@override
Map<String, dynamic> toJson() {
  return _$MerchantPromotionSendParamToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantPromotionSendParam&&(identical(other.code, code) || other.code == code)&&(identical(other.title, title) || other.title == title)&&(identical(other.isShow, isShow) || other.isShow == isShow)&&(identical(other.type, type) || other.type == type)&&(identical(other.datetimeStart, datetimeStart) || other.datetimeStart == datetimeStart)&&(identical(other.datetimeEnd, datetimeEnd) || other.datetimeEnd == datetimeEnd)&&(identical(other.discountType, discountType) || other.discountType == discountType)&&(identical(other.discount, discount) || other.discount == discount)&&(identical(other.minPurchase, minPurchase) || other.minPurchase == minPurchase)&&(identical(other.maxDiscount, maxDiscount) || other.maxDiscount == maxDiscount)&&(identical(other.eligibility, eligibility) || other.eligibility == eligibility)&&(identical(other.isUnlimitedUse, isUnlimitedUse) || other.isUnlimitedUse == isUnlimitedUse)&&(identical(other.maxUse, maxUse) || other.maxUse == maxUse)&&(identical(other.merchantDatetimeStart, merchantDatetimeStart) || other.merchantDatetimeStart == merchantDatetimeStart)&&(identical(other.merchantDatetimeEnd, merchantDatetimeEnd) || other.merchantDatetimeEnd == merchantDatetimeEnd)&&const DeepCollectionEquality().equals(other._productAssignments, _productAssignments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,title,isShow,type,datetimeStart,datetimeEnd,discountType,discount,minPurchase,maxDiscount,eligibility,isUnlimitedUse,maxUse,merchantDatetimeStart,merchantDatetimeEnd,const DeepCollectionEquality().hash(_productAssignments));

@override
String toString() {
  return 'MerchantPromotion.sendParam(code: $code, title: $title, isShow: $isShow, type: $type, datetimeStart: $datetimeStart, datetimeEnd: $datetimeEnd, discountType: $discountType, discount: $discount, minPurchase: $minPurchase, maxDiscount: $maxDiscount, eligibility: $eligibility, isUnlimitedUse: $isUnlimitedUse, maxUse: $maxUse, merchantDatetimeStart: $merchantDatetimeStart, merchantDatetimeEnd: $merchantDatetimeEnd, productAssignments: $productAssignments)';
}


}




// dart format on
