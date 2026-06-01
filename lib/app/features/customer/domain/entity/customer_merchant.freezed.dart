// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_merchant.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
CustomerMerchant _$CustomerMerchantFromJson(
  Map<String, dynamic> json
) {
    return CustomerMerchantEntity.fromJson(
      json
    );
}

/// @nodoc
mixin _$CustomerMerchant {

 String get id; String get name; String get slug; String? get photo; bool get isActive; bool get isOpen; int? get userId; String? get merchantCategory; String? get status; int? get statusChangedBy; String? get whatsappNumber; bool? get isOpenAllDay;@JsonKey(name: 'is_open_24_hours') bool? get isOpen24Hours; String? get timeOpen; String? get timeClose; bool? get internalCourier; bool? get instantCourier; bool? get pickupAtStore; List<String>? get courierCodeAvailable; int? get maxDistanceInternalCourier; List<CustomerMerchantAccountEntity>? get merchantAccounts; List<CustomerMerchantOpenEntity>? get merchantOpens; String? get address; String? get province; String? get city; String? get district; String? get postalCode; double? get longitude; double? get latitude; int? get balance; int? get currentBalance; CustomerMerchantUserEntity? get user;
/// Create a copy of CustomerMerchant
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerMerchantCopyWith<CustomerMerchant> get copyWith => _$CustomerMerchantCopyWithImpl<CustomerMerchant>(this as CustomerMerchant, _$identity);

  /// Serializes this CustomerMerchant to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerMerchant&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.photo, photo) || other.photo == photo)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.isOpen, isOpen) || other.isOpen == isOpen)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.merchantCategory, merchantCategory) || other.merchantCategory == merchantCategory)&&(identical(other.status, status) || other.status == status)&&(identical(other.statusChangedBy, statusChangedBy) || other.statusChangedBy == statusChangedBy)&&(identical(other.whatsappNumber, whatsappNumber) || other.whatsappNumber == whatsappNumber)&&(identical(other.isOpenAllDay, isOpenAllDay) || other.isOpenAllDay == isOpenAllDay)&&(identical(other.isOpen24Hours, isOpen24Hours) || other.isOpen24Hours == isOpen24Hours)&&(identical(other.timeOpen, timeOpen) || other.timeOpen == timeOpen)&&(identical(other.timeClose, timeClose) || other.timeClose == timeClose)&&(identical(other.internalCourier, internalCourier) || other.internalCourier == internalCourier)&&(identical(other.instantCourier, instantCourier) || other.instantCourier == instantCourier)&&(identical(other.pickupAtStore, pickupAtStore) || other.pickupAtStore == pickupAtStore)&&const DeepCollectionEquality().equals(other.courierCodeAvailable, courierCodeAvailable)&&(identical(other.maxDistanceInternalCourier, maxDistanceInternalCourier) || other.maxDistanceInternalCourier == maxDistanceInternalCourier)&&const DeepCollectionEquality().equals(other.merchantAccounts, merchantAccounts)&&const DeepCollectionEquality().equals(other.merchantOpens, merchantOpens)&&(identical(other.address, address) || other.address == address)&&(identical(other.province, province) || other.province == province)&&(identical(other.city, city) || other.city == city)&&(identical(other.district, district) || other.district == district)&&(identical(other.postalCode, postalCode) || other.postalCode == postalCode)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.currentBalance, currentBalance) || other.currentBalance == currentBalance)&&const DeepCollectionEquality().equals(other.user, user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,name,slug,photo,isActive,isOpen,userId,merchantCategory,status,statusChangedBy,whatsappNumber,isOpenAllDay,isOpen24Hours,timeOpen,timeClose,internalCourier,instantCourier,pickupAtStore,const DeepCollectionEquality().hash(courierCodeAvailable),maxDistanceInternalCourier,const DeepCollectionEquality().hash(merchantAccounts),const DeepCollectionEquality().hash(merchantOpens),address,province,city,district,postalCode,longitude,latitude,balance,currentBalance,const DeepCollectionEquality().hash(user)]);

@override
String toString() {
  return 'CustomerMerchant(id: $id, name: $name, slug: $slug, photo: $photo, isActive: $isActive, isOpen: $isOpen, userId: $userId, merchantCategory: $merchantCategory, status: $status, statusChangedBy: $statusChangedBy, whatsappNumber: $whatsappNumber, isOpenAllDay: $isOpenAllDay, isOpen24Hours: $isOpen24Hours, timeOpen: $timeOpen, timeClose: $timeClose, internalCourier: $internalCourier, instantCourier: $instantCourier, pickupAtStore: $pickupAtStore, courierCodeAvailable: $courierCodeAvailable, maxDistanceInternalCourier: $maxDistanceInternalCourier, merchantAccounts: $merchantAccounts, merchantOpens: $merchantOpens, address: $address, province: $province, city: $city, district: $district, postalCode: $postalCode, longitude: $longitude, latitude: $latitude, balance: $balance, currentBalance: $currentBalance, user: $user)';
}


}

