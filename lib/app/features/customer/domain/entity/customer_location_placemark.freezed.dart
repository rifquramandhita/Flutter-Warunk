// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_location_placemark.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CustomerLocationPlacemark {

 String get province; String get city; String get district; String get postalCode; String get address;
/// Create a copy of CustomerLocationPlacemark
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerLocationPlacemarkCopyWith<CustomerLocationPlacemark> get copyWith => _$CustomerLocationPlacemarkCopyWithImpl<CustomerLocationPlacemark>(this as CustomerLocationPlacemark, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerLocationPlacemark&&(identical(other.province, province) || other.province == province)&&(identical(other.city, city) || other.city == city)&&(identical(other.district, district) || other.district == district)&&(identical(other.postalCode, postalCode) || other.postalCode == postalCode)&&(identical(other.address, address) || other.address == address));
}


@override
int get hashCode => Object.hash(runtimeType,province,city,district,postalCode,address);

@override
String toString() {
  return 'CustomerLocationPlacemark(province: $province, city: $city, district: $district, postalCode: $postalCode, address: $address)';
}


}

/// @nodoc
abstract mixin class $CustomerLocationPlacemarkCopyWith<$Res>  {
  factory $CustomerLocationPlacemarkCopyWith(CustomerLocationPlacemark value, $Res Function(CustomerLocationPlacemark) _then) = _$CustomerLocationPlacemarkCopyWithImpl;
@useResult
$Res call({
 String province, String city, String district, String postalCode, String address
});




}
/// @nodoc
class _$CustomerLocationPlacemarkCopyWithImpl<$Res>
    implements $CustomerLocationPlacemarkCopyWith<$Res> {
  _$CustomerLocationPlacemarkCopyWithImpl(this._self, this._then);

  final CustomerLocationPlacemark _self;
  final $Res Function(CustomerLocationPlacemark) _then;

/// Create a copy of CustomerLocationPlacemark
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


/// Adds pattern-matching-related methods to [CustomerLocationPlacemark].
extension CustomerLocationPlacemarkPatterns on CustomerLocationPlacemark {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CustomerLocationPlacemarkEntity value)?  entity,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CustomerLocationPlacemarkEntity() when entity != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CustomerLocationPlacemarkEntity value)  entity,}){
final _that = this;
switch (_that) {
case CustomerLocationPlacemarkEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CustomerLocationPlacemarkEntity value)?  entity,}){
final _that = this;
switch (_that) {
case CustomerLocationPlacemarkEntity() when entity != null:
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
case CustomerLocationPlacemarkEntity() when entity != null:
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
case CustomerLocationPlacemarkEntity():
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
case CustomerLocationPlacemarkEntity() when entity != null:
return entity(_that.province,_that.city,_that.district,_that.postalCode,_that.address);case _:
  return null;

}
}

}

/// @nodoc


class CustomerLocationPlacemarkEntity implements CustomerLocationPlacemark {
  const CustomerLocationPlacemarkEntity({required this.province, required this.city, required this.district, required this.postalCode, required this.address});
  

@override final  String province;
@override final  String city;
@override final  String district;
@override final  String postalCode;
@override final  String address;

/// Create a copy of CustomerLocationPlacemark
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerLocationPlacemarkEntityCopyWith<CustomerLocationPlacemarkEntity> get copyWith => _$CustomerLocationPlacemarkEntityCopyWithImpl<CustomerLocationPlacemarkEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerLocationPlacemarkEntity&&(identical(other.province, province) || other.province == province)&&(identical(other.city, city) || other.city == city)&&(identical(other.district, district) || other.district == district)&&(identical(other.postalCode, postalCode) || other.postalCode == postalCode)&&(identical(other.address, address) || other.address == address));
}


@override
int get hashCode => Object.hash(runtimeType,province,city,district,postalCode,address);

@override
String toString() {
  return 'CustomerLocationPlacemark.entity(province: $province, city: $city, district: $district, postalCode: $postalCode, address: $address)';
}


}

/// @nodoc
abstract mixin class $CustomerLocationPlacemarkEntityCopyWith<$Res> implements $CustomerLocationPlacemarkCopyWith<$Res> {
  factory $CustomerLocationPlacemarkEntityCopyWith(CustomerLocationPlacemarkEntity value, $Res Function(CustomerLocationPlacemarkEntity) _then) = _$CustomerLocationPlacemarkEntityCopyWithImpl;
@override @useResult
$Res call({
 String province, String city, String district, String postalCode, String address
});




}
/// @nodoc
class _$CustomerLocationPlacemarkEntityCopyWithImpl<$Res>
    implements $CustomerLocationPlacemarkEntityCopyWith<$Res> {
  _$CustomerLocationPlacemarkEntityCopyWithImpl(this._self, this._then);

  final CustomerLocationPlacemarkEntity _self;
  final $Res Function(CustomerLocationPlacemarkEntity) _then;

/// Create a copy of CustomerLocationPlacemark
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? province = null,Object? city = null,Object? district = null,Object? postalCode = null,Object? address = null,}) {
  return _then(CustomerLocationPlacemarkEntity(
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
