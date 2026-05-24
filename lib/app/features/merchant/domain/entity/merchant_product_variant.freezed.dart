// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'merchant_product_variant.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
MerchantProductVariant _$MerchantProductVariantFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'entity':
          return MerchantProductVariantEntity.fromJson(
            json
          );
                case 'sendParam':
          return MerchantProductVariantSendParam.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'MerchantProductVariant',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$MerchantProductVariant {

 Map<String, dynamic> get variantCombination; String? get sku; int get price; int get stock; int get minPurchase; int? get weight; int? get length; int? get width; int? get height;
/// Create a copy of MerchantProductVariant
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantProductVariantCopyWith<MerchantProductVariant> get copyWith => _$MerchantProductVariantCopyWithImpl<MerchantProductVariant>(this as MerchantProductVariant, _$identity);

  /// Serializes this MerchantProductVariant to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantProductVariant&&const DeepCollectionEquality().equals(other.variantCombination, variantCombination)&&(identical(other.sku, sku) || other.sku == sku)&&(identical(other.price, price) || other.price == price)&&(identical(other.stock, stock) || other.stock == stock)&&(identical(other.minPurchase, minPurchase) || other.minPurchase == minPurchase)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.length, length) || other.length == length)&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(variantCombination),sku,price,stock,minPurchase,weight,length,width,height);

@override
String toString() {
  return 'MerchantProductVariant(variantCombination: $variantCombination, sku: $sku, price: $price, stock: $stock, minPurchase: $minPurchase, weight: $weight, length: $length, width: $width, height: $height)';
}


}

