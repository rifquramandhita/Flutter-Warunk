// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_product_variant.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
CustomerProductVariant _$CustomerProductVariantFromJson(
  Map<String, dynamic> json
) {
    return CustomerProductVariantEntity.fromJson(
      json
    );
}

/// @nodoc
mixin _$CustomerProductVariant {

 String get id; String get productId; Map<String, String> get variantCombination; String? get sku; int get price; int get stock; int get minPurchase; int? get weight; int? get length; int? get width; int? get height; String? get createdAt; String? get updatedAt;
/// Create a copy of CustomerProductVariant
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerProductVariantCopyWith<CustomerProductVariant> get copyWith => _$CustomerProductVariantCopyWithImpl<CustomerProductVariant>(this as CustomerProductVariant, _$identity);

  /// Serializes this CustomerProductVariant to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerProductVariant&&(identical(other.id, id) || other.id == id)&&(identical(other.productId, productId) || other.productId == productId)&&const DeepCollectionEquality().equals(other.variantCombination, variantCombination)&&(identical(other.sku, sku) || other.sku == sku)&&(identical(other.price, price) || other.price == price)&&(identical(other.stock, stock) || other.stock == stock)&&(identical(other.minPurchase, minPurchase) || other.minPurchase == minPurchase)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.length, length) || other.length == length)&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,productId,const DeepCollectionEquality().hash(variantCombination),sku,price,stock,minPurchase,weight,length,width,height,createdAt,updatedAt);

@override
String toString() {
  return 'CustomerProductVariant(id: $id, productId: $productId, variantCombination: $variantCombination, sku: $sku, price: $price, stock: $stock, minPurchase: $minPurchase, weight: $weight, length: $length, width: $width, height: $height, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $CustomerProductVariantCopyWith<$Res>  {
  factory $CustomerProductVariantCopyWith(CustomerProductVariant value, $Res Function(CustomerProductVariant) _then) = _$CustomerProductVariantCopyWithImpl;
@useResult
$Res call({
 String id, String productId, Map<String, String> variantCombination, String? sku, int price, int stock, int minPurchase, int? weight, int? length, int? width, int? height, String? createdAt, String? updatedAt
});




}
/// @nodoc
class _$CustomerProductVariantCopyWithImpl<$Res>
    implements $CustomerProductVariantCopyWith<$Res> {
  _$CustomerProductVariantCopyWithImpl(this._self, this._then);

  final CustomerProductVariant _self;
  final $Res Function(CustomerProductVariant) _then;

/// Create a copy of CustomerProductVariant
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? productId = null,Object? variantCombination = null,Object? sku = freezed,Object? price = null,Object? stock = null,Object? minPurchase = null,Object? weight = freezed,Object? length = freezed,Object? width = freezed,Object? height = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,variantCombination: null == variantCombination ? _self.variantCombination : variantCombination // ignore: cast_nullable_to_non_nullable
as Map<String, String>,sku: freezed == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String?,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,stock: null == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as int,minPurchase: null == minPurchase ? _self.minPurchase : minPurchase // ignore: cast_nullable_to_non_nullable
as int,weight: freezed == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as int?,length: freezed == length ? _self.length : length // ignore: cast_nullable_to_non_nullable
as int?,width: freezed == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int?,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CustomerProductVariant].
extension CustomerProductVariantPatterns on CustomerProductVariant {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CustomerProductVariantEntity value)?  entity,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CustomerProductVariantEntity() when entity != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CustomerProductVariantEntity value)  entity,}){
final _that = this;
switch (_that) {
case CustomerProductVariantEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CustomerProductVariantEntity value)?  entity,}){
final _that = this;
switch (_that) {
case CustomerProductVariantEntity() when entity != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String id,  String productId,  Map<String, String> variantCombination,  String? sku,  int price,  int stock,  int minPurchase,  int? weight,  int? length,  int? width,  int? height,  String? createdAt,  String? updatedAt)?  entity,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CustomerProductVariantEntity() when entity != null:
return entity(_that.id,_that.productId,_that.variantCombination,_that.sku,_that.price,_that.stock,_that.minPurchase,_that.weight,_that.length,_that.width,_that.height,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String id,  String productId,  Map<String, String> variantCombination,  String? sku,  int price,  int stock,  int minPurchase,  int? weight,  int? length,  int? width,  int? height,  String? createdAt,  String? updatedAt)  entity,}) {final _that = this;
switch (_that) {
case CustomerProductVariantEntity():
return entity(_that.id,_that.productId,_that.variantCombination,_that.sku,_that.price,_that.stock,_that.minPurchase,_that.weight,_that.length,_that.width,_that.height,_that.createdAt,_that.updatedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String id,  String productId,  Map<String, String> variantCombination,  String? sku,  int price,  int stock,  int minPurchase,  int? weight,  int? length,  int? width,  int? height,  String? createdAt,  String? updatedAt)?  entity,}) {final _that = this;
switch (_that) {
case CustomerProductVariantEntity() when entity != null:
return entity(_that.id,_that.productId,_that.variantCombination,_that.sku,_that.price,_that.stock,_that.minPurchase,_that.weight,_that.length,_that.width,_that.height,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class CustomerProductVariantEntity implements CustomerProductVariant {
  const CustomerProductVariantEntity({required this.id, required this.productId, required final  Map<String, String> variantCombination, this.sku, required this.price, required this.stock, required this.minPurchase, this.weight, this.length, this.width, this.height, this.createdAt, this.updatedAt}): _variantCombination = variantCombination;
  factory CustomerProductVariantEntity.fromJson(Map<String, dynamic> json) => _$CustomerProductVariantEntityFromJson(json);

@override final  String id;
@override final  String productId;
 final  Map<String, String> _variantCombination;
@override Map<String, String> get variantCombination {
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
@override final  String? createdAt;
@override final  String? updatedAt;

/// Create a copy of CustomerProductVariant
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerProductVariantEntityCopyWith<CustomerProductVariantEntity> get copyWith => _$CustomerProductVariantEntityCopyWithImpl<CustomerProductVariantEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomerProductVariantEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerProductVariantEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.productId, productId) || other.productId == productId)&&const DeepCollectionEquality().equals(other._variantCombination, _variantCombination)&&(identical(other.sku, sku) || other.sku == sku)&&(identical(other.price, price) || other.price == price)&&(identical(other.stock, stock) || other.stock == stock)&&(identical(other.minPurchase, minPurchase) || other.minPurchase == minPurchase)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.length, length) || other.length == length)&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,productId,const DeepCollectionEquality().hash(_variantCombination),sku,price,stock,minPurchase,weight,length,width,height,createdAt,updatedAt);

