// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'merchant_operational_hour.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
MerchantOperationalHour _$MerchantOperationalHourFromJson(
  Map<String, dynamic> json
) {
    return MerchantOperationalHourUpdateParam.fromJson(
      json
    );
}

/// @nodoc
mixin _$MerchantOperationalHour {

 bool get isOpenAllDay; bool get isOpen24Hours; String get timeOpen; String get timeClose; List<MerchantOperationalHourItemUpdateParam> get merchantOpens;
/// Create a copy of MerchantOperationalHour
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantOperationalHourCopyWith<MerchantOperationalHour> get copyWith => _$MerchantOperationalHourCopyWithImpl<MerchantOperationalHour>(this as MerchantOperationalHour, _$identity);

  /// Serializes this MerchantOperationalHour to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantOperationalHour&&(identical(other.isOpenAllDay, isOpenAllDay) || other.isOpenAllDay == isOpenAllDay)&&(identical(other.isOpen24Hours, isOpen24Hours) || other.isOpen24Hours == isOpen24Hours)&&(identical(other.timeOpen, timeOpen) || other.timeOpen == timeOpen)&&(identical(other.timeClose, timeClose) || other.timeClose == timeClose)&&const DeepCollectionEquality().equals(other.merchantOpens, merchantOpens));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isOpenAllDay,isOpen24Hours,timeOpen,timeClose,const DeepCollectionEquality().hash(merchantOpens));

@override
String toString() {
  return 'MerchantOperationalHour(isOpenAllDay: $isOpenAllDay, isOpen24Hours: $isOpen24Hours, timeOpen: $timeOpen, timeClose: $timeClose, merchantOpens: $merchantOpens)';
}


}

/// @nodoc
abstract mixin class $MerchantOperationalHourCopyWith<$Res>  {
  factory $MerchantOperationalHourCopyWith(MerchantOperationalHour value, $Res Function(MerchantOperationalHour) _then) = _$MerchantOperationalHourCopyWithImpl;
@useResult
$Res call({
 bool isOpenAllDay, bool isOpen24Hours, String timeOpen, String timeClose, List<MerchantOperationalHourItemUpdateParam> merchantOpens
});




}
/// @nodoc
class _$MerchantOperationalHourCopyWithImpl<$Res>
    implements $MerchantOperationalHourCopyWith<$Res> {
  _$MerchantOperationalHourCopyWithImpl(this._self, this._then);

  final MerchantOperationalHour _self;
  final $Res Function(MerchantOperationalHour) _then;

/// Create a copy of MerchantOperationalHour
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isOpenAllDay = null,Object? isOpen24Hours = null,Object? timeOpen = null,Object? timeClose = null,Object? merchantOpens = null,}) {
  return _then(_self.copyWith(
isOpenAllDay: null == isOpenAllDay ? _self.isOpenAllDay : isOpenAllDay // ignore: cast_nullable_to_non_nullable
as bool,isOpen24Hours: null == isOpen24Hours ? _self.isOpen24Hours : isOpen24Hours // ignore: cast_nullable_to_non_nullable
as bool,timeOpen: null == timeOpen ? _self.timeOpen : timeOpen // ignore: cast_nullable_to_non_nullable
as String,timeClose: null == timeClose ? _self.timeClose : timeClose // ignore: cast_nullable_to_non_nullable
as String,merchantOpens: null == merchantOpens ? _self.merchantOpens : merchantOpens // ignore: cast_nullable_to_non_nullable
as List<MerchantOperationalHourItemUpdateParam>,
  ));
}

}


