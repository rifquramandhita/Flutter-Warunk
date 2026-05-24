// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'merchant_operational_hour_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
MerchantOperationalHourItem _$MerchantOperationalHourItemFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'entity':
          return MerchantOperationalHourItemEntity.fromJson(
            json
          );
                case 'updateParam':
          return MerchantOperationalHourItemUpdateParam.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'MerchantOperationalHourItem',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$MerchantOperationalHourItem {

 String get day; bool get isClosed;@JsonKey(name: 'is_open_24_hours') bool get isOpen24Hours; String? get timeOpen; String? get timeClose;
/// Create a copy of MerchantOperationalHourItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantOperationalHourItemCopyWith<MerchantOperationalHourItem> get copyWith => _$MerchantOperationalHourItemCopyWithImpl<MerchantOperationalHourItem>(this as MerchantOperationalHourItem, _$identity);

  /// Serializes this MerchantOperationalHourItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantOperationalHourItem&&(identical(other.day, day) || other.day == day)&&(identical(other.isClosed, isClosed) || other.isClosed == isClosed)&&(identical(other.isOpen24Hours, isOpen24Hours) || other.isOpen24Hours == isOpen24Hours)&&(identical(other.timeOpen, timeOpen) || other.timeOpen == timeOpen)&&(identical(other.timeClose, timeClose) || other.timeClose == timeClose));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,day,isClosed,isOpen24Hours,timeOpen,timeClose);

@override
String toString() {
  return 'MerchantOperationalHourItem(day: $day, isClosed: $isClosed, isOpen24Hours: $isOpen24Hours, timeOpen: $timeOpen, timeClose: $timeClose)';
}


}

