// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'merchant_biteship_response_courier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
MerchantBiteshipResponseCourier _$MerchantBiteshipResponseCourierFromJson(
  Map<String, dynamic> json
) {
    return MerchantBiteshipResponseCourierEntity.fromJson(
      json
    );
}

/// @nodoc
mixin _$MerchantBiteshipResponseCourier {

 String? get link; String? get name; String? get type; String? get phone; String? get company; String? get waybillId; String? get trackingId; String? get routingCode;
/// Create a copy of MerchantBiteshipResponseCourier
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantBiteshipResponseCourierCopyWith<MerchantBiteshipResponseCourier> get copyWith => _$MerchantBiteshipResponseCourierCopyWithImpl<MerchantBiteshipResponseCourier>(this as MerchantBiteshipResponseCourier, _$identity);

  /// Serializes this MerchantBiteshipResponseCourier to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantBiteshipResponseCourier&&(identical(other.link, link) || other.link == link)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.company, company) || other.company == company)&&(identical(other.waybillId, waybillId) || other.waybillId == waybillId)&&(identical(other.trackingId, trackingId) || other.trackingId == trackingId)&&(identical(other.routingCode, routingCode) || other.routingCode == routingCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,link,name,type,phone,company,waybillId,trackingId,routingCode);

@override
String toString() {
  return 'MerchantBiteshipResponseCourier(link: $link, name: $name, type: $type, phone: $phone, company: $company, waybillId: $waybillId, trackingId: $trackingId, routingCode: $routingCode)';
}


}

/// @nodoc
abstract mixin class $MerchantBiteshipResponseCourierCopyWith<$Res>  {
  factory $MerchantBiteshipResponseCourierCopyWith(MerchantBiteshipResponseCourier value, $Res Function(MerchantBiteshipResponseCourier) _then) = _$MerchantBiteshipResponseCourierCopyWithImpl;
@useResult
$Res call({
 String? link, String? name, String? type, String? phone, String? company, String? waybillId, String? trackingId, String? routingCode
});




}
/// @nodoc
class _$MerchantBiteshipResponseCourierCopyWithImpl<$Res>
    implements $MerchantBiteshipResponseCourierCopyWith<$Res> {
  _$MerchantBiteshipResponseCourierCopyWithImpl(this._self, this._then);

  final MerchantBiteshipResponseCourier _self;
  final $Res Function(MerchantBiteshipResponseCourier) _then;

/// Create a copy of MerchantBiteshipResponseCourier
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? link = freezed,Object? name = freezed,Object? type = freezed,Object? phone = freezed,Object? company = freezed,Object? waybillId = freezed,Object? trackingId = freezed,Object? routingCode = freezed,}) {
  return _then(_self.copyWith(
link: freezed == link ? _self.link : link // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,company: freezed == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as String?,waybillId: freezed == waybillId ? _self.waybillId : waybillId // ignore: cast_nullable_to_non_nullable
as String?,trackingId: freezed == trackingId ? _self.trackingId : trackingId // ignore: cast_nullable_to_non_nullable
as String?,routingCode: freezed == routingCode ? _self.routingCode : routingCode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MerchantBiteshipResponseCourier].
extension MerchantBiteshipResponseCourierPatterns on MerchantBiteshipResponseCourier {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MerchantBiteshipResponseCourierEntity value)?  entity,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MerchantBiteshipResponseCourierEntity() when entity != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MerchantBiteshipResponseCourierEntity value)  entity,}){
final _that = this;
switch (_that) {
case MerchantBiteshipResponseCourierEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MerchantBiteshipResponseCourierEntity value)?  entity,}){
final _that = this;
switch (_that) {
case MerchantBiteshipResponseCourierEntity() when entity != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String? link,  String? name,  String? type,  String? phone,  String? company,  String? waybillId,  String? trackingId,  String? routingCode)?  entity,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MerchantBiteshipResponseCourierEntity() when entity != null:
return entity(_that.link,_that.name,_that.type,_that.phone,_that.company,_that.waybillId,_that.trackingId,_that.routingCode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String? link,  String? name,  String? type,  String? phone,  String? company,  String? waybillId,  String? trackingId,  String? routingCode)  entity,}) {final _that = this;
switch (_that) {
case MerchantBiteshipResponseCourierEntity():
return entity(_that.link,_that.name,_that.type,_that.phone,_that.company,_that.waybillId,_that.trackingId,_that.routingCode);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String? link,  String? name,  String? type,  String? phone,  String? company,  String? waybillId,  String? trackingId,  String? routingCode)?  entity,}) {final _that = this;
switch (_that) {
case MerchantBiteshipResponseCourierEntity() when entity != null:
return entity(_that.link,_that.name,_that.type,_that.phone,_that.company,_that.waybillId,_that.trackingId,_that.routingCode);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class MerchantBiteshipResponseCourierEntity implements MerchantBiteshipResponseCourier {
  const MerchantBiteshipResponseCourierEntity({this.link, this.name, this.type, this.phone, this.company, this.waybillId, this.trackingId, this.routingCode});
  factory MerchantBiteshipResponseCourierEntity.fromJson(Map<String, dynamic> json) => _$MerchantBiteshipResponseCourierEntityFromJson(json);

@override final  String? link;
@override final  String? name;
@override final  String? type;
@override final  String? phone;
@override final  String? company;
@override final  String? waybillId;
@override final  String? trackingId;
@override final  String? routingCode;

/// Create a copy of MerchantBiteshipResponseCourier
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantBiteshipResponseCourierEntityCopyWith<MerchantBiteshipResponseCourierEntity> get copyWith => _$MerchantBiteshipResponseCourierEntityCopyWithImpl<MerchantBiteshipResponseCourierEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MerchantBiteshipResponseCourierEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantBiteshipResponseCourierEntity&&(identical(other.link, link) || other.link == link)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.company, company) || other.company == company)&&(identical(other.waybillId, waybillId) || other.waybillId == waybillId)&&(identical(other.trackingId, trackingId) || other.trackingId == trackingId)&&(identical(other.routingCode, routingCode) || other.routingCode == routingCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,link,name,type,phone,company,waybillId,trackingId,routingCode);

@override
String toString() {
  return 'MerchantBiteshipResponseCourier.entity(link: $link, name: $name, type: $type, phone: $phone, company: $company, waybillId: $waybillId, trackingId: $trackingId, routingCode: $routingCode)';
}


}

