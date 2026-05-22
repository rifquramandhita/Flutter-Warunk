// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forgot_password.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
ForgotPassword _$ForgotPasswordFromJson(
  Map<String, dynamic> json
) {
    return ForgotPasswordParam.fromJson(
      json
    );
}

/// @nodoc
mixin _$ForgotPassword {

 String get email;
/// Create a copy of ForgotPassword
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForgotPasswordCopyWith<ForgotPassword> get copyWith => _$ForgotPasswordCopyWithImpl<ForgotPassword>(this as ForgotPassword, _$identity);

  /// Serializes this ForgotPassword to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForgotPassword&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'ForgotPassword(email: $email)';
}


}

/// @nodoc
abstract mixin class $ForgotPasswordCopyWith<$Res>  {
  factory $ForgotPasswordCopyWith(ForgotPassword value, $Res Function(ForgotPassword) _then) = _$ForgotPasswordCopyWithImpl;
@useResult
$Res call({
 String email
});




}
/// @nodoc
class _$ForgotPasswordCopyWithImpl<$Res>
    implements $ForgotPasswordCopyWith<$Res> {
  _$ForgotPasswordCopyWithImpl(this._self, this._then);

  final ForgotPassword _self;
  final $Res Function(ForgotPassword) _then;

/// Create a copy of ForgotPassword
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ForgotPassword].
extension ForgotPasswordPatterns on ForgotPassword {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ForgotPasswordParam value)?  param,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ForgotPasswordParam() when param != null:
return param(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ForgotPasswordParam value)  param,}){
final _that = this;
switch (_that) {
case ForgotPasswordParam():
return param(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ForgotPasswordParam value)?  param,}){
final _that = this;
switch (_that) {
case ForgotPasswordParam() when param != null:
return param(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String email)?  param,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ForgotPasswordParam() when param != null:
return param(_that.email);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String email)  param,}) {final _that = this;
switch (_that) {
case ForgotPasswordParam():
return param(_that.email);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String email)?  param,}) {final _that = this;
switch (_that) {
case ForgotPasswordParam() when param != null:
return param(_that.email);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class ForgotPasswordParam implements ForgotPassword {
  const ForgotPasswordParam({required this.email});
  factory ForgotPasswordParam.fromJson(Map<String, dynamic> json) => _$ForgotPasswordParamFromJson(json);

@override final  String email;

/// Create a copy of ForgotPassword
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForgotPasswordParamCopyWith<ForgotPasswordParam> get copyWith => _$ForgotPasswordParamCopyWithImpl<ForgotPasswordParam>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ForgotPasswordParamToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForgotPasswordParam&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'ForgotPassword.param(email: $email)';
}


}

/// @nodoc
abstract mixin class $ForgotPasswordParamCopyWith<$Res> implements $ForgotPasswordCopyWith<$Res> {
  factory $ForgotPasswordParamCopyWith(ForgotPasswordParam value, $Res Function(ForgotPasswordParam) _then) = _$ForgotPasswordParamCopyWithImpl;
@override @useResult
$Res call({
 String email
});




}
/// @nodoc
class _$ForgotPasswordParamCopyWithImpl<$Res>
    implements $ForgotPasswordParamCopyWith<$Res> {
  _$ForgotPasswordParamCopyWithImpl(this._self, this._then);

  final ForgotPasswordParam _self;
  final $Res Function(ForgotPasswordParam) _then;

/// Create a copy of ForgotPassword
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,}) {
  return _then(ForgotPasswordParam(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
