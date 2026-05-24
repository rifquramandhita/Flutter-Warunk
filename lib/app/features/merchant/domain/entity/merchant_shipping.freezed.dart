// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'merchant_shipping.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
MerchantShipping _$MerchantShippingFromJson(
  Map<String, dynamic> json
) {
    return MerchantShippingUpdateParam.fromJson(
      json
    );
}

/// @nodoc
mixin _$MerchantShipping {

 bool get internalCourier; bool get instantCourier; bool get pickupAtStore; int get maxDistanceInternalCourier; List<String> get courierCodeAvailable;
/// Create a copy of MerchantShipping
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantShippingCopyWith<MerchantShipping> get copyWith => _$MerchantShippingCopyWithImpl<MerchantShipping>(this as MerchantShipping, _$identity);

  /// Serializes this MerchantShipping to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantShipping&&(identical(other.internalCourier, internalCourier) || other.internalCourier == internalCourier)&&(identical(other.instantCourier, instantCourier) || other.instantCourier == instantCourier)&&(identical(other.pickupAtStore, pickupAtStore) || other.pickupAtStore == pickupAtStore)&&(identical(other.maxDistanceInternalCourier, maxDistanceInternalCourier) || other.maxDistanceInternalCourier == maxDistanceInternalCourier)&&const DeepCollectionEquality().equals(other.courierCodeAvailable, courierCodeAvailable));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,internalCourier,instantCourier,pickupAtStore,maxDistanceInternalCourier,const DeepCollectionEquality().hash(courierCodeAvailable));

@override
String toString() {
  return 'MerchantShipping(internalCourier: $internalCourier, instantCourier: $instantCourier, pickupAtStore: $pickupAtStore, maxDistanceInternalCourier: $maxDistanceInternalCourier, courierCodeAvailable: $courierCodeAvailable)';
}


}