/// @nodoc
abstract mixin class $CustomerMerchantCopyWith<$Res>  {
  factory $CustomerMerchantCopyWith(CustomerMerchant value, $Res Function(CustomerMerchant) _then) = _$CustomerMerchantCopyWithImpl;
@useResult
$Res call({
 String id, String name, String slug, String? photo, bool isActive, bool isOpen, int? userId, String? merchantCategory, String? status, int? statusChangedBy, String? whatsappNumber, bool? isOpenAllDay,@JsonKey(name: 'is_open_24_hours') bool? isOpen24Hours, String? timeOpen, String? timeClose, bool? internalCourier, bool? instantCourier, bool? pickupAtStore, List<String>? courierCodeAvailable, int? maxDistanceInternalCourier, List<CustomerMerchantAccountEntity>? merchantAccounts, List<CustomerMerchantOpenEntity>? merchantOpens, String? address, String? province, String? city, String? district, String? postalCode, double? longitude, double? latitude, int? balance, int? currentBalance, CustomerMerchantUserEntity? user
});




}
/// @nodoc
class _$CustomerMerchantCopyWithImpl<$Res>
    implements $CustomerMerchantCopyWith<$Res> {
  _$CustomerMerchantCopyWithImpl(this._self, this._then);

  final CustomerMerchant _self;
  final $Res Function(CustomerMerchant) _then;

/// Create a copy of CustomerMerchant
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? slug = null,Object? photo = freezed,Object? isActive = null,Object? isOpen = null,Object? userId = freezed,Object? merchantCategory = freezed,Object? status = freezed,Object? statusChangedBy = freezed,Object? whatsappNumber = freezed,Object? isOpenAllDay = freezed,Object? isOpen24Hours = freezed,Object? timeOpen = freezed,Object? timeClose = freezed,Object? internalCourier = freezed,Object? instantCourier = freezed,Object? pickupAtStore = freezed,Object? courierCodeAvailable = freezed,Object? maxDistanceInternalCourier = freezed,Object? merchantAccounts = freezed,Object? merchantOpens = freezed,Object? address = freezed,Object? province = freezed,Object? city = freezed,Object? district = freezed,Object? postalCode = freezed,Object? longitude = freezed,Object? latitude = freezed,Object? balance = freezed,Object? currentBalance = freezed,Object? user = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,photo: freezed == photo ? _self.photo : photo // ignore: cast_nullable_to_non_nullable
as String?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,isOpen: null == isOpen ? _self.isOpen : isOpen // ignore: cast_nullable_to_non_nullable
as bool,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int?,merchantCategory: freezed == merchantCategory ? _self.merchantCategory : merchantCategory // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,statusChangedBy: freezed == statusChangedBy ? _self.statusChangedBy : statusChangedBy // ignore: cast_nullable_to_non_nullable
as int?,whatsappNumber: freezed == whatsappNumber ? _self.whatsappNumber : whatsappNumber // ignore: cast_nullable_to_non_nullable
as String?,isOpenAllDay: freezed == isOpenAllDay ? _self.isOpenAllDay : isOpenAllDay // ignore: cast_nullable_to_non_nullable
as bool?,isOpen24Hours: freezed == isOpen24Hours ? _self.isOpen24Hours : isOpen24Hours // ignore: cast_nullable_to_non_nullable
as bool?,timeOpen: freezed == timeOpen ? _self.timeOpen : timeOpen // ignore: cast_nullable_to_non_nullable
as String?,timeClose: freezed == timeClose ? _self.timeClose : timeClose // ignore: cast_nullable_to_non_nullable
as String?,internalCourier: freezed == internalCourier ? _self.internalCourier : internalCourier // ignore: cast_nullable_to_non_nullable
as bool?,instantCourier: freezed == instantCourier ? _self.instantCourier : instantCourier // ignore: cast_nullable_to_non_nullable
as bool?,pickupAtStore: freezed == pickupAtStore ? _self.pickupAtStore : pickupAtStore // ignore: cast_nullable_to_non_nullable
as bool?,courierCodeAvailable: freezed == courierCodeAvailable ? _self.courierCodeAvailable : courierCodeAvailable // ignore: cast_nullable_to_non_nullable
as List<String>?,maxDistanceInternalCourier: freezed == maxDistanceInternalCourier ? _self.maxDistanceInternalCourier : maxDistanceInternalCourier // ignore: cast_nullable_to_non_nullable
as int?,merchantAccounts: freezed == merchantAccounts ? _self.merchantAccounts : merchantAccounts // ignore: cast_nullable_to_non_nullable
as List<CustomerMerchantAccountEntity>?,merchantOpens: freezed == merchantOpens ? _self.merchantOpens : merchantOpens // ignore: cast_nullable_to_non_nullable
as List<CustomerMerchantOpenEntity>?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,province: freezed == province ? _self.province : province // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,district: freezed == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as String?,postalCode: freezed == postalCode ? _self.postalCode : postalCode // ignore: cast_nullable_to_non_nullable
as String?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,balance: freezed == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as int?,currentBalance: freezed == currentBalance ? _self.currentBalance : currentBalance // ignore: cast_nullable_to_non_nullable
as int?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as CustomerMerchantUserEntity?,
  ));
}

}


