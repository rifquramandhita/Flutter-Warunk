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

 String get id; String get name; String? get slug; String? get merchantId; String get category; String? get branch; String? get description; int? get stock; int? get minPurchase; int get price; bool? get isPublished; bool? get hasVariant; bool? get isSameDimension; String? get sku; int? get weight; int? get length; int? get width; int? get height; CustomerMerchantEntity? get merchant; CustomerProductCategoryEntity? get productCategory; List<CustomerProductVariantEntity>? get variants; List<CustomerProductImageEntity>? get images; double? get rating; int? get reviewsCount; List<dynamic>? get reviews; bool? get isWishlisted; String? get createdAt; String? get updatedAt;
/// Create a copy of CustomerProduct
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerProductCopyWith<CustomerProduct> get copyWith => _$CustomerProductCopyWithImpl<CustomerProduct>(this as CustomerProduct, _$identity);

  /// Serializes this CustomerProduct to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerProduct&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.merchantId, merchantId) || other.merchantId == merchantId)&&(identical(other.category, category) || other.category == category)&&(identical(other.branch, branch) || other.branch == branch)&&(identical(other.description, description) || other.description == description)&&(identical(other.stock, stock) || other.stock == stock)&&(identical(other.minPurchase, minPurchase) || other.minPurchase == minPurchase)&&(identical(other.price, price) || other.price == price)&&(identical(other.isPublished, isPublished) || other.isPublished == isPublished)&&(identical(other.hasVariant, hasVariant) || other.hasVariant == hasVariant)&&(identical(other.isSameDimension, isSameDimension) || other.isSameDimension == isSameDimension)&&(identical(other.sku, sku) || other.sku == sku)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.length, length) || other.length == length)&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height)&&const DeepCollectionEquality().equals(other.merchant, merchant)&&const DeepCollectionEquality().equals(other.productCategory, productCategory)&&const DeepCollectionEquality().equals(other.variants, variants)&&const DeepCollectionEquality().equals(other.images, images)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.reviewsCount, reviewsCount) || other.reviewsCount == reviewsCount)&&const DeepCollectionEquality().equals(other.reviews, reviews)&&(identical(other.isWishlisted, isWishlisted) || other.isWishlisted == isWishlisted)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,name,slug,merchantId,category,branch,description,stock,minPurchase,price,isPublished,hasVariant,isSameDimension,sku,weight,length,width,height,const DeepCollectionEquality().hash(merchant),const DeepCollectionEquality().hash(productCategory),const DeepCollectionEquality().hash(variants),const DeepCollectionEquality().hash(images),rating,reviewsCount,const DeepCollectionEquality().hash(reviews),isWishlisted,createdAt,updatedAt]);

