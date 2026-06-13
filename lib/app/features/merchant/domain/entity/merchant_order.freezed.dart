// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'merchant_order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
MerchantOrder _$MerchantOrderFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'rejectParam':
          return MerchantOrderRejectParam.fromJson(
            json
          );
                case 'entity':
          return MerchantOrderEntity.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'MerchantOrder',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$MerchantOrder {

 String? get customerBank; String? get customerAccountNumber; String? get customerAccountName;@JsonKey(includeFromJson: false, includeToJson: false) Object? get refundProof;
/// Create a copy of MerchantOrder
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantOrderCopyWith<MerchantOrder> get copyWith => _$MerchantOrderCopyWithImpl<MerchantOrder>(this as MerchantOrder, _$identity);

  /// Serializes this MerchantOrder to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantOrder&&(identical(other.customerBank, customerBank) || other.customerBank == customerBank)&&(identical(other.customerAccountNumber, customerAccountNumber) || other.customerAccountNumber == customerAccountNumber)&&(identical(other.customerAccountName, customerAccountName) || other.customerAccountName == customerAccountName)&&const DeepCollectionEquality().equals(other.refundProof, refundProof));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,customerBank,customerAccountNumber,customerAccountName,const DeepCollectionEquality().hash(refundProof));

@override
String toString() {
  return 'MerchantOrder(customerBank: $customerBank, customerAccountNumber: $customerAccountNumber, customerAccountName: $customerAccountName, refundProof: $refundProof)';
}


}

