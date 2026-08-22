// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sales_merchant.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SalesMerchantEntity {

 String get id; String get name; String get slug;@JsonKey(name: 'whatsapp_number') String? get whatsappNumber; String get address;@JsonKey(name: 'district_id') int get districtId; String get province; String get city; String get district; String? get photo;@JsonKey(name: 'sales_id') int? get salesId;@JsonKey(name: 'sales_name') String? get salesName;@JsonKey(name: 'is_claimed') bool get isClaimed;@JsonKey(name: 'is_claimed_by_me') bool get isClaimedByMe;@JsonKey(name: 'can_login_as_merchant') bool get canLoginAsMerchant;@JsonKey(name: 'created_at') DateTime get createdAt;
/// Create a copy of SalesMerchantEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SalesMerchantEntityCopyWith<SalesMerchantEntity> get copyWith => _$SalesMerchantEntityCopyWithImpl<SalesMerchantEntity>(this as SalesMerchantEntity, _$identity);

  /// Serializes this SalesMerchantEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SalesMerchantEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.whatsappNumber, whatsappNumber) || other.whatsappNumber == whatsappNumber)&&(identical(other.address, address) || other.address == address)&&(identical(other.districtId, districtId) || other.districtId == districtId)&&(identical(other.province, province) || other.province == province)&&(identical(other.city, city) || other.city == city)&&(identical(other.district, district) || other.district == district)&&(identical(other.photo, photo) || other.photo == photo)&&(identical(other.salesId, salesId) || other.salesId == salesId)&&(identical(other.salesName, salesName) || other.salesName == salesName)&&(identical(other.isClaimed, isClaimed) || other.isClaimed == isClaimed)&&(identical(other.isClaimedByMe, isClaimedByMe) || other.isClaimedByMe == isClaimedByMe)&&(identical(other.canLoginAsMerchant, canLoginAsMerchant) || other.canLoginAsMerchant == canLoginAsMerchant)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,slug,whatsappNumber,address,districtId,province,city,district,photo,salesId,salesName,isClaimed,isClaimedByMe,canLoginAsMerchant,createdAt);