/// Adds pattern-matching-related methods to [CustomerMerchant].
extension CustomerMerchantPatterns on CustomerMerchant {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CustomerMerchantEntity value)?  entity,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CustomerMerchantEntity() when entity != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CustomerMerchantEntity value)  entity,}){
final _that = this;
switch (_that) {
case CustomerMerchantEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CustomerMerchantEntity value)?  entity,}){
final _that = this;
switch (_that) {
case CustomerMerchantEntity() when entity != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String id,  String name,  String slug,  String? photo,  bool isActive,  bool isOpen,  int? userId,  String? merchantCategory,  String? status,  int? statusChangedBy,  String? whatsappNumber,  bool? isOpenAllDay, @JsonKey(name: 'is_open_24_hours')  bool? isOpen24Hours,  String? timeOpen,  String? timeClose,  bool? internalCourier,  bool? instantCourier,  bool? pickupAtStore,  List<String>? courierCodeAvailable,  int? maxDistanceInternalCourier,  List<CustomerMerchantAccountEntity>? merchantAccounts,  List<CustomerMerchantOpenEntity>? merchantOpens,  String? address,  String? province,  String? city,  String? district,  String? postalCode,  double? longitude,  double? latitude,  int? balance,  int? currentBalance,  CustomerMerchantUserEntity? user)?  entity,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CustomerMerchantEntity() when entity != null:
return entity(_that.id,_that.name,_that.slug,_that.photo,_that.isActive,_that.isOpen,_that.userId,_that.merchantCategory,_that.status,_that.statusChangedBy,_that.whatsappNumber,_that.isOpenAllDay,_that.isOpen24Hours,_that.timeOpen,_that.timeClose,_that.internalCourier,_that.instantCourier,_that.pickupAtStore,_that.courierCodeAvailable,_that.maxDistanceInternalCourier,_that.merchantAccounts,_that.merchantOpens,_that.address,_that.province,_that.city,_that.district,_that.postalCode,_that.longitude,_that.latitude,_that.balance,_that.currentBalance,_that.user);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String id,  String name,  String slug,  String? photo,  bool isActive,  bool isOpen,  int? userId,  String? merchantCategory,  String? status,  int? statusChangedBy,  String? whatsappNumber,  bool? isOpenAllDay, @JsonKey(name: 'is_open_24_hours')  bool? isOpen24Hours,  String? timeOpen,  String? timeClose,  bool? internalCourier,  bool? instantCourier,  bool? pickupAtStore,  List<String>? courierCodeAvailable,  int? maxDistanceInternalCourier,  List<CustomerMerchantAccountEntity>? merchantAccounts,  List<CustomerMerchantOpenEntity>? merchantOpens,  String? address,  String? province,  String? city,  String? district,  String? postalCode,  double? longitude,  double? latitude,  int? balance,  int? currentBalance,  CustomerMerchantUserEntity? user)  entity,}) {final _that = this;
switch (_that) {
case CustomerMerchantEntity():
return entity(_that.id,_that.name,_that.slug,_that.photo,_that.isActive,_that.isOpen,_that.userId,_that.merchantCategory,_that.status,_that.statusChangedBy,_that.whatsappNumber,_that.isOpenAllDay,_that.isOpen24Hours,_that.timeOpen,_that.timeClose,_that.internalCourier,_that.instantCourier,_that.pickupAtStore,_that.courierCodeAvailable,_that.maxDistanceInternalCourier,_that.merchantAccounts,_that.merchantOpens,_that.address,_that.province,_that.city,_that.district,_that.postalCode,_that.longitude,_that.latitude,_that.balance,_that.currentBalance,_that.user);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String id,  String name,  String slug,  String? photo,  bool isActive,  bool isOpen,  int? userId,  String? merchantCategory,  String? status,  int? statusChangedBy,  String? whatsappNumber,  bool? isOpenAllDay, @JsonKey(name: 'is_open_24_hours')  bool? isOpen24Hours,  String? timeOpen,  String? timeClose,  bool? internalCourier,  bool? instantCourier,  bool? pickupAtStore,  List<String>? courierCodeAvailable,  int? maxDistanceInternalCourier,  List<CustomerMerchantAccountEntity>? merchantAccounts,  List<CustomerMerchantOpenEntity>? merchantOpens,  String? address,  String? province,  String? city,  String? district,  String? postalCode,  double? longitude,  double? latitude,  int? balance,  int? currentBalance,  CustomerMerchantUserEntity? user)?  entity,}) {final _that = this;
switch (_that) {
case CustomerMerchantEntity() when entity != null:
return entity(_that.id,_that.name,_that.slug,_that.photo,_that.isActive,_that.isOpen,_that.userId,_that.merchantCategory,_that.status,_that.statusChangedBy,_that.whatsappNumber,_that.isOpenAllDay,_that.isOpen24Hours,_that.timeOpen,_that.timeClose,_that.internalCourier,_that.instantCourier,_that.pickupAtStore,_that.courierCodeAvailable,_that.maxDistanceInternalCourier,_that.merchantAccounts,_that.merchantOpens,_that.address,_that.province,_that.city,_that.district,_that.postalCode,_that.longitude,_that.latitude,_that.balance,_that.currentBalance,_that.user);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class CustomerMerchantEntity implements CustomerMerchant {
  const CustomerMerchantEntity({required this.id, required this.name, required this.slug, this.photo, required this.isActive, required this.isOpen, this.userId, this.merchantCategory, this.status, this.statusChangedBy, this.whatsappNumber, this.isOpenAllDay, @JsonKey(name: 'is_open_24_hours') this.isOpen24Hours, this.timeOpen, this.timeClose, this.internalCourier, this.instantCourier, this.pickupAtStore, final  List<String>? courierCodeAvailable, this.maxDistanceInternalCourier, final  List<CustomerMerchantAccountEntity>? merchantAccounts, final  List<CustomerMerchantOpenEntity>? merchantOpens, this.address, this.province, this.city, this.district, this.postalCode, this.longitude, this.latitude, this.balance, this.currentBalance, this.user}): _courierCodeAvailable = courierCodeAvailable,_merchantAccounts = merchantAccounts,_merchantOpens = merchantOpens;
  factory CustomerMerchantEntity.fromJson(Map<String, dynamic> json) => _$CustomerMerchantEntityFromJson(json);

@override final  String id;
@override final  String name;
@override final  String slug;
@override final  String? photo;
@override final  bool isActive;
@override final  bool isOpen;
@override final  int? userId;
@override final  String? merchantCategory;
@override final  String? status;
@override final  int? statusChangedBy;
@override final  String? whatsappNumber;
@override final  bool? isOpenAllDay;
@override@JsonKey(name: 'is_open_24_hours') final  bool? isOpen24Hours;
@override final  String? timeOpen;
@override final  String? timeClose;
@override final  bool? internalCourier;
@override final  bool? instantCourier;
@override final  bool? pickupAtStore;
 final  List<String>? _courierCodeAvailable;
@override List<String>? get courierCodeAvailable {
  final value = _courierCodeAvailable;
  if (value == null) return null;
  if (_courierCodeAvailable is EqualUnmodifiableListView) return _courierCodeAvailable;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  int? maxDistanceInternalCourier;
 final  List<CustomerMerchantAccountEntity>? _merchantAccounts;
@override List<CustomerMerchantAccountEntity>? get merchantAccounts {
  final value = _merchantAccounts;
  if (value == null) return null;
  if (_merchantAccounts is EqualUnmodifiableListView) return _merchantAccounts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<CustomerMerchantOpenEntity>? _merchantOpens;
@override List<CustomerMerchantOpenEntity>? get merchantOpens {
  final value = _merchantOpens;
  if (value == null) return null;
  if (_merchantOpens is EqualUnmodifiableListView) return _merchantOpens;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? address;
@override final  String? province;
@override final  String? city;
@override final  String? district;
@override final  String? postalCode;
@override final  double? longitude;
@override final  double? latitude;
@override final  int? balance;
@override final  int? currentBalance;
@override final  CustomerMerchantUserEntity? user;

/// Create a copy of CustomerMerchant
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerMerchantEntityCopyWith<CustomerMerchantEntity> get copyWith => _$CustomerMerchantEntityCopyWithImpl<CustomerMerchantEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomerMerchantEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerMerchantEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.photo, photo) || other.photo == photo)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.isOpen, isOpen) || other.isOpen == isOpen)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.merchantCategory, merchantCategory) || other.merchantCategory == merchantCategory)&&(identical(other.status, status) || other.status == status)&&(identical(other.statusChangedBy, statusChangedBy) || other.statusChangedBy == statusChangedBy)&&(identical(other.whatsappNumber, whatsappNumber) || other.whatsappNumber == whatsappNumber)&&(identical(other.isOpenAllDay, isOpenAllDay) || other.isOpenAllDay == isOpenAllDay)&&(identical(other.isOpen24Hours, isOpen24Hours) || other.isOpen24Hours == isOpen24Hours)&&(identical(other.timeOpen, timeOpen) || other.timeOpen == timeOpen)&&(identical(other.timeClose, timeClose) || other.timeClose == timeClose)&&(identical(other.internalCourier, internalCourier) || other.internalCourier == internalCourier)&&(identical(other.instantCourier, instantCourier) || other.instantCourier == instantCourier)&&(identical(other.pickupAtStore, pickupAtStore) || other.pickupAtStore == pickupAtStore)&&const DeepCollectionEquality().equals(other._courierCodeAvailable, _courierCodeAvailable)&&(identical(other.maxDistanceInternalCourier, maxDistanceInternalCourier) || other.maxDistanceInternalCourier == maxDistanceInternalCourier)&&const DeepCollectionEquality().equals(other._merchantAccounts, _merchantAccounts)&&const DeepCollectionEquality().equals(other._merchantOpens, _merchantOpens)&&(identical(other.address, address) || other.address == address)&&(identical(other.province, province) || other.province == province)&&(identical(other.city, city) || other.city == city)&&(identical(other.district, district) || other.district == district)&&(identical(other.postalCode, postalCode) || other.postalCode == postalCode)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.currentBalance, currentBalance) || other.currentBalance == currentBalance)&&const DeepCollectionEquality().equals(other.user, user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,name,slug,photo,isActive,isOpen,userId,merchantCategory,status,statusChangedBy,whatsappNumber,isOpenAllDay,isOpen24Hours,timeOpen,timeClose,internalCourier,instantCourier,pickupAtStore,const DeepCollectionEquality().hash(_courierCodeAvailable),maxDistanceInternalCourier,const DeepCollectionEquality().hash(_merchantAccounts),const DeepCollectionEquality().hash(_merchantOpens),address,province,city,district,postalCode,longitude,latitude,balance,currentBalance,const DeepCollectionEquality().hash(user)]);

