// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'merchant_merchant.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
MerchantMerchant _$MerchantMerchantFromJson(
  Map<String, dynamic> json
) {
    return MerchantMerchantEntity.fromJson(
      json
    );
}

/// @nodoc
mixin _$MerchantMerchant {

 String get id; String get name; String get slug; int? get userId; String? get merchantCategoryId; MerchantCategoryEntity? get merchantCategory; String? get status; int? get statusChangedBy;@JsonKey(name: 'whatsapp_number') String? get phone; bool? get isOpenAllDay; bool? get isOpen24Hours; String? get timeOpen; String? get timeClose; bool? get internalCourier; bool? get instantCourier; bool? get pickupAtStore; int? get maxDistanceInternalCourier; List<MerchantAccountEntity> get merchantAccounts; String? get address; String? get province; String? get city; String? get district; String? get postalCode; double? get longitude; double? get latitude; String? get photo; int? get balance; bool? get isActive; bool get isOpen;
/// Create a copy of MerchantMerchant
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantMerchantCopyWith<MerchantMerchant> get copyWith => _$MerchantMerchantCopyWithImpl<MerchantMerchant>(this as MerchantMerchant, _$identity);

  /// Serializes this MerchantMerchant to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantMerchant&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.merchantCategoryId, merchantCategoryId) || other.merchantCategoryId == merchantCategoryId)&&const DeepCollectionEquality().equals(other.merchantCategory, merchantCategory)&&(identical(other.status, status) || other.status == status)&&(identical(other.statusChangedBy, statusChangedBy) || other.statusChangedBy == statusChangedBy)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.isOpenAllDay, isOpenAllDay) || other.isOpenAllDay == isOpenAllDay)&&(identical(other.isOpen24Hours, isOpen24Hours) || other.isOpen24Hours == isOpen24Hours)&&(identical(other.timeOpen, timeOpen) || other.timeOpen == timeOpen)&&(identical(other.timeClose, timeClose) || other.timeClose == timeClose)&&(identical(other.internalCourier, internalCourier) || other.internalCourier == internalCourier)&&(identical(other.instantCourier, instantCourier) || other.instantCourier == instantCourier)&&(identical(other.pickupAtStore, pickupAtStore) || other.pickupAtStore == pickupAtStore)&&(identical(other.maxDistanceInternalCourier, maxDistanceInternalCourier) || other.maxDistanceInternalCourier == maxDistanceInternalCourier)&&const DeepCollectionEquality().equals(other.merchantAccounts, merchantAccounts)&&(identical(other.address, address) || other.address == address)&&(identical(other.province, province) || other.province == province)&&(identical(other.city, city) || other.city == city)&&(identical(other.district, district) || other.district == district)&&(identical(other.postalCode, postalCode) || other.postalCode == postalCode)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.photo, photo) || other.photo == photo)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.isOpen, isOpen) || other.isOpen == isOpen));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,name,slug,userId,merchantCategoryId,const DeepCollectionEquality().hash(merchantCategory),status,statusChangedBy,phone,isOpenAllDay,isOpen24Hours,timeOpen,timeClose,internalCourier,instantCourier,pickupAtStore,maxDistanceInternalCourier,const DeepCollectionEquality().hash(merchantAccounts),address,province,city,district,postalCode,longitude,latitude,photo,balance,isActive,isOpen]);

@override
String toString() {
  return 'MerchantMerchant(id: $id, name: $name, slug: $slug, userId: $userId, merchantCategoryId: $merchantCategoryId, merchantCategory: $merchantCategory, status: $status, statusChangedBy: $statusChangedBy, phone: $phone, isOpenAllDay: $isOpenAllDay, isOpen24Hours: $isOpen24Hours, timeOpen: $timeOpen, timeClose: $timeClose, internalCourier: $internalCourier, instantCourier: $instantCourier, pickupAtStore: $pickupAtStore, maxDistanceInternalCourier: $maxDistanceInternalCourier, merchantAccounts: $merchantAccounts, address: $address, province: $province, city: $city, district: $district, postalCode: $postalCode, longitude: $longitude, latitude: $latitude, photo: $photo, balance: $balance, isActive: $isActive, isOpen: $isOpen)';
}


}

