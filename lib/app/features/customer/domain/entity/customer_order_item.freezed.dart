// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_order_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
CustomerOrderItem _$CustomerOrderItemFromJson(
  Map<String, dynamic> json
) {
    return CustomerOrderItemEntity.fromJson(
      json
    );
}

/// @nodoc
mixin _$CustomerOrderItem {

 String? get id; String? get orderId; String? get productId; String? get productVariantId; int? get price; int? get subtotal; int? get total; int? get quantity; String? get notes; String? get productName; String? get productCategory; String? get productBranch; String? get productSku; String? get productVariantLabel;@JsonKey(name: 'product_snapshot') CustomerProductEntity? get product;@JsonKey(name: 'product_variant_snapshot') dynamic get productVariantSnapshot; dynamic get review; String? get createdAt; String? get updatedAt; String? get deletedAt;
/// Create a copy of CustomerOrderItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerOrderItemCopyWith<CustomerOrderItem> get copyWith => _$CustomerOrderItemCopyWithImpl<CustomerOrderItem>(this as CustomerOrderItem, _$identity);

  /// Serializes this CustomerOrderItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerOrderItem&&(identical(other.id, id) || other.id == id)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.productVariantId, productVariantId) || other.productVariantId == productVariantId)&&(identical(other.price, price) || other.price == price)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.total, total) || other.total == total)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.productCategory, productCategory) || other.productCategory == productCategory)&&(identical(other.productBranch, productBranch) || other.productBranch == productBranch)&&(identical(other.productSku, productSku) || other.productSku == productSku)&&(identical(other.productVariantLabel, productVariantLabel) || other.productVariantLabel == productVariantLabel)&&const DeepCollectionEquality().equals(other.product, product)&&const DeepCollectionEquality().equals(other.productVariantSnapshot, productVariantSnapshot)&&const DeepCollectionEquality().equals(other.review, review)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,orderId,productId,productVariantId,price,subtotal,total,quantity,notes,productName,productCategory,productBranch,productSku,productVariantLabel,const DeepCollectionEquality().hash(product),const DeepCollectionEquality().hash(productVariantSnapshot),const DeepCollectionEquality().hash(review),createdAt,updatedAt,deletedAt]);

@override
String toString() {
  return 'CustomerOrderItem(id: $id, orderId: $orderId, productId: $productId, productVariantId: $productVariantId, price: $price, subtotal: $subtotal, total: $total, quantity: $quantity, notes: $notes, productName: $productName, productCategory: $productCategory, productBranch: $productBranch, productSku: $productSku, productVariantLabel: $productVariantLabel, product: $product, productVariantSnapshot: $productVariantSnapshot, review: $review, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
}


}