@override
String toString() {
  return 'CustomerMerchant.entity(id: $id, name: $name, slug: $slug, photo: $photo, isActive: $isActive, isOpen: $isOpen, userId: $userId, merchantCategory: $merchantCategory, status: $status, statusChangedBy: $statusChangedBy, whatsappNumber: $whatsappNumber, isOpenAllDay: $isOpenAllDay, isOpen24Hours: $isOpen24Hours, timeOpen: $timeOpen, timeClose: $timeClose, internalCourier: $internalCourier, instantCourier: $instantCourier, pickupAtStore: $pickupAtStore, courierCodeAvailable: $courierCodeAvailable, maxDistanceInternalCourier: $maxDistanceInternalCourier, merchantAccounts: $merchantAccounts, merchantOpens: $merchantOpens, address: $address, province: $province, city: $city, district: $district, postalCode: $postalCode, longitude: $longitude, latitude: $latitude, balance: $balance, currentBalance: $currentBalance, user: $user)';
}


}

/// @nodoc
abstract mixin class $CustomerMerchantEntityCopyWith<$Res> implements $CustomerMerchantCopyWith<$Res> {
  factory $CustomerMerchantEntityCopyWith(CustomerMerchantEntity value, $Res Function(CustomerMerchantEntity) _then) = _$CustomerMerchantEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String slug, String? photo, bool isActive, bool isOpen, int? userId, String? merchantCategory, String? status, int? statusChangedBy, String? whatsappNumber, bool? isOpenAllDay,@JsonKey(name: 'is_open_24_hours') bool? isOpen24Hours, String? timeOpen, String? timeClose, bool? internalCourier, bool? instantCourier, bool? pickupAtStore, List<String>? courierCodeAvailable, int? maxDistanceInternalCourier, List<CustomerMerchantAccountEntity>? merchantAccounts, List<CustomerMerchantOpenEntity>? merchantOpens, String? address, String? province, String? city, String? district, String? postalCode, double? longitude, double? latitude, int? balance, int? currentBalance, CustomerMerchantUserEntity? user
});




}
/// @nodoc
class _$CustomerMerchantEntityCopyWithImpl<$Res>
    implements $CustomerMerchantEntityCopyWith<$Res> {
  _$CustomerMerchantEntityCopyWithImpl(this._self, this._then);

  final CustomerMerchantEntity _self;
  final $Res Function(CustomerMerchantEntity) _then;

/// Create a copy of CustomerMerchant
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? slug = null,Object? photo = freezed,Object? isActive = null,Object? isOpen = null,Object? userId = freezed,Object? merchantCategory = freezed,Object? status = freezed,Object? statusChangedBy = freezed,Object? whatsappNumber = freezed,Object? isOpenAllDay = freezed,Object? isOpen24Hours = freezed,Object? timeOpen = freezed,Object? timeClose = freezed,Object? internalCourier = freezed,Object? instantCourier = freezed,Object? pickupAtStore = freezed,Object? courierCodeAvailable = freezed,Object? maxDistanceInternalCourier = freezed,Object? merchantAccounts = freezed,Object? merchantOpens = freezed,Object? address = freezed,Object? province = freezed,Object? city = freezed,Object? district = freezed,Object? postalCode = freezed,Object? longitude = freezed,Object? latitude = freezed,Object? balance = freezed,Object? currentBalance = freezed,Object? user = freezed,}) {
  return _then(CustomerMerchantEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,photo: freezed == photo ? _self.photo : photo // ignore: cast_nullable_to_non_nullable
as String?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,isOpen: null == isOpen ? _self.isOpen : isOpen // ignore: cast_nullable_to_non_nullable
as bool,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int?,merchantCategory: freezed == merchantCategory ? _self.merchantCategory : merchantCategory // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,statusChangedBy: freezed == statusChangedBy ? _self.statusChangedBy : statusChangedBy // ignore: cast_nullable_to_non_nullable
as int?,whatsappNumber: freezed == whatsappNumber ? _self.whatsappNumber : whatsappNumber // ignore: cast_nullable_to_non_nullable
as String?,isOpenAllDay: freezed == isOpenAllDay ? _self.isOpenAllDay : isOpenAllDay // ignore: cast_nullable_to_non_nullable
as bool?,isOpen24Hours: freezed == isOpen24Hours ? _self.isOpen24Hours : isOpen24Hours // ignore: cast_nullable_to_non_nullable
as bool?,timeOpen: freezed == timeOpen ? _self.timeOpen : timeOpen // ignore: cast_nullable_to_non_nullable
as String?,timeClose: freezed == timeClose ? _self.timeClose : timeClose // ignore: cast_nullable_to_non_nullable
as String?,internalCourier: freezed == internalCourier ? _self.internalCourier : internalCourier // ignore: cast_nullable_to_non_nullable
as bool?,instantCourier: freezed == instantCourier ? _self.instantCourier : instantCourier // ignore: cast_nullable_to_non_nullable
as bool?,pickupAtStore: freezed == pickupAtStore ? _self.pickupAtStore : pickupAtStore // ignore: cast_nullable_to_non_nullable
as bool?,courierCodeAvailable: freezed == courierCodeAvailable ? _self._courierCodeAvailable : courierCodeAvailable // ignore: cast_nullable_to_non_nullable
as List<String>?,maxDistanceInternalCourier: freezed == maxDistanceInternalCourier ? _self.maxDistanceInternalCourier : maxDistanceInternalCourier // ignore: cast_nullable_to_non_nullable
as int?,merchantAccounts: freezed == merchantAccounts ? _self._merchantAccounts : merchantAccounts // ignore: cast_nullable_to_non_nullable
as List<CustomerMerchantAccountEntity>?,merchantOpens: freezed == merchantOpens ? _self._merchantOpens : merchantOpens // ignore: cast_nullable_to_non_nullable
as List<CustomerMerchantOpenEntity>?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,province: freezed == province ? _self.province : province // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,district: freezed == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as String?,postalCode: freezed == postalCode ? _self.postalCode : postalCode // ignore: cast_nullable_to_non_nullable
as String?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,balance: freezed == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as int?,currentBalance: freezed == currentBalance ? _self.currentBalance : currentBalance // ignore: cast_nullable_to_non_nullable
as int?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as CustomerMerchantUserEntity?,
  ));
}


}

