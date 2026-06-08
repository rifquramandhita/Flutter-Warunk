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
        switch (json['runtimeType']) {
                  case 'createParam':
          return CustomerOrderCreateParam.fromJson(
            json
          );
                case 'getPromotionParam':
          return CustomerOrderGetPromotionParam.fromJson(
            json
          );
                case 'entity':
          return CustomerOrderEntity.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'CustomerOrder',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$CustomerOrder {



  /// Serializes this CustomerOrder to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerOrder);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CustomerOrder()';
}


}

/// @nodoc
class $CustomerOrderCopyWith<$Res>  {
$CustomerOrderCopyWith(CustomerOrder _, $Res Function(CustomerOrder) __);
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CustomerOrderCreateParam value)?  createParam,TResult Function( CustomerOrderGetPromotionParam value)?  getPromotionParam,TResult Function( CustomerOrderEntity value)?  entity,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CustomerOrderCreateParam() when createParam != null:
return createParam(_that);case CustomerOrderGetPromotionParam() when getPromotionParam != null:
return getPromotionParam(_that);case CustomerOrderEntity() when entity != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CustomerOrderCreateParam value)  createParam,required TResult Function( CustomerOrderGetPromotionParam value)  getPromotionParam,required TResult Function( CustomerOrderEntity value)  entity,}){
final _that = this;
switch (_that) {
case CustomerOrderCreateParam():
return createParam(_that);case CustomerOrderGetPromotionParam():
return getPromotionParam(_that);case CustomerOrderEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CustomerOrderCreateParam value)?  createParam,TResult? Function( CustomerOrderGetPromotionParam value)?  getPromotionParam,TResult? Function( CustomerOrderEntity value)?  entity,}){
final _that = this;
switch (_that) {
case CustomerOrderCreateParam() when createParam != null:
return createParam(_that);case CustomerOrderGetPromotionParam() when getPromotionParam != null:
return getPromotionParam(_that);case CustomerOrderEntity() when entity != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String addressId,  String? shippingKey,  String? biteshipRateKey,  String? merchantAccountId,  String? notes,  String paymentProof,  List<String> cartIds,  String? promotionId,  String? promotionCode)?  createParam,TResult Function( List<String> cartIds,  String? addressId,  String? shippingKey,  String? biteshipRateKey)?  getPromotionParam,TResult Function( String? id,  String? invoiceNumber,  String? invoiceUrl,  String? merchantId,  int? customerId,  String? customerAddressId,  String? merchantAccountId,  int? subtotal,  int? shippingCost,  int? serviceFee,  String? promotionId,  String? promotionCode,  String? promotionTitle,  String? promotionType,  int? promotionDiscount,  dynamic promotion,  List<dynamic>? promotions,  int? total,  int? paidAmount,  String? paymentProof,  String? type,  String? status,  String? statusLabel,  String? notes,  String? cancelReason,  String? customerBank,  String? customerAccountNumber,  String? customerAccountName,  String? refundProof,  dynamic customer,  dynamic customerAddress,  dynamic merchantAccount,  dynamic merchant,  List<dynamic>? items,  List<dynamic>? reviews,  bool? needsReview,  dynamic shipping,  String? paidAt,  String? cancelledAt,  String? completedAt,  String? createdAt,  String? updatedAt)?  entity,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CustomerOrderCreateParam() when createParam != null:
return createParam(_that.addressId,_that.shippingKey,_that.biteshipRateKey,_that.merchantAccountId,_that.notes,_that.paymentProof,_that.cartIds,_that.promotionId,_that.promotionCode);case CustomerOrderGetPromotionParam() when getPromotionParam != null:
return getPromotionParam(_that.cartIds,_that.addressId,_that.shippingKey,_that.biteshipRateKey);case CustomerOrderEntity() when entity != null:
return entity(_that.id,_that.invoiceNumber,_that.invoiceUrl,_that.merchantId,_that.customerId,_that.customerAddressId,_that.merchantAccountId,_that.subtotal,_that.shippingCost,_that.serviceFee,_that.promotionId,_that.promotionCode,_that.promotionTitle,_that.promotionType,_that.promotionDiscount,_that.promotion,_that.promotions,_that.total,_that.paidAmount,_that.paymentProof,_that.type,_that.status,_that.statusLabel,_that.notes,_that.cancelReason,_that.customerBank,_that.customerAccountNumber,_that.customerAccountName,_that.refundProof,_that.customer,_that.customerAddress,_that.merchantAccount,_that.merchant,_that.items,_that.reviews,_that.needsReview,_that.shipping,_that.paidAt,_that.cancelledAt,_that.completedAt,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String addressId,  String? shippingKey,  String? biteshipRateKey,  String? merchantAccountId,  String? notes,  String paymentProof,  List<String> cartIds,  String? promotionId,  String? promotionCode)  createParam,required TResult Function( List<String> cartIds,  String? addressId,  String? shippingKey,  String? biteshipRateKey)  getPromotionParam,required TResult Function( String? id,  String? invoiceNumber,  String? invoiceUrl,  String? merchantId,  int? customerId,  String? customerAddressId,  String? merchantAccountId,  int? subtotal,  int? shippingCost,  int? serviceFee,  String? promotionId,  String? promotionCode,  String? promotionTitle,  String? promotionType,  int? promotionDiscount,  dynamic promotion,  List<dynamic>? promotions,  int? total,  int? paidAmount,  String? paymentProof,  String? type,  String? status,  String? statusLabel,  String? notes,  String? cancelReason,  String? customerBank,  String? customerAccountNumber,  String? customerAccountName,  String? refundProof,  dynamic customer,  dynamic customerAddress,  dynamic merchantAccount,  dynamic merchant,  List<dynamic>? items,  List<dynamic>? reviews,  bool? needsReview,  dynamic shipping,  String? paidAt,  String? cancelledAt,  String? completedAt,  String? createdAt,  String? updatedAt)  entity,}) {final _that = this;
switch (_that) {
case CustomerOrderCreateParam():
return createParam(_that.addressId,_that.shippingKey,_that.biteshipRateKey,_that.merchantAccountId,_that.notes,_that.paymentProof,_that.cartIds,_that.promotionId,_that.promotionCode);case CustomerOrderGetPromotionParam():
return getPromotionParam(_that.cartIds,_that.addressId,_that.shippingKey,_that.biteshipRateKey);case CustomerOrderEntity():
return entity(_that.id,_that.invoiceNumber,_that.invoiceUrl,_that.merchantId,_that.customerId,_that.customerAddressId,_that.merchantAccountId,_that.subtotal,_that.shippingCost,_that.serviceFee,_that.promotionId,_that.promotionCode,_that.promotionTitle,_that.promotionType,_that.promotionDiscount,_that.promotion,_that.promotions,_that.total,_that.paidAmount,_that.paymentProof,_that.type,_that.status,_that.statusLabel,_that.notes,_that.cancelReason,_that.customerBank,_that.customerAccountNumber,_that.customerAccountName,_that.refundProof,_that.customer,_that.customerAddress,_that.merchantAccount,_that.merchant,_that.items,_that.reviews,_that.needsReview,_that.shipping,_that.paidAt,_that.cancelledAt,_that.completedAt,_that.createdAt,_that.updatedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String addressId,  String? shippingKey,  String? biteshipRateKey,  String? merchantAccountId,  String? notes,  String paymentProof,  List<String> cartIds,  String? promotionId,  String? promotionCode)?  createParam,TResult? Function( List<String> cartIds,  String? addressId,  String? shippingKey,  String? biteshipRateKey)?  getPromotionParam,TResult? Function( String? id,  String? invoiceNumber,  String? invoiceUrl,  String? merchantId,  int? customerId,  String? customerAddressId,  String? merchantAccountId,  int? subtotal,  int? shippingCost,  int? serviceFee,  String? promotionId,  String? promotionCode,  String? promotionTitle,  String? promotionType,  int? promotionDiscount,  dynamic promotion,  List<dynamic>? promotions,  int? total,  int? paidAmount,  String? paymentProof,  String? type,  String? status,  String? statusLabel,  String? notes,  String? cancelReason,  String? customerBank,  String? customerAccountNumber,  String? customerAccountName,  String? refundProof,  dynamic customer,  dynamic customerAddress,  dynamic merchantAccount,  dynamic merchant,  List<dynamic>? items,  List<dynamic>? reviews,  bool? needsReview,  dynamic shipping,  String? paidAt,  String? cancelledAt,  String? completedAt,  String? createdAt,  String? updatedAt)?  entity,}) {final _that = this;
switch (_that) {
case CustomerOrderCreateParam() when createParam != null:
return createParam(_that.addressId,_that.shippingKey,_that.biteshipRateKey,_that.merchantAccountId,_that.notes,_that.paymentProof,_that.cartIds,_that.promotionId,_that.promotionCode);case CustomerOrderGetPromotionParam() when getPromotionParam != null:
return getPromotionParam(_that.cartIds,_that.addressId,_that.shippingKey,_that.biteshipRateKey);case CustomerOrderEntity() when entity != null:
return entity(_that.id,_that.invoiceNumber,_that.invoiceUrl,_that.merchantId,_that.customerId,_that.customerAddressId,_that.merchantAccountId,_that.subtotal,_that.shippingCost,_that.serviceFee,_that.promotionId,_that.promotionCode,_that.promotionTitle,_that.promotionType,_that.promotionDiscount,_that.promotion,_that.promotions,_that.total,_that.paidAmount,_that.paymentProof,_that.type,_that.status,_that.statusLabel,_that.notes,_that.cancelReason,_that.customerBank,_that.customerAccountNumber,_that.customerAccountName,_that.refundProof,_that.customer,_that.customerAddress,_that.merchantAccount,_that.merchant,_that.items,_that.reviews,_that.needsReview,_that.shipping,_that.paidAt,_that.cancelledAt,_that.completedAt,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class CustomerOrderCreateParam implements CustomerOrder {
  const CustomerOrderCreateParam({required this.addressId, this.shippingKey, this.biteshipRateKey, this.merchantAccountId, this.notes, required this.paymentProof, required final  List<String> cartIds, this.promotionId, this.promotionCode, final  String? $type}): _cartIds = cartIds,$type = $type ?? 'createParam';
  factory CustomerOrderCreateParam.fromJson(Map<String, dynamic> json) => _$CustomerOrderCreateParamFromJson(json);

 final  String addressId;
 final  String? shippingKey;
 final  String? biteshipRateKey;
 final  String? merchantAccountId;
 final  String? notes;
 final  String paymentProof;
 final  List<String> _cartIds;
 List<String> get cartIds {
  if (_cartIds is EqualUnmodifiableListView) return _cartIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_cartIds);
}

 final  String? promotionId;
 final  String? promotionCode;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of CustomerOrder
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
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
@useResult
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
@pragma('vm:prefer-inline') $Res call({Object? addressId = null,Object? shippingKey = freezed,Object? biteshipRateKey = freezed,Object? merchantAccountId = freezed,Object? notes = freezed,Object? paymentProof = null,Object? cartIds = null,Object? promotionId = freezed,Object? promotionCode = freezed,}) {
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

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class CustomerOrderGetPromotionParam implements CustomerOrder {
  const CustomerOrderGetPromotionParam({required final  List<String> cartIds, this.addressId, this.shippingKey, this.biteshipRateKey, final  String? $type}): _cartIds = cartIds,$type = $type ?? 'getPromotionParam';
  factory CustomerOrderGetPromotionParam.fromJson(Map<String, dynamic> json) => _$CustomerOrderGetPromotionParamFromJson(json);

 final  List<String> _cartIds;
 List<String> get cartIds {
  if (_cartIds is EqualUnmodifiableListView) return _cartIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_cartIds);
}

 final  String? addressId;
 final  String? shippingKey;
 final  String? biteshipRateKey;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of CustomerOrder
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerOrderGetPromotionParamCopyWith<CustomerOrderGetPromotionParam> get copyWith => _$CustomerOrderGetPromotionParamCopyWithImpl<CustomerOrderGetPromotionParam>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomerOrderGetPromotionParamToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerOrderGetPromotionParam&&const DeepCollectionEquality().equals(other._cartIds, _cartIds)&&(identical(other.addressId, addressId) || other.addressId == addressId)&&(identical(other.shippingKey, shippingKey) || other.shippingKey == shippingKey)&&(identical(other.biteshipRateKey, biteshipRateKey) || other.biteshipRateKey == biteshipRateKey));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_cartIds),addressId,shippingKey,biteshipRateKey);

@override
String toString() {
  return 'CustomerOrder.getPromotionParam(cartIds: $cartIds, addressId: $addressId, shippingKey: $shippingKey, biteshipRateKey: $biteshipRateKey)';
}


}

