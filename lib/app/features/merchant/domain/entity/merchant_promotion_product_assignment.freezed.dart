// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'merchant_promotion_product_assignment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
MerchantPromotionProductAssignment _$MerchantPromotionProductAssignmentFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'entity':
          return MerchantPromotionProductAssignmentEntity.fromJson(
            json
          );
                case 'param':
          return MerchantPromotionProductAssignmentParamEntity.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'MerchantPromotionProductAssignment',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$MerchantPromotionProductAssignment {

 String get productId; bool get allVariant; String? get variantId;
/// Create a copy of MerchantPromotionProductAssignment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantPromotionProductAssignmentCopyWith<MerchantPromotionProductAssignment> get copyWith => _$MerchantPromotionProductAssignmentCopyWithImpl<MerchantPromotionProductAssignment>(this as MerchantPromotionProductAssignment, _$identity);

  /// Serializes this MerchantPromotionProductAssignment to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantPromotionProductAssignment&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.allVariant, allVariant) || other.allVariant == allVariant)&&(identical(other.variantId, variantId) || other.variantId == variantId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productId,allVariant,variantId);

@override
String toString() {
  return 'MerchantPromotionProductAssignment(productId: $productId, allVariant: $allVariant, variantId: $variantId)';
}


}

/// @nodoc
abstract mixin class $MerchantPromotionProductAssignmentCopyWith<$Res>  {
  factory $MerchantPromotionProductAssignmentCopyWith(MerchantPromotionProductAssignment value, $Res Function(MerchantPromotionProductAssignment) _then) = _$MerchantPromotionProductAssignmentCopyWithImpl;
@useResult
$Res call({
 String productId, bool allVariant, String? variantId
});




}
/// @nodoc
class _$MerchantPromotionProductAssignmentCopyWithImpl<$Res>
    implements $MerchantPromotionProductAssignmentCopyWith<$Res> {
  _$MerchantPromotionProductAssignmentCopyWithImpl(this._self, this._then);

  final MerchantPromotionProductAssignment _self;
  final $Res Function(MerchantPromotionProductAssignment) _then;

/// Create a copy of MerchantPromotionProductAssignment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? productId = null,Object? allVariant = null,Object? variantId = freezed,}) {
  return _then(_self.copyWith(
productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,allVariant: null == allVariant ? _self.allVariant : allVariant // ignore: cast_nullable_to_non_nullable
as bool,variantId: freezed == variantId ? _self.variantId : variantId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MerchantPromotionProductAssignment].
extension MerchantPromotionProductAssignmentPatterns on MerchantPromotionProductAssignment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MerchantPromotionProductAssignmentEntity value)?  entity,TResult Function( MerchantPromotionProductAssignmentParamEntity value)?  param,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MerchantPromotionProductAssignmentEntity() when entity != null:
return entity(_that);case MerchantPromotionProductAssignmentParamEntity() when param != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MerchantPromotionProductAssignmentEntity value)  entity,required TResult Function( MerchantPromotionProductAssignmentParamEntity value)  param,}){
final _that = this;
switch (_that) {
case MerchantPromotionProductAssignmentEntity():
return entity(_that);case MerchantPromotionProductAssignmentParamEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MerchantPromotionProductAssignmentEntity value)?  entity,TResult? Function( MerchantPromotionProductAssignmentParamEntity value)?  param,}){
final _that = this;
switch (_that) {
case MerchantPromotionProductAssignmentEntity() when entity != null:
return entity(_that);case MerchantPromotionProductAssignmentParamEntity() when param != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String id,  String productId,  String productName,  bool allVariant,  String? variantId,  String? variantLabel)?  entity,TResult Function( String productId,  bool allVariant,  String? variantId)?  param,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MerchantPromotionProductAssignmentEntity() when entity != null:
return entity(_that.id,_that.productId,_that.productName,_that.allVariant,_that.variantId,_that.variantLabel);case MerchantPromotionProductAssignmentParamEntity() when param != null:
return param(_that.productId,_that.allVariant,_that.variantId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String id,  String productId,  String productName,  bool allVariant,  String? variantId,  String? variantLabel)  entity,required TResult Function( String productId,  bool allVariant,  String? variantId)  param,}) {final _that = this;
switch (_that) {
case MerchantPromotionProductAssignmentEntity():
return entity(_that.id,_that.productId,_that.productName,_that.allVariant,_that.variantId,_that.variantLabel);case MerchantPromotionProductAssignmentParamEntity():
return param(_that.productId,_that.allVariant,_that.variantId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String id,  String productId,  String productName,  bool allVariant,  String? variantId,  String? variantLabel)?  entity,TResult? Function( String productId,  bool allVariant,  String? variantId)?  param,}) {final _that = this;
switch (_that) {
case MerchantPromotionProductAssignmentEntity() when entity != null:
return entity(_that.id,_that.productId,_that.productName,_that.allVariant,_that.variantId,_that.variantLabel);case MerchantPromotionProductAssignmentParamEntity() when param != null:
return param(_that.productId,_that.allVariant,_that.variantId);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class MerchantPromotionProductAssignmentEntity implements MerchantPromotionProductAssignment {
  const MerchantPromotionProductAssignmentEntity({required this.id, required this.productId, required this.productName, required this.allVariant, this.variantId, this.variantLabel, final  String? $type}): $type = $type ?? 'entity';
  factory MerchantPromotionProductAssignmentEntity.fromJson(Map<String, dynamic> json) => _$MerchantPromotionProductAssignmentEntityFromJson(json);

 final  String id;
@override final  String productId;
 final  String productName;
@override final  bool allVariant;
@override final  String? variantId;
 final  String? variantLabel;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of MerchantPromotionProductAssignment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantPromotionProductAssignmentEntityCopyWith<MerchantPromotionProductAssignmentEntity> get copyWith => _$MerchantPromotionProductAssignmentEntityCopyWithImpl<MerchantPromotionProductAssignmentEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MerchantPromotionProductAssignmentEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantPromotionProductAssignmentEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.allVariant, allVariant) || other.allVariant == allVariant)&&(identical(other.variantId, variantId) || other.variantId == variantId)&&(identical(other.variantLabel, variantLabel) || other.variantLabel == variantLabel));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,productId,productName,allVariant,variantId,variantLabel);