/// @nodoc
abstract mixin class $MerchantBiteshipResponseCourierEntityCopyWith<$Res> implements $MerchantBiteshipResponseCourierCopyWith<$Res> {
  factory $MerchantBiteshipResponseCourierEntityCopyWith(MerchantBiteshipResponseCourierEntity value, $Res Function(MerchantBiteshipResponseCourierEntity) _then) = _$MerchantBiteshipResponseCourierEntityCopyWithImpl;
@override @useResult
$Res call({
 String? link, String? name, String? type, String? phone, String? company, String? waybillId, String? trackingId, String? routingCode
});




}
/// @nodoc
class _$MerchantBiteshipResponseCourierEntityCopyWithImpl<$Res>
    implements $MerchantBiteshipResponseCourierEntityCopyWith<$Res> {
  _$MerchantBiteshipResponseCourierEntityCopyWithImpl(this._self, this._then);

  final MerchantBiteshipResponseCourierEntity _self;
  final $Res Function(MerchantBiteshipResponseCourierEntity) _then;

/// Create a copy of MerchantBiteshipResponseCourier
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? link = freezed,Object? name = freezed,Object? type = freezed,Object? phone = freezed,Object? company = freezed,Object? waybillId = freezed,Object? trackingId = freezed,Object? routingCode = freezed,}) {
  return _then(MerchantBiteshipResponseCourierEntity(
link: freezed == link ? _self.link : link // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,company: freezed == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as String?,waybillId: freezed == waybillId ? _self.waybillId : waybillId // ignore: cast_nullable_to_non_nullable
as String?,trackingId: freezed == trackingId ? _self.trackingId : trackingId // ignore: cast_nullable_to_non_nullable
as String?,routingCode: freezed == routingCode ? _self.routingCode : routingCode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