/// @nodoc
abstract mixin class $CustomerOrderItemCopyWith<$Res>  {
  factory $CustomerOrderItemCopyWith(CustomerOrderItem value, $Res Function(CustomerOrderItem) _then) = _$CustomerOrderItemCopyWithImpl;
@useResult
$Res call({
 String? id, String? orderId, String? productId, String? productVariantId, int? price, int? subtotal, int? total, int? quantity, String? notes, String? productName, String? productCategory, String? productBranch, String? productSku, String? productVariantLabel,@JsonKey(name: 'product_snapshot') CustomerProductEntity? product,@JsonKey(name: 'product_variant_snapshot') dynamic productVariantSnapshot, dynamic review, String? createdAt, String? updatedAt, String? deletedAt
});




}
/// @nodoc
class _$CustomerOrderItemCopyWithImpl<$Res>
    implements $CustomerOrderItemCopyWith<$Res> {
  _$CustomerOrderItemCopyWithImpl(this._self, this._then);

  final CustomerOrderItem _self;
  final $Res Function(CustomerOrderItem) _then;

/// Create a copy of CustomerOrderItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? orderId = freezed,Object? productId = freezed,Object? productVariantId = freezed,Object? price = freezed,Object? subtotal = freezed,Object? total = freezed,Object? quantity = freezed,Object? notes = freezed,Object? productName = freezed,Object? productCategory = freezed,Object? productBranch = freezed,Object? productSku = freezed,Object? productVariantLabel = freezed,Object? product = freezed,Object? productVariantSnapshot = freezed,Object? review = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? deletedAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,orderId: freezed == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String?,productId: freezed == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String?,productVariantId: freezed == productVariantId ? _self.productVariantId : productVariantId // ignore: cast_nullable_to_non_nullable
as String?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int?,subtotal: freezed == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as int?,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int?,quantity: freezed == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,productName: freezed == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String?,productCategory: freezed == productCategory ? _self.productCategory : productCategory // ignore: cast_nullable_to_non_nullable
as String?,productBranch: freezed == productBranch ? _self.productBranch : productBranch // ignore: cast_nullable_to_non_nullable
as String?,productSku: freezed == productSku ? _self.productSku : productSku // ignore: cast_nullable_to_non_nullable
as String?,productVariantLabel: freezed == productVariantLabel ? _self.productVariantLabel : productVariantLabel // ignore: cast_nullable_to_non_nullable
as String?,product: freezed == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as CustomerProductEntity?,productVariantSnapshot: freezed == productVariantSnapshot ? _self.productVariantSnapshot : productVariantSnapshot // ignore: cast_nullable_to_non_nullable
as dynamic,review: freezed == review ? _self.review : review // ignore: cast_nullable_to_non_nullable
as dynamic,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CustomerOrderItem].
extension CustomerOrderItemPatterns on CustomerOrderItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CustomerOrderItemEntity value)?  entity,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CustomerOrderItemEntity() when entity != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CustomerOrderItemEntity value)  entity,}){
final _that = this;
switch (_that) {
case CustomerOrderItemEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CustomerOrderItemEntity value)?  entity,}){
final _that = this;
switch (_that) {
case CustomerOrderItemEntity() when entity != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String? id,  String? orderId,  String? productId,  String? productVariantId,  int? price,  int? subtotal,  int? total,  int? quantity,  String? notes,  String? productName,  String? productCategory,  String? productBranch,  String? productSku,  String? productVariantLabel, @JsonKey(name: 'product_snapshot')  CustomerProductEntity? product, @JsonKey(name: 'product_variant_snapshot')  dynamic productVariantSnapshot,  dynamic review,  String? createdAt,  String? updatedAt,  String? deletedAt)?  entity,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CustomerOrderItemEntity() when entity != null:
return entity(_that.id,_that.orderId,_that.productId,_that.productVariantId,_that.price,_that.subtotal,_that.total,_that.quantity,_that.notes,_that.productName,_that.productCategory,_that.productBranch,_that.productSku,_that.productVariantLabel,_that.product,_that.productVariantSnapshot,_that.review,_that.createdAt,_that.updatedAt,_that.deletedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String? id,  String? orderId,  String? productId,  String? productVariantId,  int? price,  int? subtotal,  int? total,  int? quantity,  String? notes,  String? productName,  String? productCategory,  String? productBranch,  String? productSku,  String? productVariantLabel, @JsonKey(name: 'product_snapshot')  CustomerProductEntity? product, @JsonKey(name: 'product_variant_snapshot')  dynamic productVariantSnapshot,  dynamic review,  String? createdAt,  String? updatedAt,  String? deletedAt)  entity,}) {final _that = this;
switch (_that) {
case CustomerOrderItemEntity():
return entity(_that.id,_that.orderId,_that.productId,_that.productVariantId,_that.price,_that.subtotal,_that.total,_that.quantity,_that.notes,_that.productName,_that.productCategory,_that.productBranch,_that.productSku,_that.productVariantLabel,_that.product,_that.productVariantSnapshot,_that.review,_that.createdAt,_that.updatedAt,_that.deletedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String? id,  String? orderId,  String? productId,  String? productVariantId,  int? price,  int? subtotal,  int? total,  int? quantity,  String? notes,  String? productName,  String? productCategory,  String? productBranch,  String? productSku,  String? productVariantLabel, @JsonKey(name: 'product_snapshot')  CustomerProductEntity? product, @JsonKey(name: 'product_variant_snapshot')  dynamic productVariantSnapshot,  dynamic review,  String? createdAt,  String? updatedAt,  String? deletedAt)?  entity,}) {final _that = this;
switch (_that) {
case CustomerOrderItemEntity() when entity != null:
return entity(_that.id,_that.orderId,_that.productId,_that.productVariantId,_that.price,_that.subtotal,_that.total,_that.quantity,_that.notes,_that.productName,_that.productCategory,_that.productBranch,_that.productSku,_that.productVariantLabel,_that.product,_that.productVariantSnapshot,_that.review,_that.createdAt,_that.updatedAt,_that.deletedAt);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class CustomerOrderItemEntity implements CustomerOrderItem {
  const CustomerOrderItemEntity({this.id, this.orderId, this.productId, this.productVariantId, this.price, this.subtotal, this.total, this.quantity, this.notes, this.productName, this.productCategory, this.productBranch, this.productSku, this.productVariantLabel, @JsonKey(name: 'product_snapshot') this.product, @JsonKey(name: 'product_variant_snapshot') this.productVariantSnapshot, this.review, this.createdAt, this.updatedAt, this.deletedAt});
  factory CustomerOrderItemEntity.fromJson(Map<String, dynamic> json) => _$CustomerOrderItemEntityFromJson(json);

@override final  String? id;
@override final  String? orderId;
@override final  String? productId;
@override final  String? productVariantId;
@override final  int? price;
@override final  int? subtotal;
@override final  int? total;
@override final  int? quantity;
@override final  String? notes;
@override final  String? productName;
@override final  String? productCategory;
@override final  String? productBranch;
@override final  String? productSku;
@override final  String? productVariantLabel;
@override@JsonKey(name: 'product_snapshot') final  CustomerProductEntity? product;
@override@JsonKey(name: 'product_variant_snapshot') final  dynamic productVariantSnapshot;
@override final  dynamic review;
@override final  String? createdAt;
@override final  String? updatedAt;
@override final  String? deletedAt;

/// Create a copy of CustomerOrderItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerOrderItemEntityCopyWith<CustomerOrderItemEntity> get copyWith => _$CustomerOrderItemEntityCopyWithImpl<CustomerOrderItemEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomerOrderItemEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerOrderItemEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.productVariantId, productVariantId) || other.productVariantId == productVariantId)&&(identical(other.price, price) || other.price == price)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.total, total) || other.total == total)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.productCategory, productCategory) || other.productCategory == productCategory)&&(identical(other.productBranch, productBranch) || other.productBranch == productBranch)&&(identical(other.productSku, productSku) || other.productSku == productSku)&&(identical(other.productVariantLabel, productVariantLabel) || other.productVariantLabel == productVariantLabel)&&const DeepCollectionEquality().equals(other.product, product)&&const DeepCollectionEquality().equals(other.productVariantSnapshot, productVariantSnapshot)&&const DeepCollectionEquality().equals(other.review, review)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,orderId,productId,productVariantId,price,subtotal,total,quantity,notes,productName,productCategory,productBranch,productSku,productVariantLabel,const DeepCollectionEquality().hash(product),const DeepCollectionEquality().hash(productVariantSnapshot),const DeepCollectionEquality().hash(review),createdAt,updatedAt,deletedAt]);

@override
String toString() {
  return 'CustomerOrderItem.entity(id: $id, orderId: $orderId, productId: $productId, productVariantId: $productVariantId, price: $price, subtotal: $subtotal, total: $total, quantity: $quantity, notes: $notes, productName: $productName, productCategory: $productCategory, productBranch: $productBranch, productSku: $productSku, productVariantLabel: $productVariantLabel, product: $product, productVariantSnapshot: $productVariantSnapshot, review: $review, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
}


}

/// @nodoc
abstract mixin class $CustomerOrderItemEntityCopyWith<$Res> implements $CustomerOrderItemCopyWith<$Res> {
  factory $CustomerOrderItemEntityCopyWith(CustomerOrderItemEntity value, $Res Function(CustomerOrderItemEntity) _then) = _$CustomerOrderItemEntityCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? orderId, String? productId, String? productVariantId, int? price, int? subtotal, int? total, int? quantity, String? notes, String? productName, String? productCategory, String? productBranch, String? productSku, String? productVariantLabel,@JsonKey(name: 'product_snapshot') CustomerProductEntity? product,@JsonKey(name: 'product_variant_snapshot') dynamic productVariantSnapshot, dynamic review, String? createdAt, String? updatedAt, String? deletedAt
});




}
/// @nodoc
class _$CustomerOrderItemEntityCopyWithImpl<$Res>
    implements $CustomerOrderItemEntityCopyWith<$Res> {
  _$CustomerOrderItemEntityCopyWithImpl(this._self, this._then);

  final CustomerOrderItemEntity _self;
  final $Res Function(CustomerOrderItemEntity) _then;

/// Create a copy of CustomerOrderItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? orderId = freezed,Object? productId = freezed,Object? productVariantId = freezed,Object? price = freezed,Object? subtotal = freezed,Object? total = freezed,Object? quantity = freezed,Object? notes = freezed,Object? productName = freezed,Object? productCategory = freezed,Object? productBranch = freezed,Object? productSku = freezed,Object? productVariantLabel = freezed,Object? product = freezed,Object? productVariantSnapshot = freezed,Object? review = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? deletedAt = freezed,}) {
  return _then(CustomerOrderItemEntity(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,orderId: freezed == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String?,productId: freezed == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String?,productVariantId: freezed == productVariantId ? _self.productVariantId : productVariantId // ignore: cast_nullable_to_non_nullable
as String?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int?,subtotal: freezed == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as int?,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int?,quantity: freezed == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,productName: freezed == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String?,productCategory: freezed == productCategory ? _self.productCategory : productCategory // ignore: cast_nullable_to_non_nullable
as String?,productBranch: freezed == productBranch ? _self.productBranch : productBranch // ignore: cast_nullable_to_non_nullable
as String?,productSku: freezed == productSku ? _self.productSku : productSku // ignore: cast_nullable_to_non_nullable
as String?,productVariantLabel: freezed == productVariantLabel ? _self.productVariantLabel : productVariantLabel // ignore: cast_nullable_to_non_nullable
as String?,product: freezed == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as CustomerProductEntity?,productVariantSnapshot: freezed == productVariantSnapshot ? _self.productVariantSnapshot : productVariantSnapshot // ignore: cast_nullable_to_non_nullable
as dynamic,review: freezed == review ? _self.review : review // ignore: cast_nullable_to_non_nullable
as dynamic,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