CustomerMerchantAccount _$CustomerMerchantAccountFromJson(
  Map<String, dynamic> json
) {
    return CustomerMerchantAccountEntity.fromJson(
      json
    );
}

/// @nodoc
mixin _$CustomerMerchantAccount {

 String get id; String get bankName; String get accountName; String get accountNumber;
/// Create a copy of CustomerMerchantAccount
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerMerchantAccountCopyWith<CustomerMerchantAccount> get copyWith => _$CustomerMerchantAccountCopyWithImpl<CustomerMerchantAccount>(this as CustomerMerchantAccount, _$identity);

  /// Serializes this CustomerMerchantAccount to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerMerchantAccount&&(identical(other.id, id) || other.id == id)&&(identical(other.bankName, bankName) || other.bankName == bankName)&&(identical(other.accountName, accountName) || other.accountName == accountName)&&(identical(other.accountNumber, accountNumber) || other.accountNumber == accountNumber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,bankName,accountName,accountNumber);

@override
String toString() {
  return 'CustomerMerchantAccount(id: $id, bankName: $bankName, accountName: $accountName, accountNumber: $accountNumber)';
}


}

/// @nodoc
abstract mixin class $CustomerMerchantAccountCopyWith<$Res>  {
  factory $CustomerMerchantAccountCopyWith(CustomerMerchantAccount value, $Res Function(CustomerMerchantAccount) _then) = _$CustomerMerchantAccountCopyWithImpl;
@useResult
$Res call({
 String id, String bankName, String accountName, String accountNumber
});




}
/// @nodoc
class _$CustomerMerchantAccountCopyWithImpl<$Res>
    implements $CustomerMerchantAccountCopyWith<$Res> {
  _$CustomerMerchantAccountCopyWithImpl(this._self, this._then);

  final CustomerMerchantAccount _self;
  final $Res Function(CustomerMerchantAccount) _then;

/// Create a copy of CustomerMerchantAccount
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? bankName = null,Object? accountName = null,Object? accountNumber = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,bankName: null == bankName ? _self.bankName : bankName // ignore: cast_nullable_to_non_nullable
as String,accountName: null == accountName ? _self.accountName : accountName // ignore: cast_nullable_to_non_nullable
as String,accountNumber: null == accountNumber ? _self.accountNumber : accountNumber // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CustomerMerchantAccount].
extension CustomerMerchantAccountPatterns on CustomerMerchantAccount {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CustomerMerchantAccountEntity value)?  entity,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CustomerMerchantAccountEntity() when entity != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CustomerMerchantAccountEntity value)  entity,}){
final _that = this;
switch (_that) {
case CustomerMerchantAccountEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CustomerMerchantAccountEntity value)?  entity,}){
final _that = this;
switch (_that) {
case CustomerMerchantAccountEntity() when entity != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String id,  String bankName,  String accountName,  String accountNumber)?  entity,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CustomerMerchantAccountEntity() when entity != null:
return entity(_that.id,_that.bankName,_that.accountName,_that.accountNumber);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String id,  String bankName,  String accountName,  String accountNumber)  entity,}) {final _that = this;
switch (_that) {
case CustomerMerchantAccountEntity():
return entity(_that.id,_that.bankName,_that.accountName,_that.accountNumber);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String id,  String bankName,  String accountName,  String accountNumber)?  entity,}) {final _that = this;
switch (_that) {
case CustomerMerchantAccountEntity() when entity != null:
return entity(_that.id,_that.bankName,_that.accountName,_that.accountNumber);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class CustomerMerchantAccountEntity implements CustomerMerchantAccount {
  const CustomerMerchantAccountEntity({required this.id, required this.bankName, required this.accountName, required this.accountNumber});
  factory CustomerMerchantAccountEntity.fromJson(Map<String, dynamic> json) => _$CustomerMerchantAccountEntityFromJson(json);

@override final  String id;
@override final  String bankName;
@override final  String accountName;
@override final  String accountNumber;

/// Create a copy of CustomerMerchantAccount
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerMerchantAccountEntityCopyWith<CustomerMerchantAccountEntity> get copyWith => _$CustomerMerchantAccountEntityCopyWithImpl<CustomerMerchantAccountEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomerMerchantAccountEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerMerchantAccountEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.bankName, bankName) || other.bankName == bankName)&&(identical(other.accountName, accountName) || other.accountName == accountName)&&(identical(other.accountNumber, accountNumber) || other.accountNumber == accountNumber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,bankName,accountName,accountNumber);

@override
String toString() {
  return 'CustomerMerchantAccount.entity(id: $id, bankName: $bankName, accountName: $accountName, accountNumber: $accountNumber)';
}


}

