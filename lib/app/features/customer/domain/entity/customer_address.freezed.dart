// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_address.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
CustomerAddress _$CustomerAddressFromJson(
  Map<String, dynamic> json
) {
    return CustomerAddressEntity.fromJson(
      json
    );
}

/// @nodoc
mixin _$CustomerAddress {

 String get id; int get userId; String get recipientName; String get phone; String get label; String get address; String get province; String get city; String get district; String get postalCode; double get longitude; double get latitude; String? get notes; bool get isDefault; String get fullAddress; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of CustomerAddress
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerAddressCopyWith<CustomerAddress> get copyWith => _$CustomerAddressCopyWithImpl<CustomerAddress>(this as CustomerAddress, _$identity);

  /// Serializes this CustomerAddress to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerAddress&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.recipientName, recipientName) || other.recipientName == recipientName)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.label, label) || other.label == label)&&(identical(other.address, address) || other.address == address)&&(identical(other.province, province) || other.province == province)&&(identical(other.city, city) || other.city == city)&&(identical(other.district, district) || other.district == district)&&(identical(other.postalCode, postalCode) || other.postalCode == postalCode)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.isDefault, isDefault) || other.isDefault == isDefault)&&(identical(other.fullAddress, fullAddress) || other.fullAddress == fullAddress)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,recipientName,phone,label,address,province,city,district,postalCode,longitude,latitude,notes,isDefault,fullAddress,createdAt,updatedAt);

@override
String toString() {
  return 'CustomerAddress(id: $id, userId: $userId, recipientName: $recipientName, phone: $phone, label: $label, address: $address, province: $province, city: $city, district: $district, postalCode: $postalCode, longitude: $longitude, latitude: $latitude, notes: $notes, isDefault: $isDefault, fullAddress: $fullAddress, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $CustomerAddressCopyWith<$Res>  {
  factory $CustomerAddressCopyWith(CustomerAddress value, $Res Function(CustomerAddress) _then) = _$CustomerAddressCopyWithImpl;
@useResult
$Res call({
 String id, int userId, String recipientName, String phone, String label, String address, String province, String city, String district, String postalCode, double longitude, double latitude, String? notes, bool isDefault, String fullAddress, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$CustomerAddressCopyWithImpl<$Res>
    implements $CustomerAddressCopyWith<$Res> {
  _$CustomerAddressCopyWithImpl(this._self, this._then);

  final CustomerAddress _self;
  final $Res Function(CustomerAddress) _then;

/// Create a copy of CustomerAddress
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? recipientName = null,Object? phone = null,Object? label = null,Object? address = null,Object? province = null,Object? city = null,Object? district = null,Object? postalCode = null,Object? longitude = null,Object? latitude = null,Object? notes = freezed,Object? isDefault = null,Object? fullAddress = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,recipientName: null == recipientName ? _self.recipientName : recipientName // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,province: null == province ? _self.province : province // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,district: null == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as String,postalCode: null == postalCode ? _self.postalCode : postalCode // ignore: cast_nullable_to_non_nullable
as String,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,isDefault: null == isDefault ? _self.isDefault : isDefault // ignore: cast_nullable_to_non_nullable
as bool,fullAddress: null == fullAddress ? _self.fullAddress : fullAddress // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [CustomerAddress].
extension CustomerAddressPatterns on CustomerAddress {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CustomerAddressEntity value)?  entity,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CustomerAddressEntity() when entity != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CustomerAddressEntity value)  entity,}){
final _that = this;
switch (_that) {
case CustomerAddressEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CustomerAddressEntity value)?  entity,}){
final _that = this;
switch (_that) {
case CustomerAddressEntity() when entity != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String id,  int userId,  String recipientName,  String phone,  String label,  String address,  String province,  String city,  String district,  String postalCode,  double longitude,  double latitude,  String? notes,  bool isDefault,  String fullAddress,  DateTime createdAt,  DateTime updatedAt)?  entity,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CustomerAddressEntity() when entity != null:
return entity(_that.id,_that.userId,_that.recipientName,_that.phone,_that.label,_that.address,_that.province,_that.city,_that.district,_that.postalCode,_that.longitude,_that.latitude,_that.notes,_that.isDefault,_that.fullAddress,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String id,  int userId,  String recipientName,  String phone,  String label,  String address,  String province,  String city,  String district,  String postalCode,  double longitude,  double latitude,  String? notes,  bool isDefault,  String fullAddress,  DateTime createdAt,  DateTime updatedAt)  entity,}) {final _that = this;
switch (_that) {
case CustomerAddressEntity():
return entity(_that.id,_that.userId,_that.recipientName,_that.phone,_that.label,_that.address,_that.province,_that.city,_that.district,_that.postalCode,_that.longitude,_that.latitude,_that.notes,_that.isDefault,_that.fullAddress,_that.createdAt,_that.updatedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String id,  int userId,  String recipientName,  String phone,  String label,  String address,  String province,  String city,  String district,  String postalCode,  double longitude,  double latitude,  String? notes,  bool isDefault,  String fullAddress,  DateTime createdAt,  DateTime updatedAt)?  entity,}) {final _that = this;
switch (_that) {
case CustomerAddressEntity() when entity != null:
return entity(_that.id,_that.userId,_that.recipientName,_that.phone,_that.label,_that.address,_that.province,_that.city,_that.district,_that.postalCode,_that.longitude,_that.latitude,_that.notes,_that.isDefault,_that.fullAddress,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class CustomerAddressEntity implements CustomerAddress {
  const CustomerAddressEntity({required this.id, required this.userId, required this.recipientName, required this.phone, required this.label, required this.address, required this.province, required this.city, required this.district, required this.postalCode, required this.longitude, required this.latitude, this.notes, required this.isDefault, required this.fullAddress, required this.createdAt, required this.updatedAt});
  factory CustomerAddressEntity.fromJson(Map<String, dynamic> json) => _$CustomerAddressEntityFromJson(json);

@override final  String id;
@override final  int userId;
@override final  String recipientName;
@override final  String phone;
@override final  String label;
@override final  String address;
@override final  String province;
@override final  String city;
@override final  String district;
@override final  String postalCode;
@override final  double longitude;
@override final  double latitude;
@override final  String? notes;
@override final  bool isDefault;
@override final  String fullAddress;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of CustomerAddress
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerAddressEntityCopyWith<CustomerAddressEntity> get copyWith => _$CustomerAddressEntityCopyWithImpl<CustomerAddressEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomerAddressEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerAddressEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.recipientName, recipientName) || other.recipientName == recipientName)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.label, label) || other.label == label)&&(identical(other.address, address) || other.address == address)&&(identical(other.province, province) || other.province == province)&&(identical(other.city, city) || other.city == city)&&(identical(other.district, district) || other.district == district)&&(identical(other.postalCode, postalCode) || other.postalCode == postalCode)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.isDefault, isDefault) || other.isDefault == isDefault)&&(identical(other.fullAddress, fullAddress) || other.fullAddress == fullAddress)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,recipientName,phone,label,address,province,city,district,postalCode,longitude,latitude,notes,isDefault,fullAddress,createdAt,updatedAt);

