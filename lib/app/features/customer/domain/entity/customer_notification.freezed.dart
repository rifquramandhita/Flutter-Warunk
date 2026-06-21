// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_notification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
CustomerNotification _$CustomerNotificationFromJson(
  Map<String, dynamic> json
) {
    return CustomerNotificationEntity.fromJson(
      json
    );
}

/// @nodoc
mixin _$CustomerNotification {

 String get id; String? get type; String? get indicator; String? get title; String? get description; String? get actionUrl; String? get priority; Map<String, dynamic>? get data; bool get isRead; String? get readAt; String? get createdAt;
/// Create a copy of CustomerNotification
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerNotificationCopyWith<CustomerNotification> get copyWith => _$CustomerNotificationCopyWithImpl<CustomerNotification>(this as CustomerNotification, _$identity);

  /// Serializes this CustomerNotification to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerNotification&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.indicator, indicator) || other.indicator == indicator)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.actionUrl, actionUrl) || other.actionUrl == actionUrl)&&(identical(other.priority, priority) || other.priority == priority)&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.isRead, isRead) || other.isRead == isRead)&&(identical(other.readAt, readAt) || other.readAt == readAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,indicator,title,description,actionUrl,priority,const DeepCollectionEquality().hash(data),isRead,readAt,createdAt);

@override
String toString() {
  return 'CustomerNotification(id: $id, type: $type, indicator: $indicator, title: $title, description: $description, actionUrl: $actionUrl, priority: $priority, data: $data, isRead: $isRead, readAt: $readAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $CustomerNotificationCopyWith<$Res>  {
  factory $CustomerNotificationCopyWith(CustomerNotification value, $Res Function(CustomerNotification) _then) = _$CustomerNotificationCopyWithImpl;
@useResult
$Res call({
 String id, String? type, String? indicator, String? title, String? description, String? actionUrl, String? priority, Map<String, dynamic>? data, bool isRead, String? readAt, String? createdAt
});




}
/// @nodoc
class _$CustomerNotificationCopyWithImpl<$Res>
    implements $CustomerNotificationCopyWith<$Res> {
  _$CustomerNotificationCopyWithImpl(this._self, this._then);

  final CustomerNotification _self;
  final $Res Function(CustomerNotification) _then;

/// Create a copy of CustomerNotification
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = freezed,Object? indicator = freezed,Object? title = freezed,Object? description = freezed,Object? actionUrl = freezed,Object? priority = freezed,Object? data = freezed,Object? isRead = null,Object? readAt = freezed,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,indicator: freezed == indicator ? _self.indicator : indicator // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,actionUrl: freezed == actionUrl ? _self.actionUrl : actionUrl // ignore: cast_nullable_to_non_nullable
as String?,priority: freezed == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,isRead: null == isRead ? _self.isRead : isRead // ignore: cast_nullable_to_non_nullable
as bool,readAt: freezed == readAt ? _self.readAt : readAt // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CustomerNotification].
extension CustomerNotificationPatterns on CustomerNotification {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CustomerNotificationEntity value)?  entity,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CustomerNotificationEntity() when entity != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CustomerNotificationEntity value)  entity,}){
final _that = this;
switch (_that) {
case CustomerNotificationEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CustomerNotificationEntity value)?  entity,}){
final _that = this;
switch (_that) {
case CustomerNotificationEntity() when entity != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String id,  String? type,  String? indicator,  String? title,  String? description,  String? actionUrl,  String? priority,  Map<String, dynamic>? data,  bool isRead,  String? readAt,  String? createdAt)?  entity,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CustomerNotificationEntity() when entity != null:
return entity(_that.id,_that.type,_that.indicator,_that.title,_that.description,_that.actionUrl,_that.priority,_that.data,_that.isRead,_that.readAt,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String id,  String? type,  String? indicator,  String? title,  String? description,  String? actionUrl,  String? priority,  Map<String, dynamic>? data,  bool isRead,  String? readAt,  String? createdAt)  entity,}) {final _that = this;
switch (_that) {
case CustomerNotificationEntity():
return entity(_that.id,_that.type,_that.indicator,_that.title,_that.description,_that.actionUrl,_that.priority,_that.data,_that.isRead,_that.readAt,_that.createdAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String id,  String? type,  String? indicator,  String? title,  String? description,  String? actionUrl,  String? priority,  Map<String, dynamic>? data,  bool isRead,  String? readAt,  String? createdAt)?  entity,}) {final _that = this;
switch (_that) {
case CustomerNotificationEntity() when entity != null:
return entity(_that.id,_that.type,_that.indicator,_that.title,_that.description,_that.actionUrl,_that.priority,_that.data,_that.isRead,_that.readAt,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class CustomerNotificationEntity implements CustomerNotification {
  const CustomerNotificationEntity({required this.id, this.type, this.indicator, this.title, this.description, this.actionUrl, this.priority, final  Map<String, dynamic>? data, this.isRead = false, this.readAt, this.createdAt}): _data = data;
  factory CustomerNotificationEntity.fromJson(Map<String, dynamic> json) => _$CustomerNotificationEntityFromJson(json);

@override final  String id;
@override final  String? type;
@override final  String? indicator;
@override final  String? title;
@override final  String? description;
@override final  String? actionUrl;
@override final  String? priority;
 final  Map<String, dynamic>? _data;
@override Map<String, dynamic>? get data {
  final value = _data;
  if (value == null) return null;
  if (_data is EqualUnmodifiableMapView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override@JsonKey() final  bool isRead;
@override final  String? readAt;
@override final  String? createdAt;

/// Create a copy of CustomerNotification
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerNotificationEntityCopyWith<CustomerNotificationEntity> get copyWith => _$CustomerNotificationEntityCopyWithImpl<CustomerNotificationEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomerNotificationEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerNotificationEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.indicator, indicator) || other.indicator == indicator)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.actionUrl, actionUrl) || other.actionUrl == actionUrl)&&(identical(other.priority, priority) || other.priority == priority)&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.isRead, isRead) || other.isRead == isRead)&&(identical(other.readAt, readAt) || other.readAt == readAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,indicator,title,description,actionUrl,priority,const DeepCollectionEquality().hash(_data),isRead,readAt,createdAt);

