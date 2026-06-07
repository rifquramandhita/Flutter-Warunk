// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
CustomerOrder _$CustomerOrderFromJson(
  Map<String, dynamic> json
) {
    return CustomerOrderCreateParam.fromJson(
      json
    );
}

/// @nodoc
mixin _$CustomerOrder {

 String get addressId; String? get shippingKey; String? get biteshipRateKey; String? get merchantAccountId; String? get notes; String get paymentProof; List<String> get cartIds; String? get promotionId; String? get promotionCode;
/// Create a copy of CustomerOrder
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerOrderCopyWith<CustomerOrder> get copyWith => _$CustomerOrderCopyWithImpl<CustomerOrder>(this as CustomerOrder, _$identity);

  /// Serializes this CustomerOrder to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerOrder&&(identical(other.addressId, addressId) || other.addressId == addressId)&&(identical(other.shippingKey, shippingKey) || other.shippingKey == shippingKey)&&(identical(other.biteshipRateKey, biteshipRateKey) || other.biteshipRateKey == biteshipRateKey)&&(identical(other.merchantAccountId, merchantAccountId) || other.merchantAccountId == merchantAccountId)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.paymentProof, paymentProof) || other.paymentProof == paymentProof)&&const DeepCollectionEquality().equals(other.cartIds, cartIds)&&(identical(other.promotionId, promotionId) || other.promotionId == promotionId)&&(identical(other.promotionCode, promotionCode) || other.promotionCode == promotionCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,addressId,shippingKey,biteshipRateKey,merchantAccountId,notes,paymentProof,const DeepCollectionEquality().hash(cartIds),promotionId,promotionCode);

@override
String toString() {
  return 'CustomerOrder(addressId: $addressId, shippingKey: $shippingKey, biteshipRateKey: $biteshipRateKey, merchantAccountId: $merchantAccountId, notes: $notes, paymentProof: $paymentProof, cartIds: $cartIds, promotionId: $promotionId, promotionCode: $promotionCode)';
}


}

/// @nodoc
abstract mixin class $CustomerOrderCopyWith<$Res>  {
  factory $CustomerOrderCopyWith(CustomerOrder value, $Res Function(CustomerOrder) _then) = _$CustomerOrderCopyWithImpl;
@useResult
$Res call({
 String addressId, String? shippingKey, String? biteshipRateKey, String? merchantAccountId, String? notes, String paymentProof, List<String> cartIds, String? promotionId, String? promotionCode
});




}
/// @nodoc
class _$CustomerOrderCopyWithImpl<$Res>
    implements $CustomerOrderCopyWith<$Res> {
  _$CustomerOrderCopyWithImpl(this._self, this._then);

  final CustomerOrder _self;
  final $Res Function(CustomerOrder) _then;

/// Create a copy of CustomerOrder
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? addressId = null,Object? shippingKey = freezed,Object? biteshipRateKey = freezed,Object? merchantAccountId = freezed,Object? notes = freezed,Object? paymentProof = null,Object? cartIds = null,Object? promotionId = freezed,Object? promotionCode = freezed,}) {
  return _then(_self.copyWith(
addressId: null == addressId ? _self.addressId : addressId // ignore: cast_nullable_to_non_nullable
as String,shippingKey: freezed == shippingKey ? _self.shippingKey : shippingKey // ignore: cast_nullable_to_non_nullable
as String?,biteshipRateKey: freezed == biteshipRateKey ? _self.biteshipRateKey : biteshipRateKey // ignore: cast_nullable_to_non_nullable
as String?,merchantAccountId: freezed == merchantAccountId ? _self.merchantAccountId : merchantAccountId // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,paymentProof: null == paymentProof ? _self.paymentProof : paymentProof // ignore: cast_nullable_to_non_nullable
as String,cartIds: null == cartIds ? _self.cartIds : cartIds // ignore: cast_nullable_to_non_nullable
as List<String>,promotionId: freezed == promotionId ? _self.promotionId : promotionId // ignore: cast_nullable_to_non_nullable
as String?,promotionCode: freezed == promotionCode ? _self.promotionCode : promotionCode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CustomerOrder].
extension CustomerOrderPatterns on CustomerOrder {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CustomerOrderCreateParam value)?  createParam,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CustomerOrderCreateParam() when createParam != null:
return createParam(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CustomerOrderCreateParam value)  createParam,}){
final _that = this;
switch (_that) {
case CustomerOrderCreateParam():
return createParam(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CustomerOrderCreateParam value)?  createParam,}){
final _that = this;
switch (_that) {
case CustomerOrderCreateParam() when createParam != null:
return createParam(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String addressId,  String? shippingKey,  String? biteshipRateKey,  String? merchantAccountId,  String? notes,  String paymentProof,  List<String> cartIds,  String? promotionId,  String? promotionCode)?  createParam,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CustomerOrderCreateParam() when createParam != null:
return createParam(_that.addressId,_that.shippingKey,_that.biteshipRateKey,_that.merchantAccountId,_that.notes,_that.paymentProof,_that.cartIds,_that.promotionId,_that.promotionCode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String addressId,  String? shippingKey,  String? biteshipRateKey,  String? merchantAccountId,  String? notes,  String paymentProof,  List<String> cartIds,  String? promotionId,  String? promotionCode)  createParam,}) {final _that = this;
switch (_that) {
case CustomerOrderCreateParam():
return createParam(_that.addressId,_that.shippingKey,_that.biteshipRateKey,_that.merchantAccountId,_that.notes,_that.paymentProof,_that.cartIds,_that.promotionId,_that.promotionCode);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String addressId,  String? shippingKey,  String? biteshipRateKey,  String? merchantAccountId,  String? notes,  String paymentProof,  List<String> cartIds,  String? promotionId,  String? promotionCode)?  createParam,}) {final _that = this;
switch (_that) {
case CustomerOrderCreateParam() when createParam != null:
return createParam(_that.addressId,_that.shippingKey,_that.biteshipRateKey,_that.merchantAccountId,_that.notes,_that.paymentProof,_that.cartIds,_that.promotionId,_that.promotionCode);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class CustomerOrderCreateParam implements CustomerOrder {
  const CustomerOrderCreateParam({required this.addressId, this.shippingKey, this.biteshipRateKey, this.merchantAccountId, this.notes, required this.paymentProof, required final  List<String> cartIds, this.promotionId, this.promotionCode}): _cartIds = cartIds;
  factory CustomerOrderCreateParam.fromJson(Map<String, dynamic> json) => _$CustomerOrderCreateParamFromJson(json);

@override final  String addressId;
@override final  String? shippingKey;
@override final  String? biteshipRateKey;
@override final  String? merchantAccountId;
@override final  String? notes;
@override final  String paymentProof;
 final  List<String> _cartIds;
@override List<String> get cartIds {
  if (_cartIds is EqualUnmodifiableListView) return _cartIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_cartIds);
}

@override final  String? promotionId;
@override final  String? promotionCode;

/// Create a copy of CustomerOrder
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerOrderCreateParamCopyWith<CustomerOrderCreateParam> get copyWith => _$CustomerOrderCreateParamCopyWithImpl<CustomerOrderCreateParam>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomerOrderCreateParamToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerOrderCreateParam&&(identical(other.addressId, addressId) || other.addressId == addressId)&&(identical(other.shippingKey, shippingKey) || other.shippingKey == shippingKey)&&(identical(other.biteshipRateKey, biteshipRateKey) || other.biteshipRateKey == biteshipRateKey)&&(identical(other.merchantAccountId, merchantAccountId) || other.merchantAccountId == merchantAccountId)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.paymentProof, paymentProof) || other.paymentProof == paymentProof)&&const DeepCollectionEquality().equals(other._cartIds, _cartIds)&&(identical(other.promotionId, promotionId) || other.promotionId == promotionId)&&(identical(other.promotionCode, promotionCode) || other.promotionCode == promotionCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,addressId,shippingKey,biteshipRateKey,merchantAccountId,notes,paymentProof,const DeepCollectionEquality().hash(_cartIds),promotionId,promotionCode);