/// @nodoc
abstract mixin class $MerchantProductVariantCopyWith<$Res>  {
  factory $MerchantProductVariantCopyWith(MerchantProductVariant value, $Res Function(MerchantProductVariant) _then) = _$MerchantProductVariantCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic> variantCombination, String? sku, int price, int stock, int minPurchase, int? weight, int? length, int? width, int? height
});




}
/// @nodoc
class _$MerchantProductVariantCopyWithImpl<$Res>
    implements $MerchantProductVariantCopyWith<$Res> {
  _$MerchantProductVariantCopyWithImpl(this._self, this._then);

  final MerchantProductVariant _self;
  final $Res Function(MerchantProductVariant) _then;

/// Create a copy of MerchantProductVariant
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? variantCombination = null,Object? sku = freezed,Object? price = null,Object? stock = null,Object? minPurchase = null,Object? weight = freezed,Object? length = freezed,Object? width = freezed,Object? height = freezed,}) {
  return _then(_self.copyWith(
variantCombination: null == variantCombination ? _self.variantCombination : variantCombination // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,sku: freezed == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String?,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,stock: null == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as int,minPurchase: null == minPurchase ? _self.minPurchase : minPurchase // ignore: cast_nullable_to_non_nullable
as int,weight: freezed == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as int?,length: freezed == length ? _self.length : length // ignore: cast_nullable_to_non_nullable
as int?,width: freezed == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int?,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [MerchantProductVariant].
extension MerchantProductVariantPatterns on MerchantProductVariant {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MerchantProductVariantEntity value)?  entity,TResult Function( MerchantProductVariantSendParam value)?  sendParam,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MerchantProductVariantEntity() when entity != null:
return entity(_that);case MerchantProductVariantSendParam() when sendParam != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MerchantProductVariantEntity value)  entity,required TResult Function( MerchantProductVariantSendParam value)  sendParam,}){
final _that = this;
switch (_that) {
case MerchantProductVariantEntity():
return entity(_that);case MerchantProductVariantSendParam():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MerchantProductVariantEntity value)?  entity,TResult? Function( MerchantProductVariantSendParam value)?  sendParam,}){
final _that = this;
switch (_that) {
case MerchantProductVariantEntity() when entity != null:
return entity(_that);case MerchantProductVariantSendParam() when sendParam != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String id,  String productId,  Map<String, dynamic> variantCombination,  String? sku,  int price,  int stock,  int minPurchase,  int? weight,  int? length,  int? width,  int? height,  DateTime? createdAt,  DateTime? updatedAt)?  entity,TResult Function( Map<String, dynamic> variantCombination,  String? sku,  int price,  int stock,  int minPurchase,  int? weight,  int? length,  int? width,  int? height)?  sendParam,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MerchantProductVariantEntity() when entity != null:
return entity(_that.id,_that.productId,_that.variantCombination,_that.sku,_that.price,_that.stock,_that.minPurchase,_that.weight,_that.length,_that.width,_that.height,_that.createdAt,_that.updatedAt);case MerchantProductVariantSendParam() when sendParam != null:
return sendParam(_that.variantCombination,_that.sku,_that.price,_that.stock,_that.minPurchase,_that.weight,_that.length,_that.width,_that.height);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String id,  String productId,  Map<String, dynamic> variantCombination,  String? sku,  int price,  int stock,  int minPurchase,  int? weight,  int? length,  int? width,  int? height,  DateTime? createdAt,  DateTime? updatedAt)  entity,required TResult Function( Map<String, dynamic> variantCombination,  String? sku,  int price,  int stock,  int minPurchase,  int? weight,  int? length,  int? width,  int? height)  sendParam,}) {final _that = this;
switch (_that) {
case MerchantProductVariantEntity():
return entity(_that.id,_that.productId,_that.variantCombination,_that.sku,_that.price,_that.stock,_that.minPurchase,_that.weight,_that.length,_that.width,_that.height,_that.createdAt,_that.updatedAt);case MerchantProductVariantSendParam():
return sendParam(_that.variantCombination,_that.sku,_that.price,_that.stock,_that.minPurchase,_that.weight,_that.length,_that.width,_that.height);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String id,  String productId,  Map<String, dynamic> variantCombination,  String? sku,  int price,  int stock,  int minPurchase,  int? weight,  int? length,  int? width,  int? height,  DateTime? createdAt,  DateTime? updatedAt)?  entity,TResult? Function( Map<String, dynamic> variantCombination,  String? sku,  int price,  int stock,  int minPurchase,  int? weight,  int? length,  int? width,  int? height)?  sendParam,}) {final _that = this;
switch (_that) {
case MerchantProductVariantEntity() when entity != null:
return entity(_that.id,_that.productId,_that.variantCombination,_that.sku,_that.price,_that.stock,_that.minPurchase,_that.weight,_that.length,_that.width,_that.height,_that.createdAt,_that.updatedAt);case MerchantProductVariantSendParam() when sendParam != null:
return sendParam(_that.variantCombination,_that.sku,_that.price,_that.stock,_that.minPurchase,_that.weight,_that.length,_that.width,_that.height);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class MerchantProductVariantEntity implements MerchantProductVariant {
  const MerchantProductVariantEntity({required this.id, required this.productId, required final  Map<String, dynamic> variantCombination, this.sku, required this.price, required this.stock, required this.minPurchase, this.weight, this.length, this.width, this.height, this.createdAt, this.updatedAt, final  String? $type}): _variantCombination = variantCombination,$type = $type ?? 'entity';
  factory MerchantProductVariantEntity.fromJson(Map<String, dynamic> json) => _$MerchantProductVariantEntityFromJson(json);

 final  String id;
 final  String productId;
 final  Map<String, dynamic> _variantCombination;
@override Map<String, dynamic> get variantCombination {
  if (_variantCombination is EqualUnmodifiableMapView) return _variantCombination;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_variantCombination);
}

@override final  String? sku;
@override final  int price;
@override final  int stock;
@override final  int minPurchase;
@override final  int? weight;
@override final  int? length;
@override final  int? width;
@override final  int? height;
 final  DateTime? createdAt;
 final  DateTime? updatedAt;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of MerchantProductVariant
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantProductVariantEntityCopyWith<MerchantProductVariantEntity> get copyWith => _$MerchantProductVariantEntityCopyWithImpl<MerchantProductVariantEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MerchantProductVariantEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantProductVariantEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.productId, productId) || other.productId == productId)&&const DeepCollectionEquality().equals(other._variantCombination, _variantCombination)&&(identical(other.sku, sku) || other.sku == sku)&&(identical(other.price, price) || other.price == price)&&(identical(other.stock, stock) || other.stock == stock)&&(identical(other.minPurchase, minPurchase) || other.minPurchase == minPurchase)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.length, length) || other.length == length)&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,productId,const DeepCollectionEquality().hash(_variantCombination),sku,price,stock,minPurchase,weight,length,width,height,createdAt,updatedAt);