/// Adds pattern-matching-related methods to [MerchantOperationalHour].
extension MerchantOperationalHourPatterns on MerchantOperationalHour {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MerchantOperationalHourUpdateParam value)?  updateParam,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MerchantOperationalHourUpdateParam() when updateParam != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MerchantOperationalHourUpdateParam value)  updateParam,}){
final _that = this;
switch (_that) {
case MerchantOperationalHourUpdateParam():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MerchantOperationalHourUpdateParam value)?  updateParam,}){
final _that = this;
switch (_that) {
case MerchantOperationalHourUpdateParam() when updateParam != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( bool isOpenAllDay,  bool isOpen24Hours,  String timeOpen,  String timeClose,  List<MerchantOperationalHourItemUpdateParam> merchantOpens)?  updateParam,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MerchantOperationalHourUpdateParam() when updateParam != null:
return updateParam(_that.isOpenAllDay,_that.isOpen24Hours,_that.timeOpen,_that.timeClose,_that.merchantOpens);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( bool isOpenAllDay,  bool isOpen24Hours,  String timeOpen,  String timeClose,  List<MerchantOperationalHourItemUpdateParam> merchantOpens)  updateParam,}) {final _that = this;
switch (_that) {
case MerchantOperationalHourUpdateParam():
return updateParam(_that.isOpenAllDay,_that.isOpen24Hours,_that.timeOpen,_that.timeClose,_that.merchantOpens);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( bool isOpenAllDay,  bool isOpen24Hours,  String timeOpen,  String timeClose,  List<MerchantOperationalHourItemUpdateParam> merchantOpens)?  updateParam,}) {final _that = this;
switch (_that) {
case MerchantOperationalHourUpdateParam() when updateParam != null:
return updateParam(_that.isOpenAllDay,_that.isOpen24Hours,_that.timeOpen,_that.timeClose,_that.merchantOpens);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class MerchantOperationalHourUpdateParam implements MerchantOperationalHour {
  const MerchantOperationalHourUpdateParam({required this.isOpenAllDay, required this.isOpen24Hours, required this.timeOpen, required this.timeClose, required final  List<MerchantOperationalHourItemUpdateParam> merchantOpens}): _merchantOpens = merchantOpens;
  factory MerchantOperationalHourUpdateParam.fromJson(Map<String, dynamic> json) => _$MerchantOperationalHourUpdateParamFromJson(json);

@override final  bool isOpenAllDay;
@override final  bool isOpen24Hours;
@override final  String timeOpen;
@override final  String timeClose;
 final  List<MerchantOperationalHourItemUpdateParam> _merchantOpens;
@override List<MerchantOperationalHourItemUpdateParam> get merchantOpens {
  if (_merchantOpens is EqualUnmodifiableListView) return _merchantOpens;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_merchantOpens);
}


/// Create a copy of MerchantOperationalHour
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantOperationalHourUpdateParamCopyWith<MerchantOperationalHourUpdateParam> get copyWith => _$MerchantOperationalHourUpdateParamCopyWithImpl<MerchantOperationalHourUpdateParam>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MerchantOperationalHourUpdateParamToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantOperationalHourUpdateParam&&(identical(other.isOpenAllDay, isOpenAllDay) || other.isOpenAllDay == isOpenAllDay)&&(identical(other.isOpen24Hours, isOpen24Hours) || other.isOpen24Hours == isOpen24Hours)&&(identical(other.timeOpen, timeOpen) || other.timeOpen == timeOpen)&&(identical(other.timeClose, timeClose) || other.timeClose == timeClose)&&const DeepCollectionEquality().equals(other._merchantOpens, _merchantOpens));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isOpenAllDay,isOpen24Hours,timeOpen,timeClose,const DeepCollectionEquality().hash(_merchantOpens));

@override
String toString() {
  return 'MerchantOperationalHour.updateParam(isOpenAllDay: $isOpenAllDay, isOpen24Hours: $isOpen24Hours, timeOpen: $timeOpen, timeClose: $timeClose, merchantOpens: $merchantOpens)';
}


}

/// @nodoc
abstract mixin class $MerchantOperationalHourUpdateParamCopyWith<$Res> implements $MerchantOperationalHourCopyWith<$Res> {
  factory $MerchantOperationalHourUpdateParamCopyWith(MerchantOperationalHourUpdateParam value, $Res Function(MerchantOperationalHourUpdateParam) _then) = _$MerchantOperationalHourUpdateParamCopyWithImpl;
@override @useResult
$Res call({
 bool isOpenAllDay, bool isOpen24Hours, String timeOpen, String timeClose, List<MerchantOperationalHourItemUpdateParam> merchantOpens
});




}
/// @nodoc
class _$MerchantOperationalHourUpdateParamCopyWithImpl<$Res>
    implements $MerchantOperationalHourUpdateParamCopyWith<$Res> {
  _$MerchantOperationalHourUpdateParamCopyWithImpl(this._self, this._then);

  final MerchantOperationalHourUpdateParam _self;
  final $Res Function(MerchantOperationalHourUpdateParam) _then;

/// Create a copy of MerchantOperationalHour
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isOpenAllDay = null,Object? isOpen24Hours = null,Object? timeOpen = null,Object? timeClose = null,Object? merchantOpens = null,}) {
  return _then(MerchantOperationalHourUpdateParam(
isOpenAllDay: null == isOpenAllDay ? _self.isOpenAllDay : isOpenAllDay // ignore: cast_nullable_to_non_nullable
as bool,isOpen24Hours: null == isOpen24Hours ? _self.isOpen24Hours : isOpen24Hours // ignore: cast_nullable_to_non_nullable
as bool,timeOpen: null == timeOpen ? _self.timeOpen : timeOpen // ignore: cast_nullable_to_non_nullable
as String,timeClose: null == timeClose ? _self.timeClose : timeClose // ignore: cast_nullable_to_non_nullable
as String,merchantOpens: null == merchantOpens ? _self._merchantOpens : merchantOpens // ignore: cast_nullable_to_non_nullable
as List<MerchantOperationalHourItemUpdateParam>,
  ));
}


}

// dart format on
