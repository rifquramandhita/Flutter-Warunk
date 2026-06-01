// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
CustomerProduct _$CustomerProductFromJson(
  Map<String, dynamic> json
) {
    return CustomerProductEntity.fromJson(
      json
    );
}

/// @nodoc
mixin _$CustomerProduct {

 String get id; String get name; String get slug; String get merchantId; String get productCategoryId; String get category; String? get branch; String? get description; int get stock; int get orderCount; int get minPurchase; int get price; bool get isPublished; bool get hasVariant; bool get isSameDimension; String? get sku; int? get weight; int? get length; int? get width; int? get height; CustomerMerchantEntity? get merchant; CustomerProductCategoryEntity? get productCategory; List<CustomerProductVariantEntity>? get variants; List<CustomerProductImageEntity>? get images; double get rating; int get reviewsCount;
/// Create a copy of CustomerProduct
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerProductCopyWith<CustomerProduct> get copyWith => _$CustomerProductCopyWithImpl<CustomerProduct>(this as CustomerProduct, _$identity);

  /// Serializes this CustomerProduct to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerProduct&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.merchantId, merchantId) || other.merchantId == merchantId)&&(identical(other.productCategoryId, productCategoryId) || other.productCategoryId == productCategoryId)&&(identical(other.category, category) || other.category == category)&&(identical(other.branch, branch) || other.branch == branch)&&(identical(other.description, description) || other.description == description)&&(identical(other.stock, stock) || other.stock == stock)&&(identical(other.orderCount, orderCount) || other.orderCount == orderCount)&&(identical(other.minPurchase, minPurchase) || other.minPurchase == minPurchase)&&(identical(other.price, price) || other.price == price)&&(identical(other.isPublished, isPublished) || other.isPublished == isPublished)&&(identical(other.hasVariant, hasVariant) || other.hasVariant == hasVariant)&&(identical(other.isSameDimension, isSameDimension) || other.isSameDimension == isSameDimension)&&(identical(other.sku, sku) || other.sku == sku)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.length, length) || other.length == length)&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height)&&const DeepCollectionEquality().equals(other.merchant, merchant)&&const DeepCollectionEquality().equals(other.productCategory, productCategory)&&const DeepCollectionEquality().equals(other.variants, variants)&&const DeepCollectionEquality().equals(other.images, images)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.reviewsCount, reviewsCount) || other.reviewsCount == reviewsCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,name,slug,merchantId,productCategoryId,category,branch,description,stock,orderCount,minPurchase,price,isPublished,hasVariant,isSameDimension,sku,weight,length,width,height,const DeepCollectionEquality().hash(merchant),const DeepCollectionEquality().hash(productCategory),const DeepCollectionEquality().hash(variants),const DeepCollectionEquality().hash(images),rating,reviewsCount]);

@override
String toString() {
  return 'CustomerProduct(id: $id, name: $name, slug: $slug, merchantId: $merchantId, productCategoryId: $productCategoryId, category: $category, branch: $branch, description: $description, stock: $stock, orderCount: $orderCount, minPurchase: $minPurchase, price: $price, isPublished: $isPublished, hasVariant: $hasVariant, isSameDimension: $isSameDimension, sku: $sku, weight: $weight, length: $length, width: $width, height: $height, merchant: $merchant, productCategory: $productCategory, variants: $variants, images: $images, rating: $rating, reviewsCount: $reviewsCount)';
}


}

