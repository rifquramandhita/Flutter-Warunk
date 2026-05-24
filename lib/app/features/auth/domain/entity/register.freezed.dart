// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
Register _$RegisterFromJson(
  Map<String, dynamic> json
) {
    return RegisterSendParam.fromJson(
      json
    );
}

/// @nodoc
mixin _$Register {

 String get name; String get email; String get phone; String get password;@JsonKey(name: 'password_confirmation') String get passwordConfirmation;
/// Create a copy of Register
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterCopyWith<Register> get copyWith => _$RegisterCopyWithImpl<Register>(this as Register, _$identity);

  /// Serializes this Register to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Register&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.password, password) || other.password == password)&&(identical(other.passwordConfirmation, passwordConfirmation) || other.passwordConfirmation == passwordConfirmation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,email,phone,password,passwordConfirmation);

@override
String toString() {
  return 'Register(name: $name, email: $email, phone: $phone, password: $password, passwordConfirmation: $passwordConfirmation)';
}


}

/// @nodoc
abstract mixin class $RegisterCopyWith<$Res>  {
  factory $RegisterCopyWith(Register value, $Res Function(Register) _then) = _$RegisterCopyWithImpl;
@useResult
$Res call({
 String name, String email, String phone, String password,@JsonKey(name: 'password_confirmation') String passwordConfirmation
});




}
/// @nodoc
class _$RegisterCopyWithImpl<$Res>
    implements $RegisterCopyWith<$Res> {
  _$RegisterCopyWithImpl(this._self, this._then);

  final Register _self;
  final $Res Function(Register) _then;

/// Create a copy of Register
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? email = null,Object? phone = null,Object? password = null,Object? passwordConfirmation = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,passwordConfirmation: null == passwordConfirmation ? _self.passwordConfirmation : passwordConfirmation // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Register].
extension RegisterPatterns on Register {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( RegisterSendParam value)?  sendParam,required TResult orElse(),}){
final _that = this;
switch (_that) {
case RegisterSendParam() when sendParam != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( RegisterSendParam value)  sendParam,}){
final _that = this;
switch (_that) {
case RegisterSendParam():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( RegisterSendParam value)?  sendParam,}){
final _that = this;
switch (_that) {
case RegisterSendParam() when sendParam != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String name,  String email,  String phone,  String password, @JsonKey(name: 'password_confirmation')  String passwordConfirmation)?  sendParam,required TResult orElse(),}) {final _that = this;
switch (_that) {
case RegisterSendParam() when sendParam != null:
return sendParam(_that.name,_that.email,_that.phone,_that.password,_that.passwordConfirmation);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String name,  String email,  String phone,  String password, @JsonKey(name: 'password_confirmation')  String passwordConfirmation)  sendParam,}) {final _that = this;
switch (_that) {
case RegisterSendParam():
return sendParam(_that.name,_that.email,_that.phone,_that.password,_that.passwordConfirmation);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String name,  String email,  String phone,  String password, @JsonKey(name: 'password_confirmation')  String passwordConfirmation)?  sendParam,}) {final _that = this;
switch (_that) {
case RegisterSendParam() when sendParam != null:
return sendParam(_that.name,_that.email,_that.phone,_that.password,_that.passwordConfirmation);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class RegisterSendParam implements Register {
  const RegisterSendParam({required this.name, required this.email, required this.phone, required this.password, @JsonKey(name: 'password_confirmation') required this.passwordConfirmation});
  factory RegisterSendParam.fromJson(Map<String, dynamic> json) => _$RegisterSendParamFromJson(json);

@override final  String name;
@override final  String email;
@override final  String phone;
@override final  String password;
@override@JsonKey(name: 'password_confirmation') final  String passwordConfirmation;

/// Create a copy of Register
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterSendParamCopyWith<RegisterSendParam> get copyWith => _$RegisterSendParamCopyWithImpl<RegisterSendParam>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RegisterSendParamToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterSendParam&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.password, password) || other.password == password)&&(identical(other.passwordConfirmation, passwordConfirmation) || other.passwordConfirmation == passwordConfirmation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,email,phone,password,passwordConfirmation);

@override
String toString() {
  return 'Register.sendParam(name: $name, email: $email, phone: $phone, password: $password, passwordConfirmation: $passwordConfirmation)';
}


}

/// @nodoc
abstract mixin class $RegisterSendParamCopyWith<$Res> implements $RegisterCopyWith<$Res> {
  factory $RegisterSendParamCopyWith(RegisterSendParam value, $Res Function(RegisterSendParam) _then) = _$RegisterSendParamCopyWithImpl;
@override @useResult
$Res call({
 String name, String email, String phone, String password,@JsonKey(name: 'password_confirmation') String passwordConfirmation
});




}
/// @nodoc
class _$RegisterSendParamCopyWithImpl<$Res>
    implements $RegisterSendParamCopyWith<$Res> {
  _$RegisterSendParamCopyWithImpl(this._self, this._then);

  final RegisterSendParam _self;
  final $Res Function(RegisterSendParam) _then;

/// Create a copy of Register
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? email = null,Object? phone = null,Object? password = null,Object? passwordConfirmation = null,}) {
  return _then(RegisterSendParam(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,passwordConfirmation: null == passwordConfirmation ? _self.passwordConfirmation : passwordConfirmation // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