/// @nodoc
abstract mixin class $MerchantOrderCopyWith<$Res>  {
  factory $MerchantOrderCopyWith(MerchantOrder value, $Res Function(MerchantOrder) _then) = _$MerchantOrderCopyWithImpl;
@useResult
$Res call({
 String customerBank, String customerAccountNumber, String customerAccountName
});




}
/// @nodoc
class _$MerchantOrderCopyWithImpl<$Res>
    implements $MerchantOrderCopyWith<$Res> {
  _$MerchantOrderCopyWithImpl(this._self, this._then);

  final MerchantOrder _self;
  final $Res Function(MerchantOrder) _then;

/// Create a copy of MerchantOrder
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? customerBank = null,Object? customerAccountNumber = null,Object? customerAccountName = null,}) {
  return _then(_self.copyWith(
customerBank: null == customerBank ? _self.customerBank! : customerBank // ignore: cast_nullable_to_non_nullable
as String,customerAccountNumber: null == customerAccountNumber ? _self.customerAccountNumber! : customerAccountNumber // ignore: cast_nullable_to_non_nullable
as String,customerAccountName: null == customerAccountName ? _self.customerAccountName! : customerAccountName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MerchantOrder].
extension MerchantOrderPatterns on MerchantOrder {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MerchantOrderRejectParam value)?  rejectParam,TResult Function( MerchantOrderEntity value)?  entity,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MerchantOrderRejectParam() when rejectParam != null:
return rejectParam(_that);case MerchantOrderEntity() when entity != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MerchantOrderRejectParam value)  rejectParam,required TResult Function( MerchantOrderEntity value)  entity,}){
final _that = this;
switch (_that) {
case MerchantOrderRejectParam():
return rejectParam(_that);case MerchantOrderEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MerchantOrderRejectParam value)?  rejectParam,TResult? Function( MerchantOrderEntity value)?  entity,}){
final _that = this;
switch (_that) {
case MerchantOrderRejectParam() when rejectParam != null:
return rejectParam(_that);case MerchantOrderEntity() when entity != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String reason,  String customerBank,  String customerAccountNumber,  String customerAccountName, @JsonKey(includeFromJson: false, includeToJson: false)  File? refundProof)?  rejectParam,TResult Function( String id,  String? invoiceNumber,  String? invoiceUrl,  String? merchantId,  int? customerId,  String? customerAddressId,  String? merchantAccountId,  int? subtotal,  int? shippingCost,  int? serviceFee,  String? promotionId,  String? promotionCode,  String? promotionTitle,  String? promotionType,  int? promotionDiscount,  dynamic promotion,  List<dynamic>? promotions,  int? total,  int? paidAmount,  String? paymentProof,  String? type,  OrderStatus? status,  String? statusLabel,  String? notes,  String? cancelReason,  String? customerBank,  String? customerAccountNumber,  String? customerAccountName,  String? refundProof,  MerchantOrderCustomerEntity? customer,  MerchantOrderCustomerAddressEntity? customerAddress,  MerchantAccountEntity? merchantAccount,  List<MerchantOrderItemEntity> items,  MerchantOrderShippingEntity? shipping,  String? paidAt,  String? cancelledAt,  String? completedAt,  String? createdAt,  String? updatedAt)?  entity,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MerchantOrderRejectParam() when rejectParam != null:
return rejectParam(_that.reason,_that.customerBank,_that.customerAccountNumber,_that.customerAccountName,_that.refundProof);case MerchantOrderEntity() when entity != null:
return entity(_that.id,_that.invoiceNumber,_that.invoiceUrl,_that.merchantId,_that.customerId,_that.customerAddressId,_that.merchantAccountId,_that.subtotal,_that.shippingCost,_that.serviceFee,_that.promotionId,_that.promotionCode,_that.promotionTitle,_that.promotionType,_that.promotionDiscount,_that.promotion,_that.promotions,_that.total,_that.paidAmount,_that.paymentProof,_that.type,_that.status,_that.statusLabel,_that.notes,_that.cancelReason,_that.customerBank,_that.customerAccountNumber,_that.customerAccountName,_that.refundProof,_that.customer,_that.customerAddress,_that.merchantAccount,_that.items,_that.shipping,_that.paidAt,_that.cancelledAt,_that.completedAt,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String reason,  String customerBank,  String customerAccountNumber,  String customerAccountName, @JsonKey(includeFromJson: false, includeToJson: false)  File? refundProof)  rejectParam,required TResult Function( String id,  String? invoiceNumber,  String? invoiceUrl,  String? merchantId,  int? customerId,  String? customerAddressId,  String? merchantAccountId,  int? subtotal,  int? shippingCost,  int? serviceFee,  String? promotionId,  String? promotionCode,  String? promotionTitle,  String? promotionType,  int? promotionDiscount,  dynamic promotion,  List<dynamic>? promotions,  int? total,  int? paidAmount,  String? paymentProof,  String? type,  OrderStatus? status,  String? statusLabel,  String? notes,  String? cancelReason,  String? customerBank,  String? customerAccountNumber,  String? customerAccountName,  String? refundProof,  MerchantOrderCustomerEntity? customer,  MerchantOrderCustomerAddressEntity? customerAddress,  MerchantAccountEntity? merchantAccount,  List<MerchantOrderItemEntity> items,  MerchantOrderShippingEntity? shipping,  String? paidAt,  String? cancelledAt,  String? completedAt,  String? createdAt,  String? updatedAt)  entity,}) {final _that = this;
switch (_that) {
case MerchantOrderRejectParam():
return rejectParam(_that.reason,_that.customerBank,_that.customerAccountNumber,_that.customerAccountName,_that.refundProof);case MerchantOrderEntity():
return entity(_that.id,_that.invoiceNumber,_that.invoiceUrl,_that.merchantId,_that.customerId,_that.customerAddressId,_that.merchantAccountId,_that.subtotal,_that.shippingCost,_that.serviceFee,_that.promotionId,_that.promotionCode,_that.promotionTitle,_that.promotionType,_that.promotionDiscount,_that.promotion,_that.promotions,_that.total,_that.paidAmount,_that.paymentProof,_that.type,_that.status,_that.statusLabel,_that.notes,_that.cancelReason,_that.customerBank,_that.customerAccountNumber,_that.customerAccountName,_that.refundProof,_that.customer,_that.customerAddress,_that.merchantAccount,_that.items,_that.shipping,_that.paidAt,_that.cancelledAt,_that.completedAt,_that.createdAt,_that.updatedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String reason,  String customerBank,  String customerAccountNumber,  String customerAccountName, @JsonKey(includeFromJson: false, includeToJson: false)  File? refundProof)?  rejectParam,TResult? Function( String id,  String? invoiceNumber,  String? invoiceUrl,  String? merchantId,  int? customerId,  String? customerAddressId,  String? merchantAccountId,  int? subtotal,  int? shippingCost,  int? serviceFee,  String? promotionId,  String? promotionCode,  String? promotionTitle,  String? promotionType,  int? promotionDiscount,  dynamic promotion,  List<dynamic>? promotions,  int? total,  int? paidAmount,  String? paymentProof,  String? type,  OrderStatus? status,  String? statusLabel,  String? notes,  String? cancelReason,  String? customerBank,  String? customerAccountNumber,  String? customerAccountName,  String? refundProof,  MerchantOrderCustomerEntity? customer,  MerchantOrderCustomerAddressEntity? customerAddress,  MerchantAccountEntity? merchantAccount,  List<MerchantOrderItemEntity> items,  MerchantOrderShippingEntity? shipping,  String? paidAt,  String? cancelledAt,  String? completedAt,  String? createdAt,  String? updatedAt)?  entity,}) {final _that = this;
switch (_that) {
case MerchantOrderRejectParam() when rejectParam != null:
return rejectParam(_that.reason,_that.customerBank,_that.customerAccountNumber,_that.customerAccountName,_that.refundProof);case MerchantOrderEntity() when entity != null:
return entity(_that.id,_that.invoiceNumber,_that.invoiceUrl,_that.merchantId,_that.customerId,_that.customerAddressId,_that.merchantAccountId,_that.subtotal,_that.shippingCost,_that.serviceFee,_that.promotionId,_that.promotionCode,_that.promotionTitle,_that.promotionType,_that.promotionDiscount,_that.promotion,_that.promotions,_that.total,_that.paidAmount,_that.paymentProof,_that.type,_that.status,_that.statusLabel,_that.notes,_that.cancelReason,_that.customerBank,_that.customerAccountNumber,_that.customerAccountName,_that.refundProof,_that.customer,_that.customerAddress,_that.merchantAccount,_that.items,_that.shipping,_that.paidAt,_that.cancelledAt,_that.completedAt,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class MerchantOrderRejectParam implements MerchantOrder {
  const MerchantOrderRejectParam({required this.reason, required this.customerBank, required this.customerAccountNumber, required this.customerAccountName, @JsonKey(includeFromJson: false, includeToJson: false) this.refundProof, final  String? $type}): $type = $type ?? 'rejectParam';
  factory MerchantOrderRejectParam.fromJson(Map<String, dynamic> json) => _$MerchantOrderRejectParamFromJson(json);

 final  String reason;
@override final  String customerBank;
@override final  String customerAccountNumber;
@override final  String customerAccountName;
@override@JsonKey(includeFromJson: false, includeToJson: false) final  File? refundProof;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of MerchantOrder
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantOrderRejectParamCopyWith<MerchantOrderRejectParam> get copyWith => _$MerchantOrderRejectParamCopyWithImpl<MerchantOrderRejectParam>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MerchantOrderRejectParamToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantOrderRejectParam&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.customerBank, customerBank) || other.customerBank == customerBank)&&(identical(other.customerAccountNumber, customerAccountNumber) || other.customerAccountNumber == customerAccountNumber)&&(identical(other.customerAccountName, customerAccountName) || other.customerAccountName == customerAccountName)&&(identical(other.refundProof, refundProof) || other.refundProof == refundProof));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,reason,customerBank,customerAccountNumber,customerAccountName,refundProof);

