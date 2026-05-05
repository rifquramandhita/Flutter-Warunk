// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_notif_item_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CustomerNotifItemEntity {

 String get id; String get title; String get body; NotifType get type; bool get isRead; String get timeLabel;// Main thumbnail
 bool get hasStoreThumbnail; int get storeColor1; int get storeColor2; String get storeInitial;// Badge icon overlaid on thumbnail
 int get badgeIconCode; int get badgeBgColor; int get badgeIconColor;// Optional promo label
 bool get hasPromoLabel;// Optional order id
 String? get orderId;
/// Create a copy of CustomerNotifItemEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerNotifItemEntityCopyWith<CustomerNotifItemEntity> get copyWith => _$CustomerNotifItemEntityCopyWithImpl<CustomerNotifItemEntity>(this as CustomerNotifItemEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerNotifItemEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body)&&(identical(other.type, type) || other.type == type)&&(identical(other.isRead, isRead) || other.isRead == isRead)&&(identical(other.timeLabel, timeLabel) || other.timeLabel == timeLabel)&&(identical(other.hasStoreThumbnail, hasStoreThumbnail) || other.hasStoreThumbnail == hasStoreThumbnail)&&(identical(other.storeColor1, storeColor1) || other.storeColor1 == storeColor1)&&(identical(other.storeColor2, storeColor2) || other.storeColor2 == storeColor2)&&(identical(other.storeInitial, storeInitial) || other.storeInitial == storeInitial)&&(identical(other.badgeIconCode, badgeIconCode) || other.badgeIconCode == badgeIconCode)&&(identical(other.badgeBgColor, badgeBgColor) || other.badgeBgColor == badgeBgColor)&&(identical(other.badgeIconColor, badgeIconColor) || other.badgeIconColor == badgeIconColor)&&(identical(other.hasPromoLabel, hasPromoLabel) || other.hasPromoLabel == hasPromoLabel)&&(identical(other.orderId, orderId) || other.orderId == orderId));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,body,type,isRead,timeLabel,hasStoreThumbnail,storeColor1,storeColor2,storeInitial,badgeIconCode,badgeBgColor,badgeIconColor,hasPromoLabel,orderId);

@override
String toString() {
  return 'CustomerNotifItemEntity(id: $id, title: $title, body: $body, type: $type, isRead: $isRead, timeLabel: $timeLabel, hasStoreThumbnail: $hasStoreThumbnail, storeColor1: $storeColor1, storeColor2: $storeColor2, storeInitial: $storeInitial, badgeIconCode: $badgeIconCode, badgeBgColor: $badgeBgColor, badgeIconColor: $badgeIconColor, hasPromoLabel: $hasPromoLabel, orderId: $orderId)';
}


}

