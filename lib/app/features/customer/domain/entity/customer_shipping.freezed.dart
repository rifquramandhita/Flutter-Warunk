// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_shipping.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
CustomerShipping _$CustomerShippingFromJson(
  Map<String, dynamic> json
) {
    return CustomerShippingEntity.fromJson(
      json
    );
}

/// @nodoc
mixin _$CustomerShipping {

 String? get id; String? get orderId; String? get type; String? get status; dynamic get originAddress; dynamic get destinationAddress; String? get courier; String? get courierCode; String? get service; String? get serviceCode; String? get driverName; String? get driverPhone; String? get driverVehicleNumber; String? get trackingNumber; bool? get isInstant; String? get pickupPhoto; String? get deliveryPhoto; String? get biteshipOrderId; num? get shippingCost; dynamic get biteshipPayload; dynamic get biteshipResponse; String? get notes; String? get shippedAt; String? get deliveredAt; String? get cancelledAt; String? get createdAt; String? get updatedAt;
/// Create a copy of CustomerShipping
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerShippingCopyWith<CustomerShipping> get copyWith => _$CustomerShippingCopyWithImpl<CustomerShipping>(this as CustomerShipping, _$identity);

  /// Serializes this CustomerShipping to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerShipping&&(identical(other.id, id) || other.id == id)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.type, type) || other.type == type)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.originAddress, originAddress)&&const DeepCollectionEquality().equals(other.destinationAddress, destinationAddress)&&(identical(other.courier, courier) || other.courier == courier)&&(identical(other.courierCode, courierCode) || other.courierCode == courierCode)&&(identical(other.service, service) || other.service == service)&&(identical(other.serviceCode, serviceCode) || other.serviceCode == serviceCode)&&(identical(other.driverName, driverName) || other.driverName == driverName)&&(identical(other.driverPhone, driverPhone) || other.driverPhone == driverPhone)&&(identical(other.driverVehicleNumber, driverVehicleNumber) || other.driverVehicleNumber == driverVehicleNumber)&&(identical(other.trackingNumber, trackingNumber) || other.trackingNumber == trackingNumber)&&(identical(other.isInstant, isInstant) || other.isInstant == isInstant)&&(identical(other.pickupPhoto, pickupPhoto) || other.pickupPhoto == pickupPhoto)&&(identical(other.deliveryPhoto, deliveryPhoto) || other.deliveryPhoto == deliveryPhoto)&&(identical(other.biteshipOrderId, biteshipOrderId) || other.biteshipOrderId == biteshipOrderId)&&(identical(other.shippingCost, shippingCost) || other.shippingCost == shippingCost)&&const DeepCollectionEquality().equals(other.biteshipPayload, biteshipPayload)&&const DeepCollectionEquality().equals(other.biteshipResponse, biteshipResponse)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.shippedAt, shippedAt) || other.shippedAt == shippedAt)&&(identical(other.deliveredAt, deliveredAt) || other.deliveredAt == deliveredAt)&&(identical(other.cancelledAt, cancelledAt) || other.cancelledAt == cancelledAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,orderId,type,status,const DeepCollectionEquality().hash(originAddress),const DeepCollectionEquality().hash(destinationAddress),courier,courierCode,service,serviceCode,driverName,driverPhone,driverVehicleNumber,trackingNumber,isInstant,pickupPhoto,deliveryPhoto,biteshipOrderId,shippingCost,const DeepCollectionEquality().hash(biteshipPayload),const DeepCollectionEquality().hash(biteshipResponse),notes,shippedAt,deliveredAt,cancelledAt,createdAt,updatedAt]);

@override
String toString() {
  return 'CustomerShipping(id: $id, orderId: $orderId, type: $type, status: $status, originAddress: $originAddress, destinationAddress: $destinationAddress, courier: $courier, courierCode: $courierCode, service: $service, serviceCode: $serviceCode, driverName: $driverName, driverPhone: $driverPhone, driverVehicleNumber: $driverVehicleNumber, trackingNumber: $trackingNumber, isInstant: $isInstant, pickupPhoto: $pickupPhoto, deliveryPhoto: $deliveryPhoto, biteshipOrderId: $biteshipOrderId, shippingCost: $shippingCost, biteshipPayload: $biteshipPayload, biteshipResponse: $biteshipResponse, notes: $notes, shippedAt: $shippedAt, deliveredAt: $deliveredAt, cancelledAt: $cancelledAt, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $CustomerShippingCopyWith<$Res>  {
  factory $CustomerShippingCopyWith(CustomerShipping value, $Res Function(CustomerShipping) _then) = _$CustomerShippingCopyWithImpl;
@useResult
$Res call({
 String? id, String? orderId, String? type, String? status, dynamic originAddress, dynamic destinationAddress, String? courier, String? courierCode, String? service, String? serviceCode, String? driverName, String? driverPhone, String? driverVehicleNumber, String? trackingNumber, bool? isInstant, String? pickupPhoto, String? deliveryPhoto, String? biteshipOrderId, num? shippingCost, dynamic biteshipPayload, dynamic biteshipResponse, String? notes, String? shippedAt, String? deliveredAt, String? cancelledAt, String? createdAt, String? updatedAt
});




}
/// @nodoc
class _$CustomerShippingCopyWithImpl<$Res>
    implements $CustomerShippingCopyWith<$Res> {
  _$CustomerShippingCopyWithImpl(this._self, this._then);

  final CustomerShipping _self;
  final $Res Function(CustomerShipping) _then;

/// Create a copy of CustomerShipping
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? orderId = freezed,Object? type = freezed,Object? status = freezed,Object? originAddress = freezed,Object? destinationAddress = freezed,Object? courier = freezed,Object? courierCode = freezed,Object? service = freezed,Object? serviceCode = freezed,Object? driverName = freezed,Object? driverPhone = freezed,Object? driverVehicleNumber = freezed,Object? trackingNumber = freezed,Object? isInstant = freezed,Object? pickupPhoto = freezed,Object? deliveryPhoto = freezed,Object? biteshipOrderId = freezed,Object? shippingCost = freezed,Object? biteshipPayload = freezed,Object? biteshipResponse = freezed,Object? notes = freezed,Object? shippedAt = freezed,Object? deliveredAt = freezed,Object? cancelledAt = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,orderId: freezed == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,originAddress: freezed == originAddress ? _self.originAddress : originAddress // ignore: cast_nullable_to_non_nullable
as dynamic,destinationAddress: freezed == destinationAddress ? _self.destinationAddress : destinationAddress // ignore: cast_nullable_to_non_nullable
as dynamic,courier: freezed == courier ? _self.courier : courier // ignore: cast_nullable_to_non_nullable
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
as dynamic,biteshipResponse: freezed == biteshipResponse ? _self.biteshipResponse : biteshipResponse // ignore: cast_nullable_to_non_nullable
as dynamic,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,shippedAt: freezed == shippedAt ? _self.shippedAt : shippedAt // ignore: cast_nullable_to_non_nullable
as String?,deliveredAt: freezed == deliveredAt ? _self.deliveredAt : deliveredAt // ignore: cast_nullable_to_non_nullable
as String?,cancelledAt: freezed == cancelledAt ? _self.cancelledAt : cancelledAt // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CustomerShipping].
extension CustomerShippingPatterns on CustomerShipping {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CustomerShippingEntity value)?  entity,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CustomerShippingEntity() when entity != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CustomerShippingEntity value)  entity,}){
final _that = this;
switch (_that) {
case CustomerShippingEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CustomerShippingEntity value)?  entity,}){
final _that = this;
switch (_that) {
case CustomerShippingEntity() when entity != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String? id,  String? orderId,  String? type,  String? status,  dynamic originAddress,  dynamic destinationAddress,  String? courier,  String? courierCode,  String? service,  String? serviceCode,  String? driverName,  String? driverPhone,  String? driverVehicleNumber,  String? trackingNumber,  bool? isInstant,  String? pickupPhoto,  String? deliveryPhoto,  String? biteshipOrderId,  num? shippingCost,  dynamic biteshipPayload,  dynamic biteshipResponse,  String? notes,  String? shippedAt,  String? deliveredAt,  String? cancelledAt,  String? createdAt,  String? updatedAt)?  entity,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CustomerShippingEntity() when entity != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String? id,  String? orderId,  String? type,  String? status,  dynamic originAddress,  dynamic destinationAddress,  String? courier,  String? courierCode,  String? service,  String? serviceCode,  String? driverName,  String? driverPhone,  String? driverVehicleNumber,  String? trackingNumber,  bool? isInstant,  String? pickupPhoto,  String? deliveryPhoto,  String? biteshipOrderId,  num? shippingCost,  dynamic biteshipPayload,  dynamic biteshipResponse,  String? notes,  String? shippedAt,  String? deliveredAt,  String? cancelledAt,  String? createdAt,  String? updatedAt)  entity,}) {final _that = this;
switch (_that) {
case CustomerShippingEntity():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String? id,  String? orderId,  String? type,  String? status,  dynamic originAddress,  dynamic destinationAddress,  String? courier,  String? courierCode,  String? service,  String? serviceCode,  String? driverName,  String? driverPhone,  String? driverVehicleNumber,  String? trackingNumber,  bool? isInstant,  String? pickupPhoto,  String? deliveryPhoto,  String? biteshipOrderId,  num? shippingCost,  dynamic biteshipPayload,  dynamic biteshipResponse,  String? notes,  String? shippedAt,  String? deliveredAt,  String? cancelledAt,  String? createdAt,  String? updatedAt)?  entity,}) {final _that = this;
switch (_that) {
case CustomerShippingEntity() when entity != null:
return entity(_that.id,_that.orderId,_that.type,_that.status,_that.originAddress,_that.destinationAddress,_that.courier,_that.courierCode,_that.service,_that.serviceCode,_that.driverName,_that.driverPhone,_that.driverVehicleNumber,_that.trackingNumber,_that.isInstant,_that.pickupPhoto,_that.deliveryPhoto,_that.biteshipOrderId,_that.shippingCost,_that.biteshipPayload,_that.biteshipResponse,_that.notes,_that.shippedAt,_that.deliveredAt,_that.cancelledAt,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class CustomerShippingEntity implements CustomerShipping {
  const CustomerShippingEntity({this.id, this.orderId, this.type, this.status, this.originAddress, this.destinationAddress, this.courier, this.courierCode, this.service, this.serviceCode, this.driverName, this.driverPhone, this.driverVehicleNumber, this.trackingNumber, this.isInstant, this.pickupPhoto, this.deliveryPhoto, this.biteshipOrderId, this.shippingCost, this.biteshipPayload, this.biteshipResponse, this.notes, this.shippedAt, this.deliveredAt, this.cancelledAt, this.createdAt, this.updatedAt});
  factory CustomerShippingEntity.fromJson(Map<String, dynamic> json) => _$CustomerShippingEntityFromJson(json);

@override final  String? id;
@override final  String? orderId;
@override final  String? type;
@override final  String? status;
@override final  dynamic originAddress;
@override final  dynamic destinationAddress;
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
@override final  dynamic biteshipPayload;
@override final  dynamic biteshipResponse;
@override final  String? notes;
@override final  String? shippedAt;
@override final  String? deliveredAt;
@override final  String? cancelledAt;
@override final  String? createdAt;
@override final  String? updatedAt;

/// Create a copy of CustomerShipping
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerShippingEntityCopyWith<CustomerShippingEntity> get copyWith => _$CustomerShippingEntityCopyWithImpl<CustomerShippingEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomerShippingEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerShippingEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.type, type) || other.type == type)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.originAddress, originAddress)&&const DeepCollectionEquality().equals(other.destinationAddress, destinationAddress)&&(identical(other.courier, courier) || other.courier == courier)&&(identical(other.courierCode, courierCode) || other.courierCode == courierCode)&&(identical(other.service, service) || other.service == service)&&(identical(other.serviceCode, serviceCode) || other.serviceCode == serviceCode)&&(identical(other.driverName, driverName) || other.driverName == driverName)&&(identical(other.driverPhone, driverPhone) || other.driverPhone == driverPhone)&&(identical(other.driverVehicleNumber, driverVehicleNumber) || other.driverVehicleNumber == driverVehicleNumber)&&(identical(other.trackingNumber, trackingNumber) || other.trackingNumber == trackingNumber)&&(identical(other.isInstant, isInstant) || other.isInstant == isInstant)&&(identical(other.pickupPhoto, pickupPhoto) || other.pickupPhoto == pickupPhoto)&&(identical(other.deliveryPhoto, deliveryPhoto) || other.deliveryPhoto == deliveryPhoto)&&(identical(other.biteshipOrderId, biteshipOrderId) || other.biteshipOrderId == biteshipOrderId)&&(identical(other.shippingCost, shippingCost) || other.shippingCost == shippingCost)&&const DeepCollectionEquality().equals(other.biteshipPayload, biteshipPayload)&&const DeepCollectionEquality().equals(other.biteshipResponse, biteshipResponse)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.shippedAt, shippedAt) || other.shippedAt == shippedAt)&&(identical(other.deliveredAt, deliveredAt) || other.deliveredAt == deliveredAt)&&(identical(other.cancelledAt, cancelledAt) || other.cancelledAt == cancelledAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,orderId,type,status,const DeepCollectionEquality().hash(originAddress),const DeepCollectionEquality().hash(destinationAddress),courier,courierCode,service,serviceCode,driverName,driverPhone,driverVehicleNumber,trackingNumber,isInstant,pickupPhoto,deliveryPhoto,biteshipOrderId,shippingCost,const DeepCollectionEquality().hash(biteshipPayload),const DeepCollectionEquality().hash(biteshipResponse),notes,shippedAt,deliveredAt,cancelledAt,createdAt,updatedAt]);