@override
String toString() {
  return 'CustomerProduct(id: $id, name: $name, slug: $slug, merchantId: $merchantId, category: $category, branch: $branch, description: $description, stock: $stock, minPurchase: $minPurchase, price: $price, isPublished: $isPublished, hasVariant: $hasVariant, isSameDimension: $isSameDimension, sku: $sku, weight: $weight, length: $length, width: $width, height: $height, merchant: $merchant, productCategory: $productCategory, variants: $variants, images: $images, rating: $rating, reviewsCount: $reviewsCount, reviews: $reviews, isWishlisted: $isWishlisted, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $CustomerProductCopyWith<$Res>  {
  factory $CustomerProductCopyWith(CustomerProduct value, $Res Function(CustomerProduct) _then) = _$CustomerProductCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? slug, String? merchantId, String category, String? branch, String? description, int? stock, int? minPurchase, int price, bool? isPublished, bool? hasVariant, bool? isSameDimension, String? sku, int? weight, int? length, int? width, int? height, CustomerMerchantEntity? merchant, CustomerProductCategoryEntity? productCategory, List<CustomerProductVariantEntity>? variants, List<CustomerProductImageEntity>? images, double? rating, int? reviewsCount, List<dynamic>? reviews, bool? isWishlisted, String? createdAt, String? updatedAt
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? slug = freezed,Object? merchantId = freezed,Object? category = null,Object? branch = freezed,Object? description = freezed,Object? stock = freezed,Object? minPurchase = freezed,Object? price = null,Object? isPublished = freezed,Object? hasVariant = freezed,Object? isSameDimension = freezed,Object? sku = freezed,Object? weight = freezed,Object? length = freezed,Object? width = freezed,Object? height = freezed,Object? merchant = freezed,Object? productCategory = freezed,Object? variants = freezed,Object? images = freezed,Object? rating = freezed,Object? reviewsCount = freezed,Object? reviews = freezed,Object? isWishlisted = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: freezed == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String?,merchantId: freezed == merchantId ? _self.merchantId : merchantId // ignore: cast_nullable_to_non_nullable
as String?,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,branch: freezed == branch ? _self.branch : branch // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,stock: freezed == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as int?,minPurchase: freezed == minPurchase ? _self.minPurchase : minPurchase // ignore: cast_nullable_to_non_nullable
as int?,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,isPublished: freezed == isPublished ? _self.isPublished : isPublished // ignore: cast_nullable_to_non_nullable
as bool?,hasVariant: freezed == hasVariant ? _self.hasVariant : hasVariant // ignore: cast_nullable_to_non_nullable
as bool?,isSameDimension: freezed == isSameDimension ? _self.isSameDimension : isSameDimension // ignore: cast_nullable_to_non_nullable
as bool?,sku: freezed == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String?,weight: freezed == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as int?,length: freezed == length ? _self.length : length // ignore: cast_nullable_to_non_nullable
as int?,width: freezed == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int?,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int?,merchant: freezed == merchant ? _self.merchant : merchant // ignore: cast_nullable_to_non_nullable
as CustomerMerchantEntity?,productCategory: freezed == productCategory ? _self.productCategory : productCategory // ignore: cast_nullable_to_non_nullable
as CustomerProductCategoryEntity?,variants: freezed == variants ? _self.variants : variants // ignore: cast_nullable_to_non_nullable
as List<CustomerProductVariantEntity>?,images: freezed == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<CustomerProductImageEntity>?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double?,reviewsCount: freezed == reviewsCount ? _self.reviewsCount : reviewsCount // ignore: cast_nullable_to_non_nullable
as int?,reviews: freezed == reviews ? _self.reviews : reviews // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,isWishlisted: freezed == isWishlisted ? _self.isWishlisted : isWishlisted // ignore: cast_nullable_to_non_nullable
as bool?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String id,  String name,  String? slug,  String? merchantId,  String category,  String? branch,  String? description,  int? stock,  int? minPurchase,  int price,  bool? isPublished,  bool? hasVariant,  bool? isSameDimension,  String? sku,  int? weight,  int? length,  int? width,  int? height,  CustomerMerchantEntity? merchant,  CustomerProductCategoryEntity? productCategory,  List<CustomerProductVariantEntity>? variants,  List<CustomerProductImageEntity>? images,  double? rating,  int? reviewsCount,  List<dynamic>? reviews,  bool? isWishlisted,  String? createdAt,  String? updatedAt)?  entity,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CustomerProductEntity() when entity != null:
return entity(_that.id,_that.name,_that.slug,_that.merchantId,_that.category,_that.branch,_that.description,_that.stock,_that.minPurchase,_that.price,_that.isPublished,_that.hasVariant,_that.isSameDimension,_that.sku,_that.weight,_that.length,_that.width,_that.height,_that.merchant,_that.productCategory,_that.variants,_that.images,_that.rating,_that.reviewsCount,_that.reviews,_that.isWishlisted,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String id,  String name,  String? slug,  String? merchantId,  String category,  String? branch,  String? description,  int? stock,  int? minPurchase,  int price,  bool? isPublished,  bool? hasVariant,  bool? isSameDimension,  String? sku,  int? weight,  int? length,  int? width,  int? height,  CustomerMerchantEntity? merchant,  CustomerProductCategoryEntity? productCategory,  List<CustomerProductVariantEntity>? variants,  List<CustomerProductImageEntity>? images,  double? rating,  int? reviewsCount,  List<dynamic>? reviews,  bool? isWishlisted,  String? createdAt,  String? updatedAt)  entity,}) {final _that = this;
switch (_that) {
case CustomerProductEntity():
return entity(_that.id,_that.name,_that.slug,_that.merchantId,_that.category,_that.branch,_that.description,_that.stock,_that.minPurchase,_that.price,_that.isPublished,_that.hasVariant,_that.isSameDimension,_that.sku,_that.weight,_that.length,_that.width,_that.height,_that.merchant,_that.productCategory,_that.variants,_that.images,_that.rating,_that.reviewsCount,_that.reviews,_that.isWishlisted,_that.createdAt,_that.updatedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String id,  String name,  String? slug,  String? merchantId,  String category,  String? branch,  String? description,  int? stock,  int? minPurchase,  int price,  bool? isPublished,  bool? hasVariant,  bool? isSameDimension,  String? sku,  int? weight,  int? length,  int? width,  int? height,  CustomerMerchantEntity? merchant,  CustomerProductCategoryEntity? productCategory,  List<CustomerProductVariantEntity>? variants,  List<CustomerProductImageEntity>? images,  double? rating,  int? reviewsCount,  List<dynamic>? reviews,  bool? isWishlisted,  String? createdAt,  String? updatedAt)?  entity,}) {final _that = this;
switch (_that) {
case CustomerProductEntity() when entity != null:
return entity(_that.id,_that.name,_that.slug,_that.merchantId,_that.category,_that.branch,_that.description,_that.stock,_that.minPurchase,_that.price,_that.isPublished,_that.hasVariant,_that.isSameDimension,_that.sku,_that.weight,_that.length,_that.width,_that.height,_that.merchant,_that.productCategory,_that.variants,_that.images,_that.rating,_that.reviewsCount,_that.reviews,_that.isWishlisted,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class CustomerProductEntity implements CustomerProduct {
  const CustomerProductEntity({required this.id, required this.name, this.slug, this.merchantId, required this.category, this.branch, this.description, this.stock, this.minPurchase, required this.price, this.isPublished, this.hasVariant, this.isSameDimension, this.sku, this.weight, this.length, this.width, this.height, this.merchant, this.productCategory, final  List<CustomerProductVariantEntity>? variants, final  List<CustomerProductImageEntity>? images, this.rating, this.reviewsCount, final  List<dynamic>? reviews, this.isWishlisted, this.createdAt, this.updatedAt}): _variants = variants,_images = images,_reviews = reviews;
  factory CustomerProductEntity.fromJson(Map<String, dynamic> json) => _$CustomerProductEntityFromJson(json);

@override final  String id;
@override final  String name;
@override final  String? slug;
@override final  String? merchantId;
@override final  String category;
@override final  String? branch;
@override final  String? description;
@override final  int? stock;
@override final  int? minPurchase;
@override final  int price;
@override final  bool? isPublished;
@override final  bool? hasVariant;
@override final  bool? isSameDimension;
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

@override final  double? rating;
@override final  int? reviewsCount;
 final  List<dynamic>? _reviews;
@override List<dynamic>? get reviews {
  final value = _reviews;
  if (value == null) return null;
  if (_reviews is EqualUnmodifiableListView) return _reviews;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  bool? isWishlisted;
@override final  String? createdAt;
@override final  String? updatedAt;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerProductEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.merchantId, merchantId) || other.merchantId == merchantId)&&(identical(other.category, category) || other.category == category)&&(identical(other.branch, branch) || other.branch == branch)&&(identical(other.description, description) || other.description == description)&&(identical(other.stock, stock) || other.stock == stock)&&(identical(other.minPurchase, minPurchase) || other.minPurchase == minPurchase)&&(identical(other.price, price) || other.price == price)&&(identical(other.isPublished, isPublished) || other.isPublished == isPublished)&&(identical(other.hasVariant, hasVariant) || other.hasVariant == hasVariant)&&(identical(other.isSameDimension, isSameDimension) || other.isSameDimension == isSameDimension)&&(identical(other.sku, sku) || other.sku == sku)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.length, length) || other.length == length)&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height)&&const DeepCollectionEquality().equals(other.merchant, merchant)&&const DeepCollectionEquality().equals(other.productCategory, productCategory)&&const DeepCollectionEquality().equals(other._variants, _variants)&&const DeepCollectionEquality().equals(other._images, _images)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.reviewsCount, reviewsCount) || other.reviewsCount == reviewsCount)&&const DeepCollectionEquality().equals(other._reviews, _reviews)&&(identical(other.isWishlisted, isWishlisted) || other.isWishlisted == isWishlisted)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,name,slug,merchantId,category,branch,description,stock,minPurchase,price,isPublished,hasVariant,isSameDimension,sku,weight,length,width,height,const DeepCollectionEquality().hash(merchant),const DeepCollectionEquality().hash(productCategory),const DeepCollectionEquality().hash(_variants),const DeepCollectionEquality().hash(_images),rating,reviewsCount,const DeepCollectionEquality().hash(_reviews),isWishlisted,createdAt,updatedAt]);