@override
String toString() {
  return 'CustomerProductVariant.entity(id: $id, productId: $productId, variantCombination: $variantCombination, sku: $sku, price: $price, stock: $stock, minPurchase: $minPurchase, weight: $weight, length: $length, width: $width, height: $height, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $CustomerProductVariantEntityCopyWith<$Res> implements $CustomerProductVariantCopyWith<$Res> {
  factory $CustomerProductVariantEntityCopyWith(CustomerProductVariantEntity value, $Res Function(CustomerProductVariantEntity) _then) = _$CustomerProductVariantEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String productId, Map<String, String> variantCombination, String? sku, int price, int stock, int minPurchase, int? weight, int? length, int? width, int? height, String? createdAt, String? updatedAt
});




}
/// @nodoc
class _$CustomerProductVariantEntityCopyWithImpl<$Res>
    implements $CustomerProductVariantEntityCopyWith<$Res> {
  _$CustomerProductVariantEntityCopyWithImpl(this._self, this._then);

  final CustomerProductVariantEntity _self;
  final $Res Function(CustomerProductVariantEntity) _then;

/// Create a copy of CustomerProductVariant
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? productId = null,Object? variantCombination = null,Object? sku = freezed,Object? price = null,Object? stock = null,Object? minPurchase = null,Object? weight = freezed,Object? length = freezed,Object? width = freezed,Object? height = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(CustomerProductVariantEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,variantCombination: null == variantCombination ? _self._variantCombination : variantCombination // ignore: cast_nullable_to_non_nullable
as Map<String, String>,sku: freezed == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String?,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,stock: null == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as int,minPurchase: null == minPurchase ? _self.minPurchase : minPurchase // ignore: cast_nullable_to_non_nullable
as int,weight: freezed == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as int?,length: freezed == length ? _self.length : length // ignore: cast_nullable_to_non_nullable
as int?,width: freezed == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int?,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
