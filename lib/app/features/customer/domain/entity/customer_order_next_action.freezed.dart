// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_order_next_action.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
CustomerOrderNextAction _$CustomerOrderNextActionFromJson(
  Map<String, dynamic> json
) {
    return CustomerOrderNextActionEntity.fromJson(
      json
    );
}

/// @nodoc
mixin _$CustomerOrderNextAction {

 String? get key; String? get label; String? get method; String? get url;
/// Create a copy of CustomerOrderNextAction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerOrderNextActionCopyWith<CustomerOrderNextAction> get copyWith => _$CustomerOrderNextActionCopyWithImpl<CustomerOrderNextAction>(this as CustomerOrderNextAction, _$identity);

  /// Serializes this CustomerOrderNextAction to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerOrderNextAction&&(identical(other.key, key) || other.key == key)&&(identical(other.label, label) || other.label == label)&&(identical(other.method, method) || other.method == method)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key,label,method,url);

@override
String toString() {
  return 'CustomerOrderNextAction(key: $key, label: $label, method: $method, url: $url)';
}


}

/// @nodoc
abstract mixin class $CustomerOrderNextActionCopyWith<$Res>  {
  factory $CustomerOrderNextActionCopyWith(CustomerOrderNextAction value, $Res Function(CustomerOrderNextAction) _then) = _$CustomerOrderNextActionCopyWithImpl;
@useResult
$Res call({
 String? key, String? label, String? method, String? url
});




}
/// @nodoc
class _$CustomerOrderNextActionCopyWithImpl<$Res>
    implements $CustomerOrderNextActionCopyWith<$Res> {
  _$CustomerOrderNextActionCopyWithImpl(this._self, this._then);

  final CustomerOrderNextAction _self;
  final $Res Function(CustomerOrderNextAction) _then;

/// Create a copy of CustomerOrderNextAction
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


/// Adds pattern-matching-related methods to [CustomerOrderNextAction].
extension CustomerOrderNextActionPatterns on CustomerOrderNextAction {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CustomerOrderNextActionEntity value)?  entity,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CustomerOrderNextActionEntity() when entity != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CustomerOrderNextActionEntity value)  entity,}){
final _that = this;
switch (_that) {
case CustomerOrderNextActionEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CustomerOrderNextActionEntity value)?  entity,}){
final _that = this;
switch (_that) {
case CustomerOrderNextActionEntity() when entity != null:
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
case CustomerOrderNextActionEntity() when entity != null:
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
case CustomerOrderNextActionEntity():
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
case CustomerOrderNextActionEntity() when entity != null:
return entity(_that.key,_that.label,_that.method,_that.url);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class CustomerOrderNextActionEntity implements CustomerOrderNextAction {
  const CustomerOrderNextActionEntity({this.key, this.label, this.method, this.url});
  factory CustomerOrderNextActionEntity.fromJson(Map<String, dynamic> json) => _$CustomerOrderNextActionEntityFromJson(json);

@override final  String? key;
@override final  String? label;
@override final  String? method;
@override final  String? url;

/// Create a copy of CustomerOrderNextAction
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerOrderNextActionEntityCopyWith<CustomerOrderNextActionEntity> get copyWith => _$CustomerOrderNextActionEntityCopyWithImpl<CustomerOrderNextActionEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomerOrderNextActionEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerOrderNextActionEntity&&(identical(other.key, key) || other.key == key)&&(identical(other.label, label) || other.label == label)&&(identical(other.method, method) || other.method == method)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key,label,method,url);

@override
String toString() {
  return 'CustomerOrderNextAction.entity(key: $key, label: $label, method: $method, url: $url)';
}


}

/// @nodoc
abstract mixin class $CustomerOrderNextActionEntityCopyWith<$Res> implements $CustomerOrderNextActionCopyWith<$Res> {
  factory $CustomerOrderNextActionEntityCopyWith(CustomerOrderNextActionEntity value, $Res Function(CustomerOrderNextActionEntity) _then) = _$CustomerOrderNextActionEntityCopyWithImpl;
@override @useResult
$Res call({
 String? key, String? label, String? method, String? url
});




}
/// @nodoc
class _$CustomerOrderNextActionEntityCopyWithImpl<$Res>
    implements $CustomerOrderNextActionEntityCopyWith<$Res> {
  _$CustomerOrderNextActionEntityCopyWithImpl(this._self, this._then);

  final CustomerOrderNextActionEntity _self;
  final $Res Function(CustomerOrderNextActionEntity) _then;

/// Create a copy of CustomerOrderNextAction
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? key = freezed,Object? label = freezed,Object? method = freezed,Object? url = freezed,}) {
  return _then(CustomerOrderNextActionEntity(
key: freezed == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String?,label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,method: freezed == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