/// @nodoc
abstract mixin class $CustomerProductCopyWith<$Res>  {
  factory $CustomerProductCopyWith(CustomerProduct value, $Res Function(CustomerProduct) _then) = _$CustomerProductCopyWithImpl;
@useResult
$Res call({
 String id, String name, String slug, String merchantId, String productCategoryId, String category, String? branch, String? description, int stock, int orderCount, int minPurchase, int price, bool isPublished, bool hasVariant, bool isSameDimension, String? sku, int? weight, int? length, int? width, int? height, CustomerMerchantEntity? merchant, CustomerProductCategoryEntity? productCategory, List<CustomerProductVariantEntity>? variants, List<CustomerProductImageEntity>? images, double rating, int reviewsCount
});




}
/// @nodoc
class _$CustomerProductCopyWithImpl<$Res>
    implements $CustomerProductCopyWith<$Res> {
  _$CustomerProductCopyWithImpl(this._self, this._then);

  final CustomerProduct _self;
  final $Res Function(CustomerProduct) _then;

/// Create a copy of CustomerProduct
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? slug = null,Object? merchantId = null,Object? productCategoryId = null,Object? category = null,Object? branch = freezed,Object? description = freezed,Object? stock = null,Object? orderCount = null,Object? minPurchase = null,Object? price = null,Object? isPublished = null,Object? hasVariant = null,Object? isSameDimension = null,Object? sku = freezed,Object? weight = freezed,Object? length = freezed,Object? width = freezed,Object? height = freezed,Object? merchant = freezed,Object? productCategory = freezed,Object? variants = freezed,Object? images = freezed,Object? rating = null,Object? reviewsCount = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,merchantId: null == merchantId ? _self.merchantId : merchantId // ignore: cast_nullable_to_non_nullable
as String,productCategoryId: null == productCategoryId ? _self.productCategoryId : productCategoryId // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,branch: freezed == branch ? _self.branch : branch // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
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
as int?,merchant: freezed == merchant ? _self.merchant : merchant // ignore: cast_nullable_to_non_nullable
as CustomerMerchantEntity?,productCategory: freezed == productCategory ? _self.productCategory : productCategory // ignore: cast_nullable_to_non_nullable
as CustomerProductCategoryEntity?,variants: freezed == variants ? _self.variants : variants // ignore: cast_nullable_to_non_nullable
as List<CustomerProductVariantEntity>?,images: freezed == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<CustomerProductImageEntity>?,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,reviewsCount: null == reviewsCount ? _self.reviewsCount : reviewsCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CustomerProduct].
extension CustomerProductPatterns on CustomerProduct {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CustomerProductEntity value)?  entity,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CustomerProductEntity() when entity != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CustomerProductEntity value)  entity,}){
final _that = this;
switch (_that) {
case CustomerProductEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CustomerProductEntity value)?  entity,}){
final _that = this;
switch (_that) {
case CustomerProductEntity() when entity != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String id,  String name,  String slug,  String merchantId,  String productCategoryId,  String category,  String? branch,  String? description,  int stock,  int orderCount,  int minPurchase,  int price,  bool isPublished,  bool hasVariant,  bool isSameDimension,  String? sku,  int? weight,  int? length,  int? width,  int? height,  CustomerMerchantEntity? merchant,  CustomerProductCategoryEntity? productCategory,  List<CustomerProductVariantEntity>? variants,  List<CustomerProductImageEntity>? images,  double rating,  int reviewsCount)?  entity,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CustomerProductEntity() when entity != null:
return entity(_that.id,_that.name,_that.slug,_that.merchantId,_that.productCategoryId,_that.category,_that.branch,_that.description,_that.stock,_that.orderCount,_that.minPurchase,_that.price,_that.isPublished,_that.hasVariant,_that.isSameDimension,_that.sku,_that.weight,_that.length,_that.width,_that.height,_that.merchant,_that.productCategory,_that.variants,_that.images,_that.rating,_that.reviewsCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String id,  String name,  String slug,  String merchantId,  String productCategoryId,  String category,  String? branch,  String? description,  int stock,  int orderCount,  int minPurchase,  int price,  bool isPublished,  bool hasVariant,  bool isSameDimension,  String? sku,  int? weight,  int? length,  int? width,  int? height,  CustomerMerchantEntity? merchant,  CustomerProductCategoryEntity? productCategory,  List<CustomerProductVariantEntity>? variants,  List<CustomerProductImageEntity>? images,  double rating,  int reviewsCount)  entity,}) {final _that = this;
switch (_that) {
case CustomerProductEntity():
return entity(_that.id,_that.name,_that.slug,_that.merchantId,_that.productCategoryId,_that.category,_that.branch,_that.description,_that.stock,_that.orderCount,_that.minPurchase,_that.price,_that.isPublished,_that.hasVariant,_that.isSameDimension,_that.sku,_that.weight,_that.length,_that.width,_that.height,_that.merchant,_that.productCategory,_that.variants,_that.images,_that.rating,_that.reviewsCount);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String id,  String name,  String slug,  String merchantId,  String productCategoryId,  String category,  String? branch,  String? description,  int stock,  int orderCount,  int minPurchase,  int price,  bool isPublished,  bool hasVariant,  bool isSameDimension,  String? sku,  int? weight,  int? length,  int? width,  int? height,  CustomerMerchantEntity? merchant,  CustomerProductCategoryEntity? productCategory,  List<CustomerProductVariantEntity>? variants,  List<CustomerProductImageEntity>? images,  double rating,  int reviewsCount)?  entity,}) {final _that = this;
switch (_that) {
case CustomerProductEntity() when entity != null:
return entity(_that.id,_that.name,_that.slug,_that.merchantId,_that.productCategoryId,_that.category,_that.branch,_that.description,_that.stock,_that.orderCount,_that.minPurchase,_that.price,_that.isPublished,_that.hasVariant,_that.isSameDimension,_that.sku,_that.weight,_that.length,_that.width,_that.height,_that.merchant,_that.productCategory,_that.variants,_that.images,_that.rating,_that.reviewsCount);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class CustomerProductEntity implements CustomerProduct {
  const CustomerProductEntity({required this.id, required this.name, required this.slug, required this.merchantId, required this.productCategoryId, required this.category, this.branch, this.description, required this.stock, required this.orderCount, required this.minPurchase, required this.price, required this.isPublished, required this.hasVariant, required this.isSameDimension, this.sku, this.weight, this.length, this.width, this.height, this.merchant, this.productCategory, final  List<CustomerProductVariantEntity>? variants, final  List<CustomerProductImageEntity>? images, required this.rating, required this.reviewsCount}): _variants = variants,_images = images;
  factory CustomerProductEntity.fromJson(Map<String, dynamic> json) => _$CustomerProductEntityFromJson(json);

@override final  String id;
@override final  String name;
@override final  String slug;
@override final  String merchantId;
@override final  String productCategoryId;
@override final  String category;
@override final  String? branch;
@override final  String? description;
@override final  int stock;
@override final  int orderCount;
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
@override final  CustomerMerchantEntity? merchant;
@override final  CustomerProductCategoryEntity? productCategory;
 final  List<CustomerProductVariantEntity>? _variants;
@override List<CustomerProductVariantEntity>? get variants {
  final value = _variants;
  if (value == null) return null;
  if (_variants is EqualUnmodifiableListView) return _variants;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<CustomerProductImageEntity>? _images;
@override List<CustomerProductImageEntity>? get images {
  final value = _images;
  if (value == null) return null;
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  double rating;
@override final  int reviewsCount;

/// Create a copy of CustomerProduct
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerProductEntityCopyWith<CustomerProductEntity> get copyWith => _$CustomerProductEntityCopyWithImpl<CustomerProductEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomerProductEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerProductEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.merchantId, merchantId) || other.merchantId == merchantId)&&(identical(other.productCategoryId, productCategoryId) || other.productCategoryId == productCategoryId)&&(identical(other.category, category) || other.category == category)&&(identical(other.branch, branch) || other.branch == branch)&&(identical(other.description, description) || other.description == description)&&(identical(other.stock, stock) || other.stock == stock)&&(identical(other.orderCount, orderCount) || other.orderCount == orderCount)&&(identical(other.minPurchase, minPurchase) || other.minPurchase == minPurchase)&&(identical(other.price, price) || other.price == price)&&(identical(other.isPublished, isPublished) || other.isPublished == isPublished)&&(identical(other.hasVariant, hasVariant) || other.hasVariant == hasVariant)&&(identical(other.isSameDimension, isSameDimension) || other.isSameDimension == isSameDimension)&&(identical(other.sku, sku) || other.sku == sku)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.length, length) || other.length == length)&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height)&&const DeepCollectionEquality().equals(other.merchant, merchant)&&const DeepCollectionEquality().equals(other.productCategory, productCategory)&&const DeepCollectionEquality().equals(other._variants, _variants)&&const DeepCollectionEquality().equals(other._images, _images)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.reviewsCount, reviewsCount) || other.reviewsCount == reviewsCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,name,slug,merchantId,productCategoryId,category,branch,description,stock,orderCount,minPurchase,price,isPublished,hasVariant,isSameDimension,sku,weight,length,width,height,const DeepCollectionEquality().hash(merchant),const DeepCollectionEquality().hash(productCategory),const DeepCollectionEquality().hash(_variants),const DeepCollectionEquality().hash(_images),rating,reviewsCount]);