/// @nodoc
abstract mixin class $CustomerMerchantAccountEntityCopyWith<$Res> implements $CustomerMerchantAccountCopyWith<$Res> {
  factory $CustomerMerchantAccountEntityCopyWith(CustomerMerchantAccountEntity value, $Res Function(CustomerMerchantAccountEntity) _then) = _$CustomerMerchantAccountEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String bankName, String accountName, String accountNumber
});




}
/// @nodoc
class _$CustomerMerchantAccountEntityCopyWithImpl<$Res>
    implements $CustomerMerchantAccountEntityCopyWith<$Res> {
  _$CustomerMerchantAccountEntityCopyWithImpl(this._self, this._then);

  final CustomerMerchantAccountEntity _self;
  final $Res Function(CustomerMerchantAccountEntity) _then;

/// Create a copy of CustomerMerchantAccount
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? bankName = null,Object? accountName = null,Object? accountNumber = null,}) {
  return _then(CustomerMerchantAccountEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,bankName: null == bankName ? _self.bankName : bankName // ignore: cast_nullable_to_non_nullable
as String,accountName: null == accountName ? _self.accountName : accountName // ignore: cast_nullable_to_non_nullable
as String,accountNumber: null == accountNumber ? _self.accountNumber : accountNumber // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

CustomerMerchantOpen _$CustomerMerchantOpenFromJson(
  Map<String, dynamic> json
) {
    return CustomerMerchantOpenEntity.fromJson(
      json
    );
}

/// @nodoc
mixin _$CustomerMerchantOpen {

 String get id; String get day; bool get isClosed;@JsonKey(name: 'is_open_24_hours') bool get isOpen24Hours; String? get timeOpen; String? get timeClose;
/// Create a copy of CustomerMerchantOpen
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerMerchantOpenCopyWith<CustomerMerchantOpen> get copyWith => _$CustomerMerchantOpenCopyWithImpl<CustomerMerchantOpen>(this as CustomerMerchantOpen, _$identity);

  /// Serializes this CustomerMerchantOpen to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerMerchantOpen&&(identical(other.id, id) || other.id == id)&&(identical(other.day, day) || other.day == day)&&(identical(other.isClosed, isClosed) || other.isClosed == isClosed)&&(identical(other.isOpen24Hours, isOpen24Hours) || other.isOpen24Hours == isOpen24Hours)&&(identical(other.timeOpen, timeOpen) || other.timeOpen == timeOpen)&&(identical(other.timeClose, timeClose) || other.timeClose == timeClose));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,day,isClosed,isOpen24Hours,timeOpen,timeClose);

@override
String toString() {
  return 'CustomerMerchantOpen(id: $id, day: $day, isClosed: $isClosed, isOpen24Hours: $isOpen24Hours, timeOpen: $timeOpen, timeClose: $timeClose)';
}


}

/// @nodoc
abstract mixin class $CustomerMerchantOpenCopyWith<$Res>  {
  factory $CustomerMerchantOpenCopyWith(CustomerMerchantOpen value, $Res Function(CustomerMerchantOpen) _then) = _$CustomerMerchantOpenCopyWithImpl;
@useResult
$Res call({
 String id, String day, bool isClosed,@JsonKey(name: 'is_open_24_hours') bool isOpen24Hours, String? timeOpen, String? timeClose
});




}
/// @nodoc
class _$CustomerMerchantOpenCopyWithImpl<$Res>
    implements $CustomerMerchantOpenCopyWith<$Res> {
  _$CustomerMerchantOpenCopyWithImpl(this._self, this._then);

  final CustomerMerchantOpen _self;
  final $Res Function(CustomerMerchantOpen) _then;

/// Create a copy of CustomerMerchantOpen
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? day = null,Object? isClosed = null,Object? isOpen24Hours = null,Object? timeOpen = freezed,Object? timeClose = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,day: null == day ? _self.day : day // ignore: cast_nullable_to_non_nullable
as String,isClosed: null == isClosed ? _self.isClosed : isClosed // ignore: cast_nullable_to_non_nullable
as bool,isOpen24Hours: null == isOpen24Hours ? _self.isOpen24Hours : isOpen24Hours // ignore: cast_nullable_to_non_nullable
as bool,timeOpen: freezed == timeOpen ? _self.timeOpen : timeOpen // ignore: cast_nullable_to_non_nullable
as String?,timeClose: freezed == timeClose ? _self.timeClose : timeClose // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CustomerMerchantOpen].
extension CustomerMerchantOpenPatterns on CustomerMerchantOpen {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CustomerMerchantOpenEntity value)?  entity,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CustomerMerchantOpenEntity() when entity != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CustomerMerchantOpenEntity value)  entity,}){
final _that = this;
switch (_that) {
case CustomerMerchantOpenEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CustomerMerchantOpenEntity value)?  entity,}){
final _that = this;
switch (_that) {
case CustomerMerchantOpenEntity() when entity != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String id,  String day,  bool isClosed, @JsonKey(name: 'is_open_24_hours')  bool isOpen24Hours,  String? timeOpen,  String? timeClose)?  entity,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CustomerMerchantOpenEntity() when entity != null:
return entity(_that.id,_that.day,_that.isClosed,_that.isOpen24Hours,_that.timeOpen,_that.timeClose);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String id,  String day,  bool isClosed, @JsonKey(name: 'is_open_24_hours')  bool isOpen24Hours,  String? timeOpen,  String? timeClose)  entity,}) {final _that = this;
switch (_that) {
case CustomerMerchantOpenEntity():
return entity(_that.id,_that.day,_that.isClosed,_that.isOpen24Hours,_that.timeOpen,_that.timeClose);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String id,  String day,  bool isClosed, @JsonKey(name: 'is_open_24_hours')  bool isOpen24Hours,  String? timeOpen,  String? timeClose)?  entity,}) {final _that = this;
switch (_that) {
case CustomerMerchantOpenEntity() when entity != null:
return entity(_that.id,_that.day,_that.isClosed,_that.isOpen24Hours,_that.timeOpen,_that.timeClose);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class CustomerMerchantOpenEntity implements CustomerMerchantOpen {
  const CustomerMerchantOpenEntity({required this.id, required this.day, required this.isClosed, @JsonKey(name: 'is_open_24_hours') required this.isOpen24Hours, this.timeOpen, this.timeClose});
  factory CustomerMerchantOpenEntity.fromJson(Map<String, dynamic> json) => _$CustomerMerchantOpenEntityFromJson(json);

@override final  String id;
@override final  String day;
@override final  bool isClosed;
@override@JsonKey(name: 'is_open_24_hours') final  bool isOpen24Hours;
@override final  String? timeOpen;
@override final  String? timeClose;

/// Create a copy of CustomerMerchantOpen
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerMerchantOpenEntityCopyWith<CustomerMerchantOpenEntity> get copyWith => _$CustomerMerchantOpenEntityCopyWithImpl<CustomerMerchantOpenEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomerMerchantOpenEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerMerchantOpenEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.day, day) || other.day == day)&&(identical(other.isClosed, isClosed) || other.isClosed == isClosed)&&(identical(other.isOpen24Hours, isOpen24Hours) || other.isOpen24Hours == isOpen24Hours)&&(identical(other.timeOpen, timeOpen) || other.timeOpen == timeOpen)&&(identical(other.timeClose, timeClose) || other.timeClose == timeClose));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,day,isClosed,isOpen24Hours,timeOpen,timeClose);

