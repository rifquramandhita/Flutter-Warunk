// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'merchant_product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
MerchantProduct _$MerchantProductFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'entity':
          return MerchantProductEntity.fromJson(
            json
          );
                case 'sendParam':
          return MerchantProductSendParam.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'MerchantProduct',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$MerchantProduct {

 String get name; String get slug; String get category; String get branch; String? get description; int get stock; int get minPurchase; int get price;@JsonKey(toJson: ParseHelper.boolToInt, fromJson: ParseHelper.intToBool) bool get isPublished;@JsonKey(toJson: ParseHelper.boolToInt, fromJson: ParseHelper.intToBool) bool get hasVariant;@JsonKey(toJson: ParseHelper.boolToInt, fromJson: ParseHelper.intToBool) bool get isSameDimension; String? get sku; int? get weight; int? get length; int? get width; int? get height;
/// Create a copy of MerchantProduct
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantProductCopyWith<MerchantProduct> get copyWith => _$MerchantProductCopyWithImpl<MerchantProduct>(this as MerchantProduct, _$identity);

  /// Serializes this MerchantProduct to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantProduct&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.category, category) || other.category == category)&&(identical(other.branch, branch) || other.branch == branch)&&(identical(other.description, description) || other.description == description)&&(identical(other.stock, stock) || other.stock == stock)&&(identical(other.minPurchase, minPurchase) || other.minPurchase == minPurchase)&&(identical(other.price, price) || other.price == price)&&(identical(other.isPublished, isPublished) || other.isPublished == isPublished)&&(identical(other.hasVariant, hasVariant) || other.hasVariant == hasVariant)&&(identical(other.isSameDimension, isSameDimension) || other.isSameDimension == isSameDimension)&&(identical(other.sku, sku) || other.sku == sku)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.length, length) || other.length == length)&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,slug,category,branch,description,stock,minPurchase,price,isPublished,hasVariant,isSameDimension,sku,weight,length,width,height);

@override
String toString() {
  return 'MerchantProduct(name: $name, slug: $slug, category: $category, branch: $branch, description: $description, stock: $stock, minPurchase: $minPurchase, price: $price, isPublished: $isPublished, hasVariant: $hasVariant, isSameDimension: $isSameDimension, sku: $sku, weight: $weight, length: $length, width: $width, height: $height)';
}


}