@override
String toString() {
  return 'CustomerProduct.entity(id: $id, name: $name, slug: $slug, merchantId: $merchantId, productCategoryId: $productCategoryId, category: $category, branch: $branch, description: $description, stock: $stock, orderCount: $orderCount, minPurchase: $minPurchase, price: $price, isPublished: $isPublished, hasVariant: $hasVariant, isSameDimension: $isSameDimension, sku: $sku, weight: $weight, length: $length, width: $width, height: $height, merchant: $merchant, productCategory: $productCategory, variants: $variants, images: $images, rating: $rating, reviewsCount: $reviewsCount)';
}


}

/// @nodoc
abstract mixin class $CustomerProductEntityCopyWith<$Res> implements $CustomerProductCopyWith<$Res> {
  factory $CustomerProductEntityCopyWith(CustomerProductEntity value, $Res Function(CustomerProductEntity) _then) = _$CustomerProductEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String slug, String merchantId, String productCategoryId, String category, String? branch, String? description, int stock, int orderCount, int minPurchase, int price, bool isPublished, bool hasVariant, bool isSameDimension, String? sku, int? weight, int? length, int? width, int? height, CustomerMerchantEntity? merchant, CustomerProductCategoryEntity? productCategory, List<CustomerProductVariantEntity>? variants, List<CustomerProductImageEntity>? images, double rating, int reviewsCount
});




}
/// @nodoc
class _$CustomerProductEntityCopyWithImpl<$Res>
    implements $CustomerProductEntityCopyWith<$Res> {
  _$CustomerProductEntityCopyWithImpl(this._self, this._then);

  final CustomerProductEntity _self;
  final $Res Function(CustomerProductEntity) _then;

/// Create a copy of CustomerProduct
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? slug = null,Object? merchantId = null,Object? productCategoryId = null,Object? category = null,Object? branch = freezed,Object? description = freezed,Object? stock = null,Object? orderCount = null,Object? minPurchase = null,Object? price = null,Object? isPublished = null,Object? hasVariant = null,Object? isSameDimension = null,Object? sku = freezed,Object? weight = freezed,Object? length = freezed,Object? width = freezed,Object? height = freezed,Object? merchant = freezed,Object? productCategory = freezed,Object? variants = freezed,Object? images = freezed,Object? rating = null,Object? reviewsCount = null,}) {
  return _then(CustomerProductEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,merchantId: null == merchantId ? _self.merchantId : merchantId // ignore: cast_nullable_to_non_nullable
as String,productCategoryId: null == productCategoryId ? _self.productCategoryId : productCategoryId // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,branch: freezed == branch ? _self.branch : branch // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
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
as int?,merchant: freezed == merchant ? _self.merchant : merchant // ignore: cast_nullable_to_non_nullable
as CustomerMerchantEntity?,productCategory: freezed == productCategory ? _self.productCategory : productCategory // ignore: cast_nullable_to_non_nullable
as CustomerProductCategoryEntity?,variants: freezed == variants ? _self._variants : variants // ignore: cast_nullable_to_non_nullable
as List<CustomerProductVariantEntity>?,images: freezed == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<CustomerProductImageEntity>?,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,reviewsCount: null == reviewsCount ? _self.reviewsCount : reviewsCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

CustomerProductCategory _$CustomerProductCategoryFromJson(
  Map<String, dynamic> json
) {
    return CustomerProductCategoryEntity.fromJson(
      json
    );
}

/// @nodoc
mixin _$CustomerProductCategory {

 String get id; String get name; String get slug;
/// Create a copy of CustomerProductCategory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerProductCategoryCopyWith<CustomerProductCategory> get copyWith => _$CustomerProductCategoryCopyWithImpl<CustomerProductCategory>(this as CustomerProductCategory, _$identity);

  /// Serializes this CustomerProductCategory to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerProductCategory&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,slug);

@override
String toString() {
  return 'CustomerProductCategory(id: $id, name: $name, slug: $slug)';
}


}

/// @nodoc
abstract mixin class $CustomerProductCategoryCopyWith<$Res>  {
  factory $CustomerProductCategoryCopyWith(CustomerProductCategory value, $Res Function(CustomerProductCategory) _then) = _$CustomerProductCategoryCopyWithImpl;
@useResult
$Res call({
 String id, String name, String slug
});




}
/// @nodoc
class _$CustomerProductCategoryCopyWithImpl<$Res>
    implements $CustomerProductCategoryCopyWith<$Res> {
  _$CustomerProductCategoryCopyWithImpl(this._self, this._then);

  final CustomerProductCategory _self;
  final $Res Function(CustomerProductCategory) _then;

/// Create a copy of CustomerProductCategory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? slug = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CustomerProductCategory].
extension CustomerProductCategoryPatterns on CustomerProductCategory {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CustomerProductCategoryEntity value)?  entity,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CustomerProductCategoryEntity() when entity != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CustomerProductCategoryEntity value)  entity,}){
final _that = this;
switch (_that) {
case CustomerProductCategoryEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CustomerProductCategoryEntity value)?  entity,}){
final _that = this;
switch (_that) {
case CustomerProductCategoryEntity() when entity != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String id,  String name,  String slug)?  entity,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CustomerProductCategoryEntity() when entity != null:
return entity(_that.id,_that.name,_that.slug);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String id,  String name,  String slug)  entity,}) {final _that = this;
switch (_that) {
case CustomerProductCategoryEntity():
return entity(_that.id,_that.name,_that.slug);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String id,  String name,  String slug)?  entity,}) {final _that = this;
switch (_that) {
case CustomerProductCategoryEntity() when entity != null:
return entity(_that.id,_that.name,_that.slug);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class CustomerProductCategoryEntity implements CustomerProductCategory {
  const CustomerProductCategoryEntity({required this.id, required this.name, required this.slug});
  factory CustomerProductCategoryEntity.fromJson(Map<String, dynamic> json) => _$CustomerProductCategoryEntityFromJson(json);

@override final  String id;
@override final  String name;
@override final  String slug;

/// Create a copy of CustomerProductCategory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerProductCategoryEntityCopyWith<CustomerProductCategoryEntity> get copyWith => _$CustomerProductCategoryEntityCopyWithImpl<CustomerProductCategoryEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomerProductCategoryEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerProductCategoryEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,slug);

@override
String toString() {
  return 'CustomerProductCategory.entity(id: $id, name: $name, slug: $slug)';
}


}

/// @nodoc
abstract mixin class $CustomerProductCategoryEntityCopyWith<$Res> implements $CustomerProductCategoryCopyWith<$Res> {
  factory $CustomerProductCategoryEntityCopyWith(CustomerProductCategoryEntity value, $Res Function(CustomerProductCategoryEntity) _then) = _$CustomerProductCategoryEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String slug
});




}
/// @nodoc
class _$CustomerProductCategoryEntityCopyWithImpl<$Res>
    implements $CustomerProductCategoryEntityCopyWith<$Res> {
  _$CustomerProductCategoryEntityCopyWithImpl(this._self, this._then);

  final CustomerProductCategoryEntity _self;
  final $Res Function(CustomerProductCategoryEntity) _then;

/// Create a copy of CustomerProductCategory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? slug = null,}) {
  return _then(CustomerProductCategoryEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

CustomerProductVariant _$CustomerProductVariantFromJson(
  Map<String, dynamic> json
) {
    return CustomerProductVariantEntity.fromJson(
      json
    );
}

/// @nodoc
mixin _$CustomerProductVariant {

 String get id; String get productId; Map<String, String> get variantCombination; String? get sku; int get price; int get stock; int get minPurchase; int? get weight; int? get length; int? get width; int? get height;
/// Create a copy of CustomerProductVariant
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerProductVariantCopyWith<CustomerProductVariant> get copyWith => _$CustomerProductVariantCopyWithImpl<CustomerProductVariant>(this as CustomerProductVariant, _$identity);

  /// Serializes this CustomerProductVariant to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerProductVariant&&(identical(other.id, id) || other.id == id)&&(identical(other.productId, productId) || other.productId == productId)&&const DeepCollectionEquality().equals(other.variantCombination, variantCombination)&&(identical(other.sku, sku) || other.sku == sku)&&(identical(other.price, price) || other.price == price)&&(identical(other.stock, stock) || other.stock == stock)&&(identical(other.minPurchase, minPurchase) || other.minPurchase == minPurchase)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.length, length) || other.length == length)&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,productId,const DeepCollectionEquality().hash(variantCombination),sku,price,stock,minPurchase,weight,length,width,height);

@override
String toString() {
  return 'CustomerProductVariant(id: $id, productId: $productId, variantCombination: $variantCombination, sku: $sku, price: $price, stock: $stock, minPurchase: $minPurchase, weight: $weight, length: $length, width: $width, height: $height)';
}


}

/// @nodoc
abstract mixin class $CustomerProductVariantCopyWith<$Res>  {
  factory $CustomerProductVariantCopyWith(CustomerProductVariant value, $Res Function(CustomerProductVariant) _then) = _$CustomerProductVariantCopyWithImpl;
@useResult
$Res call({
 String id, String productId, Map<String, String> variantCombination, String? sku, int price, int stock, int minPurchase, int? weight, int? length, int? width, int? height
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? productId = null,Object? variantCombination = null,Object? sku = freezed,Object? price = null,Object? stock = null,Object? minPurchase = null,Object? weight = freezed,Object? length = freezed,Object? width = freezed,Object? height = freezed,}) {
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
as int?,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String id,  String productId,  Map<String, String> variantCombination,  String? sku,  int price,  int stock,  int minPurchase,  int? weight,  int? length,  int? width,  int? height)?  entity,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CustomerProductVariantEntity() when entity != null:
return entity(_that.id,_that.productId,_that.variantCombination,_that.sku,_that.price,_that.stock,_that.minPurchase,_that.weight,_that.length,_that.width,_that.height);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String id,  String productId,  Map<String, String> variantCombination,  String? sku,  int price,  int stock,  int minPurchase,  int? weight,  int? length,  int? width,  int? height)  entity,}) {final _that = this;
switch (_that) {
case CustomerProductVariantEntity():
return entity(_that.id,_that.productId,_that.variantCombination,_that.sku,_that.price,_that.stock,_that.minPurchase,_that.weight,_that.length,_that.width,_that.height);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String id,  String productId,  Map<String, String> variantCombination,  String? sku,  int price,  int stock,  int minPurchase,  int? weight,  int? length,  int? width,  int? height)?  entity,}) {final _that = this;
switch (_that) {
case CustomerProductVariantEntity() when entity != null:
return entity(_that.id,_that.productId,_that.variantCombination,_that.sku,_that.price,_that.stock,_that.minPurchase,_that.weight,_that.length,_that.width,_that.height);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class CustomerProductVariantEntity implements CustomerProductVariant {
  const CustomerProductVariantEntity({required this.id, required this.productId, required final  Map<String, String> variantCombination, this.sku, required this.price, required this.stock, required this.minPurchase, this.weight, this.length, this.width, this.height}): _variantCombination = variantCombination;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerProductVariantEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.productId, productId) || other.productId == productId)&&const DeepCollectionEquality().equals(other._variantCombination, _variantCombination)&&(identical(other.sku, sku) || other.sku == sku)&&(identical(other.price, price) || other.price == price)&&(identical(other.stock, stock) || other.stock == stock)&&(identical(other.minPurchase, minPurchase) || other.minPurchase == minPurchase)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.length, length) || other.length == length)&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,productId,const DeepCollectionEquality().hash(_variantCombination),sku,price,stock,minPurchase,weight,length,width,height);

