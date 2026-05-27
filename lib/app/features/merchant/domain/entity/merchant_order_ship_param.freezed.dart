// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'merchant_order_ship_param.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
MerchantOrderShipParam _$MerchantOrderShipParamFromJson(
  Map<String, dynamic> json
) {
    return MerchantOrderShipSendParam.fromJson(
      json
    );
}

/// @nodoc
mixin _$MerchantOrderShipParam {

 String? get driverName; String? get driverPhone; String? get trackingNumber; String? get notes;
/// Create a copy of MerchantOrderShipParam
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantOrderShipParamCopyWith<MerchantOrderShipParam> get copyWith => _$MerchantOrderShipParamCopyWithImpl<MerchantOrderShipParam>(this as MerchantOrderShipParam, _$identity);

  /// Serializes this MerchantOrderShipParam to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantOrderShipParam&&(identical(other.driverName, driverName) || other.driverName == driverName)&&(identical(other.driverPhone, driverPhone) || other.driverPhone == driverPhone)&&(identical(other.trackingNumber, trackingNumber) || other.trackingNumber == trackingNumber)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,driverName,driverPhone,trackingNumber,notes);

@override
String toString() {
  return 'MerchantOrderShipParam(driverName: $driverName, driverPhone: $driverPhone, trackingNumber: $trackingNumber, notes: $notes)';
}


}

/// @nodoc
abstract mixin class $MerchantOrderShipParamCopyWith<$Res>  {
  factory $MerchantOrderShipParamCopyWith(MerchantOrderShipParam value, $Res Function(MerchantOrderShipParam) _then) = _$MerchantOrderShipParamCopyWithImpl;
@useResult
$Res call({
 String? driverName, String? driverPhone, String? trackingNumber, String? notes
});




}
/// @nodoc
class _$MerchantOrderShipParamCopyWithImpl<$Res>
    implements $MerchantOrderShipParamCopyWith<$Res> {
  _$MerchantOrderShipParamCopyWithImpl(this._self, this._then);

  final MerchantOrderShipParam _self;
  final $Res Function(MerchantOrderShipParam) _then;

/// Create a copy of MerchantOrderShipParam
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? driverName = freezed,Object? driverPhone = freezed,Object? trackingNumber = freezed,Object? notes = freezed,}) {
  return _then(_self.copyWith(
driverName: freezed == driverName ? _self.driverName : driverName // ignore: cast_nullable_to_non_nullable
as String?,driverPhone: freezed == driverPhone ? _self.driverPhone : driverPhone // ignore: cast_nullable_to_non_nullable
as String?,trackingNumber: freezed == trackingNumber ? _self.trackingNumber : trackingNumber // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MerchantOrderShipParam].
extension MerchantOrderShipParamPatterns on MerchantOrderShipParam {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MerchantOrderShipSendParam value)?  sendParam,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MerchantOrderShipSendParam() when sendParam != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MerchantOrderShipSendParam value)  sendParam,}){
final _that = this;
switch (_that) {
case MerchantOrderShipSendParam():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MerchantOrderShipSendParam value)?  sendParam,}){
final _that = this;
switch (_that) {
case MerchantOrderShipSendParam() when sendParam != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String? driverName,  String? driverPhone,  String? trackingNumber,  String? notes)?  sendParam,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MerchantOrderShipSendParam() when sendParam != null:
return sendParam(_that.driverName,_that.driverPhone,_that.trackingNumber,_that.notes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String? driverName,  String? driverPhone,  String? trackingNumber,  String? notes)  sendParam,}) {final _that = this;
switch (_that) {
case MerchantOrderShipSendParam():
return sendParam(_that.driverName,_that.driverPhone,_that.trackingNumber,_that.notes);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String? driverName,  String? driverPhone,  String? trackingNumber,  String? notes)?  sendParam,}) {final _that = this;
switch (_that) {
case MerchantOrderShipSendParam() when sendParam != null:
return sendParam(_that.driverName,_that.driverPhone,_that.trackingNumber,_that.notes);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class MerchantOrderShipSendParam implements MerchantOrderShipParam {
  const MerchantOrderShipSendParam({this.driverName, this.driverPhone, this.trackingNumber, this.notes});
  factory MerchantOrderShipSendParam.fromJson(Map<String, dynamic> json) => _$MerchantOrderShipSendParamFromJson(json);

@override final  String? driverName;
@override final  String? driverPhone;
@override final  String? trackingNumber;
@override final  String? notes;

/// Create a copy of MerchantOrderShipParam
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantOrderShipSendParamCopyWith<MerchantOrderShipSendParam> get copyWith => _$MerchantOrderShipSendParamCopyWithImpl<MerchantOrderShipSendParam>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MerchantOrderShipSendParamToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantOrderShipSendParam&&(identical(other.driverName, driverName) || other.driverName == driverName)&&(identical(other.driverPhone, driverPhone) || other.driverPhone == driverPhone)&&(identical(other.trackingNumber, trackingNumber) || other.trackingNumber == trackingNumber)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,driverName,driverPhone,trackingNumber,notes);

@override
String toString() {
  return 'MerchantOrderShipParam.sendParam(driverName: $driverName, driverPhone: $driverPhone, trackingNumber: $trackingNumber, notes: $notes)';
}


}

/// @nodoc
abstract mixin class $MerchantOrderShipSendParamCopyWith<$Res> implements $MerchantOrderShipParamCopyWith<$Res> {
  factory $MerchantOrderShipSendParamCopyWith(MerchantOrderShipSendParam value, $Res Function(MerchantOrderShipSendParam) _then) = _$MerchantOrderShipSendParamCopyWithImpl;
@override @useResult
$Res call({
 String? driverName, String? driverPhone, String? trackingNumber, String? notes
});




}
/// @nodoc
class _$MerchantOrderShipSendParamCopyWithImpl<$Res>
    implements $MerchantOrderShipSendParamCopyWith<$Res> {
  _$MerchantOrderShipSendParamCopyWithImpl(this._self, this._then);

  final MerchantOrderShipSendParam _self;
  final $Res Function(MerchantOrderShipSendParam) _then;

/// Create a copy of MerchantOrderShipParam
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? driverName = freezed,Object? driverPhone = freezed,Object? trackingNumber = freezed,Object? notes = freezed,}) {
  return _then(MerchantOrderShipSendParam(
driverName: freezed == driverName ? _self.driverName : driverName // ignore: cast_nullable_to_non_nullable
as String?,driverPhone: freezed == driverPhone ? _self.driverPhone : driverPhone // ignore: cast_nullable_to_non_nullable
as String?,trackingNumber: freezed == trackingNumber ? _self.trackingNumber : trackingNumber // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
