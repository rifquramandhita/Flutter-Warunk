// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_promotion.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
CustomerPromotion _$CustomerPromotionFromJson(
  Map<String, dynamic> json
) {
    return CustomerPromotionEntity.fromJson(
      json
    );
}

/// @nodoc
mixin _$CustomerPromotion {

 String? get id; String? get code; String? get title; String? get type; String? get typeLabel; String? get discountType; String? get discountTypeLabel; int? get discountValue; int? get discount; String? get discountLabel; int? get minPurchase; int? get maxDiscount; String? get eligibility; String? get eligibilityLabel; bool? get isShow; bool? get isUnlimitedUse; int? get maxUse;
/// Create a copy of CustomerPromotion
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerPromotionCopyWith<CustomerPromotion> get copyWith => _$CustomerPromotionCopyWithImpl<CustomerPromotion>(this as CustomerPromotion, _$identity);

  /// Serializes this CustomerPromotion to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerPromotion&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&(identical(other.title, title) || other.title == title)&&(identical(other.type, type) || other.type == type)&&(identical(other.typeLabel, typeLabel) || other.typeLabel == typeLabel)&&(identical(other.discountType, discountType) || other.discountType == discountType)&&(identical(other.discountTypeLabel, discountTypeLabel) || other.discountTypeLabel == discountTypeLabel)&&(identical(other.discountValue, discountValue) || other.discountValue == discountValue)&&(identical(other.discount, discount) || other.discount == discount)&&(identical(other.discountLabel, discountLabel) || other.discountLabel == discountLabel)&&(identical(other.minPurchase, minPurchase) || other.minPurchase == minPurchase)&&(identical(other.maxDiscount, maxDiscount) || other.maxDiscount == maxDiscount)&&(identical(other.eligibility, eligibility) || other.eligibility == eligibility)&&(identical(other.eligibilityLabel, eligibilityLabel) || other.eligibilityLabel == eligibilityLabel)&&(identical(other.isShow, isShow) || other.isShow == isShow)&&(identical(other.isUnlimitedUse, isUnlimitedUse) || other.isUnlimitedUse == isUnlimitedUse)&&(identical(other.maxUse, maxUse) || other.maxUse == maxUse));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,code,title,type,typeLabel,discountType,discountTypeLabel,discountValue,discount,discountLabel,minPurchase,maxDiscount,eligibility,eligibilityLabel,isShow,isUnlimitedUse,maxUse);

@override
String toString() {
  return 'CustomerPromotion(id: $id, code: $code, title: $title, type: $type, typeLabel: $typeLabel, discountType: $discountType, discountTypeLabel: $discountTypeLabel, discountValue: $discountValue, discount: $discount, discountLabel: $discountLabel, minPurchase: $minPurchase, maxDiscount: $maxDiscount, eligibility: $eligibility, eligibilityLabel: $eligibilityLabel, isShow: $isShow, isUnlimitedUse: $isUnlimitedUse, maxUse: $maxUse)';
}


}