/// @nodoc
abstract mixin class $MerchantOperationalHourItemCopyWith<$Res>  {
  factory $MerchantOperationalHourItemCopyWith(MerchantOperationalHourItem value, $Res Function(MerchantOperationalHourItem) _then) = _$MerchantOperationalHourItemCopyWithImpl;
@useResult
$Res call({
 String day, bool isClosed,@JsonKey(name: 'is_open_24_hours') bool isOpen24Hours, String? timeOpen, String? timeClose
});




}
/// @nodoc
class _$MerchantOperationalHourItemCopyWithImpl<$Res>
    implements $MerchantOperationalHourItemCopyWith<$Res> {
  _$MerchantOperationalHourItemCopyWithImpl(this._self, this._then);

  final MerchantOperationalHourItem _self;
  final $Res Function(MerchantOperationalHourItem) _then;

/// Create a copy of MerchantOperationalHourItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? day = null,Object? isClosed = null,Object? isOpen24Hours = null,Object? timeOpen = freezed,Object? timeClose = freezed,}) {
  return _then(_self.copyWith(
day: null == day ? _self.day : day // ignore: cast_nullable_to_non_nullable
as String,isClosed: null == isClosed ? _self.isClosed : isClosed // ignore: cast_nullable_to_non_nullable
as bool,isOpen24Hours: null == isOpen24Hours ? _self.isOpen24Hours : isOpen24Hours // ignore: cast_nullable_to_non_nullable
as bool,timeOpen: freezed == timeOpen ? _self.timeOpen : timeOpen // ignore: cast_nullable_to_non_nullable
as String?,timeClose: freezed == timeClose ? _self.timeClose : timeClose // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MerchantOperationalHourItem].
extension MerchantOperationalHourItemPatterns on MerchantOperationalHourItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MerchantOperationalHourItemEntity value)?  entity,TResult Function( MerchantOperationalHourItemUpdateParam value)?  updateParam,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MerchantOperationalHourItemEntity() when entity != null:
return entity(_that);case MerchantOperationalHourItemUpdateParam() when updateParam != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MerchantOperationalHourItemEntity value)  entity,required TResult Function( MerchantOperationalHourItemUpdateParam value)  updateParam,}){
final _that = this;
switch (_that) {
case MerchantOperationalHourItemEntity():
return entity(_that);case MerchantOperationalHourItemUpdateParam():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MerchantOperationalHourItemEntity value)?  entity,TResult? Function( MerchantOperationalHourItemUpdateParam value)?  updateParam,}){
final _that = this;
switch (_that) {
case MerchantOperationalHourItemEntity() when entity != null:
return entity(_that);case MerchantOperationalHourItemUpdateParam() when updateParam != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String id,  String day,  bool isClosed, @JsonKey(name: 'is_open_24_hours')  bool isOpen24Hours,  String? timeOpen,  String? timeClose)?  entity,TResult Function( String day,  bool isClosed, @JsonKey(name: 'is_open_24_hours')  bool isOpen24Hours,  String? timeOpen,  String? timeClose)?  updateParam,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MerchantOperationalHourItemEntity() when entity != null:
return entity(_that.id,_that.day,_that.isClosed,_that.isOpen24Hours,_that.timeOpen,_that.timeClose);case MerchantOperationalHourItemUpdateParam() when updateParam != null:
return updateParam(_that.day,_that.isClosed,_that.isOpen24Hours,_that.timeOpen,_that.timeClose);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String id,  String day,  bool isClosed, @JsonKey(name: 'is_open_24_hours')  bool isOpen24Hours,  String? timeOpen,  String? timeClose)  entity,required TResult Function( String day,  bool isClosed, @JsonKey(name: 'is_open_24_hours')  bool isOpen24Hours,  String? timeOpen,  String? timeClose)  updateParam,}) {final _that = this;
switch (_that) {
case MerchantOperationalHourItemEntity():
return entity(_that.id,_that.day,_that.isClosed,_that.isOpen24Hours,_that.timeOpen,_that.timeClose);case MerchantOperationalHourItemUpdateParam():
return updateParam(_that.day,_that.isClosed,_that.isOpen24Hours,_that.timeOpen,_that.timeClose);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String id,  String day,  bool isClosed, @JsonKey(name: 'is_open_24_hours')  bool isOpen24Hours,  String? timeOpen,  String? timeClose)?  entity,TResult? Function( String day,  bool isClosed, @JsonKey(name: 'is_open_24_hours')  bool isOpen24Hours,  String? timeOpen,  String? timeClose)?  updateParam,}) {final _that = this;
switch (_that) {
case MerchantOperationalHourItemEntity() when entity != null:
return entity(_that.id,_that.day,_that.isClosed,_that.isOpen24Hours,_that.timeOpen,_that.timeClose);case MerchantOperationalHourItemUpdateParam() when updateParam != null:
return updateParam(_that.day,_that.isClosed,_that.isOpen24Hours,_that.timeOpen,_that.timeClose);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class MerchantOperationalHourItemEntity implements MerchantOperationalHourItem {
  const MerchantOperationalHourItemEntity({required this.id, required this.day, required this.isClosed, @JsonKey(name: 'is_open_24_hours') required this.isOpen24Hours, this.timeOpen, this.timeClose, final  String? $type}): $type = $type ?? 'entity';
  factory MerchantOperationalHourItemEntity.fromJson(Map<String, dynamic> json) => _$MerchantOperationalHourItemEntityFromJson(json);

 final  String id;
@override final  String day;
@override final  bool isClosed;
@override@JsonKey(name: 'is_open_24_hours') final  bool isOpen24Hours;
@override final  String? timeOpen;
@override final  String? timeClose;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of MerchantOperationalHourItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantOperationalHourItemEntityCopyWith<MerchantOperationalHourItemEntity> get copyWith => _$MerchantOperationalHourItemEntityCopyWithImpl<MerchantOperationalHourItemEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MerchantOperationalHourItemEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantOperationalHourItemEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.day, day) || other.day == day)&&(identical(other.isClosed, isClosed) || other.isClosed == isClosed)&&(identical(other.isOpen24Hours, isOpen24Hours) || other.isOpen24Hours == isOpen24Hours)&&(identical(other.timeOpen, timeOpen) || other.timeOpen == timeOpen)&&(identical(other.timeClose, timeClose) || other.timeClose == timeClose));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,day,isClosed,isOpen24Hours,timeOpen,timeClose);

@override
String toString() {
  return 'MerchantOperationalHourItem.entity(id: $id, day: $day, isClosed: $isClosed, isOpen24Hours: $isOpen24Hours, timeOpen: $timeOpen, timeClose: $timeClose)';
}


}