/// @nodoc
abstract mixin class $MerchantMerchantCopyWith<$Res>  {
  factory $MerchantMerchantCopyWith(MerchantMerchant value, $Res Function(MerchantMerchant) _then) = _$MerchantMerchantCopyWithImpl;
@useResult
$Res call({
 String id, String name, String slug, int? userId, String? merchantCategoryId, MerchantCategoryEntity? merchantCategory, String? status, int? statusChangedBy,@JsonKey(name: 'whatsapp_number') String? phone, bool? isOpenAllDay, bool? isOpen24Hours, String? timeOpen, String? timeClose, bool? internalCourier, bool? instantCourier, bool? pickupAtStore, int? maxDistanceInternalCourier, List<MerchantAccountEntity> merchantAccounts, String? address, String? province, String? city, String? district, String? postalCode, double? longitude, double? latitude, String? photo, int? balance, bool? isActive, bool isOpen
});




}
/// @nodoc
class _$MerchantMerchantCopyWithImpl<$Res>
    implements $MerchantMerchantCopyWith<$Res> {
  _$MerchantMerchantCopyWithImpl(this._self, this._then);

  final MerchantMerchant _self;
  final $Res Function(MerchantMerchant) _then;

/// Create a copy of MerchantMerchant
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? slug = null,Object? userId = freezed,Object? merchantCategoryId = freezed,Object? merchantCategory = freezed,Object? status = freezed,Object? statusChangedBy = freezed,Object? phone = freezed,Object? isOpenAllDay = freezed,Object? isOpen24Hours = freezed,Object? timeOpen = freezed,Object? timeClose = freezed,Object? internalCourier = freezed,Object? instantCourier = freezed,Object? pickupAtStore = freezed,Object? maxDistanceInternalCourier = freezed,Object? merchantAccounts = null,Object? address = freezed,Object? province = freezed,Object? city = freezed,Object? district = freezed,Object? postalCode = freezed,Object? longitude = freezed,Object? latitude = freezed,Object? photo = freezed,Object? balance = freezed,Object? isActive = freezed,Object? isOpen = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int?,merchantCategoryId: freezed == merchantCategoryId ? _self.merchantCategoryId : merchantCategoryId // ignore: cast_nullable_to_non_nullable
as String?,merchantCategory: freezed == merchantCategory ? _self.merchantCategory : merchantCategory // ignore: cast_nullable_to_non_nullable
as MerchantCategoryEntity?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,statusChangedBy: freezed == statusChangedBy ? _self.statusChangedBy : statusChangedBy // ignore: cast_nullable_to_non_nullable
as int?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,isOpenAllDay: freezed == isOpenAllDay ? _self.isOpenAllDay : isOpenAllDay // ignore: cast_nullable_to_non_nullable
as bool?,isOpen24Hours: freezed == isOpen24Hours ? _self.isOpen24Hours : isOpen24Hours // ignore: cast_nullable_to_non_nullable
as bool?,timeOpen: freezed == timeOpen ? _self.timeOpen : timeOpen // ignore: cast_nullable_to_non_nullable
as String?,timeClose: freezed == timeClose ? _self.timeClose : timeClose // ignore: cast_nullable_to_non_nullable
as String?,internalCourier: freezed == internalCourier ? _self.internalCourier : internalCourier // ignore: cast_nullable_to_non_nullable
as bool?,instantCourier: freezed == instantCourier ? _self.instantCourier : instantCourier // ignore: cast_nullable_to_non_nullable
as bool?,pickupAtStore: freezed == pickupAtStore ? _self.pickupAtStore : pickupAtStore // ignore: cast_nullable_to_non_nullable
as bool?,maxDistanceInternalCourier: freezed == maxDistanceInternalCourier ? _self.maxDistanceInternalCourier : maxDistanceInternalCourier // ignore: cast_nullable_to_non_nullable
as int?,merchantAccounts: null == merchantAccounts ? _self.merchantAccounts : merchantAccounts // ignore: cast_nullable_to_non_nullable
as List<MerchantAccountEntity>,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,province: freezed == province ? _self.province : province // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,district: freezed == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as String?,postalCode: freezed == postalCode ? _self.postalCode : postalCode // ignore: cast_nullable_to_non_nullable
as String?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,photo: freezed == photo ? _self.photo : photo // ignore: cast_nullable_to_non_nullable
as String?,balance: freezed == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as int?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,isOpen: null == isOpen ? _self.isOpen : isOpen // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [MerchantMerchant].
extension MerchantMerchantPatterns on MerchantMerchant {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MerchantMerchantEntity value)?  entity,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MerchantMerchantEntity() when entity != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MerchantMerchantEntity value)  entity,}){
final _that = this;
switch (_that) {
case MerchantMerchantEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MerchantMerchantEntity value)?  entity,}){
final _that = this;
switch (_that) {
case MerchantMerchantEntity() when entity != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String id,  String name,  String slug,  int? userId,  String? merchantCategoryId,  MerchantCategoryEntity? merchantCategory,  String? status,  int? statusChangedBy, @JsonKey(name: 'whatsapp_number')  String? phone,  bool? isOpenAllDay,  bool? isOpen24Hours,  String? timeOpen,  String? timeClose,  bool? internalCourier,  bool? instantCourier,  bool? pickupAtStore,  int? maxDistanceInternalCourier,  List<MerchantAccountEntity> merchantAccounts,  String? address,  String? province,  String? city,  String? district,  String? postalCode,  double? longitude,  double? latitude,  String? photo,  int? balance,  bool? isActive,  bool isOpen)?  entity,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MerchantMerchantEntity() when entity != null:
return entity(_that.id,_that.name,_that.slug,_that.userId,_that.merchantCategoryId,_that.merchantCategory,_that.status,_that.statusChangedBy,_that.phone,_that.isOpenAllDay,_that.isOpen24Hours,_that.timeOpen,_that.timeClose,_that.internalCourier,_that.instantCourier,_that.pickupAtStore,_that.maxDistanceInternalCourier,_that.merchantAccounts,_that.address,_that.province,_that.city,_that.district,_that.postalCode,_that.longitude,_that.latitude,_that.photo,_that.balance,_that.isActive,_that.isOpen);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String id,  String name,  String slug,  int? userId,  String? merchantCategoryId,  MerchantCategoryEntity? merchantCategory,  String? status,  int? statusChangedBy, @JsonKey(name: 'whatsapp_number')  String? phone,  bool? isOpenAllDay,  bool? isOpen24Hours,  String? timeOpen,  String? timeClose,  bool? internalCourier,  bool? instantCourier,  bool? pickupAtStore,  int? maxDistanceInternalCourier,  List<MerchantAccountEntity> merchantAccounts,  String? address,  String? province,  String? city,  String? district,  String? postalCode,  double? longitude,  double? latitude,  String? photo,  int? balance,  bool? isActive,  bool isOpen)  entity,}) {final _that = this;
switch (_that) {
case MerchantMerchantEntity():
return entity(_that.id,_that.name,_that.slug,_that.userId,_that.merchantCategoryId,_that.merchantCategory,_that.status,_that.statusChangedBy,_that.phone,_that.isOpenAllDay,_that.isOpen24Hours,_that.timeOpen,_that.timeClose,_that.internalCourier,_that.instantCourier,_that.pickupAtStore,_that.maxDistanceInternalCourier,_that.merchantAccounts,_that.address,_that.province,_that.city,_that.district,_that.postalCode,_that.longitude,_that.latitude,_that.photo,_that.balance,_that.isActive,_that.isOpen);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String id,  String name,  String slug,  int? userId,  String? merchantCategoryId,  MerchantCategoryEntity? merchantCategory,  String? status,  int? statusChangedBy, @JsonKey(name: 'whatsapp_number')  String? phone,  bool? isOpenAllDay,  bool? isOpen24Hours,  String? timeOpen,  String? timeClose,  bool? internalCourier,  bool? instantCourier,  bool? pickupAtStore,  int? maxDistanceInternalCourier,  List<MerchantAccountEntity> merchantAccounts,  String? address,  String? province,  String? city,  String? district,  String? postalCode,  double? longitude,  double? latitude,  String? photo,  int? balance,  bool? isActive,  bool isOpen)?  entity,}) {final _that = this;
switch (_that) {
case MerchantMerchantEntity() when entity != null:
return entity(_that.id,_that.name,_that.slug,_that.userId,_that.merchantCategoryId,_that.merchantCategory,_that.status,_that.statusChangedBy,_that.phone,_that.isOpenAllDay,_that.isOpen24Hours,_that.timeOpen,_that.timeClose,_that.internalCourier,_that.instantCourier,_that.pickupAtStore,_that.maxDistanceInternalCourier,_that.merchantAccounts,_that.address,_that.province,_that.city,_that.district,_that.postalCode,_that.longitude,_that.latitude,_that.photo,_that.balance,_that.isActive,_that.isOpen);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class MerchantMerchantEntity implements MerchantMerchant {
  const MerchantMerchantEntity({required this.id, required this.name, required this.slug, this.userId, this.merchantCategoryId, this.merchantCategory, this.status, this.statusChangedBy, @JsonKey(name: 'whatsapp_number') this.phone, this.isOpenAllDay, this.isOpen24Hours, this.timeOpen, this.timeClose, this.internalCourier, this.instantCourier, this.pickupAtStore, this.maxDistanceInternalCourier, final  List<MerchantAccountEntity> merchantAccounts = const [], this.address, this.province, this.city, this.district, this.postalCode, this.longitude, this.latitude, this.photo, this.balance, this.isActive, required this.isOpen}): _merchantAccounts = merchantAccounts;
  factory MerchantMerchantEntity.fromJson(Map<String, dynamic> json) => _$MerchantMerchantEntityFromJson(json);

@override final  String id;
@override final  String name;
@override final  String slug;
@override final  int? userId;
@override final  String? merchantCategoryId;
@override final  MerchantCategoryEntity? merchantCategory;
@override final  String? status;
@override final  int? statusChangedBy;
@override@JsonKey(name: 'whatsapp_number') final  String? phone;
@override final  bool? isOpenAllDay;
@override final  bool? isOpen24Hours;
@override final  String? timeOpen;
@override final  String? timeClose;
@override final  bool? internalCourier;
@override final  bool? instantCourier;
@override final  bool? pickupAtStore;
@override final  int? maxDistanceInternalCourier;
 final  List<MerchantAccountEntity> _merchantAccounts;
@override@JsonKey() List<MerchantAccountEntity> get merchantAccounts {
  if (_merchantAccounts is EqualUnmodifiableListView) return _merchantAccounts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_merchantAccounts);
}

@override final  String? address;
@override final  String? province;
@override final  String? city;
@override final  String? district;
@override final  String? postalCode;
@override final  double? longitude;
@override final  double? latitude;
@override final  String? photo;
@override final  int? balance;
@override final  bool? isActive;
@override final  bool isOpen;

/// Create a copy of MerchantMerchant
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantMerchantEntityCopyWith<MerchantMerchantEntity> get copyWith => _$MerchantMerchantEntityCopyWithImpl<MerchantMerchantEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MerchantMerchantEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantMerchantEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.merchantCategoryId, merchantCategoryId) || other.merchantCategoryId == merchantCategoryId)&&const DeepCollectionEquality().equals(other.merchantCategory, merchantCategory)&&(identical(other.status, status) || other.status == status)&&(identical(other.statusChangedBy, statusChangedBy) || other.statusChangedBy == statusChangedBy)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.isOpenAllDay, isOpenAllDay) || other.isOpenAllDay == isOpenAllDay)&&(identical(other.isOpen24Hours, isOpen24Hours) || other.isOpen24Hours == isOpen24Hours)&&(identical(other.timeOpen, timeOpen) || other.timeOpen == timeOpen)&&(identical(other.timeClose, timeClose) || other.timeClose == timeClose)&&(identical(other.internalCourier, internalCourier) || other.internalCourier == internalCourier)&&(identical(other.instantCourier, instantCourier) || other.instantCourier == instantCourier)&&(identical(other.pickupAtStore, pickupAtStore) || other.pickupAtStore == pickupAtStore)&&(identical(other.maxDistanceInternalCourier, maxDistanceInternalCourier) || other.maxDistanceInternalCourier == maxDistanceInternalCourier)&&const DeepCollectionEquality().equals(other._merchantAccounts, _merchantAccounts)&&(identical(other.address, address) || other.address == address)&&(identical(other.province, province) || other.province == province)&&(identical(other.city, city) || other.city == city)&&(identical(other.district, district) || other.district == district)&&(identical(other.postalCode, postalCode) || other.postalCode == postalCode)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.photo, photo) || other.photo == photo)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.isOpen, isOpen) || other.isOpen == isOpen));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,name,slug,userId,merchantCategoryId,const DeepCollectionEquality().hash(merchantCategory),status,statusChangedBy,phone,isOpenAllDay,isOpen24Hours,timeOpen,timeClose,internalCourier,instantCourier,pickupAtStore,maxDistanceInternalCourier,const DeepCollectionEquality().hash(_merchantAccounts),address,province,city,district,postalCode,longitude,latitude,photo,balance,isActive,isOpen]);