@override
String toString() {
  return 'CustomerAddress.entity(id: $id, userId: $userId, recipientName: $recipientName, phone: $phone, label: $label, address: $address, province: $province, city: $city, district: $district, postalCode: $postalCode, longitude: $longitude, latitude: $latitude, notes: $notes, isDefault: $isDefault, fullAddress: $fullAddress, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $CustomerAddressEntityCopyWith<$Res> implements $CustomerAddressCopyWith<$Res> {
  factory $CustomerAddressEntityCopyWith(CustomerAddressEntity value, $Res Function(CustomerAddressEntity) _then) = _$CustomerAddressEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, int userId, String recipientName, String phone, String label, String address, String province, String city, String district, String postalCode, double longitude, double latitude, String? notes, bool isDefault, String fullAddress, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$CustomerAddressEntityCopyWithImpl<$Res>
    implements $CustomerAddressEntityCopyWith<$Res> {
  _$CustomerAddressEntityCopyWithImpl(this._self, this._then);

  final CustomerAddressEntity _self;
  final $Res Function(CustomerAddressEntity) _then;

/// Create a copy of CustomerAddress
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? recipientName = null,Object? phone = null,Object? label = null,Object? address = null,Object? province = null,Object? city = null,Object? district = null,Object? postalCode = null,Object? longitude = null,Object? latitude = null,Object? notes = freezed,Object? isDefault = null,Object? fullAddress = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(CustomerAddressEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,recipientName: null == recipientName ? _self.recipientName : recipientName // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,province: null == province ? _self.province : province // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,district: null == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as String,postalCode: null == postalCode ? _self.postalCode : postalCode // ignore: cast_nullable_to_non_nullable
as String,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,isDefault: null == isDefault ? _self.isDefault : isDefault // ignore: cast_nullable_to_non_nullable
as bool,fullAddress: null == fullAddress ? _self.fullAddress : fullAddress // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