/// @nodoc
abstract mixin class $CustomerPromotionCopyWith<$Res>  {
  factory $CustomerPromotionCopyWith(CustomerPromotion value, $Res Function(CustomerPromotion) _then) = _$CustomerPromotionCopyWithImpl;
@useResult
$Res call({
 String? id, String? code, String? title, String? type, String? typeLabel, String? discountType, String? discountTypeLabel, int? discountValue, int? discount, String? discountLabel, int? minPurchase, int? maxDiscount, String? eligibility, String? eligibilityLabel, bool? isShow, bool? isUnlimitedUse, int? maxUse
});




}
/// @nodoc
class _$CustomerPromotionCopyWithImpl<$Res>
    implements $CustomerPromotionCopyWith<$Res> {
  _$CustomerPromotionCopyWithImpl(this._self, this._then);

  final CustomerPromotion _self;
  final $Res Function(CustomerPromotion) _then;

/// Create a copy of CustomerPromotion
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? code = freezed,Object? title = freezed,Object? type = freezed,Object? typeLabel = freezed,Object? discountType = freezed,Object? discountTypeLabel = freezed,Object? discountValue = freezed,Object? discount = freezed,Object? discountLabel = freezed,Object? minPurchase = freezed,Object? maxDiscount = freezed,Object? eligibility = freezed,Object? eligibilityLabel = freezed,Object? isShow = freezed,Object? isUnlimitedUse = freezed,Object? maxUse = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,typeLabel: freezed == typeLabel ? _self.typeLabel : typeLabel // ignore: cast_nullable_to_non_nullable
as String?,discountType: freezed == discountType ? _self.discountType : discountType // ignore: cast_nullable_to_non_nullable
as String?,discountTypeLabel: freezed == discountTypeLabel ? _self.discountTypeLabel : discountTypeLabel // ignore: cast_nullable_to_non_nullable
as String?,discountValue: freezed == discountValue ? _self.discountValue : discountValue // ignore: cast_nullable_to_non_nullable
as int?,discount: freezed == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as int?,discountLabel: freezed == discountLabel ? _self.discountLabel : discountLabel // ignore: cast_nullable_to_non_nullable
as String?,minPurchase: freezed == minPurchase ? _self.minPurchase : minPurchase // ignore: cast_nullable_to_non_nullable
as int?,maxDiscount: freezed == maxDiscount ? _self.maxDiscount : maxDiscount // ignore: cast_nullable_to_non_nullable
as int?,eligibility: freezed == eligibility ? _self.eligibility : eligibility // ignore: cast_nullable_to_non_nullable
as String?,eligibilityLabel: freezed == eligibilityLabel ? _self.eligibilityLabel : eligibilityLabel // ignore: cast_nullable_to_non_nullable
as String?,isShow: freezed == isShow ? _self.isShow : isShow // ignore: cast_nullable_to_non_nullable
as bool?,isUnlimitedUse: freezed == isUnlimitedUse ? _self.isUnlimitedUse : isUnlimitedUse // ignore: cast_nullable_to_non_nullable
as bool?,maxUse: freezed == maxUse ? _self.maxUse : maxUse // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [CustomerPromotion].
extension CustomerPromotionPatterns on CustomerPromotion {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CustomerPromotionEntity value)?  entity,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CustomerPromotionEntity() when entity != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CustomerPromotionEntity value)  entity,}){
final _that = this;
switch (_that) {
case CustomerPromotionEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CustomerPromotionEntity value)?  entity,}){
final _that = this;
switch (_that) {
case CustomerPromotionEntity() when entity != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String? id,  String? code,  String? title,  String? type,  String? typeLabel,  String? discountType,  String? discountTypeLabel,  int? discountValue,  int? discount,  String? discountLabel,  int? minPurchase,  int? maxDiscount,  String? eligibility,  String? eligibilityLabel,  bool? isShow,  bool? isUnlimitedUse,  int? maxUse)?  entity,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CustomerPromotionEntity() when entity != null:
return entity(_that.id,_that.code,_that.title,_that.type,_that.typeLabel,_that.discountType,_that.discountTypeLabel,_that.discountValue,_that.discount,_that.discountLabel,_that.minPurchase,_that.maxDiscount,_that.eligibility,_that.eligibilityLabel,_that.isShow,_that.isUnlimitedUse,_that.maxUse);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String? id,  String? code,  String? title,  String? type,  String? typeLabel,  String? discountType,  String? discountTypeLabel,  int? discountValue,  int? discount,  String? discountLabel,  int? minPurchase,  int? maxDiscount,  String? eligibility,  String? eligibilityLabel,  bool? isShow,  bool? isUnlimitedUse,  int? maxUse)  entity,}) {final _that = this;
switch (_that) {
case CustomerPromotionEntity():
return entity(_that.id,_that.code,_that.title,_that.type,_that.typeLabel,_that.discountType,_that.discountTypeLabel,_that.discountValue,_that.discount,_that.discountLabel,_that.minPurchase,_that.maxDiscount,_that.eligibility,_that.eligibilityLabel,_that.isShow,_that.isUnlimitedUse,_that.maxUse);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String? id,  String? code,  String? title,  String? type,  String? typeLabel,  String? discountType,  String? discountTypeLabel,  int? discountValue,  int? discount,  String? discountLabel,  int? minPurchase,  int? maxDiscount,  String? eligibility,  String? eligibilityLabel,  bool? isShow,  bool? isUnlimitedUse,  int? maxUse)?  entity,}) {final _that = this;
switch (_that) {
case CustomerPromotionEntity() when entity != null:
return entity(_that.id,_that.code,_that.title,_that.type,_that.typeLabel,_that.discountType,_that.discountTypeLabel,_that.discountValue,_that.discount,_that.discountLabel,_that.minPurchase,_that.maxDiscount,_that.eligibility,_that.eligibilityLabel,_that.isShow,_that.isUnlimitedUse,_that.maxUse);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class CustomerPromotionEntity implements CustomerPromotion {
  const CustomerPromotionEntity({this.id, this.code, this.title, this.type, this.typeLabel, this.discountType, this.discountTypeLabel, this.discountValue, this.discount, this.discountLabel, this.minPurchase, this.maxDiscount, this.eligibility, this.eligibilityLabel, this.isShow, this.isUnlimitedUse, this.maxUse});
  factory CustomerPromotionEntity.fromJson(Map<String, dynamic> json) => _$CustomerPromotionEntityFromJson(json);

@override final  String? id;
@override final  String? code;
@override final  String? title;
@override final  String? type;
@override final  String? typeLabel;
@override final  String? discountType;
@override final  String? discountTypeLabel;
@override final  int? discountValue;
@override final  int? discount;
@override final  String? discountLabel;
@override final  int? minPurchase;
@override final  int? maxDiscount;
@override final  String? eligibility;
@override final  String? eligibilityLabel;
@override final  bool? isShow;
@override final  bool? isUnlimitedUse;
@override final  int? maxUse;

/// Create a copy of CustomerPromotion
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerPromotionEntityCopyWith<CustomerPromotionEntity> get copyWith => _$CustomerPromotionEntityCopyWithImpl<CustomerPromotionEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomerPromotionEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerPromotionEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&(identical(other.title, title) || other.title == title)&&(identical(other.type, type) || other.type == type)&&(identical(other.typeLabel, typeLabel) || other.typeLabel == typeLabel)&&(identical(other.discountType, discountType) || other.discountType == discountType)&&(identical(other.discountTypeLabel, discountTypeLabel) || other.discountTypeLabel == discountTypeLabel)&&(identical(other.discountValue, discountValue) || other.discountValue == discountValue)&&(identical(other.discount, discount) || other.discount == discount)&&(identical(other.discountLabel, discountLabel) || other.discountLabel == discountLabel)&&(identical(other.minPurchase, minPurchase) || other.minPurchase == minPurchase)&&(identical(other.maxDiscount, maxDiscount) || other.maxDiscount == maxDiscount)&&(identical(other.eligibility, eligibility) || other.eligibility == eligibility)&&(identical(other.eligibilityLabel, eligibilityLabel) || other.eligibilityLabel == eligibilityLabel)&&(identical(other.isShow, isShow) || other.isShow == isShow)&&(identical(other.isUnlimitedUse, isUnlimitedUse) || other.isUnlimitedUse == isUnlimitedUse)&&(identical(other.maxUse, maxUse) || other.maxUse == maxUse));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,code,title,type,typeLabel,discountType,discountTypeLabel,discountValue,discount,discountLabel,minPurchase,maxDiscount,eligibility,eligibilityLabel,isShow,isUnlimitedUse,maxUse);

@override
String toString() {
  return 'CustomerPromotion.entity(id: $id, code: $code, title: $title, type: $type, typeLabel: $typeLabel, discountType: $discountType, discountTypeLabel: $discountTypeLabel, discountValue: $discountValue, discount: $discount, discountLabel: $discountLabel, minPurchase: $minPurchase, maxDiscount: $maxDiscount, eligibility: $eligibility, eligibilityLabel: $eligibilityLabel, isShow: $isShow, isUnlimitedUse: $isUnlimitedUse, maxUse: $maxUse)';
}


}

