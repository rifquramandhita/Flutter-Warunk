// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'merchant_order_customer_address.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
MerchantOrderCustomerAddress _$MerchantOrderCustomerAddressFromJson(
  Map<String, dynamic> json
) {
    return MerchantOrderCustomerAddressEntity.fromJson(
      json
    );
}

/// @nodoc
mixin _$MerchantOrderCustomerAddress {

 String? get id; String? get city; String? get label; String? get notes; String? get phone; String? get address; String? get district; String? get latitude; String? get province; String? get longitude; String? get postalCode; String? get recipientName;
/// Create a copy of MerchantOrderCustomerAddress
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantOrderCustomerAddressCopyWith<MerchantOrderCustomerAddress> get copyWith => _$MerchantOrderCustomerAddressCopyWithImpl<MerchantOrderCustomerAddress>(this as MerchantOrderCustomerAddress, _$identity);

  /// Serializes this MerchantOrderCustomerAddress to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantOrderCustomerAddress&&(identical(other.id, id) || other.id == id)&&(identical(other.city, city) || other.city == city)&&(identical(other.label, label) || other.label == label)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.address, address) || other.address == address)&&(identical(other.district, district) || other.district == district)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.province, province) || other.province == province)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.postalCode, postalCode) || other.postalCode == postalCode)&&(identical(other.recipientName, recipientName) || other.recipientName == recipientName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,city,label,notes,phone,address,district,latitude,province,longitude,postalCode,recipientName);

@override
String toString() {
  return 'MerchantOrderCustomerAddress(id: $id, city: $city, label: $label, notes: $notes, phone: $phone, address: $address, district: $district, latitude: $latitude, province: $province, longitude: $longitude, postalCode: $postalCode, recipientName: $recipientName)';
}


}

/// @nodoc
abstract mixin class $MerchantOrderCustomerAddressCopyWith<$Res>  {
  factory $MerchantOrderCustomerAddressCopyWith(MerchantOrderCustomerAddress value, $Res Function(MerchantOrderCustomerAddress) _then) = _$MerchantOrderCustomerAddressCopyWithImpl;
@useResult
$Res call({
 String? id, String? city, String? label, String? notes, String? phone, String? address, String? district, String? latitude, String? province, String? longitude, String? postalCode, String? recipientName
});




}
/// @nodoc
class _$MerchantOrderCustomerAddressCopyWithImpl<$Res>
    implements $MerchantOrderCustomerAddressCopyWith<$Res> {
  _$MerchantOrderCustomerAddressCopyWithImpl(this._self, this._then);

  final MerchantOrderCustomerAddress _self;
  final $Res Function(MerchantOrderCustomerAddress) _then;

/// Create a copy of MerchantOrderCustomerAddress
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? city = freezed,Object? label = freezed,Object? notes = freezed,Object? phone = freezed,Object? address = freezed,Object? district = freezed,Object? latitude = freezed,Object? province = freezed,Object? longitude = freezed,Object? postalCode = freezed,Object? recipientName = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,district: freezed == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as String?,province: freezed == province ? _self.province : province // ignore: cast_nullable_to_non_nullable
as String?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as String?,postalCode: freezed == postalCode ? _self.postalCode : postalCode // ignore: cast_nullable_to_non_nullable
as String?,recipientName: freezed == recipientName ? _self.recipientName : recipientName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MerchantOrderCustomerAddress].
extension MerchantOrderCustomerAddressPatterns on MerchantOrderCustomerAddress {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MerchantOrderCustomerAddressEntity value)?  entity,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MerchantOrderCustomerAddressEntity() when entity != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MerchantOrderCustomerAddressEntity value)  entity,}){
final _that = this;
switch (_that) {
case MerchantOrderCustomerAddressEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MerchantOrderCustomerAddressEntity value)?  entity,}){
final _that = this;
switch (_that) {
case MerchantOrderCustomerAddressEntity() when entity != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String? id,  String? city,  String? label,  String? notes,  String? phone,  String? address,  String? district,  String? latitude,  String? province,  String? longitude,  String? postalCode,  String? recipientName)?  entity,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MerchantOrderCustomerAddressEntity() when entity != null:
return entity(_that.id,_that.city,_that.label,_that.notes,_that.phone,_that.address,_that.district,_that.latitude,_that.province,_that.longitude,_that.postalCode,_that.recipientName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String? id,  String? city,  String? label,  String? notes,  String? phone,  String? address,  String? district,  String? latitude,  String? province,  String? longitude,  String? postalCode,  String? recipientName)  entity,}) {final _that = this;
switch (_that) {
case MerchantOrderCustomerAddressEntity():
return entity(_that.id,_that.city,_that.label,_that.notes,_that.phone,_that.address,_that.district,_that.latitude,_that.province,_that.longitude,_that.postalCode,_that.recipientName);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String? id,  String? city,  String? label,  String? notes,  String? phone,  String? address,  String? district,  String? latitude,  String? province,  String? longitude,  String? postalCode,  String? recipientName)?  entity,}) {final _that = this;
switch (_that) {
case MerchantOrderCustomerAddressEntity() when entity != null:
return entity(_that.id,_that.city,_that.label,_that.notes,_that.phone,_that.address,_that.district,_that.latitude,_that.province,_that.longitude,_that.postalCode,_that.recipientName);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class MerchantOrderCustomerAddressEntity implements MerchantOrderCustomerAddress {
  const MerchantOrderCustomerAddressEntity({this.id, this.city, this.label, this.notes, this.phone, this.address, this.district, this.latitude, this.province, this.longitude, this.postalCode, this.recipientName});
  factory MerchantOrderCustomerAddressEntity.fromJson(Map<String, dynamic> json) => _$MerchantOrderCustomerAddressEntityFromJson(json);

@override final  String? id;
@override final  String? city;
@override final  String? label;
@override final  String? notes;
@override final  String? phone;
@override final  String? address;
@override final  String? district;
@override final  String? latitude;
@override final  String? province;
@override final  String? longitude;
@override final  String? postalCode;
@override final  String? recipientName;

/// Create a copy of MerchantOrderCustomerAddress
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantOrderCustomerAddressEntityCopyWith<MerchantOrderCustomerAddressEntity> get copyWith => _$MerchantOrderCustomerAddressEntityCopyWithImpl<MerchantOrderCustomerAddressEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MerchantOrderCustomerAddressEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantOrderCustomerAddressEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.city, city) || other.city == city)&&(identical(other.label, label) || other.label == label)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.address, address) || other.address == address)&&(identical(other.district, district) || other.district == district)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.province, province) || other.province == province)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.postalCode, postalCode) || other.postalCode == postalCode)&&(identical(other.recipientName, recipientName) || other.recipientName == recipientName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,city,label,notes,phone,address,district,latitude,province,longitude,postalCode,recipientName);