/// @nodoc
abstract mixin class $MerchantProductCopyWith<$Res>  {
  factory $MerchantProductCopyWith(MerchantProduct value, $Res Function(MerchantProduct) _then) = _$MerchantProductCopyWithImpl;
@useResult
$Res call({
 String name, String slug, String category, String branch, String? description, int stock, int minPurchase, int price, bool isPublished, bool hasVariant, bool isSameDimension, String? sku, int? weight, int? length, int? width, int? height
});




}
/// @nodoc
class _$MerchantProductCopyWithImpl<$Res>
    implements $MerchantProductCopyWith<$Res> {
  _$MerchantProductCopyWithImpl(this._self, this._then);

  final MerchantProduct _self;
  final $Res Function(MerchantProduct) _then;

/// Create a copy of MerchantProduct
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? slug = null,Object? category = null,Object? branch = null,Object? description = freezed,Object? stock = null,Object? minPurchase = null,Object? price = null,Object? isPublished = null,Object? hasVariant = null,Object? isSameDimension = null,Object? sku = freezed,Object? weight = freezed,Object? length = freezed,Object? width = freezed,Object? height = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,branch: null == branch ? _self.branch : branch // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,stock: null == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as int,minPurchase: null == minPurchase ? _self.minPurchase : minPurchase // ignore: cast_nullable_to_non_nullable
as int,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,isPublished: null == isPublished ? _self.isPublished : isPublished // ignore: cast_nullable_to_non_nullable
as bool,hasVariant: null == hasVariant ? _self.hasVariant : hasVariant // ignore: cast_nullable_to_non_nullable
as bool,isSameDimension: null == isSameDimension ? _self.isSameDimension : isSameDimension // ignore: cast_nullable_to_non_nullable
as bool,sku: freezed == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String?,weight: freezed == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as int?,length: freezed == length ? _self.length : length // ignore: cast_nullable_to_non_nullable
as int?,width: freezed == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int?,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [MerchantProduct].
extension MerchantProductPatterns on MerchantProduct {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MerchantProductEntity value)?  entity,TResult Function( MerchantProductSendParam value)?  sendParam,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MerchantProductEntity() when entity != null:
return entity(_that);case MerchantProductSendParam() when sendParam != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MerchantProductEntity value)  entity,required TResult Function( MerchantProductSendParam value)  sendParam,}){
final _that = this;
switch (_that) {
case MerchantProductEntity():
return entity(_that);case MerchantProductSendParam():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MerchantProductEntity value)?  entity,TResult? Function( MerchantProductSendParam value)?  sendParam,}){
final _that = this;
switch (_that) {
case MerchantProductEntity() when entity != null:
return entity(_that);case MerchantProductSendParam() when sendParam != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String id,  String name,  String slug,  String merchantId,  String productCategoryId,  String category,  String branch,  String? description,  int stock,  int orderCount,  int minPurchase,  int price,  bool isPublished,  bool hasVariant,  bool isSameDimension,  String? sku,  int? weight,  int? length,  int? width,  int? height,  MerchantProductCategoryEntity productCategory,  List<MerchantProductVariantEntity> variants,  List<MerchantProductImageEntity> images,  DateTime createdAt,  DateTime updatedAt)?  entity,TResult Function( String? sendId,  String name,  String slug,  String category,  String branch,  String? description,  int stock,  int minPurchase,  int price, @JsonKey(toJson: ParseHelper.boolToInt, fromJson: ParseHelper.intToBool)  bool isPublished, @JsonKey(toJson: ParseHelper.boolToInt, fromJson: ParseHelper.intToBool)  bool hasVariant, @JsonKey(toJson: ParseHelper.boolToInt, fromJson: ParseHelper.intToBool)  bool isSameDimension,  String? sku,  int? weight,  int? length,  int? width,  int? height, @JsonKey(name: 'variants')  List<MerchantProductVariantSendParam>? sendVariants, @JsonKey(name: 'images')  List<String>? sendImages)?  sendParam,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MerchantProductEntity() when entity != null:
return entity(_that.id,_that.name,_that.slug,_that.merchantId,_that.productCategoryId,_that.category,_that.branch,_that.description,_that.stock,_that.orderCount,_that.minPurchase,_that.price,_that.isPublished,_that.hasVariant,_that.isSameDimension,_that.sku,_that.weight,_that.length,_that.width,_that.height,_that.productCategory,_that.variants,_that.images,_that.createdAt,_that.updatedAt);case MerchantProductSendParam() when sendParam != null:
return sendParam(_that.sendId,_that.name,_that.slug,_that.category,_that.branch,_that.description,_that.stock,_that.minPurchase,_that.price,_that.isPublished,_that.hasVariant,_that.isSameDimension,_that.sku,_that.weight,_that.length,_that.width,_that.height,_that.sendVariants,_that.sendImages);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String id,  String name,  String slug,  String merchantId,  String productCategoryId,  String category,  String branch,  String? description,  int stock,  int orderCount,  int minPurchase,  int price,  bool isPublished,  bool hasVariant,  bool isSameDimension,  String? sku,  int? weight,  int? length,  int? width,  int? height,  MerchantProductCategoryEntity productCategory,  List<MerchantProductVariantEntity> variants,  List<MerchantProductImageEntity> images,  DateTime createdAt,  DateTime updatedAt)  entity,required TResult Function( String? sendId,  String name,  String slug,  String category,  String branch,  String? description,  int stock,  int minPurchase,  int price, @JsonKey(toJson: ParseHelper.boolToInt, fromJson: ParseHelper.intToBool)  bool isPublished, @JsonKey(toJson: ParseHelper.boolToInt, fromJson: ParseHelper.intToBool)  bool hasVariant, @JsonKey(toJson: ParseHelper.boolToInt, fromJson: ParseHelper.intToBool)  bool isSameDimension,  String? sku,  int? weight,  int? length,  int? width,  int? height, @JsonKey(name: 'variants')  List<MerchantProductVariantSendParam>? sendVariants, @JsonKey(name: 'images')  List<String>? sendImages)  sendParam,}) {final _that = this;
switch (_that) {
case MerchantProductEntity():
return entity(_that.id,_that.name,_that.slug,_that.merchantId,_that.productCategoryId,_that.category,_that.branch,_that.description,_that.stock,_that.orderCount,_that.minPurchase,_that.price,_that.isPublished,_that.hasVariant,_that.isSameDimension,_that.sku,_that.weight,_that.length,_that.width,_that.height,_that.productCategory,_that.variants,_that.images,_that.createdAt,_that.updatedAt);case MerchantProductSendParam():
return sendParam(_that.sendId,_that.name,_that.slug,_that.category,_that.branch,_that.description,_that.stock,_that.minPurchase,_that.price,_that.isPublished,_that.hasVariant,_that.isSameDimension,_that.sku,_that.weight,_that.length,_that.width,_that.height,_that.sendVariants,_that.sendImages);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String id,  String name,  String slug,  String merchantId,  String productCategoryId,  String category,  String branch,  String? description,  int stock,  int orderCount,  int minPurchase,  int price,  bool isPublished,  bool hasVariant,  bool isSameDimension,  String? sku,  int? weight,  int? length,  int? width,  int? height,  MerchantProductCategoryEntity productCategory,  List<MerchantProductVariantEntity> variants,  List<MerchantProductImageEntity> images,  DateTime createdAt,  DateTime updatedAt)?  entity,TResult? Function( String? sendId,  String name,  String slug,  String category,  String branch,  String? description,  int stock,  int minPurchase,  int price, @JsonKey(toJson: ParseHelper.boolToInt, fromJson: ParseHelper.intToBool)  bool isPublished, @JsonKey(toJson: ParseHelper.boolToInt, fromJson: ParseHelper.intToBool)  bool hasVariant, @JsonKey(toJson: ParseHelper.boolToInt, fromJson: ParseHelper.intToBool)  bool isSameDimension,  String? sku,  int? weight,  int? length,  int? width,  int? height, @JsonKey(name: 'variants')  List<MerchantProductVariantSendParam>? sendVariants, @JsonKey(name: 'images')  List<String>? sendImages)?  sendParam,}) {final _that = this;
switch (_that) {
case MerchantProductEntity() when entity != null:
return entity(_that.id,_that.name,_that.slug,_that.merchantId,_that.productCategoryId,_that.category,_that.branch,_that.description,_that.stock,_that.orderCount,_that.minPurchase,_that.price,_that.isPublished,_that.hasVariant,_that.isSameDimension,_that.sku,_that.weight,_that.length,_that.width,_that.height,_that.productCategory,_that.variants,_that.images,_that.createdAt,_that.updatedAt);case MerchantProductSendParam() when sendParam != null:
return sendParam(_that.sendId,_that.name,_that.slug,_that.category,_that.branch,_that.description,_that.stock,_that.minPurchase,_that.price,_that.isPublished,_that.hasVariant,_that.isSameDimension,_that.sku,_that.weight,_that.length,_that.width,_that.height,_that.sendVariants,_that.sendImages);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class MerchantProductEntity implements MerchantProduct {
  const MerchantProductEntity({required this.id, required this.name, required this.slug, required this.merchantId, required this.productCategoryId, required this.category, required this.branch, this.description, required this.stock, required this.orderCount, required this.minPurchase, required this.price, required this.isPublished, required this.hasVariant, required this.isSameDimension, this.sku, this.weight, this.length, this.width, this.height, required this.productCategory, final  List<MerchantProductVariantEntity> variants = const [], final  List<MerchantProductImageEntity> images = const [], required this.createdAt, required this.updatedAt, final  String? $type}): _variants = variants,_images = images,$type = $type ?? 'entity';
  factory MerchantProductEntity.fromJson(Map<String, dynamic> json) => _$MerchantProductEntityFromJson(json);

 final  String id;
@override final  String name;
@override final  String slug;
 final  String merchantId;
 final  String productCategoryId;
@override final  String category;
@override final  String branch;
@override final  String? description;
@override final  int stock;
 final  int orderCount;
@override final  int minPurchase;
@override final  int price;
@override final  bool isPublished;
@override final  bool hasVariant;
@override final  bool isSameDimension;
@override final  String? sku;
@override final  int? weight;
@override final  int? length;
@override final  int? width;
@override final  int? height;
 final  MerchantProductCategoryEntity productCategory;
 final  List<MerchantProductVariantEntity> _variants;
@JsonKey() List<MerchantProductVariantEntity> get variants {
  if (_variants is EqualUnmodifiableListView) return _variants;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_variants);
}

 final  List<MerchantProductImageEntity> _images;
@JsonKey() List<MerchantProductImageEntity> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}

 final  DateTime createdAt;
 final  DateTime updatedAt;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of MerchantProduct
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantProductEntityCopyWith<MerchantProductEntity> get copyWith => _$MerchantProductEntityCopyWithImpl<MerchantProductEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MerchantProductEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantProductEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.merchantId, merchantId) || other.merchantId == merchantId)&&(identical(other.productCategoryId, productCategoryId) || other.productCategoryId == productCategoryId)&&(identical(other.category, category) || other.category == category)&&(identical(other.branch, branch) || other.branch == branch)&&(identical(other.description, description) || other.description == description)&&(identical(other.stock, stock) || other.stock == stock)&&(identical(other.orderCount, orderCount) || other.orderCount == orderCount)&&(identical(other.minPurchase, minPurchase) || other.minPurchase == minPurchase)&&(identical(other.price, price) || other.price == price)&&(identical(other.isPublished, isPublished) || other.isPublished == isPublished)&&(identical(other.hasVariant, hasVariant) || other.hasVariant == hasVariant)&&(identical(other.isSameDimension, isSameDimension) || other.isSameDimension == isSameDimension)&&(identical(other.sku, sku) || other.sku == sku)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.length, length) || other.length == length)&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height)&&const DeepCollectionEquality().equals(other.productCategory, productCategory)&&const DeepCollectionEquality().equals(other._variants, _variants)&&const DeepCollectionEquality().equals(other._images, _images)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,name,slug,merchantId,productCategoryId,category,branch,description,stock,orderCount,minPurchase,price,isPublished,hasVariant,isSameDimension,sku,weight,length,width,height,const DeepCollectionEquality().hash(productCategory),const DeepCollectionEquality().hash(_variants),const DeepCollectionEquality().hash(_images),createdAt,updatedAt]);