/// @nodoc
abstract mixin class $MerchantOperationalHourItemEntityCopyWith<$Res> implements $MerchantOperationalHourItemCopyWith<$Res> {
  factory $MerchantOperationalHourItemEntityCopyWith(MerchantOperationalHourItemEntity value, $Res Function(MerchantOperationalHourItemEntity) _then) = _$MerchantOperationalHourItemEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String day, bool isClosed,@JsonKey(name: 'is_open_24_hours') bool isOpen24Hours, String? timeOpen, String? timeClose
});




}
/// @nodoc
class _$MerchantOperationalHourItemEntityCopyWithImpl<$Res>
    implements $MerchantOperationalHourItemEntityCopyWith<$Res> {
  _$MerchantOperationalHourItemEntityCopyWithImpl(this._self, this._then);

  final MerchantOperationalHourItemEntity _self;
  final $Res Function(MerchantOperationalHourItemEntity) _then;

/// Create a copy of MerchantOperationalHourItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? day = null,Object? isClosed = null,Object? isOpen24Hours = null,Object? timeOpen = freezed,Object? timeClose = freezed,}) {
  return _then(MerchantOperationalHourItemEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,day: null == day ? _self.day : day // ignore: cast_nullable_to_non_nullable
as String,isClosed: null == isClosed ? _self.isClosed : isClosed // ignore: cast_nullable_to_non_nullable
as bool,isOpen24Hours: null == isOpen24Hours ? _self.isOpen24Hours : isOpen24Hours // ignore: cast_nullable_to_non_nullable
as bool,timeOpen: freezed == timeOpen ? _self.timeOpen : timeOpen // ignore: cast_nullable_to_non_nullable
as String?,timeClose: freezed == timeClose ? _self.timeClose : timeClose // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class MerchantOperationalHourItemUpdateParam implements MerchantOperationalHourItem {
  const MerchantOperationalHourItemUpdateParam({required this.day, required this.isClosed, @JsonKey(name: 'is_open_24_hours') required this.isOpen24Hours, this.timeOpen, this.timeClose, final  String? $type}): $type = $type ?? 'updateParam';
  factory MerchantOperationalHourItemUpdateParam.fromJson(Map<String, dynamic> json) => _$MerchantOperationalHourItemUpdateParamFromJson(json);

@override final  String day;
@override final  bool isClosed;
@override@JsonKey(name: 'is_open_24_hours') final  bool isOpen24Hours;
@override final  String? timeOpen;
@override final  String? timeClose;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of MerchantOperationalHourItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantOperationalHourItemUpdateParamCopyWith<MerchantOperationalHourItemUpdateParam> get copyWith => _$MerchantOperationalHourItemUpdateParamCopyWithImpl<MerchantOperationalHourItemUpdateParam>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MerchantOperationalHourItemUpdateParamToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantOperationalHourItemUpdateParam&&(identical(other.day, day) || other.day == day)&&(identical(other.isClosed, isClosed) || other.isClosed == isClosed)&&(identical(other.isOpen24Hours, isOpen24Hours) || other.isOpen24Hours == isOpen24Hours)&&(identical(other.timeOpen, timeOpen) || other.timeOpen == timeOpen)&&(identical(other.timeClose, timeClose) || other.timeClose == timeClose));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,day,isClosed,isOpen24Hours,timeOpen,timeClose);

@override
String toString() {
  return 'MerchantOperationalHourItem.updateParam(day: $day, isClosed: $isClosed, isOpen24Hours: $isOpen24Hours, timeOpen: $timeOpen, timeClose: $timeClose)';
}


}

/// @nodoc
abstract mixin class $MerchantOperationalHourItemUpdateParamCopyWith<$Res> implements $MerchantOperationalHourItemCopyWith<$Res> {
  factory $MerchantOperationalHourItemUpdateParamCopyWith(MerchantOperationalHourItemUpdateParam value, $Res Function(MerchantOperationalHourItemUpdateParam) _then) = _$MerchantOperationalHourItemUpdateParamCopyWithImpl;
@override @useResult
$Res call({
 String day, bool isClosed,@JsonKey(name: 'is_open_24_hours') bool isOpen24Hours, String? timeOpen, String? timeClose
});




}
/// @nodoc
class _$MerchantOperationalHourItemUpdateParamCopyWithImpl<$Res>
    implements $MerchantOperationalHourItemUpdateParamCopyWith<$Res> {
  _$MerchantOperationalHourItemUpdateParamCopyWithImpl(this._self, this._then);

  final MerchantOperationalHourItemUpdateParam _self;
  final $Res Function(MerchantOperationalHourItemUpdateParam) _then;

/// Create a copy of MerchantOperationalHourItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? day = null,Object? isClosed = null,Object? isOpen24Hours = null,Object? timeOpen = freezed,Object? timeClose = freezed,}) {
  return _then(MerchantOperationalHourItemUpdateParam(
day: null == day ? _self.day : day // ignore: cast_nullable_to_non_nullable
as String,isClosed: null == isClosed ? _self.isClosed : isClosed // ignore: cast_nullable_to_non_nullable
as bool,isOpen24Hours: null == isOpen24Hours ? _self.isOpen24Hours : isOpen24Hours // ignore: cast_nullable_to_non_nullable
as bool,timeOpen: freezed == timeOpen ? _self.timeOpen : timeOpen // ignore: cast_nullable_to_non_nullable
as String?,timeClose: freezed == timeClose ? _self.timeClose : timeClose // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