@override
String toString() {
  return 'MerchantOrder.rejectParam(reason: $reason, customerBank: $customerBank, customerAccountNumber: $customerAccountNumber, customerAccountName: $customerAccountName, refundProof: $refundProof)';
}


}

/// @nodoc
abstract mixin class $MerchantOrderRejectParamCopyWith<$Res> implements $MerchantOrderCopyWith<$Res> {
  factory $MerchantOrderRejectParamCopyWith(MerchantOrderRejectParam value, $Res Function(MerchantOrderRejectParam) _then) = _$MerchantOrderRejectParamCopyWithImpl;
@override @useResult
$Res call({
 String reason, String customerBank, String customerAccountNumber, String customerAccountName,@JsonKey(includeFromJson: false, includeToJson: false) File? refundProof
});




}
/// @nodoc
class _$MerchantOrderRejectParamCopyWithImpl<$Res>
    implements $MerchantOrderRejectParamCopyWith<$Res> {
  _$MerchantOrderRejectParamCopyWithImpl(this._self, this._then);

  final MerchantOrderRejectParam _self;
  final $Res Function(MerchantOrderRejectParam) _then;

/// Create a copy of MerchantOrder
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? reason = null,Object? customerBank = null,Object? customerAccountNumber = null,Object? customerAccountName = null,Object? refundProof = freezed,}) {
  return _then(MerchantOrderRejectParam(
reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,customerBank: null == customerBank ? _self.customerBank : customerBank // ignore: cast_nullable_to_non_nullable
as String,customerAccountNumber: null == customerAccountNumber ? _self.customerAccountNumber : customerAccountNumber // ignore: cast_nullable_to_non_nullable
as String,customerAccountName: null == customerAccountName ? _self.customerAccountName : customerAccountName // ignore: cast_nullable_to_non_nullable
as String,refundProof: freezed == refundProof ? _self.refundProof : refundProof // ignore: cast_nullable_to_non_nullable
as File?,
  ));
}


}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class MerchantOrderEntity implements MerchantOrder {
  const MerchantOrderEntity({required this.id, this.invoiceNumber, this.invoiceUrl, this.merchantId, this.customerId, this.customerAddressId, this.merchantAccountId, this.subtotal, this.shippingCost, this.serviceFee, this.promotionId, this.promotionCode, this.promotionTitle, this.promotionType, this.promotionDiscount, this.promotion, final  List<dynamic>? promotions, this.total, this.paidAmount, this.paymentProof, this.type, this.status, this.statusLabel, this.notes, this.cancelReason, this.customerBank, this.customerAccountNumber, this.customerAccountName, this.refundProof, this.customer, this.customerAddress, this.merchantAccount, final  List<MerchantOrderItemEntity> items = const [], this.shipping, this.paidAt, this.cancelledAt, this.completedAt, this.createdAt, this.updatedAt, final  String? $type}): _promotions = promotions,_items = items,$type = $type ?? 'entity';
  factory MerchantOrderEntity.fromJson(Map<String, dynamic> json) => _$MerchantOrderEntityFromJson(json);

 final  String id;
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
 final  OrderStatus? status;
 final  String? statusLabel;
 final  String? notes;
 final  String? cancelReason;
@override final  String? customerBank;
@override final  String? customerAccountNumber;
@override final  String? customerAccountName;
@override final  String? refundProof;
 final  MerchantOrderCustomerEntity? customer;
 final  MerchantOrderCustomerAddressEntity? customerAddress;
 final  MerchantAccountEntity? merchantAccount;
 final  List<MerchantOrderItemEntity> _items;
@JsonKey() List<MerchantOrderItemEntity> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

 final  MerchantOrderShippingEntity? shipping;
 final  String? paidAt;
 final  String? cancelledAt;
 final  String? completedAt;
 final  String? createdAt;
 final  String? updatedAt;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of MerchantOrder
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantOrderEntityCopyWith<MerchantOrderEntity> get copyWith => _$MerchantOrderEntityCopyWithImpl<MerchantOrderEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MerchantOrderEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantOrderEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.invoiceNumber, invoiceNumber) || other.invoiceNumber == invoiceNumber)&&(identical(other.invoiceUrl, invoiceUrl) || other.invoiceUrl == invoiceUrl)&&(identical(other.merchantId, merchantId) || other.merchantId == merchantId)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.customerAddressId, customerAddressId) || other.customerAddressId == customerAddressId)&&(identical(other.merchantAccountId, merchantAccountId) || other.merchantAccountId == merchantAccountId)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.shippingCost, shippingCost) || other.shippingCost == shippingCost)&&(identical(other.serviceFee, serviceFee) || other.serviceFee == serviceFee)&&(identical(other.promotionId, promotionId) || other.promotionId == promotionId)&&(identical(other.promotionCode, promotionCode) || other.promotionCode == promotionCode)&&(identical(other.promotionTitle, promotionTitle) || other.promotionTitle == promotionTitle)&&(identical(other.promotionType, promotionType) || other.promotionType == promotionType)&&(identical(other.promotionDiscount, promotionDiscount) || other.promotionDiscount == promotionDiscount)&&const DeepCollectionEquality().equals(other.promotion, promotion)&&const DeepCollectionEquality().equals(other._promotions, _promotions)&&(identical(other.total, total) || other.total == total)&&(identical(other.paidAmount, paidAmount) || other.paidAmount == paidAmount)&&(identical(other.paymentProof, paymentProof) || other.paymentProof == paymentProof)&&(identical(other.type, type) || other.type == type)&&(identical(other.status, status) || other.status == status)&&(identical(other.statusLabel, statusLabel) || other.statusLabel == statusLabel)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.cancelReason, cancelReason) || other.cancelReason == cancelReason)&&(identical(other.customerBank, customerBank) || other.customerBank == customerBank)&&(identical(other.customerAccountNumber, customerAccountNumber) || other.customerAccountNumber == customerAccountNumber)&&(identical(other.customerAccountName, customerAccountName) || other.customerAccountName == customerAccountName)&&(identical(other.refundProof, refundProof) || other.refundProof == refundProof)&&const DeepCollectionEquality().equals(other.customer, customer)&&const DeepCollectionEquality().equals(other.customerAddress, customerAddress)&&const DeepCollectionEquality().equals(other.merchantAccount, merchantAccount)&&const DeepCollectionEquality().equals(other._items, _items)&&const DeepCollectionEquality().equals(other.shipping, shipping)&&(identical(other.paidAt, paidAt) || other.paidAt == paidAt)&&(identical(other.cancelledAt, cancelledAt) || other.cancelledAt == cancelledAt)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,invoiceNumber,invoiceUrl,merchantId,customerId,customerAddressId,merchantAccountId,subtotal,shippingCost,serviceFee,promotionId,promotionCode,promotionTitle,promotionType,promotionDiscount,const DeepCollectionEquality().hash(promotion),const DeepCollectionEquality().hash(_promotions),total,paidAmount,paymentProof,type,status,statusLabel,notes,cancelReason,customerBank,customerAccountNumber,customerAccountName,refundProof,const DeepCollectionEquality().hash(customer),const DeepCollectionEquality().hash(customerAddress),const DeepCollectionEquality().hash(merchantAccount),const DeepCollectionEquality().hash(_items),const DeepCollectionEquality().hash(shipping),paidAt,cancelledAt,completedAt,createdAt,updatedAt]);