@override
String toString() {
  return 'CustomerMerchantOpen.entity(id: $id, day: $day, isClosed: $isClosed, isOpen24Hours: $isOpen24Hours, timeOpen: $timeOpen, timeClose: $timeClose)';
}


}

/// @nodoc
abstract mixin class $CustomerMerchantOpenEntityCopyWith<$Res> implements $CustomerMerchantOpenCopyWith<$Res> {
  factory $CustomerMerchantOpenEntityCopyWith(CustomerMerchantOpenEntity value, $Res Function(CustomerMerchantOpenEntity) _then) = _$CustomerMerchantOpenEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String day, bool isClosed,@JsonKey(name: 'is_open_24_hours') bool isOpen24Hours, String? timeOpen, String? timeClose
});




}
/// @nodoc
class _$CustomerMerchantOpenEntityCopyWithImpl<$Res>
    implements $CustomerMerchantOpenEntityCopyWith<$Res> {
  _$CustomerMerchantOpenEntityCopyWithImpl(this._self, this._then);

  final CustomerMerchantOpenEntity _self;
  final $Res Function(CustomerMerchantOpenEntity) _then;

/// Create a copy of CustomerMerchantOpen
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? day = null,Object? isClosed = null,Object? isOpen24Hours = null,Object? timeOpen = freezed,Object? timeClose = freezed,}) {
  return _then(CustomerMerchantOpenEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,day: null == day ? _self.day : day // ignore: cast_nullable_to_non_nullable
as String,isClosed: null == isClosed ? _self.isClosed : isClosed // ignore: cast_nullable_to_non_nullable
as bool,isOpen24Hours: null == isOpen24Hours ? _self.isOpen24Hours : isOpen24Hours // ignore: cast_nullable_to_non_nullable
as bool,timeOpen: freezed == timeOpen ? _self.timeOpen : timeOpen // ignore: cast_nullable_to_non_nullable
as String?,timeClose: freezed == timeClose ? _self.timeClose : timeClose // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

CustomerMerchantUser _$CustomerMerchantUserFromJson(
  Map<String, dynamic> json
) {
    return CustomerMerchantUserEntity.fromJson(
      json
    );
}

/// @nodoc
mixin _$CustomerMerchantUser {

 int get id; String get name; String get email; String get phone; String? get profilePhoto;
/// Create a copy of CustomerMerchantUser
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerMerchantUserCopyWith<CustomerMerchantUser> get copyWith => _$CustomerMerchantUserCopyWithImpl<CustomerMerchantUser>(this as CustomerMerchantUser, _$identity);

  /// Serializes this CustomerMerchantUser to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerMerchantUser&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.profilePhoto, profilePhoto) || other.profilePhoto == profilePhoto));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,email,phone,profilePhoto);

@override
String toString() {
  return 'CustomerMerchantUser(id: $id, name: $name, email: $email, phone: $phone, profilePhoto: $profilePhoto)';
}


}

/// @nodoc
abstract mixin class $CustomerMerchantUserCopyWith<$Res>  {
  factory $CustomerMerchantUserCopyWith(CustomerMerchantUser value, $Res Function(CustomerMerchantUser) _then) = _$CustomerMerchantUserCopyWithImpl;
@useResult
$Res call({
 int id, String name, String email, String phone, String? profilePhoto
});




}
/// @nodoc
class _$CustomerMerchantUserCopyWithImpl<$Res>
    implements $CustomerMerchantUserCopyWith<$Res> {
  _$CustomerMerchantUserCopyWithImpl(this._self, this._then);

  final CustomerMerchantUser _self;
  final $Res Function(CustomerMerchantUser) _then;

/// Create a copy of CustomerMerchantUser
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? email = null,Object? phone = null,Object? profilePhoto = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,profilePhoto: freezed == profilePhoto ? _self.profilePhoto : profilePhoto // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CustomerMerchantUser].
extension CustomerMerchantUserPatterns on CustomerMerchantUser {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CustomerMerchantUserEntity value)?  entity,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CustomerMerchantUserEntity() when entity != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CustomerMerchantUserEntity value)  entity,}){
final _that = this;
switch (_that) {
case CustomerMerchantUserEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CustomerMerchantUserEntity value)?  entity,}){
final _that = this;
switch (_that) {
case CustomerMerchantUserEntity() when entity != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int id,  String name,  String email,  String phone,  String? profilePhoto)?  entity,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CustomerMerchantUserEntity() when entity != null:
return entity(_that.id,_that.name,_that.email,_that.phone,_that.profilePhoto);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int id,  String name,  String email,  String phone,  String? profilePhoto)  entity,}) {final _that = this;
switch (_that) {
case CustomerMerchantUserEntity():
return entity(_that.id,_that.name,_that.email,_that.phone,_that.profilePhoto);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int id,  String name,  String email,  String phone,  String? profilePhoto)?  entity,}) {final _that = this;
switch (_that) {
case CustomerMerchantUserEntity() when entity != null:
return entity(_that.id,_that.name,_that.email,_that.phone,_that.profilePhoto);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class CustomerMerchantUserEntity implements CustomerMerchantUser {
  const CustomerMerchantUserEntity({required this.id, required this.name, required this.email, required this.phone, this.profilePhoto});
  factory CustomerMerchantUserEntity.fromJson(Map<String, dynamic> json) => _$CustomerMerchantUserEntityFromJson(json);

@override final  int id;
@override final  String name;
@override final  String email;
@override final  String phone;
@override final  String? profilePhoto;

/// Create a copy of CustomerMerchantUser
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerMerchantUserEntityCopyWith<CustomerMerchantUserEntity> get copyWith => _$CustomerMerchantUserEntityCopyWithImpl<CustomerMerchantUserEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomerMerchantUserEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerMerchantUserEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.profilePhoto, profilePhoto) || other.profilePhoto == profilePhoto));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,email,phone,profilePhoto);

@override
String toString() {
  return 'CustomerMerchantUser.entity(id: $id, name: $name, email: $email, phone: $phone, profilePhoto: $profilePhoto)';
}


}

/// @nodoc
abstract mixin class $CustomerMerchantUserEntityCopyWith<$Res> implements $CustomerMerchantUserCopyWith<$Res> {
  factory $CustomerMerchantUserEntityCopyWith(CustomerMerchantUserEntity value, $Res Function(CustomerMerchantUserEntity) _then) = _$CustomerMerchantUserEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String email, String phone, String? profilePhoto
});




}
/// @nodoc
class _$CustomerMerchantUserEntityCopyWithImpl<$Res>
    implements $CustomerMerchantUserEntityCopyWith<$Res> {
  _$CustomerMerchantUserEntityCopyWithImpl(this._self, this._then);

  final CustomerMerchantUserEntity _self;
  final $Res Function(CustomerMerchantUserEntity) _then;

/// Create a copy of CustomerMerchantUser
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? email = null,Object? phone = null,Object? profilePhoto = freezed,}) {
  return _then(CustomerMerchantUserEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,profilePhoto: freezed == profilePhoto ? _self.profilePhoto : profilePhoto // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