/// @nodoc
abstract mixin class $CustomerOrderGetPromotionParamCopyWith<$Res> implements $CustomerOrderCopyWith<$Res> {
  factory $CustomerOrderGetPromotionParamCopyWith(CustomerOrderGetPromotionParam value, $Res Function(CustomerOrderGetPromotionParam) _then) = _$CustomerOrderGetPromotionParamCopyWithImpl;
@useResult
$Res call({
 List<String> cartIds, String? addressId, String? shippingKey, String? biteshipRateKey
});




}
/// @nodoc
class _$CustomerOrderGetPromotionParamCopyWithImpl<$Res>
    implements $CustomerOrderGetPromotionParamCopyWith<$Res> {
  _$CustomerOrderGetPromotionParamCopyWithImpl(this._self, this._then);

  final CustomerOrderGetPromotionParam _self;
  final $Res Function(CustomerOrderGetPromotionParam) _then;

/// Create a copy of CustomerOrder
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? cartIds = null,Object? addressId = freezed,Object? shippingKey = freezed,Object? biteshipRateKey = freezed,}) {
  return _then(CustomerOrderGetPromotionParam(
cartIds: null == cartIds ? _self._cartIds : cartIds // ignore: cast_nullable_to_non_nullable
as List<String>,addressId: freezed == addressId ? _self.addressId : addressId // ignore: cast_nullable_to_non_nullable
as String?,shippingKey: freezed == shippingKey ? _self.shippingKey : shippingKey // ignore: cast_nullable_to_non_nullable
as String?,biteshipRateKey: freezed == biteshipRateKey ? _self.biteshipRateKey : biteshipRateKey // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class CustomerOrderEntity implements CustomerOrder {
  const CustomerOrderEntity({this.id, this.invoiceNumber, this.invoiceUrl, this.merchantId, this.customerId, this.customerAddressId, this.merchantAccountId, this.subtotal, this.shippingCost, this.serviceFee, this.promotionId, this.promotionCode, this.promotionTitle, this.promotionType, this.promotionDiscount, this.promotion, final  List<dynamic>? promotions, this.total, this.paidAmount, this.paymentProof, this.type, this.status, this.statusLabel, this.notes, this.cancelReason, this.customerBank, this.customerAccountNumber, this.customerAccountName, this.refundProof, this.customer, this.customerAddress, this.merchantAccount, this.merchant, final  List<dynamic>? items, final  List<dynamic>? reviews, this.needsReview, this.shipping, this.paidAt, this.cancelledAt, this.completedAt, this.createdAt, this.updatedAt, final  String? $type}): _promotions = promotions,_items = items,_reviews = reviews,$type = $type ?? 'entity';
  factory CustomerOrderEntity.fromJson(Map<String, dynamic> json) => _$CustomerOrderEntityFromJson(json);

 final  String? id;
 final  String? invoiceNumber;
 final  String? invoiceUrl;
 final  String? merchantId;
 final  int? customerId;
 final  String? customerAddressId;
 final  String? merchantAccountId;
 final  int? subtotal;
 final  int? shippingCost;
 final  int? serviceFee;
 final  String? promotionId;
 final  String? promotionCode;
 final  String? promotionTitle;
 final  String? promotionType;
 final  int? promotionDiscount;
 final  dynamic promotion;
 final  List<dynamic>? _promotions;
 List<dynamic>? get promotions {
  final value = _promotions;
  if (value == null) return null;
  if (_promotions is EqualUnmodifiableListView) return _promotions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  int? total;
 final  int? paidAmount;
 final  String? paymentProof;
 final  String? type;
 final  String? status;
 final  String? statusLabel;
 final  String? notes;
 final  String? cancelReason;
 final  String? customerBank;
 final  String? customerAccountNumber;
 final  String? customerAccountName;
 final  String? refundProof;
 final  dynamic customer;
 final  dynamic customerAddress;
 final  dynamic merchantAccount;
 final  dynamic merchant;
 final  List<dynamic>? _items;
 List<dynamic>? get items {
  final value = _items;
  if (value == null) return null;
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<dynamic>? _reviews;
 List<dynamic>? get reviews {
  final value = _reviews;
  if (value == null) return null;
  if (_reviews is EqualUnmodifiableListView) return _reviews;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  bool? needsReview;
 final  dynamic shipping;
 final  String? paidAt;
 final  String? cancelledAt;
 final  String? completedAt;
 final  String? createdAt;
 final  String? updatedAt;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of CustomerOrder
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerOrderEntityCopyWith<CustomerOrderEntity> get copyWith => _$CustomerOrderEntityCopyWithImpl<CustomerOrderEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomerOrderEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerOrderEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.invoiceNumber, invoiceNumber) || other.invoiceNumber == invoiceNumber)&&(identical(other.invoiceUrl, invoiceUrl) || other.invoiceUrl == invoiceUrl)&&(identical(other.merchantId, merchantId) || other.merchantId == merchantId)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.customerAddressId, customerAddressId) || other.customerAddressId == customerAddressId)&&(identical(other.merchantAccountId, merchantAccountId) || other.merchantAccountId == merchantAccountId)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.shippingCost, shippingCost) || other.shippingCost == shippingCost)&&(identical(other.serviceFee, serviceFee) || other.serviceFee == serviceFee)&&(identical(other.promotionId, promotionId) || other.promotionId == promotionId)&&(identical(other.promotionCode, promotionCode) || other.promotionCode == promotionCode)&&(identical(other.promotionTitle, promotionTitle) || other.promotionTitle == promotionTitle)&&(identical(other.promotionType, promotionType) || other.promotionType == promotionType)&&(identical(other.promotionDiscount, promotionDiscount) || other.promotionDiscount == promotionDiscount)&&const DeepCollectionEquality().equals(other.promotion, promotion)&&const DeepCollectionEquality().equals(other._promotions, _promotions)&&(identical(other.total, total) || other.total == total)&&(identical(other.paidAmount, paidAmount) || other.paidAmount == paidAmount)&&(identical(other.paymentProof, paymentProof) || other.paymentProof == paymentProof)&&(identical(other.type, type) || other.type == type)&&(identical(other.status, status) || other.status == status)&&(identical(other.statusLabel, statusLabel) || other.statusLabel == statusLabel)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.cancelReason, cancelReason) || other.cancelReason == cancelReason)&&(identical(other.customerBank, customerBank) || other.customerBank == customerBank)&&(identical(other.customerAccountNumber, customerAccountNumber) || other.customerAccountNumber == customerAccountNumber)&&(identical(other.customerAccountName, customerAccountName) || other.customerAccountName == customerAccountName)&&(identical(other.refundProof, refundProof) || other.refundProof == refundProof)&&const DeepCollectionEquality().equals(other.customer, customer)&&const DeepCollectionEquality().equals(other.customerAddress, customerAddress)&&const DeepCollectionEquality().equals(other.merchantAccount, merchantAccount)&&const DeepCollectionEquality().equals(other.merchant, merchant)&&const DeepCollectionEquality().equals(other._items, _items)&&const DeepCollectionEquality().equals(other._reviews, _reviews)&&(identical(other.needsReview, needsReview) || other.needsReview == needsReview)&&const DeepCollectionEquality().equals(other.shipping, shipping)&&(identical(other.paidAt, paidAt) || other.paidAt == paidAt)&&(identical(other.cancelledAt, cancelledAt) || other.cancelledAt == cancelledAt)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,invoiceNumber,invoiceUrl,merchantId,customerId,customerAddressId,merchantAccountId,subtotal,shippingCost,serviceFee,promotionId,promotionCode,promotionTitle,promotionType,promotionDiscount,const DeepCollectionEquality().hash(promotion),const DeepCollectionEquality().hash(_promotions),total,paidAmount,paymentProof,type,status,statusLabel,notes,cancelReason,customerBank,customerAccountNumber,customerAccountName,refundProof,const DeepCollectionEquality().hash(customer),const DeepCollectionEquality().hash(customerAddress),const DeepCollectionEquality().hash(merchantAccount),const DeepCollectionEquality().hash(merchant),const DeepCollectionEquality().hash(_items),const DeepCollectionEquality().hash(_reviews),needsReview,const DeepCollectionEquality().hash(shipping),paidAt,cancelledAt,completedAt,createdAt,updatedAt]);

