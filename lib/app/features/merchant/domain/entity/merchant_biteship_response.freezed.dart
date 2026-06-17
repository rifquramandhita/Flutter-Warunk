// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'merchant_biteship_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
MerchantBiteshipResponse _$MerchantBiteshipResponseFromJson(
  Map<String, dynamic> json
) {
    return MerchantBiteshipResponseEntity.fromJson(
      json
    );
}

/// @nodoc
mixin _$MerchantBiteshipResponse {

 String? get id; num? get price; String? get object; String? get status; String? get message; bool? get success; String? get currency; String? get referenceId; String? get draftOrderId; MerchantBiteshipResponseCourierEntity? get courier;
/// Create a copy of MerchantBiteshipResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantBiteshipResponseCopyWith<MerchantBiteshipResponse> get copyWith => _$MerchantBiteshipResponseCopyWithImpl<MerchantBiteshipResponse>(this as MerchantBiteshipResponse, _$identity);

  /// Serializes this MerchantBiteshipResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantBiteshipResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.price, price) || other.price == price)&&(identical(other.object, object) || other.object == object)&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&(identical(other.success, success) || other.success == success)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.referenceId, referenceId) || other.referenceId == referenceId)&&(identical(other.draftOrderId, draftOrderId) || other.draftOrderId == draftOrderId)&&const DeepCollectionEquality().equals(other.courier, courier));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,price,object,status,message,success,currency,referenceId,draftOrderId,const DeepCollectionEquality().hash(courier));

@override
String toString() {
  return 'MerchantBiteshipResponse(id: $id, price: $price, object: $object, status: $status, message: $message, success: $success, currency: $currency, referenceId: $referenceId, draftOrderId: $draftOrderId, courier: $courier)';
}


}

/// @nodoc
abstract mixin class $MerchantBiteshipResponseCopyWith<$Res>  {
  factory $MerchantBiteshipResponseCopyWith(MerchantBiteshipResponse value, $Res Function(MerchantBiteshipResponse) _then) = _$MerchantBiteshipResponseCopyWithImpl;
@useResult
$Res call({
 String? id, num? price, String? object, String? status, String? message, bool? success, String? currency, String? referenceId, String? draftOrderId, MerchantBiteshipResponseCourierEntity? courier
});




}
/// @nodoc
class _$MerchantBiteshipResponseCopyWithImpl<$Res>
    implements $MerchantBiteshipResponseCopyWith<$Res> {
  _$MerchantBiteshipResponseCopyWithImpl(this._self, this._then);

  final MerchantBiteshipResponse _self;
  final $Res Function(MerchantBiteshipResponse) _then;

/// Create a copy of MerchantBiteshipResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? price = freezed,Object? object = freezed,Object? status = freezed,Object? message = freezed,Object? success = freezed,Object? currency = freezed,Object? referenceId = freezed,Object? draftOrderId = freezed,Object? courier = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as num?,object: freezed == object ? _self.object : object // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,referenceId: freezed == referenceId ? _self.referenceId : referenceId // ignore: cast_nullable_to_non_nullable
as String?,draftOrderId: freezed == draftOrderId ? _self.draftOrderId : draftOrderId // ignore: cast_nullable_to_non_nullable
as String?,courier: freezed == courier ? _self.courier : courier // ignore: cast_nullable_to_non_nullable
as MerchantBiteshipResponseCourierEntity?,
  ));
}

}


