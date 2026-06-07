// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
Login _$LoginFromJson(
  Map<String, dynamic> json
) {
    return LoginParam.fromJson(
      json
    );
}

/// @nodoc
mixin _$Login {

 String get email; String get password; String get fcmToken; String get apkVersion; String get type; String get firebaseId; AuthDeviceEntity get device;
/// Create a copy of Login
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginCopyWith<Login> get copyWith => _$LoginCopyWithImpl<Login>(this as Login, _$identity);

  /// Serializes this Login to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Login&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.fcmToken, fcmToken) || other.fcmToken == fcmToken)&&(identical(other.apkVersion, apkVersion) || other.apkVersion == apkVersion)&&(identical(other.type, type) || other.type == type)&&(identical(other.firebaseId, firebaseId) || other.firebaseId == firebaseId)&&const DeepCollectionEquality().equals(other.device, device));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,password,fcmToken,apkVersion,type,firebaseId,const DeepCollectionEquality().hash(device));

@override
String toString() {
  return 'Login(email: $email, password: $password, fcmToken: $fcmToken, apkVersion: $apkVersion, type: $type, firebaseId: $firebaseId, device: $device)';
}


}

/// @nodoc
abstract mixin class $LoginCopyWith<$Res>  {
  factory $LoginCopyWith(Login value, $Res Function(Login) _then) = _$LoginCopyWithImpl;
@useResult
$Res call({
 String email, String password, String fcmToken, String apkVersion, String type, String firebaseId, AuthDeviceEntity device
});




}
/// @nodoc
class _$LoginCopyWithImpl<$Res>
    implements $LoginCopyWith<$Res> {
  _$LoginCopyWithImpl(this._self, this._then);

  final Login _self;
  final $Res Function(Login) _then;

/// Create a copy of Login
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,Object? password = null,Object? fcmToken = null,Object? apkVersion = null,Object? type = null,Object? firebaseId = null,Object? device = freezed,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,fcmToken: null == fcmToken ? _self.fcmToken : fcmToken // ignore: cast_nullable_to_non_nullable
as String,apkVersion: null == apkVersion ? _self.apkVersion : apkVersion // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,firebaseId: null == firebaseId ? _self.firebaseId : firebaseId // ignore: cast_nullable_to_non_nullable
as String,device: freezed == device ? _self.device : device // ignore: cast_nullable_to_non_nullable
as AuthDeviceEntity,
  ));
}

}


/// Adds pattern-matching-related methods to [Login].
extension LoginPatterns on Login {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoginParam value)?  param,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoginParam() when param != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoginParam value)  param,}){
final _that = this;
switch (_that) {
case LoginParam():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoginParam value)?  param,}){
final _that = this;
switch (_that) {
case LoginParam() when param != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String email,  String password,  String fcmToken,  String apkVersion,  String type,  String firebaseId,  AuthDeviceEntity device)?  param,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoginParam() when param != null:
return param(_that.email,_that.password,_that.fcmToken,_that.apkVersion,_that.type,_that.firebaseId,_that.device);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String email,  String password,  String fcmToken,  String apkVersion,  String type,  String firebaseId,  AuthDeviceEntity device)  param,}) {final _that = this;
switch (_that) {
case LoginParam():
return param(_that.email,_that.password,_that.fcmToken,_that.apkVersion,_that.type,_that.firebaseId,_that.device);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String email,  String password,  String fcmToken,  String apkVersion,  String type,  String firebaseId,  AuthDeviceEntity device)?  param,}) {final _that = this;
switch (_that) {
case LoginParam() when param != null:
return param(_that.email,_that.password,_that.fcmToken,_that.apkVersion,_that.type,_that.firebaseId,_that.device);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake)
class LoginParam implements Login {
  const LoginParam({required this.email, required this.password, required this.fcmToken, required this.apkVersion, required this.type, required this.firebaseId, required this.device});
  factory LoginParam.fromJson(Map<String, dynamic> json) => _$LoginParamFromJson(json);

@override final  String email;
@override final  String password;
@override final  String fcmToken;
@override final  String apkVersion;
@override final  String type;
@override final  String firebaseId;
@override final  AuthDeviceEntity device;

/// Create a copy of Login
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginParamCopyWith<LoginParam> get copyWith => _$LoginParamCopyWithImpl<LoginParam>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LoginParamToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginParam&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.fcmToken, fcmToken) || other.fcmToken == fcmToken)&&(identical(other.apkVersion, apkVersion) || other.apkVersion == apkVersion)&&(identical(other.type, type) || other.type == type)&&(identical(other.firebaseId, firebaseId) || other.firebaseId == firebaseId)&&const DeepCollectionEquality().equals(other.device, device));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,password,fcmToken,apkVersion,type,firebaseId,const DeepCollectionEquality().hash(device));

@override
String toString() {
  return 'Login.param(email: $email, password: $password, fcmToken: $fcmToken, apkVersion: $apkVersion, type: $type, firebaseId: $firebaseId, device: $device)';
}


}

/// @nodoc
abstract mixin class $LoginParamCopyWith<$Res> implements $LoginCopyWith<$Res> {
  factory $LoginParamCopyWith(LoginParam value, $Res Function(LoginParam) _then) = _$LoginParamCopyWithImpl;
@override @useResult
$Res call({
 String email, String password, String fcmToken, String apkVersion, String type, String firebaseId, AuthDeviceEntity device
});




}
/// @nodoc
class _$LoginParamCopyWithImpl<$Res>
    implements $LoginParamCopyWith<$Res> {
  _$LoginParamCopyWithImpl(this._self, this._then);

  final LoginParam _self;
  final $Res Function(LoginParam) _then;

/// Create a copy of Login
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,Object? fcmToken = null,Object? apkVersion = null,Object? type = null,Object? firebaseId = null,Object? device = freezed,}) {
  return _then(LoginParam(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,fcmToken: null == fcmToken ? _self.fcmToken : fcmToken // ignore: cast_nullable_to_non_nullable
as String,apkVersion: null == apkVersion ? _self.apkVersion : apkVersion // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,firebaseId: null == firebaseId ? _self.firebaseId : firebaseId // ignore: cast_nullable_to_non_nullable
as String,device: freezed == device ? _self.device : device // ignore: cast_nullable_to_non_nullable
as AuthDeviceEntity,
  ));
}


}

// dart format on