@override
String toString() {
  return 'CustomerOrder.entity(id: $id, invoiceNumber: $invoiceNumber, invoiceUrl: $invoiceUrl, merchantId: $merchantId, customerId: $customerId, customerAddressId: $customerAddressId, merchantAccountId: $merchantAccountId, subtotal: $subtotal, shippingCost: $shippingCost, serviceFee: $serviceFee, promotionId: $promotionId, promotionCode: $promotionCode, promotionTitle: $promotionTitle, promotionType: $promotionType, promotionDiscount: $promotionDiscount, promotion: $promotion, promotions: $promotions, total: $total, paidAmount: $paidAmount, paymentProof: $paymentProof, type: $type, status: $status, statusLabel: $statusLabel, notes: $notes, cancelReason: $cancelReason, customerBank: $customerBank, customerAccountNumber: $customerAccountNumber, customerAccountName: $customerAccountName, refundProof: $refundProof, customer: $customer, customerAddress: $customerAddress, merchantAccount: $merchantAccount, merchant: $merchant, items: $items, reviews: $reviews, needsReview: $needsReview, shipping: $shipping, paidAt: $paidAt, cancelledAt: $cancelledAt, completedAt: $completedAt, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $CustomerOrderEntityCopyWith<$Res> implements $CustomerOrderCopyWith<$Res> {
  factory $CustomerOrderEntityCopyWith(CustomerOrderEntity value, $Res Function(CustomerOrderEntity) _then) = _$CustomerOrderEntityCopyWithImpl;
@useResult
$Res call({
 String? id, String? invoiceNumber, String? invoiceUrl, String? merchantId, int? customerId, String? customerAddressId, String? merchantAccountId, int? subtotal, int? shippingCost, int? serviceFee, String? promotionId, String? promotionCode, String? promotionTitle, String? promotionType, int? promotionDiscount, dynamic promotion, List<dynamic>? promotions, int? total, int? paidAmount, String? paymentProof, String? type, String? status, String? statusLabel, String? notes, String? cancelReason, String? customerBank, String? customerAccountNumber, String? customerAccountName, String? refundProof, dynamic customer, dynamic customerAddress, dynamic merchantAccount, dynamic merchant, List<dynamic>? items, List<dynamic>? reviews, bool? needsReview, dynamic shipping, String? paidAt, String? cancelledAt, String? completedAt, String? createdAt, String? updatedAt
});




}
/// @nodoc
class _$CustomerOrderEntityCopyWithImpl<$Res>
    implements $CustomerOrderEntityCopyWith<$Res> {
  _$CustomerOrderEntityCopyWithImpl(this._self, this._then);

  final CustomerOrderEntity _self;
  final $Res Function(CustomerOrderEntity) _then;

/// Create a copy of CustomerOrder
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? invoiceNumber = freezed,Object? invoiceUrl = freezed,Object? merchantId = freezed,Object? customerId = freezed,Object? customerAddressId = freezed,Object? merchantAccountId = freezed,Object? subtotal = freezed,Object? shippingCost = freezed,Object? serviceFee = freezed,Object? promotionId = freezed,Object? promotionCode = freezed,Object? promotionTitle = freezed,Object? promotionType = freezed,Object? promotionDiscount = freezed,Object? promotion = freezed,Object? promotions = freezed,Object? total = freezed,Object? paidAmount = freezed,Object? paymentProof = freezed,Object? type = freezed,Object? status = freezed,Object? statusLabel = freezed,Object? notes = freezed,Object? cancelReason = freezed,Object? customerBank = freezed,Object? customerAccountNumber = freezed,Object? customerAccountName = freezed,Object? refundProof = freezed,Object? customer = freezed,Object? customerAddress = freezed,Object? merchantAccount = freezed,Object? merchant = freezed,Object? items = freezed,Object? reviews = freezed,Object? needsReview = freezed,Object? shipping = freezed,Object? paidAt = freezed,Object? cancelledAt = freezed,Object? completedAt = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(CustomerOrderEntity(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,invoiceNumber: freezed == invoiceNumber ? _self.invoiceNumber : invoiceNumber // ignore: cast_nullable_to_non_nullable
as String?,invoiceUrl: freezed == invoiceUrl ? _self.invoiceUrl : invoiceUrl // ignore: cast_nullable_to_non_nullable
as String?,merchantId: freezed == merchantId ? _self.merchantId : merchantId // ignore: cast_nullable_to_non_nullable
as String?,customerId: freezed == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as int?,customerAddressId: freezed == customerAddressId ? _self.customerAddressId : customerAddressId // ignore: cast_nullable_to_non_nullable
as String?,merchantAccountId: freezed == merchantAccountId ? _self.merchantAccountId : merchantAccountId // ignore: cast_nullable_to_non_nullable
as String?,subtotal: freezed == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as int?,shippingCost: freezed == shippingCost ? _self.shippingCost : shippingCost // ignore: cast_nullable_to_non_nullable
as int?,serviceFee: freezed == serviceFee ? _self.serviceFee : serviceFee // ignore: cast_nullable_to_non_nullable
as int?,promotionId: freezed == promotionId ? _self.promotionId : promotionId // ignore: cast_nullable_to_non_nullable
as String?,promotionCode: freezed == promotionCode ? _self.promotionCode : promotionCode // ignore: cast_nullable_to_non_nullable
as String?,promotionTitle: freezed == promotionTitle ? _self.promotionTitle : promotionTitle // ignore: cast_nullable_to_non_nullable
as String?,promotionType: freezed == promotionType ? _self.promotionType : promotionType // ignore: cast_nullable_to_non_nullable
as String?,promotionDiscount: freezed == promotionDiscount ? _self.promotionDiscount : promotionDiscount // ignore: cast_nullable_to_non_nullable
as int?,promotion: freezed == promotion ? _self.promotion : promotion // ignore: cast_nullable_to_non_nullable
as dynamic,promotions: freezed == promotions ? _self._promotions : promotions // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int?,paidAmount: freezed == paidAmount ? _self.paidAmount : paidAmount // ignore: cast_nullable_to_non_nullable
as int?,paymentProof: freezed == paymentProof ? _self.paymentProof : paymentProof // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,statusLabel: freezed == statusLabel ? _self.statusLabel : statusLabel // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,cancelReason: freezed == cancelReason ? _self.cancelReason : cancelReason // ignore: cast_nullable_to_non_nullable
as String?,customerBank: freezed == customerBank ? _self.customerBank : customerBank // ignore: cast_nullable_to_non_nullable
as String?,customerAccountNumber: freezed == customerAccountNumber ? _self.customerAccountNumber : customerAccountNumber // ignore: cast_nullable_to_non_nullable
as String?,customerAccountName: freezed == customerAccountName ? _self.customerAccountName : customerAccountName // ignore: cast_nullable_to_non_nullable
as String?,refundProof: freezed == refundProof ? _self.refundProof : refundProof // ignore: cast_nullable_to_non_nullable
as String?,customer: freezed == customer ? _self.customer : customer // ignore: cast_nullable_to_non_nullable
as dynamic,customerAddress: freezed == customerAddress ? _self.customerAddress : customerAddress // ignore: cast_nullable_to_non_nullable
as dynamic,merchantAccount: freezed == merchantAccount ? _self.merchantAccount : merchantAccount // ignore: cast_nullable_to_non_nullable
as dynamic,merchant: freezed == merchant ? _self.merchant : merchant // ignore: cast_nullable_to_non_nullable
as dynamic,items: freezed == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,reviews: freezed == reviews ? _self._reviews : reviews // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,needsReview: freezed == needsReview ? _self.needsReview : needsReview // ignore: cast_nullable_to_non_nullable
as bool?,shipping: freezed == shipping ? _self.shipping : shipping // ignore: cast_nullable_to_non_nullable
as dynamic,paidAt: freezed == paidAt ? _self.paidAt : paidAt // ignore: cast_nullable_to_non_nullable
as String?,cancelledAt: freezed == cancelledAt ? _self.cancelledAt : cancelledAt // ignore: cast_nullable_to_non_nullable
as String?,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
