// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
Auth _$AuthFromJson(
  Map<String, dynamic> json
) {
    return AuthEntity.fromJson(
      json
    );
}

/// @nodoc
mixin _$Auth {

 String get token; String get tokenType; UserEntity get user;
/// Create a copy of Auth
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthCopyWith<Auth> get copyWith => _$AuthCopyWithImpl<Auth>(this as Auth, _$identity);

  /// Serializes this Auth to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Auth&&(identical(other.token, token) || other.token == token)&&(identical(other.tokenType, tokenType) || other.tokenType == tokenType)&&const DeepCollectionEquality().equals(other.user, user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,token,tokenType,const DeepCollectionEquality().hash(user));

@override
String toString() {
  return 'Auth(token: $token, tokenType: $tokenType, user: $user)';
}


}

/// @nodoc
abstract mixin class $AuthCopyWith<$Res>  {
  factory $AuthCopyWith(Auth value, $Res Function(Auth) _then) = _$AuthCopyWithImpl;
@useResult
$Res call({
 String token, String tokenType, UserEntity user
});




}
/// @nodoc
class _$AuthCopyWithImpl<$Res>
    implements $AuthCopyWith<$Res> {
  _$AuthCopyWithImpl(this._self, this._then);

  final Auth _self;
  final $Res Function(Auth) _then;

/// Create a copy of Auth
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? token = null,Object? tokenType = null,Object? user = freezed,}) {
  return _then(_self.copyWith(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,tokenType: null == tokenType ? _self.tokenType : tokenType // ignore: cast_nullable_to_non_nullable
as String,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserEntity,
  ));
}

}


/// Adds pattern-matching-related methods to [Auth].
extension AuthPatterns on Auth {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AuthEntity value)?  entity,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AuthEntity() when entity != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AuthEntity value)  entity,}){
final _that = this;
switch (_that) {
case AuthEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AuthEntity value)?  entity,}){
final _that = this;
switch (_that) {
case AuthEntity() when entity != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String token,  String tokenType,  UserEntity user)?  entity,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AuthEntity() when entity != null:
return entity(_that.token,_that.tokenType,_that.user);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String token,  String tokenType,  UserEntity user)  entity,}) {final _that = this;
switch (_that) {
case AuthEntity():
return entity(_that.token,_that.tokenType,_that.user);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String token,  String tokenType,  UserEntity user)?  entity,}) {final _that = this;
switch (_that) {
case AuthEntity() when entity != null:
return entity(_that.token,_that.tokenType,_that.user);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class AuthEntity implements Auth {
  const AuthEntity({required this.token, required this.tokenType, required this.user});
  factory AuthEntity.fromJson(Map<String, dynamic> json) => _$AuthEntityFromJson(json);

@override final  String token;
@override final  String tokenType;
@override final  UserEntity user;

/// Create a copy of Auth
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthEntityCopyWith<AuthEntity> get copyWith => _$AuthEntityCopyWithImpl<AuthEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthEntity&&(identical(other.token, token) || other.token == token)&&(identical(other.tokenType, tokenType) || other.tokenType == tokenType)&&const DeepCollectionEquality().equals(other.user, user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,token,tokenType,const DeepCollectionEquality().hash(user));

@override
String toString() {
  return 'Auth.entity(token: $token, tokenType: $tokenType, user: $user)';
}


}

/// @nodoc
abstract mixin class $AuthEntityCopyWith<$Res> implements $AuthCopyWith<$Res> {
  factory $AuthEntityCopyWith(AuthEntity value, $Res Function(AuthEntity) _then) = _$AuthEntityCopyWithImpl;
@override @useResult
$Res call({
 String token, String tokenType, UserEntity user
});




}
/// @nodoc
class _$AuthEntityCopyWithImpl<$Res>
    implements $AuthEntityCopyWith<$Res> {
  _$AuthEntityCopyWithImpl(this._self, this._then);

  final AuthEntity _self;
  final $Res Function(AuthEntity) _then;

/// Create a copy of Auth
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? token = null,Object? tokenType = null,Object? user = freezed,}) {
  return _then(AuthEntity(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,tokenType: null == tokenType ? _self.tokenType : tokenType // ignore: cast_nullable_to_non_nullable
as String,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserEntity,
  ));
}


}

// dart format on