@override
String toString() {
  return 'CustomerNotification.entity(id: $id, type: $type, indicator: $indicator, title: $title, description: $description, actionUrl: $actionUrl, priority: $priority, data: $data, isRead: $isRead, readAt: $readAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $CustomerNotificationEntityCopyWith<$Res> implements $CustomerNotificationCopyWith<$Res> {
  factory $CustomerNotificationEntityCopyWith(CustomerNotificationEntity value, $Res Function(CustomerNotificationEntity) _then) = _$CustomerNotificationEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String? type, String? indicator, String? title, String? description, String? actionUrl, String? priority, Map<String, dynamic>? data, bool isRead, String? readAt, String? createdAt
});




}
/// @nodoc
class _$CustomerNotificationEntityCopyWithImpl<$Res>
    implements $CustomerNotificationEntityCopyWith<$Res> {
  _$CustomerNotificationEntityCopyWithImpl(this._self, this._then);

  final CustomerNotificationEntity _self;
  final $Res Function(CustomerNotificationEntity) _then;

/// Create a copy of CustomerNotification
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = freezed,Object? indicator = freezed,Object? title = freezed,Object? description = freezed,Object? actionUrl = freezed,Object? priority = freezed,Object? data = freezed,Object? isRead = null,Object? readAt = freezed,Object? createdAt = freezed,}) {
  return _then(CustomerNotificationEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,indicator: freezed == indicator ? _self.indicator : indicator // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,actionUrl: freezed == actionUrl ? _self.actionUrl : actionUrl // ignore: cast_nullable_to_non_nullable
as String?,priority: freezed == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,isRead: null == isRead ? _self.isRead : isRead // ignore: cast_nullable_to_non_nullable
as bool,readAt: freezed == readAt ? _self.readAt : readAt // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
