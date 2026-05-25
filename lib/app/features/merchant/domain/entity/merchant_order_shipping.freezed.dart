// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'merchant_order_shipping.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
MerchantOrderShipping _$MerchantOrderShippingFromJson(
  Map<String, dynamic> json
) {
    return MerchantOrderShippingEntity.fromJson(
      json
    );
}

/// @nodoc
mixin _$MerchantOrderShipping {

 String? get id; String? get orderId; String? get type; String? get status; MerchantOrderShippingAddressEntity? get originAddress; MerchantOrderShippingAddressEntity? get destinationAddress; String? get courier; String? get courierCode; String? get service; String? get serviceCode; String? get driverName; String? get driverPhone; String? get driverVehicleNumber; String? get trackingNumber; bool? get isInstant; String? get pickupPhoto; String? get deliveryPhoto; String? get biteshipOrderId; num? get shippingCost; Map<String, dynamic>? get biteshipPayload; Map<String, dynamic>? get biteshipResponse; String? get notes; String? get shippedAt; String? get deliveredAt; String? get cancelledAt; String? get createdAt; String? get updatedAt;
/// Create a copy of MerchantOrderShipping
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantOrderShippingCopyWith<MerchantOrderShipping> get copyWith => _$MerchantOrderShippingCopyWithImpl<MerchantOrderShipping>(this as MerchantOrderShipping, _$identity);

  /// Serializes this MerchantOrderShipping to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantOrderShipping&&(identical(other.id, id) || other.id == id)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.type, type) || other.type == type)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.originAddress, originAddress)&&const DeepCollectionEquality().equals(other.destinationAddress, destinationAddress)&&(identical(other.courier, courier) || other.courier == courier)&&(identical(other.courierCode, courierCode) || other.courierCode == courierCode)&&(identical(other.service, service) || other.service == service)&&(identical(other.serviceCode, serviceCode) || other.serviceCode == serviceCode)&&(identical(other.driverName, driverName) || other.driverName == driverName)&&(identical(other.driverPhone, driverPhone) || other.driverPhone == driverPhone)&&(identical(other.driverVehicleNumber, driverVehicleNumber) || other.driverVehicleNumber == driverVehicleNumber)&&(identical(other.trackingNumber, trackingNumber) || other.trackingNumber == trackingNumber)&&(identical(other.isInstant, isInstant) || other.isInstant == isInstant)&&(identical(other.pickupPhoto, pickupPhoto) || other.pickupPhoto == pickupPhoto)&&(identical(other.deliveryPhoto, deliveryPhoto) || other.deliveryPhoto == deliveryPhoto)&&(identical(other.biteshipOrderId, biteshipOrderId) || other.biteshipOrderId == biteshipOrderId)&&(identical(other.shippingCost, shippingCost) || other.shippingCost == shippingCost)&&const DeepCollectionEquality().equals(other.biteshipPayload, biteshipPayload)&&const DeepCollectionEquality().equals(other.biteshipResponse, biteshipResponse)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.shippedAt, shippedAt) || other.shippedAt == shippedAt)&&(identical(other.deliveredAt, deliveredAt) || other.deliveredAt == deliveredAt)&&(identical(other.cancelledAt, cancelledAt) || other.cancelledAt == cancelledAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,orderId,type,status,const DeepCollectionEquality().hash(originAddress),const DeepCollectionEquality().hash(destinationAddress),courier,courierCode,service,serviceCode,driverName,driverPhone,driverVehicleNumber,trackingNumber,isInstant,pickupPhoto,deliveryPhoto,biteshipOrderId,shippingCost,const DeepCollectionEquality().hash(biteshipPayload),const DeepCollectionEquality().hash(biteshipResponse),notes,shippedAt,deliveredAt,cancelledAt,createdAt,updatedAt]);

@override
String toString() {
  return 'MerchantOrderShipping(id: $id, orderId: $orderId, type: $type, status: $status, originAddress: $originAddress, destinationAddress: $destinationAddress, courier: $courier, courierCode: $courierCode, service: $service, serviceCode: $serviceCode, driverName: $driverName, driverPhone: $driverPhone, driverVehicleNumber: $driverVehicleNumber, trackingNumber: $trackingNumber, isInstant: $isInstant, pickupPhoto: $pickupPhoto, deliveryPhoto: $deliveryPhoto, biteshipOrderId: $biteshipOrderId, shippingCost: $shippingCost, biteshipPayload: $biteshipPayload, biteshipResponse: $biteshipResponse, notes: $notes, shippedAt: $shippedAt, deliveredAt: $deliveredAt, cancelledAt: $cancelledAt, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $MerchantOrderShippingCopyWith<$Res>  {
  factory $MerchantOrderShippingCopyWith(MerchantOrderShipping value, $Res Function(MerchantOrderShipping) _then) = _$MerchantOrderShippingCopyWithImpl;
@useResult
$Res call({
 String? id, String? orderId, String? type, String? status, MerchantOrderShippingAddressEntity? originAddress, MerchantOrderShippingAddressEntity? destinationAddress, String? courier, String? courierCode, String? service, String? serviceCode, String? driverName, String? driverPhone, String? driverVehicleNumber, String? trackingNumber, bool? isInstant, String? pickupPhoto, String? deliveryPhoto, String? biteshipOrderId, num? shippingCost, Map<String, dynamic>? biteshipPayload, Map<String, dynamic>? biteshipResponse, String? notes, String? shippedAt, String? deliveredAt, String? cancelledAt, String? createdAt, String? updatedAt
});




}
/// @nodoc
class _$MerchantOrderShippingCopyWithImpl<$Res>
    implements $MerchantOrderShippingCopyWith<$Res> {
  _$MerchantOrderShippingCopyWithImpl(this._self, this._then);

  final MerchantOrderShipping _self;
  final $Res Function(MerchantOrderShipping) _then;

/// Create a copy of MerchantOrderShipping
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? orderId = freezed,Object? type = freezed,Object? status = freezed,Object? originAddress = freezed,Object? destinationAddress = freezed,Object? courier = freezed,Object? courierCode = freezed,Object? service = freezed,Object? serviceCode = freezed,Object? driverName = freezed,Object? driverPhone = freezed,Object? driverVehicleNumber = freezed,Object? trackingNumber = freezed,Object? isInstant = freezed,Object? pickupPhoto = freezed,Object? deliveryPhoto = freezed,Object? biteshipOrderId = freezed,Object? shippingCost = freezed,Object? biteshipPayload = freezed,Object? biteshipResponse = freezed,Object? notes = freezed,Object? shippedAt = freezed,Object? deliveredAt = freezed,Object? cancelledAt = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,orderId: freezed == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,originAddress: freezed == originAddress ? _self.originAddress : originAddress // ignore: cast_nullable_to_non_nullable
as MerchantOrderShippingAddressEntity?,destinationAddress: freezed == destinationAddress ? _self.destinationAddress : destinationAddress // ignore: cast_nullable_to_non_nullable
as MerchantOrderShippingAddressEntity?,courier: freezed == courier ? _self.courier : courier // ignore: cast_nullable_to_non_nullable
as String?,courierCode: freezed == courierCode ? _self.courierCode : courierCode // ignore: cast_nullable_to_non_nullable
as String?,service: freezed == service ? _self.service : service // ignore: cast_nullable_to_non_nullable
as String?,serviceCode: freezed == serviceCode ? _self.serviceCode : serviceCode // ignore: cast_nullable_to_non_nullable
as String?,driverName: freezed == driverName ? _self.driverName : driverName // ignore: cast_nullable_to_non_nullable
as String?,driverPhone: freezed == driverPhone ? _self.driverPhone : driverPhone // ignore: cast_nullable_to_non_nullable
as String?,driverVehicleNumber: freezed == driverVehicleNumber ? _self.driverVehicleNumber : driverVehicleNumber // ignore: cast_nullable_to_non_nullable
as String?,trackingNumber: freezed == trackingNumber ? _self.trackingNumber : trackingNumber // ignore: cast_nullable_to_non_nullable
as String?,isInstant: freezed == isInstant ? _self.isInstant : isInstant // ignore: cast_nullable_to_non_nullable
as bool?,pickupPhoto: freezed == pickupPhoto ? _self.pickupPhoto : pickupPhoto // ignore: cast_nullable_to_non_nullable
as String?,deliveryPhoto: freezed == deliveryPhoto ? _self.deliveryPhoto : deliveryPhoto // ignore: cast_nullable_to_non_nullable
as String?,biteshipOrderId: freezed == biteshipOrderId ? _self.biteshipOrderId : biteshipOrderId // ignore: cast_nullable_to_non_nullable
as String?,shippingCost: freezed == shippingCost ? _self.shippingCost : shippingCost // ignore: cast_nullable_to_non_nullable
as num?,biteshipPayload: freezed == biteshipPayload ? _self.biteshipPayload : biteshipPayload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,biteshipResponse: freezed == biteshipResponse ? _self.biteshipResponse : biteshipResponse // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,shippedAt: freezed == shippedAt ? _self.shippedAt : shippedAt // ignore: cast_nullable_to_non_nullable
as String?,deliveredAt: freezed == deliveredAt ? _self.deliveredAt : deliveredAt // ignore: cast_nullable_to_non_nullable
as String?,cancelledAt: freezed == cancelledAt ? _self.cancelledAt : cancelledAt // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MerchantOrderShipping].
extension MerchantOrderShippingPatterns on MerchantOrderShipping {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MerchantOrderShippingEntity value)?  entity,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MerchantOrderShippingEntity() when entity != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MerchantOrderShippingEntity value)  entity,}){
final _that = this;
switch (_that) {
case MerchantOrderShippingEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MerchantOrderShippingEntity value)?  entity,}){
final _that = this;
switch (_that) {
case MerchantOrderShippingEntity() when entity != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String? id,  String? orderId,  String? type,  String? status,  MerchantOrderShippingAddressEntity? originAddress,  MerchantOrderShippingAddressEntity? destinationAddress,  String? courier,  String? courierCode,  String? service,  String? serviceCode,  String? driverName,  String? driverPhone,  String? driverVehicleNumber,  String? trackingNumber,  bool? isInstant,  String? pickupPhoto,  String? deliveryPhoto,  String? biteshipOrderId,  num? shippingCost,  Map<String, dynamic>? biteshipPayload,  Map<String, dynamic>? biteshipResponse,  String? notes,  String? shippedAt,  String? deliveredAt,  String? cancelledAt,  String? createdAt,  String? updatedAt)?  entity,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MerchantOrderShippingEntity() when entity != null:
return entity(_that.id,_that.orderId,_that.type,_that.status,_that.originAddress,_that.destinationAddress,_that.courier,_that.courierCode,_that.service,_that.serviceCode,_that.driverName,_that.driverPhone,_that.driverVehicleNumber,_that.trackingNumber,_that.isInstant,_that.pickupPhoto,_that.deliveryPhoto,_that.biteshipOrderId,_that.shippingCost,_that.biteshipPayload,_that.biteshipResponse,_that.notes,_that.shippedAt,_that.deliveredAt,_that.cancelledAt,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String? id,  String? orderId,  String? type,  String? status,  MerchantOrderShippingAddressEntity? originAddress,  MerchantOrderShippingAddressEntity? destinationAddress,  String? courier,  String? courierCode,  String? service,  String? serviceCode,  String? driverName,  String? driverPhone,  String? driverVehicleNumber,  String? trackingNumber,  bool? isInstant,  String? pickupPhoto,  String? deliveryPhoto,  String? biteshipOrderId,  num? shippingCost,  Map<String, dynamic>? biteshipPayload,  Map<String, dynamic>? biteshipResponse,  String? notes,  String? shippedAt,  String? deliveredAt,  String? cancelledAt,  String? createdAt,  String? updatedAt)  entity,}) {final _that = this;
switch (_that) {
case MerchantOrderShippingEntity():
return entity(_that.id,_that.orderId,_that.type,_that.status,_that.originAddress,_that.destinationAddress,_that.courier,_that.courierCode,_that.service,_that.serviceCode,_that.driverName,_that.driverPhone,_that.driverVehicleNumber,_that.trackingNumber,_that.isInstant,_that.pickupPhoto,_that.deliveryPhoto,_that.biteshipOrderId,_that.shippingCost,_that.biteshipPayload,_that.biteshipResponse,_that.notes,_that.shippedAt,_that.deliveredAt,_that.cancelledAt,_that.createdAt,_that.updatedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String? id,  String? orderId,  String? type,  String? status,  MerchantOrderShippingAddressEntity? originAddress,  MerchantOrderShippingAddressEntity? destinationAddress,  String? courier,  String? courierCode,  String? service,  String? serviceCode,  String? driverName,  String? driverPhone,  String? driverVehicleNumber,  String? trackingNumber,  bool? isInstant,  String? pickupPhoto,  String? deliveryPhoto,  String? biteshipOrderId,  num? shippingCost,  Map<String, dynamic>? biteshipPayload,  Map<String, dynamic>? biteshipResponse,  String? notes,  String? shippedAt,  String? deliveredAt,  String? cancelledAt,  String? createdAt,  String? updatedAt)?  entity,}) {final _that = this;
switch (_that) {
case MerchantOrderShippingEntity() when entity != null:
return entity(_that.id,_that.orderId,_that.type,_that.status,_that.originAddress,_that.destinationAddress,_that.courier,_that.courierCode,_that.service,_that.serviceCode,_that.driverName,_that.driverPhone,_that.driverVehicleNumber,_that.trackingNumber,_that.isInstant,_that.pickupPhoto,_that.deliveryPhoto,_that.biteshipOrderId,_that.shippingCost,_that.biteshipPayload,_that.biteshipResponse,_that.notes,_that.shippedAt,_that.deliveredAt,_that.cancelledAt,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class MerchantOrderShippingEntity implements MerchantOrderShipping {
  const MerchantOrderShippingEntity({this.id, this.orderId, this.type, this.status, this.originAddress, this.destinationAddress, this.courier, this.courierCode, this.service, this.serviceCode, this.driverName, this.driverPhone, this.driverVehicleNumber, this.trackingNumber, this.isInstant, this.pickupPhoto, this.deliveryPhoto, this.biteshipOrderId, this.shippingCost, final  Map<String, dynamic>? biteshipPayload, final  Map<String, dynamic>? biteshipResponse, this.notes, this.shippedAt, this.deliveredAt, this.cancelledAt, this.createdAt, this.updatedAt}): _biteshipPayload = biteshipPayload,_biteshipResponse = biteshipResponse;
  factory MerchantOrderShippingEntity.fromJson(Map<String, dynamic> json) => _$MerchantOrderShippingEntityFromJson(json);

@override final  String? id;
@override final  String? orderId;
@override final  String? type;
@override final  String? status;
@override final  MerchantOrderShippingAddressEntity? originAddress;
@override final  MerchantOrderShippingAddressEntity? destinationAddress;
@override final  String? courier;
@override final  String? courierCode;
@override final  String? service;
@override final  String? serviceCode;
@override final  String? driverName;
@override final  String? driverPhone;
@override final  String? driverVehicleNumber;
@override final  String? trackingNumber;
@override final  bool? isInstant;
@override final  String? pickupPhoto;
@override final  String? deliveryPhoto;
@override final  String? biteshipOrderId;
@override final  num? shippingCost;
 final  Map<String, dynamic>? _biteshipPayload;
@override Map<String, dynamic>? get biteshipPayload {
  final value = _biteshipPayload;
  if (value == null) return null;
  if (_biteshipPayload is EqualUnmodifiableMapView) return _biteshipPayload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

 final  Map<String, dynamic>? _biteshipResponse;
@override Map<String, dynamic>? get biteshipResponse {
  final value = _biteshipResponse;
  if (value == null) return null;
  if (_biteshipResponse is EqualUnmodifiableMapView) return _biteshipResponse;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override final  String? notes;
@override final  String? shippedAt;
@override final  String? deliveredAt;
@override final  String? cancelledAt;
@override final  String? createdAt;
@override final  String? updatedAt;

/// Create a copy of MerchantOrderShipping
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantOrderShippingEntityCopyWith<MerchantOrderShippingEntity> get copyWith => _$MerchantOrderShippingEntityCopyWithImpl<MerchantOrderShippingEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MerchantOrderShippingEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantOrderShippingEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.type, type) || other.type == type)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.originAddress, originAddress)&&const DeepCollectionEquality().equals(other.destinationAddress, destinationAddress)&&(identical(other.courier, courier) || other.courier == courier)&&(identical(other.courierCode, courierCode) || other.courierCode == courierCode)&&(identical(other.service, service) || other.service == service)&&(identical(other.serviceCode, serviceCode) || other.serviceCode == serviceCode)&&(identical(other.driverName, driverName) || other.driverName == driverName)&&(identical(other.driverPhone, driverPhone) || other.driverPhone == driverPhone)&&(identical(other.driverVehicleNumber, driverVehicleNumber) || other.driverVehicleNumber == driverVehicleNumber)&&(identical(other.trackingNumber, trackingNumber) || other.trackingNumber == trackingNumber)&&(identical(other.isInstant, isInstant) || other.isInstant == isInstant)&&(identical(other.pickupPhoto, pickupPhoto) || other.pickupPhoto == pickupPhoto)&&(identical(other.deliveryPhoto, deliveryPhoto) || other.deliveryPhoto == deliveryPhoto)&&(identical(other.biteshipOrderId, biteshipOrderId) || other.biteshipOrderId == biteshipOrderId)&&(identical(other.shippingCost, shippingCost) || other.shippingCost == shippingCost)&&const DeepCollectionEquality().equals(other._biteshipPayload, _biteshipPayload)&&const DeepCollectionEquality().equals(other._biteshipResponse, _biteshipResponse)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.shippedAt, shippedAt) || other.shippedAt == shippedAt)&&(identical(other.deliveredAt, deliveredAt) || other.deliveredAt == deliveredAt)&&(identical(other.cancelledAt, cancelledAt) || other.cancelledAt == cancelledAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,orderId,type,status,const DeepCollectionEquality().hash(originAddress),const DeepCollectionEquality().hash(destinationAddress),courier,courierCode,service,serviceCode,driverName,driverPhone,driverVehicleNumber,trackingNumber,isInstant,pickupPhoto,deliveryPhoto,biteshipOrderId,shippingCost,const DeepCollectionEquality().hash(_biteshipPayload),const DeepCollectionEquality().hash(_biteshipResponse),notes,shippedAt,deliveredAt,cancelledAt,createdAt,updatedAt]);

