// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_notification_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
CustomerNotificationResponse _$CustomerNotificationResponseFromJson(
  Map<String, dynamic> json
) {
    return CustomerNotificationResponseEntity.fromJson(
      json
    );
}

/// @nodoc
mixin _$CustomerNotificationResponse {

 List<CustomerNotificationEntity> get notifications; int get unreadCount; Map<String, dynamic>? get pagination;
/// Create a copy of CustomerNotificationResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerNotificationResponseCopyWith<CustomerNotificationResponse> get copyWith => _$CustomerNotificationResponseCopyWithImpl<CustomerNotificationResponse>(this as CustomerNotificationResponse, _$identity);

  /// Serializes this CustomerNotificationResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerNotificationResponse&&const DeepCollectionEquality().equals(other.notifications, notifications)&&(identical(other.unreadCount, unreadCount) || other.unreadCount == unreadCount)&&const DeepCollectionEquality().equals(other.pagination, pagination));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(notifications),unreadCount,const DeepCollectionEquality().hash(pagination));

@override
String toString() {
  return 'CustomerNotificationResponse(notifications: $notifications, unreadCount: $unreadCount, pagination: $pagination)';
}


}

/// @nodoc
abstract mixin class $CustomerNotificationResponseCopyWith<$Res>  {
  factory $CustomerNotificationResponseCopyWith(CustomerNotificationResponse value, $Res Function(CustomerNotificationResponse) _then) = _$CustomerNotificationResponseCopyWithImpl;
@useResult
$Res call({
 List<CustomerNotificationEntity> notifications, int unreadCount, Map<String, dynamic>? pagination
});




}
/// @nodoc
class _$CustomerNotificationResponseCopyWithImpl<$Res>
    implements $CustomerNotificationResponseCopyWith<$Res> {
  _$CustomerNotificationResponseCopyWithImpl(this._self, this._then);

  final CustomerNotificationResponse _self;
  final $Res Function(CustomerNotificationResponse) _then;

/// Create a copy of CustomerNotificationResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? notifications = null,Object? unreadCount = null,Object? pagination = freezed,}) {
  return _then(_self.copyWith(
notifications: null == notifications ? _self.notifications : notifications // ignore: cast_nullable_to_non_nullable
as List<CustomerNotificationEntity>,unreadCount: null == unreadCount ? _self.unreadCount : unreadCount // ignore: cast_nullable_to_non_nullable
as int,pagination: freezed == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [CustomerNotificationResponse].
extension CustomerNotificationResponsePatterns on CustomerNotificationResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CustomerNotificationResponseEntity value)?  entity,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CustomerNotificationResponseEntity() when entity != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CustomerNotificationResponseEntity value)  entity,}){
final _that = this;
switch (_that) {
case CustomerNotificationResponseEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CustomerNotificationResponseEntity value)?  entity,}){
final _that = this;
switch (_that) {
case CustomerNotificationResponseEntity() when entity != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( List<CustomerNotificationEntity> notifications,  int unreadCount,  Map<String, dynamic>? pagination)?  entity,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CustomerNotificationResponseEntity() when entity != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( List<CustomerNotificationEntity> notifications,  int unreadCount,  Map<String, dynamic>? pagination)  entity,}) {final _that = this;
switch (_that) {
case CustomerNotificationResponseEntity():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( List<CustomerNotificationEntity> notifications,  int unreadCount,  Map<String, dynamic>? pagination)?  entity,}) {final _that = this;
switch (_that) {
case CustomerNotificationResponseEntity() when entity != null:
return entity(_that.notifications,_that.unreadCount,_that.pagination);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class CustomerNotificationResponseEntity implements CustomerNotificationResponse {
  const CustomerNotificationResponseEntity({final  List<CustomerNotificationEntity> notifications = const [], this.unreadCount = 0, final  Map<String, dynamic>? pagination}): _notifications = notifications,_pagination = pagination;
  factory CustomerNotificationResponseEntity.fromJson(Map<String, dynamic> json) => _$CustomerNotificationResponseEntityFromJson(json);

 final  List<CustomerNotificationEntity> _notifications;
@override@JsonKey() List<CustomerNotificationEntity> get notifications {
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


/// Create a copy of CustomerNotificationResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerNotificationResponseEntityCopyWith<CustomerNotificationResponseEntity> get copyWith => _$CustomerNotificationResponseEntityCopyWithImpl<CustomerNotificationResponseEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomerNotificationResponseEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerNotificationResponseEntity&&const DeepCollectionEquality().equals(other._notifications, _notifications)&&(identical(other.unreadCount, unreadCount) || other.unreadCount == unreadCount)&&const DeepCollectionEquality().equals(other._pagination, _pagination));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_notifications),unreadCount,const DeepCollectionEquality().hash(_pagination));

@override
String toString() {
  return 'CustomerNotificationResponse.entity(notifications: $notifications, unreadCount: $unreadCount, pagination: $pagination)';
}


}

/// @nodoc
abstract mixin class $CustomerNotificationResponseEntityCopyWith<$Res> implements $CustomerNotificationResponseCopyWith<$Res> {
  factory $CustomerNotificationResponseEntityCopyWith(CustomerNotificationResponseEntity value, $Res Function(CustomerNotificationResponseEntity) _then) = _$CustomerNotificationResponseEntityCopyWithImpl;
@override @useResult
$Res call({
 List<CustomerNotificationEntity> notifications, int unreadCount, Map<String, dynamic>? pagination
});




}
/// @nodoc
class _$CustomerNotificationResponseEntityCopyWithImpl<$Res>
    implements $CustomerNotificationResponseEntityCopyWith<$Res> {
  _$CustomerNotificationResponseEntityCopyWithImpl(this._self, this._then);

  final CustomerNotificationResponseEntity _self;
  final $Res Function(CustomerNotificationResponseEntity) _then;

/// Create a copy of CustomerNotificationResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? notifications = null,Object? unreadCount = null,Object? pagination = freezed,}) {
  return _then(CustomerNotificationResponseEntity(
notifications: null == notifications ? _self._notifications : notifications // ignore: cast_nullable_to_non_nullable
as List<CustomerNotificationEntity>,unreadCount: null == unreadCount ? _self.unreadCount : unreadCount // ignore: cast_nullable_to_non_nullable
as int,pagination: freezed == pagination ? _self._pagination : pagination // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}

// dart format on