@override
String toString() {
  return 'SalesMerchantEntity(id: $id, name: $name, slug: $slug, whatsappNumber: $whatsappNumber, address: $address, districtId: $districtId, province: $province, city: $city, district: $district, photo: $photo, salesId: $salesId, salesName: $salesName, isClaimed: $isClaimed, isClaimedByMe: $isClaimedByMe, canLoginAsMerchant: $canLoginAsMerchant, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $SalesMerchantEntityCopyWith<$Res>  {
  factory $SalesMerchantEntityCopyWith(SalesMerchantEntity value, $Res Function(SalesMerchantEntity) _then) = _$SalesMerchantEntityCopyWithImpl;
@useResult
$Res call({
 String id, String name, String slug,@JsonKey(name: 'whatsapp_number') String? whatsappNumber, String address,@JsonKey(name: 'district_id') int districtId, String province, String city, String district, String? photo,@JsonKey(name: 'sales_id') int? salesId,@JsonKey(name: 'sales_name') String? salesName,@JsonKey(name: 'is_claimed') bool isClaimed,@JsonKey(name: 'is_claimed_by_me') bool isClaimedByMe,@JsonKey(name: 'can_login_as_merchant') bool canLoginAsMerchant,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class _$SalesMerchantEntityCopyWithImpl<$Res>
    implements $SalesMerchantEntityCopyWith<$Res> {
  _$SalesMerchantEntityCopyWithImpl(this._self, this._then);

  final SalesMerchantEntity _self;
  final $Res Function(SalesMerchantEntity) _then;

/// Create a copy of SalesMerchantEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? slug = null,Object? whatsappNumber = freezed,Object? address = null,Object? districtId = null,Object? province = null,Object? city = null,Object? district = null,Object? photo = freezed,Object? salesId = freezed,Object? salesName = freezed,Object? isClaimed = null,Object? isClaimedByMe = null,Object? canLoginAsMerchant = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,whatsappNumber: freezed == whatsappNumber ? _self.whatsappNumber : whatsappNumber // ignore: cast_nullable_to_non_nullable
as String?,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,districtId: null == districtId ? _self.districtId : districtId // ignore: cast_nullable_to_non_nullable
as int,province: null == province ? _self.province : province // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,district: null == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as String,photo: freezed == photo ? _self.photo : photo // ignore: cast_nullable_to_non_nullable
as String?,salesId: freezed == salesId ? _self.salesId : salesId // ignore: cast_nullable_to_non_nullable
as int?,salesName: freezed == salesName ? _self.salesName : salesName // ignore: cast_nullable_to_non_nullable
as String?,isClaimed: null == isClaimed ? _self.isClaimed : isClaimed // ignore: cast_nullable_to_non_nullable
as bool,isClaimedByMe: null == isClaimedByMe ? _self.isClaimedByMe : isClaimedByMe // ignore: cast_nullable_to_non_nullable
as bool,canLoginAsMerchant: null == canLoginAsMerchant ? _self.canLoginAsMerchant : canLoginAsMerchant // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [SalesMerchantEntity].
extension SalesMerchantEntityPatterns on SalesMerchantEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SalesMerchantEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SalesMerchantEntity() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SalesMerchantEntity value)  $default,){
final _that = this;
switch (_that) {
case _SalesMerchantEntity():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SalesMerchantEntity value)?  $default,){
final _that = this;
switch (_that) {
case _SalesMerchantEntity() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String slug, @JsonKey(name: 'whatsapp_number')  String? whatsappNumber,  String address, @JsonKey(name: 'district_id')  int districtId,  String province,  String city,  String district,  String? photo, @JsonKey(name: 'sales_id')  int? salesId, @JsonKey(name: 'sales_name')  String? salesName, @JsonKey(name: 'is_claimed')  bool isClaimed, @JsonKey(name: 'is_claimed_by_me')  bool isClaimedByMe, @JsonKey(name: 'can_login_as_merchant')  bool canLoginAsMerchant, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SalesMerchantEntity() when $default != null:
return $default(_that.id,_that.name,_that.slug,_that.whatsappNumber,_that.address,_that.districtId,_that.province,_that.city,_that.district,_that.photo,_that.salesId,_that.salesName,_that.isClaimed,_that.isClaimedByMe,_that.canLoginAsMerchant,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String slug, @JsonKey(name: 'whatsapp_number')  String? whatsappNumber,  String address, @JsonKey(name: 'district_id')  int districtId,  String province,  String city,  String district,  String? photo, @JsonKey(name: 'sales_id')  int? salesId, @JsonKey(name: 'sales_name')  String? salesName, @JsonKey(name: 'is_claimed')  bool isClaimed, @JsonKey(name: 'is_claimed_by_me')  bool isClaimedByMe, @JsonKey(name: 'can_login_as_merchant')  bool canLoginAsMerchant, @JsonKey(name: 'created_at')  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _SalesMerchantEntity():
return $default(_that.id,_that.name,_that.slug,_that.whatsappNumber,_that.address,_that.districtId,_that.province,_that.city,_that.district,_that.photo,_that.salesId,_that.salesName,_that.isClaimed,_that.isClaimedByMe,_that.canLoginAsMerchant,_that.createdAt);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String slug, @JsonKey(name: 'whatsapp_number')  String? whatsappNumber,  String address, @JsonKey(name: 'district_id')  int districtId,  String province,  String city,  String district,  String? photo, @JsonKey(name: 'sales_id')  int? salesId, @JsonKey(name: 'sales_name')  String? salesName, @JsonKey(name: 'is_claimed')  bool isClaimed, @JsonKey(name: 'is_claimed_by_me')  bool isClaimedByMe, @JsonKey(name: 'can_login_as_merchant')  bool canLoginAsMerchant, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _SalesMerchantEntity() when $default != null:
return $default(_that.id,_that.name,_that.slug,_that.whatsappNumber,_that.address,_that.districtId,_that.province,_that.city,_that.district,_that.photo,_that.salesId,_that.salesName,_that.isClaimed,_that.isClaimedByMe,_that.canLoginAsMerchant,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SalesMerchantEntity implements SalesMerchantEntity {
  const _SalesMerchantEntity({required this.id, required this.name, required this.slug, @JsonKey(name: 'whatsapp_number') this.whatsappNumber, required this.address, @JsonKey(name: 'district_id') required this.districtId, required this.province, required this.city, required this.district, this.photo, @JsonKey(name: 'sales_id') this.salesId, @JsonKey(name: 'sales_name') this.salesName, @JsonKey(name: 'is_claimed') required this.isClaimed, @JsonKey(name: 'is_claimed_by_me') required this.isClaimedByMe, @JsonKey(name: 'can_login_as_merchant') required this.canLoginAsMerchant, @JsonKey(name: 'created_at') required this.createdAt});
  factory _SalesMerchantEntity.fromJson(Map<String, dynamic> json) => _$SalesMerchantEntityFromJson(json);

@override final  String id;
@override final  String name;
@override final  String slug;
@override@JsonKey(name: 'whatsapp_number') final  String? whatsappNumber;
@override final  String address;
@override@JsonKey(name: 'district_id') final  int districtId;
@override final  String province;
@override final  String city;
@override final  String district;
@override final  String? photo;
@override@JsonKey(name: 'sales_id') final  int? salesId;
@override@JsonKey(name: 'sales_name') final  String? salesName;
@override@JsonKey(name: 'is_claimed') final  bool isClaimed;
@override@JsonKey(name: 'is_claimed_by_me') final  bool isClaimedByMe;
@override@JsonKey(name: 'can_login_as_merchant') final  bool canLoginAsMerchant;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;

/// Create a copy of SalesMerchantEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SalesMerchantEntityCopyWith<_SalesMerchantEntity> get copyWith => __$SalesMerchantEntityCopyWithImpl<_SalesMerchantEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SalesMerchantEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SalesMerchantEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.whatsappNumber, whatsappNumber) || other.whatsappNumber == whatsappNumber)&&(identical(other.address, address) || other.address == address)&&(identical(other.districtId, districtId) || other.districtId == districtId)&&(identical(other.province, province) || other.province == province)&&(identical(other.city, city) || other.city == city)&&(identical(other.district, district) || other.district == district)&&(identical(other.photo, photo) || other.photo == photo)&&(identical(other.salesId, salesId) || other.salesId == salesId)&&(identical(other.salesName, salesName) || other.salesName == salesName)&&(identical(other.isClaimed, isClaimed) || other.isClaimed == isClaimed)&&(identical(other.isClaimedByMe, isClaimedByMe) || other.isClaimedByMe == isClaimedByMe)&&(identical(other.canLoginAsMerchant, canLoginAsMerchant) || other.canLoginAsMerchant == canLoginAsMerchant)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,slug,whatsappNumber,address,districtId,province,city,district,photo,salesId,salesName,isClaimed,isClaimedByMe,canLoginAsMerchant,createdAt);

@override
String toString() {
  return 'SalesMerchantEntity(id: $id, name: $name, slug: $slug, whatsappNumber: $whatsappNumber, address: $address, districtId: $districtId, province: $province, city: $city, district: $district, photo: $photo, salesId: $salesId, salesName: $salesName, isClaimed: $isClaimed, isClaimedByMe: $isClaimedByMe, canLoginAsMerchant: $canLoginAsMerchant, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$SalesMerchantEntityCopyWith<$Res> implements $SalesMerchantEntityCopyWith<$Res> {
  factory _$SalesMerchantEntityCopyWith(_SalesMerchantEntity value, $Res Function(_SalesMerchantEntity) _then) = __$SalesMerchantEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String slug,@JsonKey(name: 'whatsapp_number') String? whatsappNumber, String address,@JsonKey(name: 'district_id') int districtId, String province, String city, String district, String? photo,@JsonKey(name: 'sales_id') int? salesId,@JsonKey(name: 'sales_name') String? salesName,@JsonKey(name: 'is_claimed') bool isClaimed,@JsonKey(name: 'is_claimed_by_me') bool isClaimedByMe,@JsonKey(name: 'can_login_as_merchant') bool canLoginAsMerchant,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class __$SalesMerchantEntityCopyWithImpl<$Res>
    implements _$SalesMerchantEntityCopyWith<$Res> {
  __$SalesMerchantEntityCopyWithImpl(this._self, this._then);

  final _SalesMerchantEntity _self;
  final $Res Function(_SalesMerchantEntity) _then;

/// Create a copy of SalesMerchantEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? slug = null,Object? whatsappNumber = freezed,Object? address = null,Object? districtId = null,Object? province = null,Object? city = null,Object? district = null,Object? photo = freezed,Object? salesId = freezed,Object? salesName = freezed,Object? isClaimed = null,Object? isClaimedByMe = null,Object? canLoginAsMerchant = null,Object? createdAt = null,}) {
  return _then(_SalesMerchantEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,whatsappNumber: freezed == whatsappNumber ? _self.whatsappNumber : whatsappNumber // ignore: cast_nullable_to_non_nullable
as String?,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,districtId: null == districtId ? _self.districtId : districtId // ignore: cast_nullable_to_non_nullable
as int,province: null == province ? _self.province : province // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,district: null == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as String,photo: freezed == photo ? _self.photo : photo // ignore: cast_nullable_to_non_nullable
as String?,salesId: freezed == salesId ? _self.salesId : salesId // ignore: cast_nullable_to_non_nullable
as int?,salesName: freezed == salesName ? _self.salesName : salesName // ignore: cast_nullable_to_non_nullable
as String?,isClaimed: null == isClaimed ? _self.isClaimed : isClaimed // ignore: cast_nullable_to_non_nullable
as bool,isClaimedByMe: null == isClaimedByMe ? _self.isClaimedByMe : isClaimedByMe // ignore: cast_nullable_to_non_nullable
as bool,canLoginAsMerchant: null == canLoginAsMerchant ? _self.canLoginAsMerchant : canLoginAsMerchant // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$SalesMerchantResponseEntity {

 List<SalesMerchantEntity> get merchants; Map<String, dynamic>? get pagination;
/// Create a copy of SalesMerchantResponseEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SalesMerchantResponseEntityCopyWith<SalesMerchantResponseEntity> get copyWith => _$SalesMerchantResponseEntityCopyWithImpl<SalesMerchantResponseEntity>(this as SalesMerchantResponseEntity, _$identity);

  /// Serializes this SalesMerchantResponseEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SalesMerchantResponseEntity&&const DeepCollectionEquality().equals(other.merchants, merchants)&&const DeepCollectionEquality().equals(other.pagination, pagination));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(merchants),const DeepCollectionEquality().hash(pagination));

@override
String toString() {
  return 'SalesMerchantResponseEntity(merchants: $merchants, pagination: $pagination)';
}


}

/// @nodoc
abstract mixin class $SalesMerchantResponseEntityCopyWith<$Res>  {
  factory $SalesMerchantResponseEntityCopyWith(SalesMerchantResponseEntity value, $Res Function(SalesMerchantResponseEntity) _then) = _$SalesMerchantResponseEntityCopyWithImpl;
@useResult
$Res call({
 List<SalesMerchantEntity> merchants, Map<String, dynamic>? pagination
});




}
/// @nodoc
class _$SalesMerchantResponseEntityCopyWithImpl<$Res>
    implements $SalesMerchantResponseEntityCopyWith<$Res> {
  _$SalesMerchantResponseEntityCopyWithImpl(this._self, this._then);

  final SalesMerchantResponseEntity _self;
  final $Res Function(SalesMerchantResponseEntity) _then;

/// Create a copy of SalesMerchantResponseEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? merchants = null,Object? pagination = freezed,}) {
  return _then(_self.copyWith(
merchants: null == merchants ? _self.merchants : merchants // ignore: cast_nullable_to_non_nullable
as List<SalesMerchantEntity>,pagination: freezed == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [SalesMerchantResponseEntity].
extension SalesMerchantResponseEntityPatterns on SalesMerchantResponseEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SalesMerchantResponseEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SalesMerchantResponseEntity() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SalesMerchantResponseEntity value)  $default,){
final _that = this;
switch (_that) {
case _SalesMerchantResponseEntity():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SalesMerchantResponseEntity value)?  $default,){
final _that = this;
switch (_that) {
case _SalesMerchantResponseEntity() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<SalesMerchantEntity> merchants,  Map<String, dynamic>? pagination)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SalesMerchantResponseEntity() when $default != null:
return $default(_that.merchants,_that.pagination);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<SalesMerchantEntity> merchants,  Map<String, dynamic>? pagination)  $default,) {final _that = this;
switch (_that) {
case _SalesMerchantResponseEntity():
return $default(_that.merchants,_that.pagination);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<SalesMerchantEntity> merchants,  Map<String, dynamic>? pagination)?  $default,) {final _that = this;
switch (_that) {
case _SalesMerchantResponseEntity() when $default != null:
return $default(_that.merchants,_that.pagination);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SalesMerchantResponseEntity implements SalesMerchantResponseEntity {
  const _SalesMerchantResponseEntity({final  List<SalesMerchantEntity> merchants = const [], final  Map<String, dynamic>? pagination}): _merchants = merchants,_pagination = pagination;
  factory _SalesMerchantResponseEntity.fromJson(Map<String, dynamic> json) => _$SalesMerchantResponseEntityFromJson(json);

 final  List<SalesMerchantEntity> _merchants;
@override@JsonKey() List<SalesMerchantEntity> get merchants {
  if (_merchants is EqualUnmodifiableListView) return _merchants;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_merchants);
}

 final  Map<String, dynamic>? _pagination;
@override Map<String, dynamic>? get pagination {
  final value = _pagination;
  if (value == null) return null;
  if (_pagination is EqualUnmodifiableMapView) return _pagination;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of SalesMerchantResponseEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SalesMerchantResponseEntityCopyWith<_SalesMerchantResponseEntity> get copyWith => __$SalesMerchantResponseEntityCopyWithImpl<_SalesMerchantResponseEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SalesMerchantResponseEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SalesMerchantResponseEntity&&const DeepCollectionEquality().equals(other._merchants, _merchants)&&const DeepCollectionEquality().equals(other._pagination, _pagination));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_merchants),const DeepCollectionEquality().hash(_pagination));

@override
String toString() {
  return 'SalesMerchantResponseEntity(merchants: $merchants, pagination: $pagination)';
}


}

/// @nodoc
abstract mixin class _$SalesMerchantResponseEntityCopyWith<$Res> implements $SalesMerchantResponseEntityCopyWith<$Res> {
  factory _$SalesMerchantResponseEntityCopyWith(_SalesMerchantResponseEntity value, $Res Function(_SalesMerchantResponseEntity) _then) = __$SalesMerchantResponseEntityCopyWithImpl;
@override @useResult
$Res call({
 List<SalesMerchantEntity> merchants, Map<String, dynamic>? pagination
});




}
/// @nodoc
class __$SalesMerchantResponseEntityCopyWithImpl<$Res>
    implements _$SalesMerchantResponseEntityCopyWith<$Res> {
  __$SalesMerchantResponseEntityCopyWithImpl(this._self, this._then);

  final _SalesMerchantResponseEntity _self;
  final $Res Function(_SalesMerchantResponseEntity) _then;

/// Create a copy of SalesMerchantResponseEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? merchants = null,Object? pagination = freezed,}) {
  return _then(_SalesMerchantResponseEntity(
merchants: null == merchants ? _self._merchants : merchants // ignore: cast_nullable_to_non_nullable
as List<SalesMerchantEntity>,pagination: freezed == pagination ? _self._pagination : pagination // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}

// dart format on