/// @nodoc
abstract mixin class $MerchantShippingCopyWith<$Res>  {
  factory $MerchantShippingCopyWith(MerchantShipping value, $Res Function(MerchantShipping) _then) = _$MerchantShippingCopyWithImpl;
@useResult
$Res call({
 bool internalCourier, bool instantCourier, bool pickupAtStore, int maxDistanceInternalCourier, List<String> courierCodeAvailable
});




}
/// @nodoc
class _$MerchantShippingCopyWithImpl<$Res>
    implements $MerchantShippingCopyWith<$Res> {
  _$MerchantShippingCopyWithImpl(this._self, this._then);

  final MerchantShipping _self;
  final $Res Function(MerchantShipping) _then;

/// Create a copy of MerchantShipping
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? internalCourier = null,Object? instantCourier = null,Object? pickupAtStore = null,Object? maxDistanceInternalCourier = null,Object? courierCodeAvailable = null,}) {
  return _then(_self.copyWith(
internalCourier: null == internalCourier ? _self.internalCourier : internalCourier // ignore: cast_nullable_to_non_nullable
as bool,instantCourier: null == instantCourier ? _self.instantCourier : instantCourier // ignore: cast_nullable_to_non_nullable
as bool,pickupAtStore: null == pickupAtStore ? _self.pickupAtStore : pickupAtStore // ignore: cast_nullable_to_non_nullable
as bool,maxDistanceInternalCourier: null == maxDistanceInternalCourier ? _self.maxDistanceInternalCourier : maxDistanceInternalCourier // ignore: cast_nullable_to_non_nullable
as int,courierCodeAvailable: null == courierCodeAvailable ? _self.courierCodeAvailable : courierCodeAvailable // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [MerchantShipping].
extension MerchantShippingPatterns on MerchantShipping {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MerchantShippingUpdateParam value)?  updateParam,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MerchantShippingUpdateParam() when updateParam != null:
return updateParam(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MerchantShippingUpdateParam value)  updateParam,}){
final _that = this;
switch (_that) {
case MerchantShippingUpdateParam():
return updateParam(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MerchantShippingUpdateParam value)?  updateParam,}){
final _that = this;
switch (_that) {
case MerchantShippingUpdateParam() when updateParam != null:
return updateParam(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( bool internalCourier,  bool instantCourier,  bool pickupAtStore,  int maxDistanceInternalCourier,  List<String> courierCodeAvailable)?  updateParam,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MerchantShippingUpdateParam() when updateParam != null:
return updateParam(_that.internalCourier,_that.instantCourier,_that.pickupAtStore,_that.maxDistanceInternalCourier,_that.courierCodeAvailable);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( bool internalCourier,  bool instantCourier,  bool pickupAtStore,  int maxDistanceInternalCourier,  List<String> courierCodeAvailable)  updateParam,}) {final _that = this;
switch (_that) {
case MerchantShippingUpdateParam():
return updateParam(_that.internalCourier,_that.instantCourier,_that.pickupAtStore,_that.maxDistanceInternalCourier,_that.courierCodeAvailable);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( bool internalCourier,  bool instantCourier,  bool pickupAtStore,  int maxDistanceInternalCourier,  List<String> courierCodeAvailable)?  updateParam,}) {final _that = this;
switch (_that) {
case MerchantShippingUpdateParam() when updateParam != null:
return updateParam(_that.internalCourier,_that.instantCourier,_that.pickupAtStore,_that.maxDistanceInternalCourier,_that.courierCodeAvailable);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class MerchantShippingUpdateParam implements MerchantShipping {
  const MerchantShippingUpdateParam({required this.internalCourier, required this.instantCourier, required this.pickupAtStore, required this.maxDistanceInternalCourier, required final  List<String> courierCodeAvailable}): _courierCodeAvailable = courierCodeAvailable;
  factory MerchantShippingUpdateParam.fromJson(Map<String, dynamic> json) => _$MerchantShippingUpdateParamFromJson(json);

@override final  bool internalCourier;
@override final  bool instantCourier;
@override final  bool pickupAtStore;
@override final  int maxDistanceInternalCourier;
 final  List<String> _courierCodeAvailable;
@override List<String> get courierCodeAvailable {
  if (_courierCodeAvailable is EqualUnmodifiableListView) return _courierCodeAvailable;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_courierCodeAvailable);
}


/// Create a copy of MerchantShipping
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantShippingUpdateParamCopyWith<MerchantShippingUpdateParam> get copyWith => _$MerchantShippingUpdateParamCopyWithImpl<MerchantShippingUpdateParam>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MerchantShippingUpdateParamToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantShippingUpdateParam&&(identical(other.internalCourier, internalCourier) || other.internalCourier == internalCourier)&&(identical(other.instantCourier, instantCourier) || other.instantCourier == instantCourier)&&(identical(other.pickupAtStore, pickupAtStore) || other.pickupAtStore == pickupAtStore)&&(identical(other.maxDistanceInternalCourier, maxDistanceInternalCourier) || other.maxDistanceInternalCourier == maxDistanceInternalCourier)&&const DeepCollectionEquality().equals(other._courierCodeAvailable, _courierCodeAvailable));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,internalCourier,instantCourier,pickupAtStore,maxDistanceInternalCourier,const DeepCollectionEquality().hash(_courierCodeAvailable));

@override
String toString() {
  return 'MerchantShipping.updateParam(internalCourier: $internalCourier, instantCourier: $instantCourier, pickupAtStore: $pickupAtStore, maxDistanceInternalCourier: $maxDistanceInternalCourier, courierCodeAvailable: $courierCodeAvailable)';
}


}

/// @nodoc
abstract mixin class $MerchantShippingUpdateParamCopyWith<$Res> implements $MerchantShippingCopyWith<$Res> {
  factory $MerchantShippingUpdateParamCopyWith(MerchantShippingUpdateParam value, $Res Function(MerchantShippingUpdateParam) _then) = _$MerchantShippingUpdateParamCopyWithImpl;
@override @useResult
$Res call({
 bool internalCourier, bool instantCourier, bool pickupAtStore, int maxDistanceInternalCourier, List<String> courierCodeAvailable
});




}
/// @nodoc
class _$MerchantShippingUpdateParamCopyWithImpl<$Res>
    implements $MerchantShippingUpdateParamCopyWith<$Res> {
  _$MerchantShippingUpdateParamCopyWithImpl(this._self, this._then);

  final MerchantShippingUpdateParam _self;
  final $Res Function(MerchantShippingUpdateParam) _then;

/// Create a copy of MerchantShipping
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? internalCourier = null,Object? instantCourier = null,Object? pickupAtStore = null,Object? maxDistanceInternalCourier = null,Object? courierCodeAvailable = null,}) {
  return _then(MerchantShippingUpdateParam(
internalCourier: null == internalCourier ? _self.internalCourier : internalCourier // ignore: cast_nullable_to_non_nullable
as bool,instantCourier: null == instantCourier ? _self.instantCourier : instantCourier // ignore: cast_nullable_to_non_nullable
as bool,pickupAtStore: null == pickupAtStore ? _self.pickupAtStore : pickupAtStore // ignore: cast_nullable_to_non_nullable
as bool,maxDistanceInternalCourier: null == maxDistanceInternalCourier ? _self.maxDistanceInternalCourier : maxDistanceInternalCourier // ignore: cast_nullable_to_non_nullable
as int,courierCodeAvailable: null == courierCodeAvailable ? _self._courierCodeAvailable : courierCodeAvailable // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