@override
String toString() {
  return 'MerchantProduct.entity(id: $id, name: $name, slug: $slug, merchantId: $merchantId, productCategoryId: $productCategoryId, category: $category, branch: $branch, description: $description, stock: $stock, orderCount: $orderCount, minPurchase: $minPurchase, price: $price, isPublished: $isPublished, hasVariant: $hasVariant, isSameDimension: $isSameDimension, sku: $sku, weight: $weight, length: $length, width: $width, height: $height, productCategory: $productCategory, variants: $variants, images: $images, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $MerchantProductEntityCopyWith<$Res> implements $MerchantProductCopyWith<$Res> {
  factory $MerchantProductEntityCopyWith(MerchantProductEntity value, $Res Function(MerchantProductEntity) _then) = _$MerchantProductEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String slug, String merchantId, String productCategoryId, String category, String branch, String? description, int stock, int orderCount, int minPurchase, int price, bool isPublished, bool hasVariant, bool isSameDimension, String? sku, int? weight, int? length, int? width, int? height, MerchantProductCategoryEntity productCategory, List<MerchantProductVariantEntity> variants, List<MerchantProductImageEntity> images, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$MerchantProductEntityCopyWithImpl<$Res>
    implements $MerchantProductEntityCopyWith<$Res> {
  _$MerchantProductEntityCopyWithImpl(this._self, this._then);

  final MerchantProductEntity _self;
  final $Res Function(MerchantProductEntity) _then;

/// Create a copy of MerchantProduct
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? slug = null,Object? merchantId = null,Object? productCategoryId = null,Object? category = null,Object? branch = null,Object? description = freezed,Object? stock = null,Object? orderCount = null,Object? minPurchase = null,Object? price = null,Object? isPublished = null,Object? hasVariant = null,Object? isSameDimension = null,Object? sku = freezed,Object? weight = freezed,Object? length = freezed,Object? width = freezed,Object? height = freezed,Object? productCategory = freezed,Object? variants = null,Object? images = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(MerchantProductEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,merchantId: null == merchantId ? _self.merchantId : merchantId // ignore: cast_nullable_to_non_nullable
as String,productCategoryId: null == productCategoryId ? _self.productCategoryId : productCategoryId // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,branch: null == branch ? _self.branch : branch // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,stock: null == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as int,orderCount: null == orderCount ? _self.orderCount : orderCount // ignore: cast_nullable_to_non_nullable
as int,minPurchase: null == minPurchase ? _self.minPurchase : minPurchase // ignore: cast_nullable_to_non_nullable
as int,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,isPublished: null == isPublished ? _self.isPublished : isPublished // ignore: cast_nullable_to_non_nullable
as bool,hasVariant: null == hasVariant ? _self.hasVariant : hasVariant // ignore: cast_nullable_to_non_nullable
as bool,isSameDimension: null == isSameDimension ? _self.isSameDimension : isSameDimension // ignore: cast_nullable_to_non_nullable
as bool,sku: freezed == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String?,weight: freezed == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as int?,length: freezed == length ? _self.length : length // ignore: cast_nullable_to_non_nullable
as int?,width: freezed == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int?,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int?,productCategory: freezed == productCategory ? _self.productCategory : productCategory // ignore: cast_nullable_to_non_nullable
as MerchantProductCategoryEntity,variants: null == variants ? _self._variants : variants // ignore: cast_nullable_to_non_nullable
as List<MerchantProductVariantEntity>,images: null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<MerchantProductImageEntity>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class MerchantProductSendParam implements MerchantProduct {
  const MerchantProductSendParam({this.sendId, required this.name, required this.slug, required this.category, required this.branch, this.description, required this.stock, required this.minPurchase, required this.price, @JsonKey(toJson: ParseHelper.boolToInt, fromJson: ParseHelper.intToBool) required this.isPublished, @JsonKey(toJson: ParseHelper.boolToInt, fromJson: ParseHelper.intToBool) required this.hasVariant, @JsonKey(toJson: ParseHelper.boolToInt, fromJson: ParseHelper.intToBool) required this.isSameDimension, this.sku, this.weight, this.length, this.width, this.height, @JsonKey(name: 'variants') final  List<MerchantProductVariantSendParam>? sendVariants, @JsonKey(name: 'images') final  List<String>? sendImages, final  String? $type}): _sendVariants = sendVariants,_sendImages = sendImages,$type = $type ?? 'sendParam';
  factory MerchantProductSendParam.fromJson(Map<String, dynamic> json) => _$MerchantProductSendParamFromJson(json);

 final  String? sendId;
@override final  String name;
@override final  String slug;
@override final  String category;
@override final  String branch;
@override final  String? description;
@override final  int stock;
@override final  int minPurchase;
@override final  int price;
@override@JsonKey(toJson: ParseHelper.boolToInt, fromJson: ParseHelper.intToBool) final  bool isPublished;
@override@JsonKey(toJson: ParseHelper.boolToInt, fromJson: ParseHelper.intToBool) final  bool hasVariant;
@override@JsonKey(toJson: ParseHelper.boolToInt, fromJson: ParseHelper.intToBool) final  bool isSameDimension;
@override final  String? sku;
@override final  int? weight;
@override final  int? length;
@override final  int? width;
@override final  int? height;
 final  List<MerchantProductVariantSendParam>? _sendVariants;
@JsonKey(name: 'variants') List<MerchantProductVariantSendParam>? get sendVariants {
  final value = _sendVariants;
  if (value == null) return null;
  if (_sendVariants is EqualUnmodifiableListView) return _sendVariants;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _sendImages;
@JsonKey(name: 'images') List<String>? get sendImages {
  final value = _sendImages;
  if (value == null) return null;
  if (_sendImages is EqualUnmodifiableListView) return _sendImages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of MerchantProduct
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantProductSendParamCopyWith<MerchantProductSendParam> get copyWith => _$MerchantProductSendParamCopyWithImpl<MerchantProductSendParam>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MerchantProductSendParamToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantProductSendParam&&(identical(other.sendId, sendId) || other.sendId == sendId)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.category, category) || other.category == category)&&(identical(other.branch, branch) || other.branch == branch)&&(identical(other.description, description) || other.description == description)&&(identical(other.stock, stock) || other.stock == stock)&&(identical(other.minPurchase, minPurchase) || other.minPurchase == minPurchase)&&(identical(other.price, price) || other.price == price)&&(identical(other.isPublished, isPublished) || other.isPublished == isPublished)&&(identical(other.hasVariant, hasVariant) || other.hasVariant == hasVariant)&&(identical(other.isSameDimension, isSameDimension) || other.isSameDimension == isSameDimension)&&(identical(other.sku, sku) || other.sku == sku)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.length, length) || other.length == length)&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height)&&const DeepCollectionEquality().equals(other._sendVariants, _sendVariants)&&const DeepCollectionEquality().equals(other._sendImages, _sendImages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,sendId,name,slug,category,branch,description,stock,minPurchase,price,isPublished,hasVariant,isSameDimension,sku,weight,length,width,height,const DeepCollectionEquality().hash(_sendVariants),const DeepCollectionEquality().hash(_sendImages)]);