@override
String toString() {
  return 'MerchantOrder.entity(id: $id, invoiceNumber: $invoiceNumber, invoiceUrl: $invoiceUrl, merchantId: $merchantId, customerId: $customerId, customerAddressId: $customerAddressId, merchantAccountId: $merchantAccountId, subtotal: $subtotal, shippingCost: $shippingCost, serviceFee: $serviceFee, promotionId: $promotionId, promotionCode: $promotionCode, promotionTitle: $promotionTitle, promotionType: $promotionType, promotionDiscount: $promotionDiscount, promotion: $promotion, promotions: $promotions, total: $total, paidAmount: $paidAmount, paymentProof: $paymentProof, type: $type, status: $status, statusLabel: $statusLabel, notes: $notes, cancelReason: $cancelReason, customerBank: $customerBank, customerAccountNumber: $customerAccountNumber, customerAccountName: $customerAccountName, refundProof: $refundProof, customer: $customer, customerAddress: $customerAddress, merchantAccount: $merchantAccount, items: $items, shipping: $shipping, paidAt: $paidAt, cancelledAt: $cancelledAt, completedAt: $completedAt, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $MerchantOrderEntityCopyWith<$Res> implements $MerchantOrderCopyWith<$Res> {
  factory $MerchantOrderEntityCopyWith(MerchantOrderEntity value, $Res Function(MerchantOrderEntity) _then) = _$MerchantOrderEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String? invoiceNumber, String? invoiceUrl, String? merchantId, int? customerId, String? customerAddressId, String? merchantAccountId, int? subtotal, int? shippingCost, int? serviceFee, String? promotionId, String? promotionCode, String? promotionTitle, String? promotionType, int? promotionDiscount, dynamic promotion, List<dynamic>? promotions, int? total, int? paidAmount, String? paymentProof, String? type, OrderStatus? status, String? statusLabel, String? notes, String? cancelReason, String? customerBank, String? customerAccountNumber, String? customerAccountName, String? refundProof, MerchantOrderCustomerEntity? customer, MerchantOrderCustomerAddressEntity? customerAddress, MerchantAccountEntity? merchantAccount, List<MerchantOrderItemEntity> items, MerchantOrderShippingEntity? shipping, String? paidAt, String? cancelledAt, String? completedAt, String? createdAt, String? updatedAt
});




}
/// @nodoc
class _$MerchantOrderEntityCopyWithImpl<$Res>
    implements $MerchantOrderEntityCopyWith<$Res> {
  _$MerchantOrderEntityCopyWithImpl(this._self, this._then);

  final MerchantOrderEntity _self;
  final $Res Function(MerchantOrderEntity) _then;

/// Create a copy of MerchantOrder
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? invoiceNumber = freezed,Object? invoiceUrl = freezed,Object? merchantId = freezed,Object? customerId = freezed,Object? customerAddressId = freezed,Object? merchantAccountId = freezed,Object? subtotal = freezed,Object? shippingCost = freezed,Object? serviceFee = freezed,Object? promotionId = freezed,Object? promotionCode = freezed,Object? promotionTitle = freezed,Object? promotionType = freezed,Object? promotionDiscount = freezed,Object? promotion = freezed,Object? promotions = freezed,Object? total = freezed,Object? paidAmount = freezed,Object? paymentProof = freezed,Object? type = freezed,Object? status = freezed,Object? statusLabel = freezed,Object? notes = freezed,Object? cancelReason = freezed,Object? customerBank = freezed,Object? customerAccountNumber = freezed,Object? customerAccountName = freezed,Object? refundProof = freezed,Object? customer = freezed,Object? customerAddress = freezed,Object? merchantAccount = freezed,Object? items = null,Object? shipping = freezed,Object? paidAt = freezed,Object? cancelledAt = freezed,Object? completedAt = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(MerchantOrderEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,invoiceNumber: freezed == invoiceNumber ? _self.invoiceNumber : invoiceNumber // ignore: cast_nullable_to_non_nullable
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
as OrderStatus?,statusLabel: freezed == statusLabel ? _self.statusLabel : statusLabel // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,cancelReason: freezed == cancelReason ? _self.cancelReason : cancelReason // ignore: cast_nullable_to_non_nullable
as String?,customerBank: freezed == customerBank ? _self.customerBank : customerBank // ignore: cast_nullable_to_non_nullable
as String?,customerAccountNumber: freezed == customerAccountNumber ? _self.customerAccountNumber : customerAccountNumber // ignore: cast_nullable_to_non_nullable
as String?,customerAccountName: freezed == customerAccountName ? _self.customerAccountName : customerAccountName // ignore: cast_nullable_to_non_nullable
as String?,refundProof: freezed == refundProof ? _self.refundProof : refundProof // ignore: cast_nullable_to_non_nullable
as String?,customer: freezed == customer ? _self.customer : customer // ignore: cast_nullable_to_non_nullable
as MerchantOrderCustomerEntity?,customerAddress: freezed == customerAddress ? _self.customerAddress : customerAddress // ignore: cast_nullable_to_non_nullable
as MerchantOrderCustomerAddressEntity?,merchantAccount: freezed == merchantAccount ? _self.merchantAccount : merchantAccount // ignore: cast_nullable_to_non_nullable
as MerchantAccountEntity?,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<MerchantOrderItemEntity>,shipping: freezed == shipping ? _self.shipping : shipping // ignore: cast_nullable_to_non_nullable
as MerchantOrderShippingEntity?,paidAt: freezed == paidAt ? _self.paidAt : paidAt // ignore: cast_nullable_to_non_nullable
as String?,cancelledAt: freezed == cancelledAt ? _self.cancelledAt : cancelledAt // ignore: cast_nullable_to_non_nullable
as String?,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
