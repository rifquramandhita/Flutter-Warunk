// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'merchant_notification_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
MerchantNotificationResponse _$MerchantNotificationResponseFromJson(
  Map<String, dynamic> json
) {
    return MerchantNotificationResponseEntity.fromJson(
      json
    );
}

/// @nodoc
mixin _$MerchantNotificationResponse {

 List<MerchantNotificationEntity> get notifications; int get unreadCount; Map<String, dynamic>? get pagination;
/// Create a copy of MerchantNotificationResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantNotificationResponseCopyWith<MerchantNotificationResponse> get copyWith => _$MerchantNotificationResponseCopyWithImpl<MerchantNotificationResponse>(this as MerchantNotificationResponse, _$identity);

  /// Serializes this MerchantNotificationResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantNotificationResponse&&const DeepCollectionEquality().equals(other.notifications, notifications)&&(identical(other.unreadCount, unreadCount) || other.unreadCount == unreadCount)&&const DeepCollectionEquality().equals(other.pagination, pagination));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(notifications),unreadCount,const DeepCollectionEquality().hash(pagination));

@override
String toString() {
  return 'MerchantNotificationResponse(notifications: $notifications, unreadCount: $unreadCount, pagination: $pagination)';
}


}

/// @nodoc
abstract mixin class $MerchantNotificationResponseCopyWith<$Res>  {
  factory $MerchantNotificationResponseCopyWith(MerchantNotificationResponse value, $Res Function(MerchantNotificationResponse) _then) = _$MerchantNotificationResponseCopyWithImpl;
@useResult
$Res call({
 List<MerchantNotificationEntity> notifications, int unreadCount, Map<String, dynamic>? pagination
});




}
/// @nodoc
class _$MerchantNotificationResponseCopyWithImpl<$Res>
    implements $MerchantNotificationResponseCopyWith<$Res> {
  _$MerchantNotificationResponseCopyWithImpl(this._self, this._then);

  final MerchantNotificationResponse _self;
  final $Res Function(MerchantNotificationResponse) _then;

/// Create a copy of MerchantNotificationResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? notifications = null,Object? unreadCount = null,Object? pagination = freezed,}) {
  return _then(_self.copyWith(
notifications: null == notifications ? _self.notifications : notifications // ignore: cast_nullable_to_non_nullable
as List<MerchantNotificationEntity>,unreadCount: null == unreadCount ? _self.unreadCount : unreadCount // ignore: cast_nullable_to_non_nullable
as int,pagination: freezed == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [MerchantNotificationResponse].
extension MerchantNotificationResponsePatterns on MerchantNotificationResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MerchantNotificationResponseEntity value)?  entity,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MerchantNotificationResponseEntity() when entity != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MerchantNotificationResponseEntity value)  entity,}){
final _that = this;
switch (_that) {
case MerchantNotificationResponseEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MerchantNotificationResponseEntity value)?  entity,}){
final _that = this;
switch (_that) {
case MerchantNotificationResponseEntity() when entity != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( List<MerchantNotificationEntity> notifications,  int unreadCount,  Map<String, dynamic>? pagination)?  entity,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MerchantNotificationResponseEntity() when entity != null:
return entity(_that.notifications,_that.unreadCount,_that.pagination);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( List<MerchantNotificationEntity> notifications,  int unreadCount,  Map<String, dynamic>? pagination)  entity,}) {final _that = this;
switch (_that) {
case MerchantNotificationResponseEntity():
return entity(_that.notifications,_that.unreadCount,_that.pagination);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( List<MerchantNotificationEntity> notifications,  int unreadCount,  Map<String, dynamic>? pagination)?  entity,}) {final _that = this;
switch (_that) {
case MerchantNotificationResponseEntity() when entity != null:
return entity(_that.notifications,_that.unreadCount,_that.pagination);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class MerchantNotificationResponseEntity implements MerchantNotificationResponse {
  const MerchantNotificationResponseEntity({final  List<MerchantNotificationEntity> notifications = const [], this.unreadCount = 0, final  Map<String, dynamic>? pagination}): _notifications = notifications,_pagination = pagination;
  factory MerchantNotificationResponseEntity.fromJson(Map<String, dynamic> json) => _$MerchantNotificationResponseEntityFromJson(json);

 final  List<MerchantNotificationEntity> _notifications;
@override@JsonKey() List<MerchantNotificationEntity> get notifications {
  if (_notifications is EqualUnmodifiableListView) return _notifications;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_notifications);
}

@override@JsonKey() final  int unreadCount;
 final  Map<String, dynamic>? _pagination;
@override Map<String, dynamic>? get pagination {
  final value = _pagination;
  if (value == null) return null;
  if (_pagination is EqualUnmodifiableMapView) return _pagination;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of MerchantNotificationResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantNotificationResponseEntityCopyWith<MerchantNotificationResponseEntity> get copyWith => _$MerchantNotificationResponseEntityCopyWithImpl<MerchantNotificationResponseEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MerchantNotificationResponseEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantNotificationResponseEntity&&const DeepCollectionEquality().equals(other._notifications, _notifications)&&(identical(other.unreadCount, unreadCount) || other.unreadCount == unreadCount)&&const DeepCollectionEquality().equals(other._pagination, _pagination));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_notifications),unreadCount,const DeepCollectionEquality().hash(_pagination));

@override
String toString() {
  return 'MerchantNotificationResponse.entity(notifications: $notifications, unreadCount: $unreadCount, pagination: $pagination)';
}


}

/// @nodoc
abstract mixin class $MerchantNotificationResponseEntityCopyWith<$Res> implements $MerchantNotificationResponseCopyWith<$Res> {
  factory $MerchantNotificationResponseEntityCopyWith(MerchantNotificationResponseEntity value, $Res Function(MerchantNotificationResponseEntity) _then) = _$MerchantNotificationResponseEntityCopyWithImpl;
@override @useResult
$Res call({
 List<MerchantNotificationEntity> notifications, int unreadCount, Map<String, dynamic>? pagination
});




}
/// @nodoc
class _$MerchantNotificationResponseEntityCopyWithImpl<$Res>
    implements $MerchantNotificationResponseEntityCopyWith<$Res> {
  _$MerchantNotificationResponseEntityCopyWithImpl(this._self, this._then);

  final MerchantNotificationResponseEntity _self;
  final $Res Function(MerchantNotificationResponseEntity) _then;

/// Create a copy of MerchantNotificationResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? notifications = null,Object? unreadCount = null,Object? pagination = freezed,}) {
  return _then(MerchantNotificationResponseEntity(
notifications: null == notifications ? _self._notifications : notifications // ignore: cast_nullable_to_non_nullable
as List<MerchantNotificationEntity>,unreadCount: null == unreadCount ? _self.unreadCount : unreadCount // ignore: cast_nullable_to_non_nullable
as int,pagination: freezed == pagination ? _self._pagination : pagination // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}

// dart format on