@override
String toString() {
  return 'CustomerProductVariant.entity(id: $id, productId: $productId, variantCombination: $variantCombination, sku: $sku, price: $price, stock: $stock, minPurchase: $minPurchase, weight: $weight, length: $length, width: $width, height: $height)';
}


}

/// @nodoc
abstract mixin class $CustomerProductVariantEntityCopyWith<$Res> implements $CustomerProductVariantCopyWith<$Res> {
  factory $CustomerProductVariantEntityCopyWith(CustomerProductVariantEntity value, $Res Function(CustomerProductVariantEntity) _then) = _$CustomerProductVariantEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String productId, Map<String, String> variantCombination, String? sku, int price, int stock, int minPurchase, int? weight, int? length, int? width, int? height
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? productId = null,Object? variantCombination = null,Object? sku = freezed,Object? price = null,Object? stock = null,Object? minPurchase = null,Object? weight = freezed,Object? length = freezed,Object? width = freezed,Object? height = freezed,}) {
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
as int?,
  ));
}


}

CustomerProductImage _$CustomerProductImageFromJson(
  Map<String, dynamic> json
) {
    return CustomerProductImageEntity.fromJson(
      json
    );
}

/// @nodoc
mixin _$CustomerProductImage {

 String get id; String get filePath; String get url; String get fileName; int get fileSize; String get mimeType; String get altText; int get sortOrder;
/// Create a copy of CustomerProductImage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerProductImageCopyWith<CustomerProductImage> get copyWith => _$CustomerProductImageCopyWithImpl<CustomerProductImage>(this as CustomerProductImage, _$identity);

  /// Serializes this CustomerProductImage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerProductImage&&(identical(other.id, id) || other.id == id)&&(identical(other.filePath, filePath) || other.filePath == filePath)&&(identical(other.url, url) || other.url == url)&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.fileSize, fileSize) || other.fileSize == fileSize)&&(identical(other.mimeType, mimeType) || other.mimeType == mimeType)&&(identical(other.altText, altText) || other.altText == altText)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,filePath,url,fileName,fileSize,mimeType,altText,sortOrder);

@override
String toString() {
  return 'CustomerProductImage(id: $id, filePath: $filePath, url: $url, fileName: $fileName, fileSize: $fileSize, mimeType: $mimeType, altText: $altText, sortOrder: $sortOrder)';
}


}

