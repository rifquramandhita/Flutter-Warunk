// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'merchant_order_next_action.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
MerchantOrderNextAction _$MerchantOrderNextActionFromJson(
  Map<String, dynamic> json
) {
    return MerchantOrderNextActionEntity.fromJson(
      json
    );
}

/// @nodoc
mixin _$MerchantOrderNextAction {

 String? get key; String? get label; String? get method; String? get url;
/// Create a copy of MerchantOrderNextAction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantOrderNextActionCopyWith<MerchantOrderNextAction> get copyWith => _$MerchantOrderNextActionCopyWithImpl<MerchantOrderNextAction>(this as MerchantOrderNextAction, _$identity);

  /// Serializes this MerchantOrderNextAction to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantOrderNextAction&&(identical(other.key, key) || other.key == key)&&(identical(other.label, label) || other.label == label)&&(identical(other.method, method) || other.method == method)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key,label,method,url);

@override
String toString() {
  return 'MerchantOrderNextAction(key: $key, label: $label, method: $method, url: $url)';
}


}

/// @nodoc
abstract mixin class $MerchantOrderNextActionCopyWith<$Res>  {
  factory $MerchantOrderNextActionCopyWith(MerchantOrderNextAction value, $Res Function(MerchantOrderNextAction) _then) = _$MerchantOrderNextActionCopyWithImpl;
@useResult
$Res call({
 String? key, String? label, String? method, String? url
});




}
/// @nodoc
class _$MerchantOrderNextActionCopyWithImpl<$Res>
    implements $MerchantOrderNextActionCopyWith<$Res> {
  _$MerchantOrderNextActionCopyWithImpl(this._self, this._then);

  final MerchantOrderNextAction _self;
  final $Res Function(MerchantOrderNextAction) _then;

/// Create a copy of MerchantOrderNextAction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? key = freezed,Object? label = freezed,Object? method = freezed,Object? url = freezed,}) {
  return _then(_self.copyWith(
key: freezed == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String?,label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,method: freezed == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MerchantOrderNextAction].
extension MerchantOrderNextActionPatterns on MerchantOrderNextAction {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MerchantOrderNextActionEntity value)?  entity,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MerchantOrderNextActionEntity() when entity != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MerchantOrderNextActionEntity value)  entity,}){
final _that = this;
switch (_that) {
case MerchantOrderNextActionEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MerchantOrderNextActionEntity value)?  entity,}){
final _that = this;
switch (_that) {
case MerchantOrderNextActionEntity() when entity != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String? key,  String? label,  String? method,  String? url)?  entity,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MerchantOrderNextActionEntity() when entity != null:
return entity(_that.key,_that.label,_that.method,_that.url);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String? key,  String? label,  String? method,  String? url)  entity,}) {final _that = this;
switch (_that) {
case MerchantOrderNextActionEntity():
return entity(_that.key,_that.label,_that.method,_that.url);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String? key,  String? label,  String? method,  String? url)?  entity,}) {final _that = this;
switch (_that) {
case MerchantOrderNextActionEntity() when entity != null:
return entity(_that.key,_that.label,_that.method,_that.url);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class MerchantOrderNextActionEntity implements MerchantOrderNextAction {
  const MerchantOrderNextActionEntity({this.key, this.label, this.method, this.url});
  factory MerchantOrderNextActionEntity.fromJson(Map<String, dynamic> json) => _$MerchantOrderNextActionEntityFromJson(json);

@override final  String? key;
@override final  String? label;
@override final  String? method;
@override final  String? url;

/// Create a copy of MerchantOrderNextAction
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantOrderNextActionEntityCopyWith<MerchantOrderNextActionEntity> get copyWith => _$MerchantOrderNextActionEntityCopyWithImpl<MerchantOrderNextActionEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MerchantOrderNextActionEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantOrderNextActionEntity&&(identical(other.key, key) || other.key == key)&&(identical(other.label, label) || other.label == label)&&(identical(other.method, method) || other.method == method)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key,label,method,url);

@override
String toString() {
  return 'MerchantOrderNextAction.entity(key: $key, label: $label, method: $method, url: $url)';
}


}

/// @nodoc
abstract mixin class $MerchantOrderNextActionEntityCopyWith<$Res> implements $MerchantOrderNextActionCopyWith<$Res> {
  factory $MerchantOrderNextActionEntityCopyWith(MerchantOrderNextActionEntity value, $Res Function(MerchantOrderNextActionEntity) _then) = _$MerchantOrderNextActionEntityCopyWithImpl;
@override @useResult
$Res call({
 String? key, String? label, String? method, String? url
});




}
/// @nodoc
class _$MerchantOrderNextActionEntityCopyWithImpl<$Res>
    implements $MerchantOrderNextActionEntityCopyWith<$Res> {
  _$MerchantOrderNextActionEntityCopyWithImpl(this._self, this._then);

  final MerchantOrderNextActionEntity _self;
  final $Res Function(MerchantOrderNextActionEntity) _then;

/// Create a copy of MerchantOrderNextAction
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? key = freezed,Object? label = freezed,Object? method = freezed,Object? url = freezed,}) {
  return _then(MerchantOrderNextActionEntity(
key: freezed == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String?,label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,method: freezed == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