@override
String toString() {
  return 'MerchantMerchant.entity(id: $id, name: $name, slug: $slug, userId: $userId, merchantCategoryId: $merchantCategoryId, merchantCategory: $merchantCategory, status: $status, statusChangedBy: $statusChangedBy, phone: $phone, isOpenAllDay: $isOpenAllDay, isOpen24Hours: $isOpen24Hours, timeOpen: $timeOpen, timeClose: $timeClose, internalCourier: $internalCourier, instantCourier: $instantCourier, pickupAtStore: $pickupAtStore, maxDistanceInternalCourier: $maxDistanceInternalCourier, merchantAccounts: $merchantAccounts, address: $address, province: $province, city: $city, district: $district, postalCode: $postalCode, longitude: $longitude, latitude: $latitude, photo: $photo, balance: $balance, isActive: $isActive, isOpen: $isOpen)';
}


}

/// @nodoc
abstract mixin class $MerchantMerchantEntityCopyWith<$Res> implements $MerchantMerchantCopyWith<$Res> {
  factory $MerchantMerchantEntityCopyWith(MerchantMerchantEntity value, $Res Function(MerchantMerchantEntity) _then) = _$MerchantMerchantEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String slug, int? userId, String? merchantCategoryId, MerchantCategoryEntity? merchantCategory, String? status, int? statusChangedBy,@JsonKey(name: 'whatsapp_number') String? phone, bool? isOpenAllDay, bool? isOpen24Hours, String? timeOpen, String? timeClose, bool? internalCourier, bool? instantCourier, bool? pickupAtStore, int? maxDistanceInternalCourier, List<MerchantAccountEntity> merchantAccounts, String? address, String? province, String? city, String? district, String? postalCode, double? longitude, double? latitude, String? photo, int? balance, bool? isActive, bool isOpen
});




}
/// @nodoc
class _$MerchantMerchantEntityCopyWithImpl<$Res>
    implements $MerchantMerchantEntityCopyWith<$Res> {
  _$MerchantMerchantEntityCopyWithImpl(this._self, this._then);

  final MerchantMerchantEntity _self;
  final $Res Function(MerchantMerchantEntity) _then;

/// Create a copy of MerchantMerchant
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? slug = null,Object? userId = freezed,Object? merchantCategoryId = freezed,Object? merchantCategory = freezed,Object? status = freezed,Object? statusChangedBy = freezed,Object? phone = freezed,Object? isOpenAllDay = freezed,Object? isOpen24Hours = freezed,Object? timeOpen = freezed,Object? timeClose = freezed,Object? internalCourier = freezed,Object? instantCourier = freezed,Object? pickupAtStore = freezed,Object? maxDistanceInternalCourier = freezed,Object? merchantAccounts = null,Object? address = freezed,Object? province = freezed,Object? city = freezed,Object? district = freezed,Object? postalCode = freezed,Object? longitude = freezed,Object? latitude = freezed,Object? photo = freezed,Object? balance = freezed,Object? isActive = freezed,Object? isOpen = null,}) {
  return _then(MerchantMerchantEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int?,merchantCategoryId: freezed == merchantCategoryId ? _self.merchantCategoryId : merchantCategoryId // ignore: cast_nullable_to_non_nullable
as String?,merchantCategory: freezed == merchantCategory ? _self.merchantCategory : merchantCategory // ignore: cast_nullable_to_non_nullable
as MerchantCategoryEntity?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,statusChangedBy: freezed == statusChangedBy ? _self.statusChangedBy : statusChangedBy // ignore: cast_nullable_to_non_nullable
as int?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,isOpenAllDay: freezed == isOpenAllDay ? _self.isOpenAllDay : isOpenAllDay // ignore: cast_nullable_to_non_nullable
as bool?,isOpen24Hours: freezed == isOpen24Hours ? _self.isOpen24Hours : isOpen24Hours // ignore: cast_nullable_to_non_nullable
as bool?,timeOpen: freezed == timeOpen ? _self.timeOpen : timeOpen // ignore: cast_nullable_to_non_nullable
as String?,timeClose: freezed == timeClose ? _self.timeClose : timeClose // ignore: cast_nullable_to_non_nullable
as String?,internalCourier: freezed == internalCourier ? _self.internalCourier : internalCourier // ignore: cast_nullable_to_non_nullable
as bool?,instantCourier: freezed == instantCourier ? _self.instantCourier : instantCourier // ignore: cast_nullable_to_non_nullable
as bool?,pickupAtStore: freezed == pickupAtStore ? _self.pickupAtStore : pickupAtStore // ignore: cast_nullable_to_non_nullable
as bool?,maxDistanceInternalCourier: freezed == maxDistanceInternalCourier ? _self.maxDistanceInternalCourier : maxDistanceInternalCourier // ignore: cast_nullable_to_non_nullable
as int?,merchantAccounts: null == merchantAccounts ? _self._merchantAccounts : merchantAccounts // ignore: cast_nullable_to_non_nullable
as List<MerchantAccountEntity>,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,province: freezed == province ? _self.province : province // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,district: freezed == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as String?,postalCode: freezed == postalCode ? _self.postalCode : postalCode // ignore: cast_nullable_to_non_nullable
as String?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,photo: freezed == photo ? _self.photo : photo // ignore: cast_nullable_to_non_nullable
as String?,balance: freezed == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as int?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,isOpen: null == isOpen ? _self.isOpen : isOpen // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