@override
String toString() {
  return 'MerchantProduct.sendParam(sendId: $sendId, name: $name, slug: $slug, category: $category, branch: $branch, description: $description, stock: $stock, minPurchase: $minPurchase, price: $price, isPublished: $isPublished, hasVariant: $hasVariant, isSameDimension: $isSameDimension, sku: $sku, weight: $weight, length: $length, width: $width, height: $height, sendVariants: $sendVariants, sendImages: $sendImages)';
}


}

/// @nodoc
abstract mixin class $MerchantProductSendParamCopyWith<$Res> implements $MerchantProductCopyWith<$Res> {
  factory $MerchantProductSendParamCopyWith(MerchantProductSendParam value, $Res Function(MerchantProductSendParam) _then) = _$MerchantProductSendParamCopyWithImpl;
@override @useResult
$Res call({
 String? sendId, String name, String slug, String category, String branch, String? description, int stock, int minPurchase, int price,@JsonKey(toJson: ParseHelper.boolToInt, fromJson: ParseHelper.intToBool) bool isPublished,@JsonKey(toJson: ParseHelper.boolToInt, fromJson: ParseHelper.intToBool) bool hasVariant,@JsonKey(toJson: ParseHelper.boolToInt, fromJson: ParseHelper.intToBool) bool isSameDimension, String? sku, int? weight, int? length, int? width, int? height,@JsonKey(name: 'variants') List<MerchantProductVariantSendParam>? sendVariants,@JsonKey(name: 'images') List<String>? sendImages
});




}
/// @nodoc
class _$MerchantProductSendParamCopyWithImpl<$Res>
    implements $MerchantProductSendParamCopyWith<$Res> {
  _$MerchantProductSendParamCopyWithImpl(this._self, this._then);

  final MerchantProductSendParam _self;
  final $Res Function(MerchantProductSendParam) _then;

/// Create a copy of MerchantProduct
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sendId = freezed,Object? name = null,Object? slug = null,Object? category = null,Object? branch = null,Object? description = freezed,Object? stock = null,Object? minPurchase = null,Object? price = null,Object? isPublished = null,Object? hasVariant = null,Object? isSameDimension = null,Object? sku = freezed,Object? weight = freezed,Object? length = freezed,Object? width = freezed,Object? height = freezed,Object? sendVariants = freezed,Object? sendImages = freezed,}) {
  return _then(MerchantProductSendParam(
sendId: freezed == sendId ? _self.sendId : sendId // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,branch: null == branch ? _self.branch : branch // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,stock: null == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as int,minPurchase: null == minPurchase ? _self.minPurchase : minPurchase // ignore: cast_nullable_to_non_nullable
as int,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,isPublished: null == isPublished ? _self.isPublished : isPublished // ignore: cast_nullable_to_non_nullable
as bool,hasVariant: null == hasVariant ? _self.hasVariant : hasVariant // ignore: cast_nullable_to_non_nullable
as bool,isSameDimension: null == isSameDimension ? _self.isSameDimension : isSameDimension // ignore: cast_nullable_to_non_nullable
as bool,sku: freezed == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String?,weight: freezed == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as int?,length: freezed == length ? _self.length : length // ignore: cast_nullable_to_non_nullable
as int?,width: freezed == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int?,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int?,sendVariants: freezed == sendVariants ? _self._sendVariants : sendVariants // ignore: cast_nullable_to_non_nullable
as List<MerchantProductVariantSendParam>?,sendImages: freezed == sendImages ? _self._sendImages : sendImages // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}


}

// dart format on