@override
String toString() {
  return 'CustomerShipping.entity(id: $id, orderId: $orderId, type: $type, status: $status, originAddress: $originAddress, destinationAddress: $destinationAddress, courier: $courier, courierCode: $courierCode, service: $service, serviceCode: $serviceCode, driverName: $driverName, driverPhone: $driverPhone, driverVehicleNumber: $driverVehicleNumber, trackingNumber: $trackingNumber, isInstant: $isInstant, pickupPhoto: $pickupPhoto, deliveryPhoto: $deliveryPhoto, biteshipOrderId: $biteshipOrderId, shippingCost: $shippingCost, biteshipPayload: $biteshipPayload, biteshipResponse: $biteshipResponse, notes: $notes, shippedAt: $shippedAt, deliveredAt: $deliveredAt, cancelledAt: $cancelledAt, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $CustomerShippingEntityCopyWith<$Res> implements $CustomerShippingCopyWith<$Res> {
  factory $CustomerShippingEntityCopyWith(CustomerShippingEntity value, $Res Function(CustomerShippingEntity) _then) = _$CustomerShippingEntityCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? orderId, String? type, String? status, dynamic originAddress, dynamic destinationAddress, String? courier, String? courierCode, String? service, String? serviceCode, String? driverName, String? driverPhone, String? driverVehicleNumber, String? trackingNumber, bool? isInstant, String? pickupPhoto, String? deliveryPhoto, String? biteshipOrderId, num? shippingCost, dynamic biteshipPayload, dynamic biteshipResponse, String? notes, String? shippedAt, String? deliveredAt, String? cancelledAt, String? createdAt, String? updatedAt
});




}
/// @nodoc
class _$CustomerShippingEntityCopyWithImpl<$Res>
    implements $CustomerShippingEntityCopyWith<$Res> {
  _$CustomerShippingEntityCopyWithImpl(this._self, this._then);

  final CustomerShippingEntity _self;
  final $Res Function(CustomerShippingEntity) _then;

/// Create a copy of CustomerShipping
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? orderId = freezed,Object? type = freezed,Object? status = freezed,Object? originAddress = freezed,Object? destinationAddress = freezed,Object? courier = freezed,Object? courierCode = freezed,Object? service = freezed,Object? serviceCode = freezed,Object? driverName = freezed,Object? driverPhone = freezed,Object? driverVehicleNumber = freezed,Object? trackingNumber = freezed,Object? isInstant = freezed,Object? pickupPhoto = freezed,Object? deliveryPhoto = freezed,Object? biteshipOrderId = freezed,Object? shippingCost = freezed,Object? biteshipPayload = freezed,Object? biteshipResponse = freezed,Object? notes = freezed,Object? shippedAt = freezed,Object? deliveredAt = freezed,Object? cancelledAt = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(CustomerShippingEntity(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,orderId: freezed == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,originAddress: freezed == originAddress ? _self.originAddress : originAddress // ignore: cast_nullable_to_non_nullable
as dynamic,destinationAddress: freezed == destinationAddress ? _self.destinationAddress : destinationAddress // ignore: cast_nullable_to_non_nullable
as dynamic,courier: freezed == courier ? _self.courier : courier // ignore: cast_nullable_to_non_nullable
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
as dynamic,biteshipResponse: freezed == biteshipResponse ? _self.biteshipResponse : biteshipResponse // ignore: cast_nullable_to_non_nullable
as dynamic,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,shippedAt: freezed == shippedAt ? _self.shippedAt : shippedAt // ignore: cast_nullable_to_non_nullable
as String?,deliveredAt: freezed == deliveredAt ? _self.deliveredAt : deliveredAt // ignore: cast_nullable_to_non_nullable
as String?,cancelledAt: freezed == cancelledAt ? _self.cancelledAt : cancelledAt // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