/// @nodoc
abstract mixin class $CustomerNotifItemEntityCopyWith<$Res>  {
  factory $CustomerNotifItemEntityCopyWith(CustomerNotifItemEntity value, $Res Function(CustomerNotifItemEntity) _then) = _$CustomerNotifItemEntityCopyWithImpl;
@useResult
$Res call({
 String id, String title, String body, NotifType type, bool isRead, String timeLabel, bool hasStoreThumbnail, int storeColor1, int storeColor2, String storeInitial, int badgeIconCode, int badgeBgColor, int badgeIconColor, bool hasPromoLabel, String? orderId
});




}
/// @nodoc
class _$CustomerNotifItemEntityCopyWithImpl<$Res>
    implements $CustomerNotifItemEntityCopyWith<$Res> {
  _$CustomerNotifItemEntityCopyWithImpl(this._self, this._then);

  final CustomerNotifItemEntity _self;
  final $Res Function(CustomerNotifItemEntity) _then;

/// Create a copy of CustomerNotifItemEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? body = null,Object? type = null,Object? isRead = null,Object? timeLabel = null,Object? hasStoreThumbnail = null,Object? storeColor1 = null,Object? storeColor2 = null,Object? storeInitial = null,Object? badgeIconCode = null,Object? badgeBgColor = null,Object? badgeIconColor = null,Object? hasPromoLabel = null,Object? orderId = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as NotifType,isRead: null == isRead ? _self.isRead : isRead // ignore: cast_nullable_to_non_nullable
as bool,timeLabel: null == timeLabel ? _self.timeLabel : timeLabel // ignore: cast_nullable_to_non_nullable
as String,hasStoreThumbnail: null == hasStoreThumbnail ? _self.hasStoreThumbnail : hasStoreThumbnail // ignore: cast_nullable_to_non_nullable
as bool,storeColor1: null == storeColor1 ? _self.storeColor1 : storeColor1 // ignore: cast_nullable_to_non_nullable
as int,storeColor2: null == storeColor2 ? _self.storeColor2 : storeColor2 // ignore: cast_nullable_to_non_nullable
as int,storeInitial: null == storeInitial ? _self.storeInitial : storeInitial // ignore: cast_nullable_to_non_nullable
as String,badgeIconCode: null == badgeIconCode ? _self.badgeIconCode : badgeIconCode // ignore: cast_nullable_to_non_nullable
as int,badgeBgColor: null == badgeBgColor ? _self.badgeBgColor : badgeBgColor // ignore: cast_nullable_to_non_nullable
as int,badgeIconColor: null == badgeIconColor ? _self.badgeIconColor : badgeIconColor // ignore: cast_nullable_to_non_nullable
as int,hasPromoLabel: null == hasPromoLabel ? _self.hasPromoLabel : hasPromoLabel // ignore: cast_nullable_to_non_nullable
as bool,orderId: freezed == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CustomerNotifItemEntity].
extension CustomerNotifItemEntityPatterns on CustomerNotifItemEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CustomerNotifItemEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CustomerNotifItemEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CustomerNotifItemEntity value)  $default,){
final _that = this;
switch (_that) {
case _CustomerNotifItemEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CustomerNotifItemEntity value)?  $default,){
final _that = this;
switch (_that) {
case _CustomerNotifItemEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String body,  NotifType type,  bool isRead,  String timeLabel,  bool hasStoreThumbnail,  int storeColor1,  int storeColor2,  String storeInitial,  int badgeIconCode,  int badgeBgColor,  int badgeIconColor,  bool hasPromoLabel,  String? orderId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CustomerNotifItemEntity() when $default != null:
return $default(_that.id,_that.title,_that.body,_that.type,_that.isRead,_that.timeLabel,_that.hasStoreThumbnail,_that.storeColor1,_that.storeColor2,_that.storeInitial,_that.badgeIconCode,_that.badgeBgColor,_that.badgeIconColor,_that.hasPromoLabel,_that.orderId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String body,  NotifType type,  bool isRead,  String timeLabel,  bool hasStoreThumbnail,  int storeColor1,  int storeColor2,  String storeInitial,  int badgeIconCode,  int badgeBgColor,  int badgeIconColor,  bool hasPromoLabel,  String? orderId)  $default,) {final _that = this;
switch (_that) {
case _CustomerNotifItemEntity():
return $default(_that.id,_that.title,_that.body,_that.type,_that.isRead,_that.timeLabel,_that.hasStoreThumbnail,_that.storeColor1,_that.storeColor2,_that.storeInitial,_that.badgeIconCode,_that.badgeBgColor,_that.badgeIconColor,_that.hasPromoLabel,_that.orderId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String body,  NotifType type,  bool isRead,  String timeLabel,  bool hasStoreThumbnail,  int storeColor1,  int storeColor2,  String storeInitial,  int badgeIconCode,  int badgeBgColor,  int badgeIconColor,  bool hasPromoLabel,  String? orderId)?  $default,) {final _that = this;
switch (_that) {
case _CustomerNotifItemEntity() when $default != null:
return $default(_that.id,_that.title,_that.body,_that.type,_that.isRead,_that.timeLabel,_that.hasStoreThumbnail,_that.storeColor1,_that.storeColor2,_that.storeInitial,_that.badgeIconCode,_that.badgeBgColor,_that.badgeIconColor,_that.hasPromoLabel,_that.orderId);case _:
  return null;

}
}

}

/// @nodoc


class _CustomerNotifItemEntity implements CustomerNotifItemEntity {
  const _CustomerNotifItemEntity({required this.id, required this.title, required this.body, required this.type, required this.isRead, required this.timeLabel, required this.hasStoreThumbnail, required this.storeColor1, required this.storeColor2, required this.storeInitial, required this.badgeIconCode, required this.badgeBgColor, required this.badgeIconColor, this.hasPromoLabel = false, this.orderId});
  

@override final  String id;
@override final  String title;
@override final  String body;
@override final  NotifType type;
@override final  bool isRead;
@override final  String timeLabel;
// Main thumbnail
@override final  bool hasStoreThumbnail;
@override final  int storeColor1;
@override final  int storeColor2;
@override final  String storeInitial;
// Badge icon overlaid on thumbnail
@override final  int badgeIconCode;
@override final  int badgeBgColor;
@override final  int badgeIconColor;
// Optional promo label
@override@JsonKey() final  bool hasPromoLabel;
// Optional order id
@override final  String? orderId;

/// Create a copy of CustomerNotifItemEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CustomerNotifItemEntityCopyWith<_CustomerNotifItemEntity> get copyWith => __$CustomerNotifItemEntityCopyWithImpl<_CustomerNotifItemEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CustomerNotifItemEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body)&&(identical(other.type, type) || other.type == type)&&(identical(other.isRead, isRead) || other.isRead == isRead)&&(identical(other.timeLabel, timeLabel) || other.timeLabel == timeLabel)&&(identical(other.hasStoreThumbnail, hasStoreThumbnail) || other.hasStoreThumbnail == hasStoreThumbnail)&&(identical(other.storeColor1, storeColor1) || other.storeColor1 == storeColor1)&&(identical(other.storeColor2, storeColor2) || other.storeColor2 == storeColor2)&&(identical(other.storeInitial, storeInitial) || other.storeInitial == storeInitial)&&(identical(other.badgeIconCode, badgeIconCode) || other.badgeIconCode == badgeIconCode)&&(identical(other.badgeBgColor, badgeBgColor) || other.badgeBgColor == badgeBgColor)&&(identical(other.badgeIconColor, badgeIconColor) || other.badgeIconColor == badgeIconColor)&&(identical(other.hasPromoLabel, hasPromoLabel) || other.hasPromoLabel == hasPromoLabel)&&(identical(other.orderId, orderId) || other.orderId == orderId));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,body,type,isRead,timeLabel,hasStoreThumbnail,storeColor1,storeColor2,storeInitial,badgeIconCode,badgeBgColor,badgeIconColor,hasPromoLabel,orderId);

@override
String toString() {
  return 'CustomerNotifItemEntity(id: $id, title: $title, body: $body, type: $type, isRead: $isRead, timeLabel: $timeLabel, hasStoreThumbnail: $hasStoreThumbnail, storeColor1: $storeColor1, storeColor2: $storeColor2, storeInitial: $storeInitial, badgeIconCode: $badgeIconCode, badgeBgColor: $badgeBgColor, badgeIconColor: $badgeIconColor, hasPromoLabel: $hasPromoLabel, orderId: $orderId)';
}


}

/// @nodoc
abstract mixin class _$CustomerNotifItemEntityCopyWith<$Res> implements $CustomerNotifItemEntityCopyWith<$Res> {
  factory _$CustomerNotifItemEntityCopyWith(_CustomerNotifItemEntity value, $Res Function(_CustomerNotifItemEntity) _then) = __$CustomerNotifItemEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String body, NotifType type, bool isRead, String timeLabel, bool hasStoreThumbnail, int storeColor1, int storeColor2, String storeInitial, int badgeIconCode, int badgeBgColor, int badgeIconColor, bool hasPromoLabel, String? orderId
});




}
/// @nodoc
class __$CustomerNotifItemEntityCopyWithImpl<$Res>
    implements _$CustomerNotifItemEntityCopyWith<$Res> {
  __$CustomerNotifItemEntityCopyWithImpl(this._self, this._then);

  final _CustomerNotifItemEntity _self;
  final $Res Function(_CustomerNotifItemEntity) _then;

/// Create a copy of CustomerNotifItemEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? body = null,Object? type = null,Object? isRead = null,Object? timeLabel = null,Object? hasStoreThumbnail = null,Object? storeColor1 = null,Object? storeColor2 = null,Object? storeInitial = null,Object? badgeIconCode = null,Object? badgeBgColor = null,Object? badgeIconColor = null,Object? hasPromoLabel = null,Object? orderId = freezed,}) {
  return _then(_CustomerNotifItemEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as NotifType,isRead: null == isRead ? _self.isRead : isRead // ignore: cast_nullable_to_non_nullable
as bool,timeLabel: null == timeLabel ? _self.timeLabel : timeLabel // ignore: cast_nullable_to_non_nullable
as String,hasStoreThumbnail: null == hasStoreThumbnail ? _self.hasStoreThumbnail : hasStoreThumbnail // ignore: cast_nullable_to_non_nullable
as bool,storeColor1: null == storeColor1 ? _self.storeColor1 : storeColor1 // ignore: cast_nullable_to_non_nullable
as int,storeColor2: null == storeColor2 ? _self.storeColor2 : storeColor2 // ignore: cast_nullable_to_non_nullable
as int,storeInitial: null == storeInitial ? _self.storeInitial : storeInitial // ignore: cast_nullable_to_non_nullable
as String,badgeIconCode: null == badgeIconCode ? _self.badgeIconCode : badgeIconCode // ignore: cast_nullable_to_non_nullable
as int,badgeBgColor: null == badgeBgColor ? _self.badgeBgColor : badgeBgColor // ignore: cast_nullable_to_non_nullable
as int,badgeIconColor: null == badgeIconColor ? _self.badgeIconColor : badgeIconColor // ignore: cast_nullable_to_non_nullable
as int,hasPromoLabel: null == hasPromoLabel ? _self.hasPromoLabel : hasPromoLabel // ignore: cast_nullable_to_non_nullable
as bool,orderId: freezed == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
