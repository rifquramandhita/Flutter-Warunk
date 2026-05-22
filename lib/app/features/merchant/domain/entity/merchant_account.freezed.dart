// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'merchant_account.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
MerchantAccount _$MerchantAccountFromJson(
  Map<String, dynamic> json
) {
    return MerchantAccountEntity.fromJson(
      json
    );
}

/// @nodoc
mixin _$MerchantAccount {

 String get id; String get bankName; String get accountName; String get accountNumber;
/// Create a copy of MerchantAccount
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantAccountCopyWith<MerchantAccount> get copyWith => _$MerchantAccountCopyWithImpl<MerchantAccount>(this as MerchantAccount, _$identity);

  /// Serializes this MerchantAccount to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantAccount&&(identical(other.id, id) || other.id == id)&&(identical(other.bankName, bankName) || other.bankName == bankName)&&(identical(other.accountName, accountName) || other.accountName == accountName)&&(identical(other.accountNumber, accountNumber) || other.accountNumber == accountNumber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,bankName,accountName,accountNumber);

@override
String toString() {
  return 'MerchantAccount(id: $id, bankName: $bankName, accountName: $accountName, accountNumber: $accountNumber)';
}


}

/// @nodoc
abstract mixin class $MerchantAccountCopyWith<$Res>  {
  factory $MerchantAccountCopyWith(MerchantAccount value, $Res Function(MerchantAccount) _then) = _$MerchantAccountCopyWithImpl;
@useResult
$Res call({
 String id, String bankName, String accountName, String accountNumber
});




}
/// @nodoc
class _$MerchantAccountCopyWithImpl<$Res>
    implements $MerchantAccountCopyWith<$Res> {
  _$MerchantAccountCopyWithImpl(this._self, this._then);

  final MerchantAccount _self;
  final $Res Function(MerchantAccount) _then;

/// Create a copy of MerchantAccount
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? bankName = null,Object? accountName = null,Object? accountNumber = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,bankName: null == bankName ? _self.bankName : bankName // ignore: cast_nullable_to_non_nullable
as String,accountName: null == accountName ? _self.accountName : accountName // ignore: cast_nullable_to_non_nullable
as String,accountNumber: null == accountNumber ? _self.accountNumber : accountNumber // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MerchantAccount].
extension MerchantAccountPatterns on MerchantAccount {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MerchantAccountEntity value)?  entity,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MerchantAccountEntity() when entity != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MerchantAccountEntity value)  entity,}){
final _that = this;
switch (_that) {
case MerchantAccountEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MerchantAccountEntity value)?  entity,}){
final _that = this;
switch (_that) {
case MerchantAccountEntity() when entity != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String id,  String bankName,  String accountName,  String accountNumber)?  entity,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MerchantAccountEntity() when entity != null:
return entity(_that.id,_that.bankName,_that.accountName,_that.accountNumber);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String id,  String bankName,  String accountName,  String accountNumber)  entity,}) {final _that = this;
switch (_that) {
case MerchantAccountEntity():
return entity(_that.id,_that.bankName,_that.accountName,_that.accountNumber);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String id,  String bankName,  String accountName,  String accountNumber)?  entity,}) {final _that = this;
switch (_that) {
case MerchantAccountEntity() when entity != null:
return entity(_that.id,_that.bankName,_that.accountName,_that.accountNumber);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class MerchantAccountEntity implements MerchantAccount {
  const MerchantAccountEntity({required this.id, required this.bankName, required this.accountName, required this.accountNumber});
  factory MerchantAccountEntity.fromJson(Map<String, dynamic> json) => _$MerchantAccountEntityFromJson(json);

@override final  String id;
@override final  String bankName;
@override final  String accountName;
@override final  String accountNumber;

/// Create a copy of MerchantAccount
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantAccountEntityCopyWith<MerchantAccountEntity> get copyWith => _$MerchantAccountEntityCopyWithImpl<MerchantAccountEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MerchantAccountEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantAccountEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.bankName, bankName) || other.bankName == bankName)&&(identical(other.accountName, accountName) || other.accountName == accountName)&&(identical(other.accountNumber, accountNumber) || other.accountNumber == accountNumber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,bankName,accountName,accountNumber);

@override
String toString() {
  return 'MerchantAccount.entity(id: $id, bankName: $bankName, accountName: $accountName, accountNumber: $accountNumber)';
}


}

/// @nodoc
abstract mixin class $MerchantAccountEntityCopyWith<$Res> implements $MerchantAccountCopyWith<$Res> {
  factory $MerchantAccountEntityCopyWith(MerchantAccountEntity value, $Res Function(MerchantAccountEntity) _then) = _$MerchantAccountEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String bankName, String accountName, String accountNumber
});




}
/// @nodoc
class _$MerchantAccountEntityCopyWithImpl<$Res>
    implements $MerchantAccountEntityCopyWith<$Res> {
  _$MerchantAccountEntityCopyWithImpl(this._self, this._then);

  final MerchantAccountEntity _self;
  final $Res Function(MerchantAccountEntity) _then;

/// Create a copy of MerchantAccount
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? bankName = null,Object? accountName = null,Object? accountNumber = null,}) {
  return _then(MerchantAccountEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,bankName: null == bankName ? _self.bankName : bankName // ignore: cast_nullable_to_non_nullable
as String,accountName: null == accountName ? _self.accountName : accountName // ignore: cast_nullable_to_non_nullable
as String,accountNumber: null == accountNumber ? _self.accountNumber : accountNumber // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
