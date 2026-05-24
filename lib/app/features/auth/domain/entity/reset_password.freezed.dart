// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reset_password.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
ResetPassword _$ResetPasswordFromJson(
  Map<String, dynamic> json
) {
    return ResetPasswordParam.fromJson(
      json
    );
}

/// @nodoc
mixin _$ResetPassword {

@JsonKey(name: 'current_password') String get currentPassword; String get password;@JsonKey(name: 'password_confirmation') String get passwordConfirmation;
/// Create a copy of ResetPassword
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResetPasswordCopyWith<ResetPassword> get copyWith => _$ResetPasswordCopyWithImpl<ResetPassword>(this as ResetPassword, _$identity);

  /// Serializes this ResetPassword to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResetPassword&&(identical(other.currentPassword, currentPassword) || other.currentPassword == currentPassword)&&(identical(other.password, password) || other.password == password)&&(identical(other.passwordConfirmation, passwordConfirmation) || other.passwordConfirmation == passwordConfirmation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currentPassword,password,passwordConfirmation);

@override
String toString() {
  return 'ResetPassword(currentPassword: $currentPassword, password: $password, passwordConfirmation: $passwordConfirmation)';
}


}

/// @nodoc
abstract mixin class $ResetPasswordCopyWith<$Res>  {
  factory $ResetPasswordCopyWith(ResetPassword value, $Res Function(ResetPassword) _then) = _$ResetPasswordCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'current_password') String currentPassword, String password,@JsonKey(name: 'password_confirmation') String passwordConfirmation
});




}
/// @nodoc
class _$ResetPasswordCopyWithImpl<$Res>
    implements $ResetPasswordCopyWith<$Res> {
  _$ResetPasswordCopyWithImpl(this._self, this._then);

  final ResetPassword _self;
  final $Res Function(ResetPassword) _then;

/// Create a copy of ResetPassword
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentPassword = null,Object? password = null,Object? passwordConfirmation = null,}) {
  return _then(_self.copyWith(
currentPassword: null == currentPassword ? _self.currentPassword : currentPassword // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,passwordConfirmation: null == passwordConfirmation ? _self.passwordConfirmation : passwordConfirmation // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ResetPassword].
extension ResetPasswordPatterns on ResetPassword {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ResetPasswordParam value)?  param,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ResetPasswordParam() when param != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ResetPasswordParam value)  param,}){
final _that = this;
switch (_that) {
case ResetPasswordParam():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ResetPasswordParam value)?  param,}){
final _that = this;
switch (_that) {
case ResetPasswordParam() when param != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function(@JsonKey(name: 'current_password')  String currentPassword,  String password, @JsonKey(name: 'password_confirmation')  String passwordConfirmation)?  param,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ResetPasswordParam() when param != null:
return param(_that.currentPassword,_that.password,_that.passwordConfirmation);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function(@JsonKey(name: 'current_password')  String currentPassword,  String password, @JsonKey(name: 'password_confirmation')  String passwordConfirmation)  param,}) {final _that = this;
switch (_that) {
case ResetPasswordParam():
return param(_that.currentPassword,_that.password,_that.passwordConfirmation);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function(@JsonKey(name: 'current_password')  String currentPassword,  String password, @JsonKey(name: 'password_confirmation')  String passwordConfirmation)?  param,}) {final _that = this;
switch (_that) {
case ResetPasswordParam() when param != null:
return param(_that.currentPassword,_that.password,_that.passwordConfirmation);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class ResetPasswordParam implements ResetPassword {
  const ResetPasswordParam({@JsonKey(name: 'current_password') required this.currentPassword, required this.password, @JsonKey(name: 'password_confirmation') required this.passwordConfirmation});
  factory ResetPasswordParam.fromJson(Map<String, dynamic> json) => _$ResetPasswordParamFromJson(json);

@override@JsonKey(name: 'current_password') final  String currentPassword;
@override final  String password;
@override@JsonKey(name: 'password_confirmation') final  String passwordConfirmation;

/// Create a copy of ResetPassword
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResetPasswordParamCopyWith<ResetPasswordParam> get copyWith => _$ResetPasswordParamCopyWithImpl<ResetPasswordParam>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResetPasswordParamToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResetPasswordParam&&(identical(other.currentPassword, currentPassword) || other.currentPassword == currentPassword)&&(identical(other.password, password) || other.password == password)&&(identical(other.passwordConfirmation, passwordConfirmation) || other.passwordConfirmation == passwordConfirmation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currentPassword,password,passwordConfirmation);

@override
String toString() {
  return 'ResetPassword.param(currentPassword: $currentPassword, password: $password, passwordConfirmation: $passwordConfirmation)';
}


}

/// @nodoc
abstract mixin class $ResetPasswordParamCopyWith<$Res> implements $ResetPasswordCopyWith<$Res> {
  factory $ResetPasswordParamCopyWith(ResetPasswordParam value, $Res Function(ResetPasswordParam) _then) = _$ResetPasswordParamCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'current_password') String currentPassword, String password,@JsonKey(name: 'password_confirmation') String passwordConfirmation
});




}
/// @nodoc
class _$ResetPasswordParamCopyWithImpl<$Res>
    implements $ResetPasswordParamCopyWith<$Res> {
  _$ResetPasswordParamCopyWithImpl(this._self, this._then);

  final ResetPasswordParam _self;
  final $Res Function(ResetPasswordParam) _then;

/// Create a copy of ResetPassword
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentPassword = null,Object? password = null,Object? passwordConfirmation = null,}) {
  return _then(ResetPasswordParam(
currentPassword: null == currentPassword ? _self.currentPassword : currentPassword // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,passwordConfirmation: null == passwordConfirmation ? _self.passwordConfirmation : passwordConfirmation // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