@override
String toString() {
  return 'CustomerProduct.entity(id: $id, name: $name, slug: $slug, merchantId: $merchantId, category: $category, branch: $branch, description: $description, stock: $stock, minPurchase: $minPurchase, price: $price, isPublished: $isPublished, hasVariant: $hasVariant, isSameDimension: $isSameDimension, sku: $sku, weight: $weight, length: $length, width: $width, height: $height, merchant: $merchant, productCategory: $productCategory, variants: $variants, images: $images, rating: $rating, reviewsCount: $reviewsCount, reviews: $reviews, isWishlisted: $isWishlisted, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $CustomerProductEntityCopyWith<$Res> implements $CustomerProductCopyWith<$Res> {
  factory $CustomerProductEntityCopyWith(CustomerProductEntity value, $Res Function(CustomerProductEntity) _then) = _$CustomerProductEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? slug, String? merchantId, String category, String? branch, String? description, int? stock, int? minPurchase, int price, bool? isPublished, bool? hasVariant, bool? isSameDimension, String? sku, int? weight, int? length, int? width, int? height, CustomerMerchantEntity? merchant, CustomerProductCategoryEntity? productCategory, List<CustomerProductVariantEntity>? variants, List<CustomerProductImageEntity>? images, double? rating, int? reviewsCount, List<dynamic>? reviews, bool? isWishlisted, String? createdAt, String? updatedAt
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? slug = freezed,Object? merchantId = freezed,Object? category = null,Object? branch = freezed,Object? description = freezed,Object? stock = freezed,Object? minPurchase = freezed,Object? price = null,Object? isPublished = freezed,Object? hasVariant = freezed,Object? isSameDimension = freezed,Object? sku = freezed,Object? weight = freezed,Object? length = freezed,Object? width = freezed,Object? height = freezed,Object? merchant = freezed,Object? productCategory = freezed,Object? variants = freezed,Object? images = freezed,Object? rating = freezed,Object? reviewsCount = freezed,Object? reviews = freezed,Object? isWishlisted = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(CustomerProductEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: freezed == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String?,merchantId: freezed == merchantId ? _self.merchantId : merchantId // ignore: cast_nullable_to_non_nullable
as String?,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,branch: freezed == branch ? _self.branch : branch // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,stock: freezed == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as int?,minPurchase: freezed == minPurchase ? _self.minPurchase : minPurchase // ignore: cast_nullable_to_non_nullable
as int?,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,isPublished: freezed == isPublished ? _self.isPublished : isPublished // ignore: cast_nullable_to_non_nullable
as bool?,hasVariant: freezed == hasVariant ? _self.hasVariant : hasVariant // ignore: cast_nullable_to_non_nullable
as bool?,isSameDimension: freezed == isSameDimension ? _self.isSameDimension : isSameDimension // ignore: cast_nullable_to_non_nullable
as bool?,sku: freezed == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String?,weight: freezed == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as int?,length: freezed == length ? _self.length : length // ignore: cast_nullable_to_non_nullable
as int?,width: freezed == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int?,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int?,merchant: freezed == merchant ? _self.merchant : merchant // ignore: cast_nullable_to_non_nullable
as CustomerMerchantEntity?,productCategory: freezed == productCategory ? _self.productCategory : productCategory // ignore: cast_nullable_to_non_nullable
as CustomerProductCategoryEntity?,variants: freezed == variants ? _self._variants : variants // ignore: cast_nullable_to_non_nullable
as List<CustomerProductVariantEntity>?,images: freezed == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<CustomerProductImageEntity>?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double?,reviewsCount: freezed == reviewsCount ? _self.reviewsCount : reviewsCount // ignore: cast_nullable_to_non_nullable
as int?,reviews: freezed == reviews ? _self._reviews : reviews // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,isWishlisted: freezed == isWishlisted ? _self.isWishlisted : isWishlisted // ignore: cast_nullable_to_non_nullable
as bool?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