@override
String toString() {
  return 'MerchantPromotionProductAssignment.entity(id: $id, productId: $productId, productName: $productName, allVariant: $allVariant, variantId: $variantId, variantLabel: $variantLabel)';
}


}

/// @nodoc
abstract mixin class $MerchantPromotionProductAssignmentEntityCopyWith<$Res> implements $MerchantPromotionProductAssignmentCopyWith<$Res> {
  factory $MerchantPromotionProductAssignmentEntityCopyWith(MerchantPromotionProductAssignmentEntity value, $Res Function(MerchantPromotionProductAssignmentEntity) _then) = _$MerchantPromotionProductAssignmentEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String productId, String productName, bool allVariant, String? variantId, String? variantLabel
});




}
/// @nodoc
class _$MerchantPromotionProductAssignmentEntityCopyWithImpl<$Res>
    implements $MerchantPromotionProductAssignmentEntityCopyWith<$Res> {
  _$MerchantPromotionProductAssignmentEntityCopyWithImpl(this._self, this._then);

  final MerchantPromotionProductAssignmentEntity _self;
  final $Res Function(MerchantPromotionProductAssignmentEntity) _then;

/// Create a copy of MerchantPromotionProductAssignment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? productId = null,Object? productName = null,Object? allVariant = null,Object? variantId = freezed,Object? variantLabel = freezed,}) {
  return _then(MerchantPromotionProductAssignmentEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,allVariant: null == allVariant ? _self.allVariant : allVariant // ignore: cast_nullable_to_non_nullable
as bool,variantId: freezed == variantId ? _self.variantId : variantId // ignore: cast_nullable_to_non_nullable
as String?,variantLabel: freezed == variantLabel ? _self.variantLabel : variantLabel // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class MerchantPromotionProductAssignmentParamEntity implements MerchantPromotionProductAssignment {
  const MerchantPromotionProductAssignmentParamEntity({required this.productId, required this.allVariant, this.variantId, final  String? $type}): $type = $type ?? 'param';
  factory MerchantPromotionProductAssignmentParamEntity.fromJson(Map<String, dynamic> json) => _$MerchantPromotionProductAssignmentParamEntityFromJson(json);

@override final  String productId;
@override final  bool allVariant;
@override final  String? variantId;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of MerchantPromotionProductAssignment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantPromotionProductAssignmentParamEntityCopyWith<MerchantPromotionProductAssignmentParamEntity> get copyWith => _$MerchantPromotionProductAssignmentParamEntityCopyWithImpl<MerchantPromotionProductAssignmentParamEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MerchantPromotionProductAssignmentParamEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantPromotionProductAssignmentParamEntity&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.allVariant, allVariant) || other.allVariant == allVariant)&&(identical(other.variantId, variantId) || other.variantId == variantId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productId,allVariant,variantId);

@override
String toString() {
  return 'MerchantPromotionProductAssignment.param(productId: $productId, allVariant: $allVariant, variantId: $variantId)';
}


}

/// @nodoc
abstract mixin class $MerchantPromotionProductAssignmentParamEntityCopyWith<$Res> implements $MerchantPromotionProductAssignmentCopyWith<$Res> {
  factory $MerchantPromotionProductAssignmentParamEntityCopyWith(MerchantPromotionProductAssignmentParamEntity value, $Res Function(MerchantPromotionProductAssignmentParamEntity) _then) = _$MerchantPromotionProductAssignmentParamEntityCopyWithImpl;
@override @useResult
$Res call({
 String productId, bool allVariant, String? variantId
});




}
/// @nodoc
class _$MerchantPromotionProductAssignmentParamEntityCopyWithImpl<$Res>
    implements $MerchantPromotionProductAssignmentParamEntityCopyWith<$Res> {
  _$MerchantPromotionProductAssignmentParamEntityCopyWithImpl(this._self, this._then);

  final MerchantPromotionProductAssignmentParamEntity _self;
  final $Res Function(MerchantPromotionProductAssignmentParamEntity) _then;

/// Create a copy of MerchantPromotionProductAssignment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? productId = null,Object? allVariant = null,Object? variantId = freezed,}) {
  return _then(MerchantPromotionProductAssignmentParamEntity(
productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,allVariant: null == allVariant ? _self.allVariant : allVariant // ignore: cast_nullable_to_non_nullable
as bool,variantId: freezed == variantId ? _self.variantId : variantId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