/// @nodoc
abstract mixin class $CustomerProductImageCopyWith<$Res>  {
  factory $CustomerProductImageCopyWith(CustomerProductImage value, $Res Function(CustomerProductImage) _then) = _$CustomerProductImageCopyWithImpl;
@useResult
$Res call({
 String id, String filePath, String url, String fileName, int fileSize, String mimeType, String altText, int sortOrder
});




}
/// @nodoc
class _$CustomerProductImageCopyWithImpl<$Res>
    implements $CustomerProductImageCopyWith<$Res> {
  _$CustomerProductImageCopyWithImpl(this._self, this._then);

  final CustomerProductImage _self;
  final $Res Function(CustomerProductImage) _then;

/// Create a copy of CustomerProductImage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? filePath = null,Object? url = null,Object? fileName = null,Object? fileSize = null,Object? mimeType = null,Object? altText = null,Object? sortOrder = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,filePath: null == filePath ? _self.filePath : filePath // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,fileName: null == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String,fileSize: null == fileSize ? _self.fileSize : fileSize // ignore: cast_nullable_to_non_nullable
as int,mimeType: null == mimeType ? _self.mimeType : mimeType // ignore: cast_nullable_to_non_nullable
as String,altText: null == altText ? _self.altText : altText // ignore: cast_nullable_to_non_nullable
as String,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CustomerProductImage].
extension CustomerProductImagePatterns on CustomerProductImage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CustomerProductImageEntity value)?  entity,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CustomerProductImageEntity() when entity != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CustomerProductImageEntity value)  entity,}){
final _that = this;
switch (_that) {
case CustomerProductImageEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CustomerProductImageEntity value)?  entity,}){
final _that = this;
switch (_that) {
case CustomerProductImageEntity() when entity != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String id,  String filePath,  String url,  String fileName,  int fileSize,  String mimeType,  String altText,  int sortOrder)?  entity,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CustomerProductImageEntity() when entity != null:
return entity(_that.id,_that.filePath,_that.url,_that.fileName,_that.fileSize,_that.mimeType,_that.altText,_that.sortOrder);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String id,  String filePath,  String url,  String fileName,  int fileSize,  String mimeType,  String altText,  int sortOrder)  entity,}) {final _that = this;
switch (_that) {
case CustomerProductImageEntity():
return entity(_that.id,_that.filePath,_that.url,_that.fileName,_that.fileSize,_that.mimeType,_that.altText,_that.sortOrder);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String id,  String filePath,  String url,  String fileName,  int fileSize,  String mimeType,  String altText,  int sortOrder)?  entity,}) {final _that = this;
switch (_that) {
case CustomerProductImageEntity() when entity != null:
return entity(_that.id,_that.filePath,_that.url,_that.fileName,_that.fileSize,_that.mimeType,_that.altText,_that.sortOrder);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class CustomerProductImageEntity implements CustomerProductImage {
  const CustomerProductImageEntity({required this.id, required this.filePath, required this.url, required this.fileName, required this.fileSize, required this.mimeType, required this.altText, required this.sortOrder});
  factory CustomerProductImageEntity.fromJson(Map<String, dynamic> json) => _$CustomerProductImageEntityFromJson(json);

@override final  String id;
@override final  String filePath;
@override final  String url;
@override final  String fileName;
@override final  int fileSize;
@override final  String mimeType;
@override final  String altText;
@override final  int sortOrder;

/// Create a copy of CustomerProductImage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerProductImageEntityCopyWith<CustomerProductImageEntity> get copyWith => _$CustomerProductImageEntityCopyWithImpl<CustomerProductImageEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomerProductImageEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerProductImageEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.filePath, filePath) || other.filePath == filePath)&&(identical(other.url, url) || other.url == url)&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.fileSize, fileSize) || other.fileSize == fileSize)&&(identical(other.mimeType, mimeType) || other.mimeType == mimeType)&&(identical(other.altText, altText) || other.altText == altText)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,filePath,url,fileName,fileSize,mimeType,altText,sortOrder);

@override
String toString() {
  return 'CustomerProductImage.entity(id: $id, filePath: $filePath, url: $url, fileName: $fileName, fileSize: $fileSize, mimeType: $mimeType, altText: $altText, sortOrder: $sortOrder)';
}


}

/// @nodoc
abstract mixin class $CustomerProductImageEntityCopyWith<$Res> implements $CustomerProductImageCopyWith<$Res> {
  factory $CustomerProductImageEntityCopyWith(CustomerProductImageEntity value, $Res Function(CustomerProductImageEntity) _then) = _$CustomerProductImageEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String filePath, String url, String fileName, int fileSize, String mimeType, String altText, int sortOrder
});




}
/// @nodoc
class _$CustomerProductImageEntityCopyWithImpl<$Res>
    implements $CustomerProductImageEntityCopyWith<$Res> {
  _$CustomerProductImageEntityCopyWithImpl(this._self, this._then);

  final CustomerProductImageEntity _self;
  final $Res Function(CustomerProductImageEntity) _then;

/// Create a copy of CustomerProductImage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? filePath = null,Object? url = null,Object? fileName = null,Object? fileSize = null,Object? mimeType = null,Object? altText = null,Object? sortOrder = null,}) {
  return _then(CustomerProductImageEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,filePath: null == filePath ? _self.filePath : filePath // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,fileName: null == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String,fileSize: null == fileSize ? _self.fileSize : fileSize // ignore: cast_nullable_to_non_nullable
as int,mimeType: null == mimeType ? _self.mimeType : mimeType // ignore: cast_nullable_to_non_nullable
as String,altText: null == altText ? _self.altText : altText // ignore: cast_nullable_to_non_nullable
as String,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