@override
String toString() {
  return 'MerchantOrderShipping.entity(id: $id, orderId: $orderId, type: $type, status: $status, originAddress: $originAddress, destinationAddress: $destinationAddress, courier: $courier, courierCode: $courierCode, service: $service, serviceCode: $serviceCode, driverName: $driverName, driverPhone: $driverPhone, driverVehicleNumber: $driverVehicleNumber, trackingNumber: $trackingNumber, isInstant: $isInstant, pickupPhoto: $pickupPhoto, deliveryPhoto: $deliveryPhoto, biteshipOrderId: $biteshipOrderId, shippingCost: $shippingCost, biteshipPayload: $biteshipPayload, biteshipResponse: $biteshipResponse, notes: $notes, shippedAt: $shippedAt, deliveredAt: $deliveredAt, cancelledAt: $cancelledAt, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $MerchantOrderShippingEntityCopyWith<$Res> implements $MerchantOrderShippingCopyWith<$Res> {
  factory $MerchantOrderShippingEntityCopyWith(MerchantOrderShippingEntity value, $Res Function(MerchantOrderShippingEntity) _then) = _$MerchantOrderShippingEntityCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? orderId, String? type, String? status, MerchantOrderShippingAddressEntity? originAddress, MerchantOrderShippingAddressEntity? destinationAddress, String? courier, String? courierCode, String? service, String? serviceCode, String? driverName, String? driverPhone, String? driverVehicleNumber, String? trackingNumber, bool? isInstant, String? pickupPhoto, String? deliveryPhoto, String? biteshipOrderId, num? shippingCost, Map<String, dynamic>? biteshipPayload, Map<String, dynamic>? biteshipResponse, String? notes, String? shippedAt, String? deliveredAt, String? cancelledAt, String? createdAt, String? updatedAt
});




}
/// @nodoc
class _$MerchantOrderShippingEntityCopyWithImpl<$Res>
    implements $MerchantOrderShippingEntityCopyWith<$Res> {
  _$MerchantOrderShippingEntityCopyWithImpl(this._self, this._then);

  final MerchantOrderShippingEntity _self;
  final $Res Function(MerchantOrderShippingEntity) _then;

/// Create a copy of MerchantOrderShipping
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? orderId = freezed,Object? type = freezed,Object? status = freezed,Object? originAddress = freezed,Object? destinationAddress = freezed,Object? courier = freezed,Object? courierCode = freezed,Object? service = freezed,Object? serviceCode = freezed,Object? driverName = freezed,Object? driverPhone = freezed,Object? driverVehicleNumber = freezed,Object? trackingNumber = freezed,Object? isInstant = freezed,Object? pickupPhoto = freezed,Object? deliveryPhoto = freezed,Object? biteshipOrderId = freezed,Object? shippingCost = freezed,Object? biteshipPayload = freezed,Object? biteshipResponse = freezed,Object? notes = freezed,Object? shippedAt = freezed,Object? deliveredAt = freezed,Object? cancelledAt = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(MerchantOrderShippingEntity(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,orderId: freezed == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,originAddress: freezed == originAddress ? _self.originAddress : originAddress // ignore: cast_nullable_to_non_nullable
as MerchantOrderShippingAddressEntity?,destinationAddress: freezed == destinationAddress ? _self.destinationAddress : destinationAddress // ignore: cast_nullable_to_non_nullable
as MerchantOrderShippingAddressEntity?,courier: freezed == courier ? _self.courier : courier // ignore: cast_nullable_to_non_nullable
as String?,courierCode: freezed == courierCode ? _self.courierCode : courierCode // ignore: cast_nullable_to_non_nullable
as String?,service: freezed == service ? _self.service : service // ignore: cast_nullable_to_non_nullable
as String?,serviceCode: freezed == serviceCode ? _self.serviceCode : serviceCode // ignore: cast_nullable_to_non_nullable
as String?,driverName: freezed == driverName ? _self.driverName : driverName // ignore: cast_nullable_to_non_nullable
as String?,driverPhone: freezed == driverPhone ? _self.driverPhone : driverPhone // ignore: cast_nullable_to_non_nullable
as String?,driverVehicleNumber: freezed == driverVehicleNumber ? _self.driverVehicleNumber : driverVehicleNumber // ignore: cast_nullable_to_non_nullable
as String?,trackingNumber: freezed == trackingNumber ? _self.trackingNumber : trackingNumber // ignore: cast_nullable_to_non_nullable
as String?,isInstant: freezed == isInstant ? _self.isInstant : isInstant // ignore: cast_nullable_to_non_nullable
as bool?,pickupPhoto: freezed == pickupPhoto ? _self.pickupPhoto : pickupPhoto // ignore: cast_nullable_to_non_nullable
as String?,deliveryPhoto: freezed == deliveryPhoto ? _self.deliveryPhoto : deliveryPhoto // ignore: cast_nullable_to_non_nullable
as String?,biteshipOrderId: freezed == biteshipOrderId ? _self.biteshipOrderId : biteshipOrderId // ignore: cast_nullable_to_non_nullable
as String?,shippingCost: freezed == shippingCost ? _self.shippingCost : shippingCost // ignore: cast_nullable_to_non_nullable
as num?,biteshipPayload: freezed == biteshipPayload ? _self._biteshipPayload : biteshipPayload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,biteshipResponse: freezed == biteshipResponse ? _self._biteshipResponse : biteshipResponse // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,shippedAt: freezed == shippedAt ? _self.shippedAt : shippedAt // ignore: cast_nullable_to_non_nullable
as String?,deliveredAt: freezed == deliveredAt ? _self.deliveredAt : deliveredAt // ignore: cast_nullable_to_non_nullable
as String?,cancelledAt: freezed == cancelledAt ? _self.cancelledAt : cancelledAt // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

MerchantOrderShippingAddress _$MerchantOrderShippingAddressFromJson(
  Map<String, dynamic> json
) {
    return MerchantOrderShippingAddressEntity.fromJson(
      json
    );
}

/// @nodoc
mixin _$MerchantOrderShippingAddress {

 String? get id; String? get city; String? get name; String? get label; String? get notes; String? get phone; String? get address; String? get district; dynamic get latitude; String? get province; dynamic get longitude; String? get postalCode; String? get recipientName;
/// Create a copy of MerchantOrderShippingAddress
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantOrderShippingAddressCopyWith<MerchantOrderShippingAddress> get copyWith => _$MerchantOrderShippingAddressCopyWithImpl<MerchantOrderShippingAddress>(this as MerchantOrderShippingAddress, _$identity);

  /// Serializes this MerchantOrderShippingAddress to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantOrderShippingAddress&&(identical(other.id, id) || other.id == id)&&(identical(other.city, city) || other.city == city)&&(identical(other.name, name) || other.name == name)&&(identical(other.label, label) || other.label == label)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.address, address) || other.address == address)&&(identical(other.district, district) || other.district == district)&&const DeepCollectionEquality().equals(other.latitude, latitude)&&(identical(other.province, province) || other.province == province)&&const DeepCollectionEquality().equals(other.longitude, longitude)&&(identical(other.postalCode, postalCode) || other.postalCode == postalCode)&&(identical(other.recipientName, recipientName) || other.recipientName == recipientName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,city,name,label,notes,phone,address,district,const DeepCollectionEquality().hash(latitude),province,const DeepCollectionEquality().hash(longitude),postalCode,recipientName);

@override
String toString() {
  return 'MerchantOrderShippingAddress(id: $id, city: $city, name: $name, label: $label, notes: $notes, phone: $phone, address: $address, district: $district, latitude: $latitude, province: $province, longitude: $longitude, postalCode: $postalCode, recipientName: $recipientName)';
}


}

/// @nodoc
abstract mixin class $MerchantOrderShippingAddressCopyWith<$Res>  {
  factory $MerchantOrderShippingAddressCopyWith(MerchantOrderShippingAddress value, $Res Function(MerchantOrderShippingAddress) _then) = _$MerchantOrderShippingAddressCopyWithImpl;
@useResult
$Res call({
 String? id, String? city, String? name, String? label, String? notes, String? phone, String? address, String? district, dynamic latitude, String? province, dynamic longitude, String? postalCode, String? recipientName
});




}
/// @nodoc
class _$MerchantOrderShippingAddressCopyWithImpl<$Res>
    implements $MerchantOrderShippingAddressCopyWith<$Res> {
  _$MerchantOrderShippingAddressCopyWithImpl(this._self, this._then);

  final MerchantOrderShippingAddress _self;
  final $Res Function(MerchantOrderShippingAddress) _then;

/// Create a copy of MerchantOrderShippingAddress
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? city = freezed,Object? name = freezed,Object? label = freezed,Object? notes = freezed,Object? phone = freezed,Object? address = freezed,Object? district = freezed,Object? latitude = freezed,Object? province = freezed,Object? longitude = freezed,Object? postalCode = freezed,Object? recipientName = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,district: freezed == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as dynamic,province: freezed == province ? _self.province : province // ignore: cast_nullable_to_non_nullable
as String?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as dynamic,postalCode: freezed == postalCode ? _self.postalCode : postalCode // ignore: cast_nullable_to_non_nullable
as String?,recipientName: freezed == recipientName ? _self.recipientName : recipientName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MerchantOrderShippingAddress].
extension MerchantOrderShippingAddressPatterns on MerchantOrderShippingAddress {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MerchantOrderShippingAddressEntity value)?  entity,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MerchantOrderShippingAddressEntity() when entity != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MerchantOrderShippingAddressEntity value)  entity,}){
final _that = this;
switch (_that) {
case MerchantOrderShippingAddressEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MerchantOrderShippingAddressEntity value)?  entity,}){
final _that = this;
switch (_that) {
case MerchantOrderShippingAddressEntity() when entity != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String? id,  String? city,  String? name,  String? label,  String? notes,  String? phone,  String? address,  String? district,  dynamic latitude,  String? province,  dynamic longitude,  String? postalCode,  String? recipientName)?  entity,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MerchantOrderShippingAddressEntity() when entity != null:
return entity(_that.id,_that.city,_that.name,_that.label,_that.notes,_that.phone,_that.address,_that.district,_that.latitude,_that.province,_that.longitude,_that.postalCode,_that.recipientName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String? id,  String? city,  String? name,  String? label,  String? notes,  String? phone,  String? address,  String? district,  dynamic latitude,  String? province,  dynamic longitude,  String? postalCode,  String? recipientName)  entity,}) {final _that = this;
switch (_that) {
case MerchantOrderShippingAddressEntity():
return entity(_that.id,_that.city,_that.name,_that.label,_that.notes,_that.phone,_that.address,_that.district,_that.latitude,_that.province,_that.longitude,_that.postalCode,_that.recipientName);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String? id,  String? city,  String? name,  String? label,  String? notes,  String? phone,  String? address,  String? district,  dynamic latitude,  String? province,  dynamic longitude,  String? postalCode,  String? recipientName)?  entity,}) {final _that = this;
switch (_that) {
case MerchantOrderShippingAddressEntity() when entity != null:
return entity(_that.id,_that.city,_that.name,_that.label,_that.notes,_that.phone,_that.address,_that.district,_that.latitude,_that.province,_that.longitude,_that.postalCode,_that.recipientName);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class MerchantOrderShippingAddressEntity implements MerchantOrderShippingAddress {
  const MerchantOrderShippingAddressEntity({this.id, this.city, this.name, this.label, this.notes, this.phone, this.address, this.district, this.latitude, this.province, this.longitude, this.postalCode, this.recipientName});
  factory MerchantOrderShippingAddressEntity.fromJson(Map<String, dynamic> json) => _$MerchantOrderShippingAddressEntityFromJson(json);

@override final  String? id;
@override final  String? city;
@override final  String? name;
@override final  String? label;
@override final  String? notes;
@override final  String? phone;
@override final  String? address;
@override final  String? district;
@override final  dynamic latitude;
@override final  String? province;
@override final  dynamic longitude;
@override final  String? postalCode;
@override final  String? recipientName;

/// Create a copy of MerchantOrderShippingAddress
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantOrderShippingAddressEntityCopyWith<MerchantOrderShippingAddressEntity> get copyWith => _$MerchantOrderShippingAddressEntityCopyWithImpl<MerchantOrderShippingAddressEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MerchantOrderShippingAddressEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantOrderShippingAddressEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.city, city) || other.city == city)&&(identical(other.name, name) || other.name == name)&&(identical(other.label, label) || other.label == label)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.address, address) || other.address == address)&&(identical(other.district, district) || other.district == district)&&const DeepCollectionEquality().equals(other.latitude, latitude)&&(identical(other.province, province) || other.province == province)&&const DeepCollectionEquality().equals(other.longitude, longitude)&&(identical(other.postalCode, postalCode) || other.postalCode == postalCode)&&(identical(other.recipientName, recipientName) || other.recipientName == recipientName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,city,name,label,notes,phone,address,district,const DeepCollectionEquality().hash(latitude),province,const DeepCollectionEquality().hash(longitude),postalCode,recipientName);

