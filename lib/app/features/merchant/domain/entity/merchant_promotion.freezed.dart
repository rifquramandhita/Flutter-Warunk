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
    return MerchantPromotionEntity.fromJson(
      json
    );
}

/// @nodoc
mixin _$MerchantPromotion {

 String get id; String? get code; String get title; bool get isShow; bool get isPromotionNational; bool get isAllMerchant; String get type; String get typeLabel; DateTime get datetimeStart; DateTime get datetimeEnd; String get discountType; String get discountTypeLabel; int get discount; String get discountLabel; int get minPurchase; int? get maxDiscount; String get eligibility; String get eligibilityLabel; bool get isUnlimitedUse; int? get maxUse; List<MerchantPromotionAssignmentEntity> get merchantAssignments; List<MerchantPromotionProductAssignmentEntity> get productAssignments; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of MerchantPromotion
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantPromotionCopyWith<MerchantPromotion> get copyWith => _$MerchantPromotionCopyWithImpl<MerchantPromotion>(this as MerchantPromotion, _$identity);

  /// Serializes this MerchantPromotion to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantPromotion&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&(identical(other.title, title) || other.title == title)&&(identical(other.isShow, isShow) || other.isShow == isShow)&&(identical(other.isPromotionNational, isPromotionNational) || other.isPromotionNational == isPromotionNational)&&(identical(other.isAllMerchant, isAllMerchant) || other.isAllMerchant == isAllMerchant)&&(identical(other.type, type) || other.type == type)&&(identical(other.typeLabel, typeLabel) || other.typeLabel == typeLabel)&&(identical(other.datetimeStart, datetimeStart) || other.datetimeStart == datetimeStart)&&(identical(other.datetimeEnd, datetimeEnd) || other.datetimeEnd == datetimeEnd)&&(identical(other.discountType, discountType) || other.discountType == discountType)&&(identical(other.discountTypeLabel, discountTypeLabel) || other.discountTypeLabel == discountTypeLabel)&&(identical(other.discount, discount) || other.discount == discount)&&(identical(other.discountLabel, discountLabel) || other.discountLabel == discountLabel)&&(identical(other.minPurchase, minPurchase) || other.minPurchase == minPurchase)&&(identical(other.maxDiscount, maxDiscount) || other.maxDiscount == maxDiscount)&&(identical(other.eligibility, eligibility) || other.eligibility == eligibility)&&(identical(other.eligibilityLabel, eligibilityLabel) || other.eligibilityLabel == eligibilityLabel)&&(identical(other.isUnlimitedUse, isUnlimitedUse) || other.isUnlimitedUse == isUnlimitedUse)&&(identical(other.maxUse, maxUse) || other.maxUse == maxUse)&&const DeepCollectionEquality().equals(other.merchantAssignments, merchantAssignments)&&const DeepCollectionEquality().equals(other.productAssignments, productAssignments)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,code,title,isShow,isPromotionNational,isAllMerchant,type,typeLabel,datetimeStart,datetimeEnd,discountType,discountTypeLabel,discount,discountLabel,minPurchase,maxDiscount,eligibility,eligibilityLabel,isUnlimitedUse,maxUse,const DeepCollectionEquality().hash(merchantAssignments),const DeepCollectionEquality().hash(productAssignments),createdAt,updatedAt]);

@override
String toString() {
  return 'MerchantPromotion(id: $id, code: $code, title: $title, isShow: $isShow, isPromotionNational: $isPromotionNational, isAllMerchant: $isAllMerchant, type: $type, typeLabel: $typeLabel, datetimeStart: $datetimeStart, datetimeEnd: $datetimeEnd, discountType: $discountType, discountTypeLabel: $discountTypeLabel, discount: $discount, discountLabel: $discountLabel, minPurchase: $minPurchase, maxDiscount: $maxDiscount, eligibility: $eligibility, eligibilityLabel: $eligibilityLabel, isUnlimitedUse: $isUnlimitedUse, maxUse: $maxUse, merchantAssignments: $merchantAssignments, productAssignments: $productAssignments, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $MerchantPromotionCopyWith<$Res>  {
  factory $MerchantPromotionCopyWith(MerchantPromotion value, $Res Function(MerchantPromotion) _then) = _$MerchantPromotionCopyWithImpl;
@useResult
$Res call({
 String id, String? code, String title, bool isShow, bool isPromotionNational, bool isAllMerchant, String type, String typeLabel, DateTime datetimeStart, DateTime datetimeEnd, String discountType, String discountTypeLabel, int discount, String discountLabel, int minPurchase, int? maxDiscount, String eligibility, String eligibilityLabel, bool isUnlimitedUse, int? maxUse, List<MerchantPromotionAssignmentEntity> merchantAssignments, List<MerchantPromotionProductAssignmentEntity> productAssignments, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$MerchantPromotionCopyWithImpl<$Res>
    implements $MerchantPromotionCopyWith<$Res> {
  _$MerchantPromotionCopyWithImpl(this._self, this._then);

  final MerchantPromotion _self;
  final $Res Function(MerchantPromotion) _then;

/// Create a copy of MerchantPromotion
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? code = freezed,Object? title = null,Object? isShow = null,Object? isPromotionNational = null,Object? isAllMerchant = null,Object? type = null,Object? typeLabel = null,Object? datetimeStart = null,Object? datetimeEnd = null,Object? discountType = null,Object? discountTypeLabel = null,Object? discount = null,Object? discountLabel = null,Object? minPurchase = null,Object? maxDiscount = freezed,Object? eligibility = null,Object? eligibilityLabel = null,Object? isUnlimitedUse = null,Object? maxUse = freezed,Object? merchantAssignments = null,Object? productAssignments = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,isShow: null == isShow ? _self.isShow : isShow // ignore: cast_nullable_to_non_nullable
as bool,isPromotionNational: null == isPromotionNational ? _self.isPromotionNational : isPromotionNational // ignore: cast_nullable_to_non_nullable
as bool,isAllMerchant: null == isAllMerchant ? _self.isAllMerchant : isAllMerchant // ignore: cast_nullable_to_non_nullable
as bool,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,typeLabel: null == typeLabel ? _self.typeLabel : typeLabel // ignore: cast_nullable_to_non_nullable
as String,datetimeStart: null == datetimeStart ? _self.datetimeStart : datetimeStart // ignore: cast_nullable_to_non_nullable
as DateTime,datetimeEnd: null == datetimeEnd ? _self.datetimeEnd : datetimeEnd // ignore: cast_nullable_to_non_nullable
as DateTime,discountType: null == discountType ? _self.discountType : discountType // ignore: cast_nullable_to_non_nullable
as String,discountTypeLabel: null == discountTypeLabel ? _self.discountTypeLabel : discountTypeLabel // ignore: cast_nullable_to_non_nullable
as String,discount: null == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as int,discountLabel: null == discountLabel ? _self.discountLabel : discountLabel // ignore: cast_nullable_to_non_nullable
as String,minPurchase: null == minPurchase ? _self.minPurchase : minPurchase // ignore: cast_nullable_to_non_nullable
as int,maxDiscount: freezed == maxDiscount ? _self.maxDiscount : maxDiscount // ignore: cast_nullable_to_non_nullable
as int?,eligibility: null == eligibility ? _self.eligibility : eligibility // ignore: cast_nullable_to_non_nullable
as String,eligibilityLabel: null == eligibilityLabel ? _self.eligibilityLabel : eligibilityLabel // ignore: cast_nullable_to_non_nullable
as String,isUnlimitedUse: null == isUnlimitedUse ? _self.isUnlimitedUse : isUnlimitedUse // ignore: cast_nullable_to_non_nullable
as bool,maxUse: freezed == maxUse ? _self.maxUse : maxUse // ignore: cast_nullable_to_non_nullable
as int?,merchantAssignments: null == merchantAssignments ? _self.merchantAssignments : merchantAssignments // ignore: cast_nullable_to_non_nullable
as List<MerchantPromotionAssignmentEntity>,productAssignments: null == productAssignments ? _self.productAssignments : productAssignments // ignore: cast_nullable_to_non_nullable
as List<MerchantPromotionProductAssignmentEntity>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MerchantPromotionEntity value)?  entity,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MerchantPromotionEntity() when entity != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MerchantPromotionEntity value)  entity,}){
final _that = this;
switch (_that) {
case MerchantPromotionEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MerchantPromotionEntity value)?  entity,}){
final _that = this;
switch (_that) {
case MerchantPromotionEntity() when entity != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String id,  String? code,  String title,  bool isShow,  bool isPromotionNational,  bool isAllMerchant,  String type,  String typeLabel,  DateTime datetimeStart,  DateTime datetimeEnd,  String discountType,  String discountTypeLabel,  int discount,  String discountLabel,  int minPurchase,  int? maxDiscount,  String eligibility,  String eligibilityLabel,  bool isUnlimitedUse,  int? maxUse,  List<MerchantPromotionAssignmentEntity> merchantAssignments,  List<MerchantPromotionProductAssignmentEntity> productAssignments,  DateTime createdAt,  DateTime updatedAt)?  entity,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MerchantPromotionEntity() when entity != null:
return entity(_that.id,_that.code,_that.title,_that.isShow,_that.isPromotionNational,_that.isAllMerchant,_that.type,_that.typeLabel,_that.datetimeStart,_that.datetimeEnd,_that.discountType,_that.discountTypeLabel,_that.discount,_that.discountLabel,_that.minPurchase,_that.maxDiscount,_that.eligibility,_that.eligibilityLabel,_that.isUnlimitedUse,_that.maxUse,_that.merchantAssignments,_that.productAssignments,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String id,  String? code,  String title,  bool isShow,  bool isPromotionNational,  bool isAllMerchant,  String type,  String typeLabel,  DateTime datetimeStart,  DateTime datetimeEnd,  String discountType,  String discountTypeLabel,  int discount,  String discountLabel,  int minPurchase,  int? maxDiscount,  String eligibility,  String eligibilityLabel,  bool isUnlimitedUse,  int? maxUse,  List<MerchantPromotionAssignmentEntity> merchantAssignments,  List<MerchantPromotionProductAssignmentEntity> productAssignments,  DateTime createdAt,  DateTime updatedAt)  entity,}) {final _that = this;
switch (_that) {
case MerchantPromotionEntity():
return entity(_that.id,_that.code,_that.title,_that.isShow,_that.isPromotionNational,_that.isAllMerchant,_that.type,_that.typeLabel,_that.datetimeStart,_that.datetimeEnd,_that.discountType,_that.discountTypeLabel,_that.discount,_that.discountLabel,_that.minPurchase,_that.maxDiscount,_that.eligibility,_that.eligibilityLabel,_that.isUnlimitedUse,_that.maxUse,_that.merchantAssignments,_that.productAssignments,_that.createdAt,_that.updatedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String id,  String? code,  String title,  bool isShow,  bool isPromotionNational,  bool isAllMerchant,  String type,  String typeLabel,  DateTime datetimeStart,  DateTime datetimeEnd,  String discountType,  String discountTypeLabel,  int discount,  String discountLabel,  int minPurchase,  int? maxDiscount,  String eligibility,  String eligibilityLabel,  bool isUnlimitedUse,  int? maxUse,  List<MerchantPromotionAssignmentEntity> merchantAssignments,  List<MerchantPromotionProductAssignmentEntity> productAssignments,  DateTime createdAt,  DateTime updatedAt)?  entity,}) {final _that = this;
switch (_that) {
case MerchantPromotionEntity() when entity != null:
return entity(_that.id,_that.code,_that.title,_that.isShow,_that.isPromotionNational,_that.isAllMerchant,_that.type,_that.typeLabel,_that.datetimeStart,_that.datetimeEnd,_that.discountType,_that.discountTypeLabel,_that.discount,_that.discountLabel,_that.minPurchase,_that.maxDiscount,_that.eligibility,_that.eligibilityLabel,_that.isUnlimitedUse,_that.maxUse,_that.merchantAssignments,_that.productAssignments,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class MerchantPromotionEntity implements MerchantPromotion {
  const MerchantPromotionEntity({required this.id, this.code, required this.title, required this.isShow, required this.isPromotionNational, required this.isAllMerchant, required this.type, required this.typeLabel, required this.datetimeStart, required this.datetimeEnd, required this.discountType, required this.discountTypeLabel, required this.discount, required this.discountLabel, required this.minPurchase, this.maxDiscount, required this.eligibility, required this.eligibilityLabel, required this.isUnlimitedUse, this.maxUse, final  List<MerchantPromotionAssignmentEntity> merchantAssignments = const [], final  List<MerchantPromotionProductAssignmentEntity> productAssignments = const [], required this.createdAt, required this.updatedAt}): _merchantAssignments = merchantAssignments,_productAssignments = productAssignments;
  factory MerchantPromotionEntity.fromJson(Map<String, dynamic> json) => _$MerchantPromotionEntityFromJson(json);

@override final  String id;
@override final  String? code;
@override final  String title;
@override final  bool isShow;
@override final  bool isPromotionNational;
@override final  bool isAllMerchant;
@override final  String type;
@override final  String typeLabel;
@override final  DateTime datetimeStart;
@override final  DateTime datetimeEnd;
@override final  String discountType;
@override final  String discountTypeLabel;
@override final  int discount;
@override final  String discountLabel;
@override final  int minPurchase;
@override final  int? maxDiscount;
@override final  String eligibility;
@override final  String eligibilityLabel;
@override final  bool isUnlimitedUse;
@override final  int? maxUse;
 final  List<MerchantPromotionAssignmentEntity> _merchantAssignments;
@override@JsonKey() List<MerchantPromotionAssignmentEntity> get merchantAssignments {
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

@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of MerchantPromotion
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantPromotionEntityCopyWith<MerchantPromotionEntity> get copyWith => _$MerchantPromotionEntityCopyWithImpl<MerchantPromotionEntity>(this, _$identity);

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
abstract mixin class $MerchantPromotionEntityCopyWith<$Res> implements $MerchantPromotionCopyWith<$Res> {
  factory $MerchantPromotionEntityCopyWith(MerchantPromotionEntity value, $Res Function(MerchantPromotionEntity) _then) = _$MerchantPromotionEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String? code, String title, bool isShow, bool isPromotionNational, bool isAllMerchant, String type, String typeLabel, DateTime datetimeStart, DateTime datetimeEnd, String discountType, String discountTypeLabel, int discount, String discountLabel, int minPurchase, int? maxDiscount, String eligibility, String eligibilityLabel, bool isUnlimitedUse, int? maxUse, List<MerchantPromotionAssignmentEntity> merchantAssignments, List<MerchantPromotionProductAssignmentEntity> productAssignments, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$MerchantPromotionEntityCopyWithImpl<$Res>
    implements $MerchantPromotionEntityCopyWith<$Res> {
  _$MerchantPromotionEntityCopyWithImpl(this._self, this._then);

  final MerchantPromotionEntity _self;
  final $Res Function(MerchantPromotionEntity) _then;

/// Create a copy of MerchantPromotion
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? code = freezed,Object? title = null,Object? isShow = null,Object? isPromotionNational = null,Object? isAllMerchant = null,Object? type = null,Object? typeLabel = null,Object? datetimeStart = null,Object? datetimeEnd = null,Object? discountType = null,Object? discountTypeLabel = null,Object? discount = null,Object? discountLabel = null,Object? minPurchase = null,Object? maxDiscount = freezed,Object? eligibility = null,Object? eligibilityLabel = null,Object? isUnlimitedUse = null,Object? maxUse = freezed,Object? merchantAssignments = null,Object? productAssignments = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(MerchantPromotionEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,isShow: null == isShow ? _self.isShow : isShow // ignore: cast_nullable_to_non_nullable
as bool,isPromotionNational: null == isPromotionNational ? _self.isPromotionNational : isPromotionNational // ignore: cast_nullable_to_non_nullable
as bool,isAllMerchant: null == isAllMerchant ? _self.isAllMerchant : isAllMerchant // ignore: cast_nullable_to_non_nullable
as bool,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,typeLabel: null == typeLabel ? _self.typeLabel : typeLabel // ignore: cast_nullable_to_non_nullable
as String,datetimeStart: null == datetimeStart ? _self.datetimeStart : datetimeStart // ignore: cast_nullable_to_non_nullable
as DateTime,datetimeEnd: null == datetimeEnd ? _self.datetimeEnd : datetimeEnd // ignore: cast_nullable_to_non_nullable
as DateTime,discountType: null == discountType ? _self.discountType : discountType // ignore: cast_nullable_to_non_nullable
as String,discountTypeLabel: null == discountTypeLabel ? _self.discountTypeLabel : discountTypeLabel // ignore: cast_nullable_to_non_nullable
as String,discount: null == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as int,discountLabel: null == discountLabel ? _self.discountLabel : discountLabel // ignore: cast_nullable_to_non_nullable
as String,minPurchase: null == minPurchase ? _self.minPurchase : minPurchase // ignore: cast_nullable_to_non_nullable
as int,maxDiscount: freezed == maxDiscount ? _self.maxDiscount : maxDiscount // ignore: cast_nullable_to_non_nullable
as int?,eligibility: null == eligibility ? _self.eligibility : eligibility // ignore: cast_nullable_to_non_nullable
as String,eligibilityLabel: null == eligibilityLabel ? _self.eligibilityLabel : eligibilityLabel // ignore: cast_nullable_to_non_nullable
as String,isUnlimitedUse: null == isUnlimitedUse ? _self.isUnlimitedUse : isUnlimitedUse // ignore: cast_nullable_to_non_nullable
as bool,maxUse: freezed == maxUse ? _self.maxUse : maxUse // ignore: cast_nullable_to_non_nullable
as int?,merchantAssignments: null == merchantAssignments ? _self._merchantAssignments : merchantAssignments // ignore: cast_nullable_to_non_nullable
as List<MerchantPromotionAssignmentEntity>,productAssignments: null == productAssignments ? _self._productAssignments : productAssignments // ignore: cast_nullable_to_non_nullable
as List<MerchantPromotionProductAssignmentEntity>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

MerchantPromotionAssignment _$MerchantPromotionAssignmentFromJson(
  Map<String, dynamic> json
) {
    return MerchantPromotionAssignmentEntity.fromJson(
      json
    );
}

/// @nodoc
mixin _$MerchantPromotionAssignment {

 String get id; String get merchantId; String get merchantName; DateTime get datetimeStart; DateTime get datetimeEnd;
/// Create a copy of MerchantPromotionAssignment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantPromotionAssignmentCopyWith<MerchantPromotionAssignment> get copyWith => _$MerchantPromotionAssignmentCopyWithImpl<MerchantPromotionAssignment>(this as MerchantPromotionAssignment, _$identity);

  /// Serializes this MerchantPromotionAssignment to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantPromotionAssignment&&(identical(other.id, id) || other.id == id)&&(identical(other.merchantId, merchantId) || other.merchantId == merchantId)&&(identical(other.merchantName, merchantName) || other.merchantName == merchantName)&&(identical(other.datetimeStart, datetimeStart) || other.datetimeStart == datetimeStart)&&(identical(other.datetimeEnd, datetimeEnd) || other.datetimeEnd == datetimeEnd));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,merchantId,merchantName,datetimeStart,datetimeEnd);

@override
String toString() {
  return 'MerchantPromotionAssignment(id: $id, merchantId: $merchantId, merchantName: $merchantName, datetimeStart: $datetimeStart, datetimeEnd: $datetimeEnd)';
}


}

/// @nodoc
abstract mixin class $MerchantPromotionAssignmentCopyWith<$Res>  {
  factory $MerchantPromotionAssignmentCopyWith(MerchantPromotionAssignment value, $Res Function(MerchantPromotionAssignment) _then) = _$MerchantPromotionAssignmentCopyWithImpl;
@useResult
$Res call({
 String id, String merchantId, String merchantName, DateTime datetimeStart, DateTime datetimeEnd
});




}
/// @nodoc
class _$MerchantPromotionAssignmentCopyWithImpl<$Res>
    implements $MerchantPromotionAssignmentCopyWith<$Res> {
  _$MerchantPromotionAssignmentCopyWithImpl(this._self, this._then);

  final MerchantPromotionAssignment _self;
  final $Res Function(MerchantPromotionAssignment) _then;

/// Create a copy of MerchantPromotionAssignment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? merchantId = null,Object? merchantName = null,Object? datetimeStart = null,Object? datetimeEnd = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,merchantId: null == merchantId ? _self.merchantId : merchantId // ignore: cast_nullable_to_non_nullable
as String,merchantName: null == merchantName ? _self.merchantName : merchantName // ignore: cast_nullable_to_non_nullable
as String,datetimeStart: null == datetimeStart ? _self.datetimeStart : datetimeStart // ignore: cast_nullable_to_non_nullable
as DateTime,datetimeEnd: null == datetimeEnd ? _self.datetimeEnd : datetimeEnd // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [MerchantPromotionAssignment].
extension MerchantPromotionAssignmentPatterns on MerchantPromotionAssignment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MerchantPromotionAssignmentEntity value)?  entity,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MerchantPromotionAssignmentEntity() when entity != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MerchantPromotionAssignmentEntity value)  entity,}){
final _that = this;
switch (_that) {
case MerchantPromotionAssignmentEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MerchantPromotionAssignmentEntity value)?  entity,}){
final _that = this;
switch (_that) {
case MerchantPromotionAssignmentEntity() when entity != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String id,  String merchantId,  String merchantName,  DateTime datetimeStart,  DateTime datetimeEnd)?  entity,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MerchantPromotionAssignmentEntity() when entity != null:
return entity(_that.id,_that.merchantId,_that.merchantName,_that.datetimeStart,_that.datetimeEnd);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String id,  String merchantId,  String merchantName,  DateTime datetimeStart,  DateTime datetimeEnd)  entity,}) {final _that = this;
switch (_that) {
case MerchantPromotionAssignmentEntity():
return entity(_that.id,_that.merchantId,_that.merchantName,_that.datetimeStart,_that.datetimeEnd);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String id,  String merchantId,  String merchantName,  DateTime datetimeStart,  DateTime datetimeEnd)?  entity,}) {final _that = this;
switch (_that) {
case MerchantPromotionAssignmentEntity() when entity != null:
return entity(_that.id,_that.merchantId,_that.merchantName,_that.datetimeStart,_that.datetimeEnd);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class MerchantPromotionAssignmentEntity implements MerchantPromotionAssignment {
  const MerchantPromotionAssignmentEntity({required this.id, required this.merchantId, required this.merchantName, required this.datetimeStart, required this.datetimeEnd});
  factory MerchantPromotionAssignmentEntity.fromJson(Map<String, dynamic> json) => _$MerchantPromotionAssignmentEntityFromJson(json);

@override final  String id;
@override final  String merchantId;
@override final  String merchantName;
@override final  DateTime datetimeStart;
@override final  DateTime datetimeEnd;

/// Create a copy of MerchantPromotionAssignment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantPromotionAssignmentEntityCopyWith<MerchantPromotionAssignmentEntity> get copyWith => _$MerchantPromotionAssignmentEntityCopyWithImpl<MerchantPromotionAssignmentEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MerchantPromotionAssignmentEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantPromotionAssignmentEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.merchantId, merchantId) || other.merchantId == merchantId)&&(identical(other.merchantName, merchantName) || other.merchantName == merchantName)&&(identical(other.datetimeStart, datetimeStart) || other.datetimeStart == datetimeStart)&&(identical(other.datetimeEnd, datetimeEnd) || other.datetimeEnd == datetimeEnd));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,merchantId,merchantName,datetimeStart,datetimeEnd);

@override
String toString() {
  return 'MerchantPromotionAssignment.entity(id: $id, merchantId: $merchantId, merchantName: $merchantName, datetimeStart: $datetimeStart, datetimeEnd: $datetimeEnd)';
}


}

/// @nodoc
abstract mixin class $MerchantPromotionAssignmentEntityCopyWith<$Res> implements $MerchantPromotionAssignmentCopyWith<$Res> {
  factory $MerchantPromotionAssignmentEntityCopyWith(MerchantPromotionAssignmentEntity value, $Res Function(MerchantPromotionAssignmentEntity) _then) = _$MerchantPromotionAssignmentEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String merchantId, String merchantName, DateTime datetimeStart, DateTime datetimeEnd
});




}
/// @nodoc
class _$MerchantPromotionAssignmentEntityCopyWithImpl<$Res>
    implements $MerchantPromotionAssignmentEntityCopyWith<$Res> {
  _$MerchantPromotionAssignmentEntityCopyWithImpl(this._self, this._then);

  final MerchantPromotionAssignmentEntity _self;
  final $Res Function(MerchantPromotionAssignmentEntity) _then;

/// Create a copy of MerchantPromotionAssignment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? merchantId = null,Object? merchantName = null,Object? datetimeStart = null,Object? datetimeEnd = null,}) {
  return _then(MerchantPromotionAssignmentEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,merchantId: null == merchantId ? _self.merchantId : merchantId // ignore: cast_nullable_to_non_nullable
as String,merchantName: null == merchantName ? _self.merchantName : merchantName // ignore: cast_nullable_to_non_nullable
as String,datetimeStart: null == datetimeStart ? _self.datetimeStart : datetimeStart // ignore: cast_nullable_to_non_nullable
as DateTime,datetimeEnd: null == datetimeEnd ? _self.datetimeEnd : datetimeEnd // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

MerchantPromotionProductAssignment _$MerchantPromotionProductAssignmentFromJson(
  Map<String, dynamic> json
) {
    return MerchantPromotionProductAssignmentEntity.fromJson(
      json
    );
}

/// @nodoc
mixin _$MerchantPromotionProductAssignment {

 String get id; String get productId; String get productName; DateTime get datetimeStart; DateTime get datetimeEnd;
/// Create a copy of MerchantPromotionProductAssignment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantPromotionProductAssignmentCopyWith<MerchantPromotionProductAssignment> get copyWith => _$MerchantPromotionProductAssignmentCopyWithImpl<MerchantPromotionProductAssignment>(this as MerchantPromotionProductAssignment, _$identity);

  /// Serializes this MerchantPromotionProductAssignment to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantPromotionProductAssignment&&(identical(other.id, id) || other.id == id)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.datetimeStart, datetimeStart) || other.datetimeStart == datetimeStart)&&(identical(other.datetimeEnd, datetimeEnd) || other.datetimeEnd == datetimeEnd));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,productId,productName,datetimeStart,datetimeEnd);

@override
String toString() {
  return 'MerchantPromotionProductAssignment(id: $id, productId: $productId, productName: $productName, datetimeStart: $datetimeStart, datetimeEnd: $datetimeEnd)';
}


}

/// @nodoc
abstract mixin class $MerchantPromotionProductAssignmentCopyWith<$Res>  {
  factory $MerchantPromotionProductAssignmentCopyWith(MerchantPromotionProductAssignment value, $Res Function(MerchantPromotionProductAssignment) _then) = _$MerchantPromotionProductAssignmentCopyWithImpl;
@useResult
$Res call({
 String id, String productId, String productName, DateTime datetimeStart, DateTime datetimeEnd
});




}
/// @nodoc
class _$MerchantPromotionProductAssignmentCopyWithImpl<$Res>
    implements $MerchantPromotionProductAssignmentCopyWith<$Res> {
  _$MerchantPromotionProductAssignmentCopyWithImpl(this._self, this._then);

  final MerchantPromotionProductAssignment _self;
  final $Res Function(MerchantPromotionProductAssignment) _then;

/// Create a copy of MerchantPromotionProductAssignment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? productId = null,Object? productName = null,Object? datetimeStart = null,Object? datetimeEnd = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,datetimeStart: null == datetimeStart ? _self.datetimeStart : datetimeStart // ignore: cast_nullable_to_non_nullable
as DateTime,datetimeEnd: null == datetimeEnd ? _self.datetimeEnd : datetimeEnd // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [MerchantPromotionProductAssignment].
extension MerchantPromotionProductAssignmentPatterns on MerchantPromotionProductAssignment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MerchantPromotionProductAssignmentEntity value)?  entity,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MerchantPromotionProductAssignmentEntity() when entity != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MerchantPromotionProductAssignmentEntity value)  entity,}){
final _that = this;
switch (_that) {
case MerchantPromotionProductAssignmentEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MerchantPromotionProductAssignmentEntity value)?  entity,}){
final _that = this;
switch (_that) {
case MerchantPromotionProductAssignmentEntity() when entity != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String id,  String productId,  String productName,  DateTime datetimeStart,  DateTime datetimeEnd)?  entity,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MerchantPromotionProductAssignmentEntity() when entity != null:
return entity(_that.id,_that.productId,_that.productName,_that.datetimeStart,_that.datetimeEnd);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String id,  String productId,  String productName,  DateTime datetimeStart,  DateTime datetimeEnd)  entity,}) {final _that = this;
switch (_that) {
case MerchantPromotionProductAssignmentEntity():
return entity(_that.id,_that.productId,_that.productName,_that.datetimeStart,_that.datetimeEnd);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String id,  String productId,  String productName,  DateTime datetimeStart,  DateTime datetimeEnd)?  entity,}) {final _that = this;
switch (_that) {
case MerchantPromotionProductAssignmentEntity() when entity != null:
return entity(_that.id,_that.productId,_that.productName,_that.datetimeStart,_that.datetimeEnd);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class MerchantPromotionProductAssignmentEntity implements MerchantPromotionProductAssignment {
  const MerchantPromotionProductAssignmentEntity({required this.id, required this.productId, required this.productName, required this.datetimeStart, required this.datetimeEnd});
  factory MerchantPromotionProductAssignmentEntity.fromJson(Map<String, dynamic> json) => _$MerchantPromotionProductAssignmentEntityFromJson(json);

@override final  String id;
@override final  String productId;
@override final  String productName;
@override final  DateTime datetimeStart;
@override final  DateTime datetimeEnd;

/// Create a copy of MerchantPromotionProductAssignment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantPromotionProductAssignmentEntityCopyWith<MerchantPromotionProductAssignmentEntity> get copyWith => _$MerchantPromotionProductAssignmentEntityCopyWithImpl<MerchantPromotionProductAssignmentEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MerchantPromotionProductAssignmentEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantPromotionProductAssignmentEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.datetimeStart, datetimeStart) || other.datetimeStart == datetimeStart)&&(identical(other.datetimeEnd, datetimeEnd) || other.datetimeEnd == datetimeEnd));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,productId,productName,datetimeStart,datetimeEnd);

@override
String toString() {
  return 'MerchantPromotionProductAssignment.entity(id: $id, productId: $productId, productName: $productName, datetimeStart: $datetimeStart, datetimeEnd: $datetimeEnd)';
}


}

/// @nodoc
abstract mixin class $MerchantPromotionProductAssignmentEntityCopyWith<$Res> implements $MerchantPromotionProductAssignmentCopyWith<$Res> {
  factory $MerchantPromotionProductAssignmentEntityCopyWith(MerchantPromotionProductAssignmentEntity value, $Res Function(MerchantPromotionProductAssignmentEntity) _then) = _$MerchantPromotionProductAssignmentEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String productId, String productName, DateTime datetimeStart, DateTime datetimeEnd
});




}
/// @nodoc
class _$MerchantPromotionProductAssignmentEntityCopyWithImpl<$Res>
    implements $MerchantPromotionProductAssignmentEntityCopyWith<$Res> {
  _$MerchantPromotionProductAssignmentEntityCopyWithImpl(this._self, this._then);

  final MerchantPromotionProductAssignmentEntity _self;
  final $Res Function(MerchantPromotionProductAssignmentEntity) _then;

/// Create a copy of MerchantPromotionProductAssignment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? productId = null,Object? productName = null,Object? datetimeStart = null,Object? datetimeEnd = null,}) {
  return _then(MerchantPromotionProductAssignmentEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,datetimeStart: null == datetimeStart ? _self.datetimeStart : datetimeStart // ignore: cast_nullable_to_non_nullable
as DateTime,datetimeEnd: null == datetimeEnd ? _self.datetimeEnd : datetimeEnd // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