@override
String toString() {
  return 'MerchantProductVariant.entity(id: $id, productId: $productId, variantCombination: $variantCombination, sku: $sku, price: $price, stock: $stock, minPurchase: $minPurchase, weight: $weight, length: $length, width: $width, height: $height, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $MerchantProductVariantEntityCopyWith<$Res> implements $MerchantProductVariantCopyWith<$Res> {
  factory $MerchantProductVariantEntityCopyWith(MerchantProductVariantEntity value, $Res Function(MerchantProductVariantEntity) _then) = _$MerchantProductVariantEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String productId, Map<String, dynamic> variantCombination, String? sku, int price, int stock, int minPurchase, int? weight, int? length, int? width, int? height, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class _$MerchantProductVariantEntityCopyWithImpl<$Res>
    implements $MerchantProductVariantEntityCopyWith<$Res> {
  _$MerchantProductVariantEntityCopyWithImpl(this._self, this._then);

  final MerchantProductVariantEntity _self;
  final $Res Function(MerchantProductVariantEntity) _then;

/// Create a copy of MerchantProductVariant
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? productId = null,Object? variantCombination = null,Object? sku = freezed,Object? price = null,Object? stock = null,Object? minPurchase = null,Object? weight = freezed,Object? length = freezed,Object? width = freezed,Object? height = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(MerchantProductVariantEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,variantCombination: null == variantCombination ? _self._variantCombination : variantCombination // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,sku: freezed == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String?,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,stock: null == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as int,minPurchase: null == minPurchase ? _self.minPurchase : minPurchase // ignore: cast_nullable_to_non_nullable
as int,weight: freezed == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as int?,length: freezed == length ? _self.length : length // ignore: cast_nullable_to_non_nullable
as int?,width: freezed == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int?,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class MerchantProductVariantSendParam implements MerchantProductVariant {
  const MerchantProductVariantSendParam({required final  Map<String, dynamic> variantCombination, this.sku, required this.price, required this.stock, required this.minPurchase, this.weight, this.length, this.width, this.height, final  String? $type}): _variantCombination = variantCombination,$type = $type ?? 'sendParam';
  factory MerchantProductVariantSendParam.fromJson(Map<String, dynamic> json) => _$MerchantProductVariantSendParamFromJson(json);

 final  Map<String, dynamic> _variantCombination;
@override Map<String, dynamic> get variantCombination {
  if (_variantCombination is EqualUnmodifiableMapView) return _variantCombination;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_variantCombination);
}

@override final  String? sku;
@override final  int price;
@override final  int stock;
@override final  int minPurchase;
@override final  int? weight;
@override final  int? length;
@override final  int? width;
@override final  int? height;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of MerchantProductVariant
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantProductVariantSendParamCopyWith<MerchantProductVariantSendParam> get copyWith => _$MerchantProductVariantSendParamCopyWithImpl<MerchantProductVariantSendParam>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MerchantProductVariantSendParamToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantProductVariantSendParam&&const DeepCollectionEquality().equals(other._variantCombination, _variantCombination)&&(identical(other.sku, sku) || other.sku == sku)&&(identical(other.price, price) || other.price == price)&&(identical(other.stock, stock) || other.stock == stock)&&(identical(other.minPurchase, minPurchase) || other.minPurchase == minPurchase)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.length, length) || other.length == length)&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_variantCombination),sku,price,stock,minPurchase,weight,length,width,height);

@override
String toString() {
  return 'MerchantProductVariant.sendParam(variantCombination: $variantCombination, sku: $sku, price: $price, stock: $stock, minPurchase: $minPurchase, weight: $weight, length: $length, width: $width, height: $height)';
}


}

/// @nodoc
abstract mixin class $MerchantProductVariantSendParamCopyWith<$Res> implements $MerchantProductVariantCopyWith<$Res> {
  factory $MerchantProductVariantSendParamCopyWith(MerchantProductVariantSendParam value, $Res Function(MerchantProductVariantSendParam) _then) = _$MerchantProductVariantSendParamCopyWithImpl;
@override @useResult
$Res call({
 Map<String, dynamic> variantCombination, String? sku, int price, int stock, int minPurchase, int? weight, int? length, int? width, int? height
});




}
/// @nodoc
class _$MerchantProductVariantSendParamCopyWithImpl<$Res>
    implements $MerchantProductVariantSendParamCopyWith<$Res> {
  _$MerchantProductVariantSendParamCopyWithImpl(this._self, this._then);

  final MerchantProductVariantSendParam _self;
  final $Res Function(MerchantProductVariantSendParam) _then;

/// Create a copy of MerchantProductVariant
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? variantCombination = null,Object? sku = freezed,Object? price = null,Object? stock = null,Object? minPurchase = null,Object? weight = freezed,Object? length = freezed,Object? width = freezed,Object? height = freezed,}) {
  return _then(MerchantProductVariantSendParam(
variantCombination: null == variantCombination ? _self._variantCombination : variantCombination // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,sku: freezed == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String?,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,stock: null == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as int,minPurchase: null == minPurchase ? _self.minPurchase : minPurchase // ignore: cast_nullable_to_non_nullable
as int,weight: freezed == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as int?,length: freezed == length ? _self.length : length // ignore: cast_nullable_to_non_nullable
as int?,width: freezed == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int?,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