/// Adds pattern-matching-related methods to [MerchantBiteshipResponse].
extension MerchantBiteshipResponsePatterns on MerchantBiteshipResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MerchantBiteshipResponseEntity value)?  entity,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MerchantBiteshipResponseEntity() when entity != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MerchantBiteshipResponseEntity value)  entity,}){
final _that = this;
switch (_that) {
case MerchantBiteshipResponseEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MerchantBiteshipResponseEntity value)?  entity,}){
final _that = this;
switch (_that) {
case MerchantBiteshipResponseEntity() when entity != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String? id,  num? price,  String? object,  String? status,  String? message,  bool? success,  String? currency,  String? referenceId,  String? draftOrderId,  MerchantBiteshipResponseCourierEntity? courier)?  entity,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MerchantBiteshipResponseEntity() when entity != null:
return entity(_that.id,_that.price,_that.object,_that.status,_that.message,_that.success,_that.currency,_that.referenceId,_that.draftOrderId,_that.courier);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String? id,  num? price,  String? object,  String? status,  String? message,  bool? success,  String? currency,  String? referenceId,  String? draftOrderId,  MerchantBiteshipResponseCourierEntity? courier)  entity,}) {final _that = this;
switch (_that) {
case MerchantBiteshipResponseEntity():
return entity(_that.id,_that.price,_that.object,_that.status,_that.message,_that.success,_that.currency,_that.referenceId,_that.draftOrderId,_that.courier);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String? id,  num? price,  String? object,  String? status,  String? message,  bool? success,  String? currency,  String? referenceId,  String? draftOrderId,  MerchantBiteshipResponseCourierEntity? courier)?  entity,}) {final _that = this;
switch (_that) {
case MerchantBiteshipResponseEntity() when entity != null:
return entity(_that.id,_that.price,_that.object,_that.status,_that.message,_that.success,_that.currency,_that.referenceId,_that.draftOrderId,_that.courier);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class MerchantBiteshipResponseEntity implements MerchantBiteshipResponse {
  const MerchantBiteshipResponseEntity({this.id, this.price, this.object, this.status, this.message, this.success, this.currency, this.referenceId, this.draftOrderId, this.courier});
  factory MerchantBiteshipResponseEntity.fromJson(Map<String, dynamic> json) => _$MerchantBiteshipResponseEntityFromJson(json);

@override final  String? id;
@override final  num? price;
@override final  String? object;
@override final  String? status;
@override final  String? message;
@override final  bool? success;
@override final  String? currency;
@override final  String? referenceId;
@override final  String? draftOrderId;
@override final  MerchantBiteshipResponseCourierEntity? courier;

/// Create a copy of MerchantBiteshipResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantBiteshipResponseEntityCopyWith<MerchantBiteshipResponseEntity> get copyWith => _$MerchantBiteshipResponseEntityCopyWithImpl<MerchantBiteshipResponseEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MerchantBiteshipResponseEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantBiteshipResponseEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.price, price) || other.price == price)&&(identical(other.object, object) || other.object == object)&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&(identical(other.success, success) || other.success == success)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.referenceId, referenceId) || other.referenceId == referenceId)&&(identical(other.draftOrderId, draftOrderId) || other.draftOrderId == draftOrderId)&&const DeepCollectionEquality().equals(other.courier, courier));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,price,object,status,message,success,currency,referenceId,draftOrderId,const DeepCollectionEquality().hash(courier));

@override
String toString() {
  return 'MerchantBiteshipResponse.entity(id: $id, price: $price, object: $object, status: $status, message: $message, success: $success, currency: $currency, referenceId: $referenceId, draftOrderId: $draftOrderId, courier: $courier)';
}


}

/// @nodoc
abstract mixin class $MerchantBiteshipResponseEntityCopyWith<$Res> implements $MerchantBiteshipResponseCopyWith<$Res> {
  factory $MerchantBiteshipResponseEntityCopyWith(MerchantBiteshipResponseEntity value, $Res Function(MerchantBiteshipResponseEntity) _then) = _$MerchantBiteshipResponseEntityCopyWithImpl;
@override @useResult
$Res call({
 String? id, num? price, String? object, String? status, String? message, bool? success, String? currency, String? referenceId, String? draftOrderId, MerchantBiteshipResponseCourierEntity? courier
});




}
/// @nodoc
class _$MerchantBiteshipResponseEntityCopyWithImpl<$Res>
    implements $MerchantBiteshipResponseEntityCopyWith<$Res> {
  _$MerchantBiteshipResponseEntityCopyWithImpl(this._self, this._then);

  final MerchantBiteshipResponseEntity _self;
  final $Res Function(MerchantBiteshipResponseEntity) _then;

/// Create a copy of MerchantBiteshipResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? price = freezed,Object? object = freezed,Object? status = freezed,Object? message = freezed,Object? success = freezed,Object? currency = freezed,Object? referenceId = freezed,Object? draftOrderId = freezed,Object? courier = freezed,}) {
  return _then(MerchantBiteshipResponseEntity(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as num?,object: freezed == object ? _self.object : object // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,referenceId: freezed == referenceId ? _self.referenceId : referenceId // ignore: cast_nullable_to_non_nullable
as String?,draftOrderId: freezed == draftOrderId ? _self.draftOrderId : draftOrderId // ignore: cast_nullable_to_non_nullable
as String?,courier: freezed == courier ? _self.courier : courier // ignore: cast_nullable_to_non_nullable
as MerchantBiteshipResponseCourierEntity?,
  ));
}


}

// dart format on