/// @nodoc
abstract mixin class $CustomerPromotionEntityCopyWith<$Res> implements $CustomerPromotionCopyWith<$Res> {
  factory $CustomerPromotionEntityCopyWith(CustomerPromotionEntity value, $Res Function(CustomerPromotionEntity) _then) = _$CustomerPromotionEntityCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? code, String? title, String? type, String? typeLabel, String? discountType, String? discountTypeLabel, int? discountValue, int? discount, String? discountLabel, int? minPurchase, int? maxDiscount, String? eligibility, String? eligibilityLabel, bool? isShow, bool? isUnlimitedUse, int? maxUse
});




}
/// @nodoc
class _$CustomerPromotionEntityCopyWithImpl<$Res>
    implements $CustomerPromotionEntityCopyWith<$Res> {
  _$CustomerPromotionEntityCopyWithImpl(this._self, this._then);

  final CustomerPromotionEntity _self;
  final $Res Function(CustomerPromotionEntity) _then;

/// Create a copy of CustomerPromotion
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? code = freezed,Object? title = freezed,Object? type = freezed,Object? typeLabel = freezed,Object? discountType = freezed,Object? discountTypeLabel = freezed,Object? discountValue = freezed,Object? discount = freezed,Object? discountLabel = freezed,Object? minPurchase = freezed,Object? maxDiscount = freezed,Object? eligibility = freezed,Object? eligibilityLabel = freezed,Object? isShow = freezed,Object? isUnlimitedUse = freezed,Object? maxUse = freezed,}) {
  return _then(CustomerPromotionEntity(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,typeLabel: freezed == typeLabel ? _self.typeLabel : typeLabel // ignore: cast_nullable_to_non_nullable
as String?,discountType: freezed == discountType ? _self.discountType : discountType // ignore: cast_nullable_to_non_nullable
as String?,discountTypeLabel: freezed == discountTypeLabel ? _self.discountTypeLabel : discountTypeLabel // ignore: cast_nullable_to_non_nullable
as String?,discountValue: freezed == discountValue ? _self.discountValue : discountValue // ignore: cast_nullable_to_non_nullable
as int?,discount: freezed == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as int?,discountLabel: freezed == discountLabel ? _self.discountLabel : discountLabel // ignore: cast_nullable_to_non_nullable
as String?,minPurchase: freezed == minPurchase ? _self.minPurchase : minPurchase // ignore: cast_nullable_to_non_nullable
as int?,maxDiscount: freezed == maxDiscount ? _self.maxDiscount : maxDiscount // ignore: cast_nullable_to_non_nullable
as int?,eligibility: freezed == eligibility ? _self.eligibility : eligibility // ignore: cast_nullable_to_non_nullable
as String?,eligibilityLabel: freezed == eligibilityLabel ? _self.eligibilityLabel : eligibilityLabel // ignore: cast_nullable_to_non_nullable
as String?,isShow: freezed == isShow ? _self.isShow : isShow // ignore: cast_nullable_to_non_nullable
as bool?,isUnlimitedUse: freezed == isUnlimitedUse ? _self.isUnlimitedUse : isUnlimitedUse // ignore: cast_nullable_to_non_nullable
as bool?,maxUse: freezed == maxUse ? _self.maxUse : maxUse // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