@override
String toString() {
  return 'MerchantOrderCustomerAddress.entity(id: $id, city: $city, label: $label, notes: $notes, phone: $phone, address: $address, district: $district, latitude: $latitude, province: $province, longitude: $longitude, postalCode: $postalCode, recipientName: $recipientName)';
}


}

/// @nodoc
abstract mixin class $MerchantOrderCustomerAddressEntityCopyWith<$Res> implements $MerchantOrderCustomerAddressCopyWith<$Res> {
  factory $MerchantOrderCustomerAddressEntityCopyWith(MerchantOrderCustomerAddressEntity value, $Res Function(MerchantOrderCustomerAddressEntity) _then) = _$MerchantOrderCustomerAddressEntityCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? city, String? label, String? notes, String? phone, String? address, String? district, String? latitude, String? province, String? longitude, String? postalCode, String? recipientName
});




}
/// @nodoc
class _$MerchantOrderCustomerAddressEntityCopyWithImpl<$Res>
    implements $MerchantOrderCustomerAddressEntityCopyWith<$Res> {
  _$MerchantOrderCustomerAddressEntityCopyWithImpl(this._self, this._then);

  final MerchantOrderCustomerAddressEntity _self;
  final $Res Function(MerchantOrderCustomerAddressEntity) _then;

/// Create a copy of MerchantOrderCustomerAddress
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? city = freezed,Object? label = freezed,Object? notes = freezed,Object? phone = freezed,Object? address = freezed,Object? district = freezed,Object? latitude = freezed,Object? province = freezed,Object? longitude = freezed,Object? postalCode = freezed,Object? recipientName = freezed,}) {
  return _then(MerchantOrderCustomerAddressEntity(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,district: freezed == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as String?,province: freezed == province ? _self.province : province // ignore: cast_nullable_to_non_nullable
as String?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as String?,postalCode: freezed == postalCode ? _self.postalCode : postalCode // ignore: cast_nullable_to_non_nullable
as String?,recipientName: freezed == recipientName ? _self.recipientName : recipientName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