@override
String toString() {
  return 'CustomerOrder.createParam(addressId: $addressId, shippingKey: $shippingKey, biteshipRateKey: $biteshipRateKey, merchantAccountId: $merchantAccountId, notes: $notes, paymentProof: $paymentProof, cartIds: $cartIds, promotionId: $promotionId, promotionCode: $promotionCode)';
}


}

/// @nodoc
abstract mixin class $CustomerOrderCreateParamCopyWith<$Res> implements $CustomerOrderCopyWith<$Res> {
  factory $CustomerOrderCreateParamCopyWith(CustomerOrderCreateParam value, $Res Function(CustomerOrderCreateParam) _then) = _$CustomerOrderCreateParamCopyWithImpl;
@override @useResult
$Res call({
 String addressId, String? shippingKey, String? biteshipRateKey, String? merchantAccountId, String? notes, String paymentProof, List<String> cartIds, String? promotionId, String? promotionCode
});




}
/// @nodoc
class _$CustomerOrderCreateParamCopyWithImpl<$Res>
    implements $CustomerOrderCreateParamCopyWith<$Res> {
  _$CustomerOrderCreateParamCopyWithImpl(this._self, this._then);

  final CustomerOrderCreateParam _self;
  final $Res Function(CustomerOrderCreateParam) _then;

/// Create a copy of CustomerOrder
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? addressId = null,Object? shippingKey = freezed,Object? biteshipRateKey = freezed,Object? merchantAccountId = freezed,Object? notes = freezed,Object? paymentProof = null,Object? cartIds = null,Object? promotionId = freezed,Object? promotionCode = freezed,}) {
  return _then(CustomerOrderCreateParam(
addressId: null == addressId ? _self.addressId : addressId // ignore: cast_nullable_to_non_nullable
as String,shippingKey: freezed == shippingKey ? _self.shippingKey : shippingKey // ignore: cast_nullable_to_non_nullable
as String?,biteshipRateKey: freezed == biteshipRateKey ? _self.biteshipRateKey : biteshipRateKey // ignore: cast_nullable_to_non_nullable
as String?,merchantAccountId: freezed == merchantAccountId ? _self.merchantAccountId : merchantAccountId // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,paymentProof: null == paymentProof ? _self.paymentProof : paymentProof // ignore: cast_nullable_to_non_nullable
as String,cartIds: null == cartIds ? _self._cartIds : cartIds // ignore: cast_nullable_to_non_nullable
as List<String>,promotionId: freezed == promotionId ? _self.promotionId : promotionId // ignore: cast_nullable_to_non_nullable
as String?,promotionCode: freezed == promotionCode ? _self.promotionCode : promotionCode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