@override
String toString() {
  return 'MerchantOrderShippingAddress.entity(id: $id, city: $city, name: $name, label: $label, notes: $notes, phone: $phone, address: $address, district: $district, latitude: $latitude, province: $province, longitude: $longitude, postalCode: $postalCode, recipientName: $recipientName)';
}


}

/// @nodoc
abstract mixin class $MerchantOrderShippingAddressEntityCopyWith<$Res> implements $MerchantOrderShippingAddressCopyWith<$Res> {
  factory $MerchantOrderShippingAddressEntityCopyWith(MerchantOrderShippingAddressEntity value, $Res Function(MerchantOrderShippingAddressEntity) _then) = _$MerchantOrderShippingAddressEntityCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? city, String? name, String? label, String? notes, String? phone, String? address, String? district, dynamic latitude, String? province, dynamic longitude, String? postalCode, String? recipientName
});




}
/// @nodoc
class _$MerchantOrderShippingAddressEntityCopyWithImpl<$Res>
    implements $MerchantOrderShippingAddressEntityCopyWith<$Res> {
  _$MerchantOrderShippingAddressEntityCopyWithImpl(this._self, this._then);

  final MerchantOrderShippingAddressEntity _self;
  final $Res Function(MerchantOrderShippingAddressEntity) _then;

/// Create a copy of MerchantOrderShippingAddress
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? city = freezed,Object? name = freezed,Object? label = freezed,Object? notes = freezed,Object? phone = freezed,Object? address = freezed,Object? district = freezed,Object? latitude = freezed,Object? province = freezed,Object? longitude = freezed,Object? postalCode = freezed,Object? recipientName = freezed,}) {
  return _then(MerchantOrderShippingAddressEntity(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,district: freezed == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as dynamic,province: freezed == province ? _self.province : province // ignore: cast_nullable_to_non_nullable
as String?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as dynamic,postalCode: freezed == postalCode ? _self.postalCode : postalCode // ignore: cast_nullable_to_non_nullable
as String?,recipientName: freezed == recipientName ? _self.recipientName : recipientName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
