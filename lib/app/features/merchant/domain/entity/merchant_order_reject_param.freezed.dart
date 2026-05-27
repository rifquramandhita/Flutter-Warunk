// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'merchant_order_reject_param.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
MerchantOrderRejectParam _$MerchantOrderRejectParamFromJson(
  Map<String, dynamic> json
) {
    return MerchantOrderRejectSendParam.fromJson(
      json
    );
}

/// @nodoc
mixin _$MerchantOrderRejectParam {

 String get reason;
/// Create a copy of MerchantOrderRejectParam
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantOrderRejectParamCopyWith<MerchantOrderRejectParam> get copyWith => _$MerchantOrderRejectParamCopyWithImpl<MerchantOrderRejectParam>(this as MerchantOrderRejectParam, _$identity);

  /// Serializes this MerchantOrderRejectParam to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantOrderRejectParam&&(identical(other.reason, reason) || other.reason == reason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,reason);

@override
String toString() {
  return 'MerchantOrderRejectParam(reason: $reason)';
}


}

/// @nodoc
abstract mixin class $MerchantOrderRejectParamCopyWith<$Res>  {
  factory $MerchantOrderRejectParamCopyWith(MerchantOrderRejectParam value, $Res Function(MerchantOrderRejectParam) _then) = _$MerchantOrderRejectParamCopyWithImpl;
@useResult
$Res call({
 String reason
});




}
/// @nodoc
class _$MerchantOrderRejectParamCopyWithImpl<$Res>
    implements $MerchantOrderRejectParamCopyWith<$Res> {
  _$MerchantOrderRejectParamCopyWithImpl(this._self, this._then);

  final MerchantOrderRejectParam _self;
  final $Res Function(MerchantOrderRejectParam) _then;

/// Create a copy of MerchantOrderRejectParam
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? reason = null,}) {
  return _then(_self.copyWith(
reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MerchantOrderRejectParam].
extension MerchantOrderRejectParamPatterns on MerchantOrderRejectParam {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MerchantOrderRejectSendParam value)?  sendParam,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MerchantOrderRejectSendParam() when sendParam != null:
return sendParam(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MerchantOrderRejectSendParam value)  sendParam,}){
final _that = this;
switch (_that) {
case MerchantOrderRejectSendParam():
return sendParam(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MerchantOrderRejectSendParam value)?  sendParam,}){
final _that = this;
switch (_that) {
case MerchantOrderRejectSendParam() when sendParam != null:
return sendParam(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String reason)?  sendParam,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MerchantOrderRejectSendParam() when sendParam != null:
return sendParam(_that.reason);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String reason)  sendParam,}) {final _that = this;
switch (_that) {
case MerchantOrderRejectSendParam():
return sendParam(_that.reason);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String reason)?  sendParam,}) {final _that = this;
switch (_that) {
case MerchantOrderRejectSendParam() when sendParam != null:
return sendParam(_that.reason);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class MerchantOrderRejectSendParam implements MerchantOrderRejectParam {
  const MerchantOrderRejectSendParam({required this.reason});
  factory MerchantOrderRejectSendParam.fromJson(Map<String, dynamic> json) => _$MerchantOrderRejectSendParamFromJson(json);

@override final  String reason;

/// Create a copy of MerchantOrderRejectParam
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantOrderRejectSendParamCopyWith<MerchantOrderRejectSendParam> get copyWith => _$MerchantOrderRejectSendParamCopyWithImpl<MerchantOrderRejectSendParam>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MerchantOrderRejectSendParamToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantOrderRejectSendParam&&(identical(other.reason, reason) || other.reason == reason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,reason);

@override
String toString() {
  return 'MerchantOrderRejectParam.sendParam(reason: $reason)';
}


}

/// @nodoc
abstract mixin class $MerchantOrderRejectSendParamCopyWith<$Res> implements $MerchantOrderRejectParamCopyWith<$Res> {
  factory $MerchantOrderRejectSendParamCopyWith(MerchantOrderRejectSendParam value, $Res Function(MerchantOrderRejectSendParam) _then) = _$MerchantOrderRejectSendParamCopyWithImpl;
@override @useResult
$Res call({
 String reason
});




}
/// @nodoc
class _$MerchantOrderRejectSendParamCopyWithImpl<$Res>
    implements $MerchantOrderRejectSendParamCopyWith<$Res> {
  _$MerchantOrderRejectSendParamCopyWithImpl(this._self, this._then);

  final MerchantOrderRejectSendParam _self;
  final $Res Function(MerchantOrderRejectSendParam) _then;

/// Create a copy of MerchantOrderRejectParam
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? reason = null,}) {
  return _then(MerchantOrderRejectSendParam(
reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
