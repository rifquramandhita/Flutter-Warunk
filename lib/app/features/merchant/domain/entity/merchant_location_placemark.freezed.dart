// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'merchant_location_placemark.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MerchantLocationPlacemark {

 String get province; String get city; String get district; String get postalCode; String get address;
/// Create a copy of MerchantLocationPlacemark
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantLocationPlacemarkCopyWith<MerchantLocationPlacemark> get copyWith => _$MerchantLocationPlacemarkCopyWithImpl<MerchantLocationPlacemark>(this as MerchantLocationPlacemark, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantLocationPlacemark&&(identical(other.province, province) || other.province == province)&&(identical(other.city, city) || other.city == city)&&(identical(other.district, district) || other.district == district)&&(identical(other.postalCode, postalCode) || other.postalCode == postalCode)&&(identical(other.address, address) || other.address == address));
}


@override
int get hashCode => Object.hash(runtimeType,province,city,district,postalCode,address);

@override
String toString() {
  return 'MerchantLocationPlacemark(province: $province, city: $city, district: $district, postalCode: $postalCode, address: $address)';
}


}

/// @nodoc
abstract mixin class $MerchantLocationPlacemarkCopyWith<$Res>  {
  factory $MerchantLocationPlacemarkCopyWith(MerchantLocationPlacemark value, $Res Function(MerchantLocationPlacemark) _then) = _$MerchantLocationPlacemarkCopyWithImpl;
@useResult
$Res call({
 String province, String city, String district, String postalCode, String address
});




}
/// @nodoc
class _$MerchantLocationPlacemarkCopyWithImpl<$Res>
    implements $MerchantLocationPlacemarkCopyWith<$Res> {
  _$MerchantLocationPlacemarkCopyWithImpl(this._self, this._then);

  final MerchantLocationPlacemark _self;
  final $Res Function(MerchantLocationPlacemark) _then;

/// Create a copy of MerchantLocationPlacemark
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? province = null,Object? city = null,Object? district = null,Object? postalCode = null,Object? address = null,}) {
  return _then(_self.copyWith(
province: null == province ? _self.province : province // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,district: null == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as String,postalCode: null == postalCode ? _self.postalCode : postalCode // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MerchantLocationPlacemark].
extension MerchantLocationPlacemarkPatterns on MerchantLocationPlacemark {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MerchantLocationPlacemarkEntity value)?  entity,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MerchantLocationPlacemarkEntity() when entity != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MerchantLocationPlacemarkEntity value)  entity,}){
final _that = this;
switch (_that) {
case MerchantLocationPlacemarkEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MerchantLocationPlacemarkEntity value)?  entity,}){
final _that = this;
switch (_that) {
case MerchantLocationPlacemarkEntity() when entity != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String province,  String city,  String district,  String postalCode,  String address)?  entity,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MerchantLocationPlacemarkEntity() when entity != null:
return entity(_that.province,_that.city,_that.district,_that.postalCode,_that.address);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String province,  String city,  String district,  String postalCode,  String address)  entity,}) {final _that = this;
switch (_that) {
case MerchantLocationPlacemarkEntity():
return entity(_that.province,_that.city,_that.district,_that.postalCode,_that.address);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String province,  String city,  String district,  String postalCode,  String address)?  entity,}) {final _that = this;
switch (_that) {
case MerchantLocationPlacemarkEntity() when entity != null:
return entity(_that.province,_that.city,_that.district,_that.postalCode,_that.address);case _:
  return null;

}
}

}

/// @nodoc


class MerchantLocationPlacemarkEntity implements MerchantLocationPlacemark {
  const MerchantLocationPlacemarkEntity({required this.province, required this.city, required this.district, required this.postalCode, required this.address});
  

@override final  String province;
@override final  String city;
@override final  String district;
@override final  String postalCode;
@override final  String address;

/// Create a copy of MerchantLocationPlacemark
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantLocationPlacemarkEntityCopyWith<MerchantLocationPlacemarkEntity> get copyWith => _$MerchantLocationPlacemarkEntityCopyWithImpl<MerchantLocationPlacemarkEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantLocationPlacemarkEntity&&(identical(other.province, province) || other.province == province)&&(identical(other.city, city) || other.city == city)&&(identical(other.district, district) || other.district == district)&&(identical(other.postalCode, postalCode) || other.postalCode == postalCode)&&(identical(other.address, address) || other.address == address));
}


@override
int get hashCode => Object.hash(runtimeType,province,city,district,postalCode,address);

@override
String toString() {
  return 'MerchantLocationPlacemark.entity(province: $province, city: $city, district: $district, postalCode: $postalCode, address: $address)';
}


}

/// @nodoc
abstract mixin class $MerchantLocationPlacemarkEntityCopyWith<$Res> implements $MerchantLocationPlacemarkCopyWith<$Res> {
  factory $MerchantLocationPlacemarkEntityCopyWith(MerchantLocationPlacemarkEntity value, $Res Function(MerchantLocationPlacemarkEntity) _then) = _$MerchantLocationPlacemarkEntityCopyWithImpl;
@override @useResult
$Res call({
 String province, String city, String district, String postalCode, String address
});




}
/// @nodoc
class _$MerchantLocationPlacemarkEntityCopyWithImpl<$Res>
    implements $MerchantLocationPlacemarkEntityCopyWith<$Res> {
  _$MerchantLocationPlacemarkEntityCopyWithImpl(this._self, this._then);

  final MerchantLocationPlacemarkEntity _self;
  final $Res Function(MerchantLocationPlacemarkEntity) _then;

/// Create a copy of MerchantLocationPlacemark
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? province = null,Object? city = null,Object? district = null,Object? postalCode = null,Object? address = null,}) {
  return _then(MerchantLocationPlacemarkEntity(
province: null == province ? _self.province : province // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,district: null == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as String,postalCode: null == postalCode ? _self.postalCode : postalCode // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
