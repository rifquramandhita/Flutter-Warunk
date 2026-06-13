// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'merchant_order_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
MerchantOrderItem _$MerchantOrderItemFromJson(
  Map<String, dynamic> json
) {
    return MerchantOrderItemEntity.fromJson(
      json
    );
}

/// @nodoc
mixin _$MerchantOrderItem {

 String? get id; String? get orderId; String? get productId; String? get productVariantId; int? get quantity; int? get price; int? get subtotal; int? get total; String? get notes; String? get productName; String? get productCategory; String? get productBranch; String? get productSku; String? get productVariantLabel; MerchantOrderProductSnapshotEntity? get productSnapshot; MerchantOrderProductVariantSnapshotEntity? get productVariantSnapshot; String? get createdAt; String? get updatedAt;
/// Create a copy of MerchantOrderItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantOrderItemCopyWith<MerchantOrderItem> get copyWith => _$MerchantOrderItemCopyWithImpl<MerchantOrderItem>(this as MerchantOrderItem, _$identity);

  /// Serializes this MerchantOrderItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantOrderItem&&(identical(other.id, id) || other.id == id)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.productVariantId, productVariantId) || other.productVariantId == productVariantId)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.price, price) || other.price == price)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.total, total) || other.total == total)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.productCategory, productCategory) || other.productCategory == productCategory)&&(identical(other.productBranch, productBranch) || other.productBranch == productBranch)&&(identical(other.productSku, productSku) || other.productSku == productSku)&&(identical(other.productVariantLabel, productVariantLabel) || other.productVariantLabel == productVariantLabel)&&const DeepCollectionEquality().equals(other.productSnapshot, productSnapshot)&&const DeepCollectionEquality().equals(other.productVariantSnapshot, productVariantSnapshot)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,orderId,productId,productVariantId,quantity,price,subtotal,total,notes,productName,productCategory,productBranch,productSku,productVariantLabel,const DeepCollectionEquality().hash(productSnapshot),const DeepCollectionEquality().hash(productVariantSnapshot),createdAt,updatedAt);

@override
String toString() {
  return 'MerchantOrderItem(id: $id, orderId: $orderId, productId: $productId, productVariantId: $productVariantId, quantity: $quantity, price: $price, subtotal: $subtotal, total: $total, notes: $notes, productName: $productName, productCategory: $productCategory, productBranch: $productBranch, productSku: $productSku, productVariantLabel: $productVariantLabel, productSnapshot: $productSnapshot, productVariantSnapshot: $productVariantSnapshot, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $MerchantOrderItemCopyWith<$Res>  {
  factory $MerchantOrderItemCopyWith(MerchantOrderItem value, $Res Function(MerchantOrderItem) _then) = _$MerchantOrderItemCopyWithImpl;
@useResult
$Res call({
 String? id, String? orderId, String? productId, String? productVariantId, int? quantity, int? price, int? subtotal, int? total, String? notes, String? productName, String? productCategory, String? productBranch, String? productSku, String? productVariantLabel, MerchantOrderProductSnapshotEntity? productSnapshot, MerchantOrderProductVariantSnapshotEntity? productVariantSnapshot, String? createdAt, String? updatedAt
});




}
/// @nodoc
class _$MerchantOrderItemCopyWithImpl<$Res>
    implements $MerchantOrderItemCopyWith<$Res> {
  _$MerchantOrderItemCopyWithImpl(this._self, this._then);

  final MerchantOrderItem _self;
  final $Res Function(MerchantOrderItem) _then;

/// Create a copy of MerchantOrderItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? orderId = freezed,Object? productId = freezed,Object? productVariantId = freezed,Object? quantity = freezed,Object? price = freezed,Object? subtotal = freezed,Object? total = freezed,Object? notes = freezed,Object? productName = freezed,Object? productCategory = freezed,Object? productBranch = freezed,Object? productSku = freezed,Object? productVariantLabel = freezed,Object? productSnapshot = freezed,Object? productVariantSnapshot = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,orderId: freezed == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String?,productId: freezed == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String?,productVariantId: freezed == productVariantId ? _self.productVariantId : productVariantId // ignore: cast_nullable_to_non_nullable
as String?,quantity: freezed == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int?,subtotal: freezed == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as int?,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,productName: freezed == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String?,productCategory: freezed == productCategory ? _self.productCategory : productCategory // ignore: cast_nullable_to_non_nullable
as String?,productBranch: freezed == productBranch ? _self.productBranch : productBranch // ignore: cast_nullable_to_non_nullable
as String?,productSku: freezed == productSku ? _self.productSku : productSku // ignore: cast_nullable_to_non_nullable
as String?,productVariantLabel: freezed == productVariantLabel ? _self.productVariantLabel : productVariantLabel // ignore: cast_nullable_to_non_nullable
as String?,productSnapshot: freezed == productSnapshot ? _self.productSnapshot : productSnapshot // ignore: cast_nullable_to_non_nullable
as MerchantOrderProductSnapshotEntity?,productVariantSnapshot: freezed == productVariantSnapshot ? _self.productVariantSnapshot : productVariantSnapshot // ignore: cast_nullable_to_non_nullable
as MerchantOrderProductVariantSnapshotEntity?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MerchantOrderItem].
extension MerchantOrderItemPatterns on MerchantOrderItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MerchantOrderItemEntity value)?  entity,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MerchantOrderItemEntity() when entity != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MerchantOrderItemEntity value)  entity,}){
final _that = this;
switch (_that) {
case MerchantOrderItemEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MerchantOrderItemEntity value)?  entity,}){
final _that = this;
switch (_that) {
case MerchantOrderItemEntity() when entity != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String? id,  String? orderId,  String? productId,  String? productVariantId,  int? quantity,  int? price,  int? subtotal,  int? total,  String? notes,  String? productName,  String? productCategory,  String? productBranch,  String? productSku,  String? productVariantLabel,  MerchantOrderProductSnapshotEntity? productSnapshot,  MerchantOrderProductVariantSnapshotEntity? productVariantSnapshot,  String? createdAt,  String? updatedAt)?  entity,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MerchantOrderItemEntity() when entity != null:
return entity(_that.id,_that.orderId,_that.productId,_that.productVariantId,_that.quantity,_that.price,_that.subtotal,_that.total,_that.notes,_that.productName,_that.productCategory,_that.productBranch,_that.productSku,_that.productVariantLabel,_that.productSnapshot,_that.productVariantSnapshot,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String? id,  String? orderId,  String? productId,  String? productVariantId,  int? quantity,  int? price,  int? subtotal,  int? total,  String? notes,  String? productName,  String? productCategory,  String? productBranch,  String? productSku,  String? productVariantLabel,  MerchantOrderProductSnapshotEntity? productSnapshot,  MerchantOrderProductVariantSnapshotEntity? productVariantSnapshot,  String? createdAt,  String? updatedAt)  entity,}) {final _that = this;
switch (_that) {
case MerchantOrderItemEntity():
return entity(_that.id,_that.orderId,_that.productId,_that.productVariantId,_that.quantity,_that.price,_that.subtotal,_that.total,_that.notes,_that.productName,_that.productCategory,_that.productBranch,_that.productSku,_that.productVariantLabel,_that.productSnapshot,_that.productVariantSnapshot,_that.createdAt,_that.updatedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String? id,  String? orderId,  String? productId,  String? productVariantId,  int? quantity,  int? price,  int? subtotal,  int? total,  String? notes,  String? productName,  String? productCategory,  String? productBranch,  String? productSku,  String? productVariantLabel,  MerchantOrderProductSnapshotEntity? productSnapshot,  MerchantOrderProductVariantSnapshotEntity? productVariantSnapshot,  String? createdAt,  String? updatedAt)?  entity,}) {final _that = this;
switch (_that) {
case MerchantOrderItemEntity() when entity != null:
return entity(_that.id,_that.orderId,_that.productId,_that.productVariantId,_that.quantity,_that.price,_that.subtotal,_that.total,_that.notes,_that.productName,_that.productCategory,_that.productBranch,_that.productSku,_that.productVariantLabel,_that.productSnapshot,_that.productVariantSnapshot,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class MerchantOrderItemEntity implements MerchantOrderItem {
  const MerchantOrderItemEntity({this.id, this.orderId, this.productId, this.productVariantId, this.quantity, this.price, this.subtotal, this.total, this.notes, this.productName, this.productCategory, this.productBranch, this.productSku, this.productVariantLabel, this.productSnapshot, this.productVariantSnapshot, this.createdAt, this.updatedAt});
  factory MerchantOrderItemEntity.fromJson(Map<String, dynamic> json) => _$MerchantOrderItemEntityFromJson(json);

@override final  String? id;
@override final  String? orderId;
@override final  String? productId;
@override final  String? productVariantId;
@override final  int? quantity;
@override final  int? price;
@override final  int? subtotal;
@override final  int? total;
@override final  String? notes;
@override final  String? productName;
@override final  String? productCategory;
@override final  String? productBranch;
@override final  String? productSku;
@override final  String? productVariantLabel;
@override final  MerchantOrderProductSnapshotEntity? productSnapshot;
@override final  MerchantOrderProductVariantSnapshotEntity? productVariantSnapshot;
@override final  String? createdAt;
@override final  String? updatedAt;

/// Create a copy of MerchantOrderItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantOrderItemEntityCopyWith<MerchantOrderItemEntity> get copyWith => _$MerchantOrderItemEntityCopyWithImpl<MerchantOrderItemEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MerchantOrderItemEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantOrderItemEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.productVariantId, productVariantId) || other.productVariantId == productVariantId)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.price, price) || other.price == price)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.total, total) || other.total == total)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.productCategory, productCategory) || other.productCategory == productCategory)&&(identical(other.productBranch, productBranch) || other.productBranch == productBranch)&&(identical(other.productSku, productSku) || other.productSku == productSku)&&(identical(other.productVariantLabel, productVariantLabel) || other.productVariantLabel == productVariantLabel)&&const DeepCollectionEquality().equals(other.productSnapshot, productSnapshot)&&const DeepCollectionEquality().equals(other.productVariantSnapshot, productVariantSnapshot)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,orderId,productId,productVariantId,quantity,price,subtotal,total,notes,productName,productCategory,productBranch,productSku,productVariantLabel,const DeepCollectionEquality().hash(productSnapshot),const DeepCollectionEquality().hash(productVariantSnapshot),createdAt,updatedAt);

@override
String toString() {
  return 'MerchantOrderItem.entity(id: $id, orderId: $orderId, productId: $productId, productVariantId: $productVariantId, quantity: $quantity, price: $price, subtotal: $subtotal, total: $total, notes: $notes, productName: $productName, productCategory: $productCategory, productBranch: $productBranch, productSku: $productSku, productVariantLabel: $productVariantLabel, productSnapshot: $productSnapshot, productVariantSnapshot: $productVariantSnapshot, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $MerchantOrderItemEntityCopyWith<$Res> implements $MerchantOrderItemCopyWith<$Res> {
  factory $MerchantOrderItemEntityCopyWith(MerchantOrderItemEntity value, $Res Function(MerchantOrderItemEntity) _then) = _$MerchantOrderItemEntityCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? orderId, String? productId, String? productVariantId, int? quantity, int? price, int? subtotal, int? total, String? notes, String? productName, String? productCategory, String? productBranch, String? productSku, String? productVariantLabel, MerchantOrderProductSnapshotEntity? productSnapshot, MerchantOrderProductVariantSnapshotEntity? productVariantSnapshot, String? createdAt, String? updatedAt
});




}
/// @nodoc
class _$MerchantOrderItemEntityCopyWithImpl<$Res>
    implements $MerchantOrderItemEntityCopyWith<$Res> {
  _$MerchantOrderItemEntityCopyWithImpl(this._self, this._then);

  final MerchantOrderItemEntity _self;
  final $Res Function(MerchantOrderItemEntity) _then;

/// Create a copy of MerchantOrderItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? orderId = freezed,Object? productId = freezed,Object? productVariantId = freezed,Object? quantity = freezed,Object? price = freezed,Object? subtotal = freezed,Object? total = freezed,Object? notes = freezed,Object? productName = freezed,Object? productCategory = freezed,Object? productBranch = freezed,Object? productSku = freezed,Object? productVariantLabel = freezed,Object? productSnapshot = freezed,Object? productVariantSnapshot = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(MerchantOrderItemEntity(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,orderId: freezed == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String?,productId: freezed == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String?,productVariantId: freezed == productVariantId ? _self.productVariantId : productVariantId // ignore: cast_nullable_to_non_nullable
as String?,quantity: freezed == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int?,subtotal: freezed == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as int?,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,productName: freezed == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String?,productCategory: freezed == productCategory ? _self.productCategory : productCategory // ignore: cast_nullable_to_non_nullable
as String?,productBranch: freezed == productBranch ? _self.productBranch : productBranch // ignore: cast_nullable_to_non_nullable
as String?,productSku: freezed == productSku ? _self.productSku : productSku // ignore: cast_nullable_to_non_nullable
as String?,productVariantLabel: freezed == productVariantLabel ? _self.productVariantLabel : productVariantLabel // ignore: cast_nullable_to_non_nullable
as String?,productSnapshot: freezed == productSnapshot ? _self.productSnapshot : productSnapshot // ignore: cast_nullable_to_non_nullable
as MerchantOrderProductSnapshotEntity?,productVariantSnapshot: freezed == productVariantSnapshot ? _self.productVariantSnapshot : productVariantSnapshot // ignore: cast_nullable_to_non_nullable
as MerchantOrderProductVariantSnapshotEntity?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

MerchantOrderProductSnapshot _$MerchantOrderProductSnapshotFromJson(
  Map<String, dynamic> json
) {
    return MerchantOrderProductSnapshotEntity.fromJson(
      json
    );
}

/// @nodoc
mixin _$MerchantOrderProductSnapshot {

 String? get id; String? get sku; String? get name; String? get slug; int? get price; int? get width; int? get height; int? get length; int? get weight; String? get category;
/// Create a copy of MerchantOrderProductSnapshot
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantOrderProductSnapshotCopyWith<MerchantOrderProductSnapshot> get copyWith => _$MerchantOrderProductSnapshotCopyWithImpl<MerchantOrderProductSnapshot>(this as MerchantOrderProductSnapshot, _$identity);

  /// Serializes this MerchantOrderProductSnapshot to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantOrderProductSnapshot&&(identical(other.id, id) || other.id == id)&&(identical(other.sku, sku) || other.sku == sku)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.price, price) || other.price == price)&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height)&&(identical(other.length, length) || other.length == length)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.category, category) || other.category == category));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,sku,name,slug,price,width,height,length,weight,category);

@override
String toString() {
  return 'MerchantOrderProductSnapshot(id: $id, sku: $sku, name: $name, slug: $slug, price: $price, width: $width, height: $height, length: $length, weight: $weight, category: $category)';
}


}

/// @nodoc
abstract mixin class $MerchantOrderProductSnapshotCopyWith<$Res>  {
  factory $MerchantOrderProductSnapshotCopyWith(MerchantOrderProductSnapshot value, $Res Function(MerchantOrderProductSnapshot) _then) = _$MerchantOrderProductSnapshotCopyWithImpl;
@useResult
$Res call({
 String? id, String? sku, String? name, String? slug, int? price, int? width, int? height, int? length, int? weight, String? category
});




}
/// @nodoc
class _$MerchantOrderProductSnapshotCopyWithImpl<$Res>
    implements $MerchantOrderProductSnapshotCopyWith<$Res> {
  _$MerchantOrderProductSnapshotCopyWithImpl(this._self, this._then);

  final MerchantOrderProductSnapshot _self;
  final $Res Function(MerchantOrderProductSnapshot) _then;

/// Create a copy of MerchantOrderProductSnapshot
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? sku = freezed,Object? name = freezed,Object? slug = freezed,Object? price = freezed,Object? width = freezed,Object? height = freezed,Object? length = freezed,Object? weight = freezed,Object? category = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,sku: freezed == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,slug: freezed == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int?,width: freezed == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int?,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int?,length: freezed == length ? _self.length : length // ignore: cast_nullable_to_non_nullable
as int?,weight: freezed == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as int?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MerchantOrderProductSnapshot].
extension MerchantOrderProductSnapshotPatterns on MerchantOrderProductSnapshot {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MerchantOrderProductSnapshotEntity value)?  entity,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MerchantOrderProductSnapshotEntity() when entity != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MerchantOrderProductSnapshotEntity value)  entity,}){
final _that = this;
switch (_that) {
case MerchantOrderProductSnapshotEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MerchantOrderProductSnapshotEntity value)?  entity,}){
final _that = this;
switch (_that) {
case MerchantOrderProductSnapshotEntity() when entity != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String? id,  String? sku,  String? name,  String? slug,  int? price,  int? width,  int? height,  int? length,  int? weight,  String? category)?  entity,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MerchantOrderProductSnapshotEntity() when entity != null:
return entity(_that.id,_that.sku,_that.name,_that.slug,_that.price,_that.width,_that.height,_that.length,_that.weight,_that.category);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String? id,  String? sku,  String? name,  String? slug,  int? price,  int? width,  int? height,  int? length,  int? weight,  String? category)  entity,}) {final _that = this;
switch (_that) {
case MerchantOrderProductSnapshotEntity():
return entity(_that.id,_that.sku,_that.name,_that.slug,_that.price,_that.width,_that.height,_that.length,_that.weight,_that.category);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String? id,  String? sku,  String? name,  String? slug,  int? price,  int? width,  int? height,  int? length,  int? weight,  String? category)?  entity,}) {final _that = this;
switch (_that) {
case MerchantOrderProductSnapshotEntity() when entity != null:
return entity(_that.id,_that.sku,_that.name,_that.slug,_that.price,_that.width,_that.height,_that.length,_that.weight,_that.category);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class MerchantOrderProductSnapshotEntity implements MerchantOrderProductSnapshot {
  const MerchantOrderProductSnapshotEntity({this.id, this.sku, this.name, this.slug, this.price, this.width, this.height, this.length, this.weight, this.category});
  factory MerchantOrderProductSnapshotEntity.fromJson(Map<String, dynamic> json) => _$MerchantOrderProductSnapshotEntityFromJson(json);

@override final  String? id;
@override final  String? sku;
@override final  String? name;
@override final  String? slug;
@override final  int? price;
@override final  int? width;
@override final  int? height;
@override final  int? length;
@override final  int? weight;
@override final  String? category;

/// Create a copy of MerchantOrderProductSnapshot
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantOrderProductSnapshotEntityCopyWith<MerchantOrderProductSnapshotEntity> get copyWith => _$MerchantOrderProductSnapshotEntityCopyWithImpl<MerchantOrderProductSnapshotEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MerchantOrderProductSnapshotEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantOrderProductSnapshotEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.sku, sku) || other.sku == sku)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.price, price) || other.price == price)&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height)&&(identical(other.length, length) || other.length == length)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.category, category) || other.category == category));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,sku,name,slug,price,width,height,length,weight,category);

@override
String toString() {
  return 'MerchantOrderProductSnapshot.entity(id: $id, sku: $sku, name: $name, slug: $slug, price: $price, width: $width, height: $height, length: $length, weight: $weight, category: $category)';
}


}

/// @nodoc
abstract mixin class $MerchantOrderProductSnapshotEntityCopyWith<$Res> implements $MerchantOrderProductSnapshotCopyWith<$Res> {
  factory $MerchantOrderProductSnapshotEntityCopyWith(MerchantOrderProductSnapshotEntity value, $Res Function(MerchantOrderProductSnapshotEntity) _then) = _$MerchantOrderProductSnapshotEntityCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? sku, String? name, String? slug, int? price, int? width, int? height, int? length, int? weight, String? category
});




}
/// @nodoc
class _$MerchantOrderProductSnapshotEntityCopyWithImpl<$Res>
    implements $MerchantOrderProductSnapshotEntityCopyWith<$Res> {
  _$MerchantOrderProductSnapshotEntityCopyWithImpl(this._self, this._then);

  final MerchantOrderProductSnapshotEntity _self;
  final $Res Function(MerchantOrderProductSnapshotEntity) _then;

/// Create a copy of MerchantOrderProductSnapshot
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? sku = freezed,Object? name = freezed,Object? slug = freezed,Object? price = freezed,Object? width = freezed,Object? height = freezed,Object? length = freezed,Object? weight = freezed,Object? category = freezed,}) {
  return _then(MerchantOrderProductSnapshotEntity(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,sku: freezed == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,slug: freezed == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int?,width: freezed == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int?,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int?,length: freezed == length ? _self.length : length // ignore: cast_nullable_to_non_nullable
as int?,weight: freezed == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as int?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

MerchantOrderProductVariantSnapshot _$MerchantOrderProductVariantSnapshotFromJson(
  Map<String, dynamic> json
) {
    return MerchantOrderProductVariantSnapshotEntity.fromJson(
      json
    );
}

/// @nodoc
mixin _$MerchantOrderProductVariantSnapshot {

 String? get id; String? get sku; Map<String, dynamic>? get variantCombination; dynamic get price; dynamic get stock; dynamic get minPurchase; dynamic get weight; dynamic get length; dynamic get width; dynamic get height;
/// Create a copy of MerchantOrderProductVariantSnapshot
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantOrderProductVariantSnapshotCopyWith<MerchantOrderProductVariantSnapshot> get copyWith => _$MerchantOrderProductVariantSnapshotCopyWithImpl<MerchantOrderProductVariantSnapshot>(this as MerchantOrderProductVariantSnapshot, _$identity);

  /// Serializes this MerchantOrderProductVariantSnapshot to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantOrderProductVariantSnapshot&&(identical(other.id, id) || other.id == id)&&(identical(other.sku, sku) || other.sku == sku)&&const DeepCollectionEquality().equals(other.variantCombination, variantCombination)&&const DeepCollectionEquality().equals(other.price, price)&&const DeepCollectionEquality().equals(other.stock, stock)&&const DeepCollectionEquality().equals(other.minPurchase, minPurchase)&&const DeepCollectionEquality().equals(other.weight, weight)&&const DeepCollectionEquality().equals(other.length, length)&&const DeepCollectionEquality().equals(other.width, width)&&const DeepCollectionEquality().equals(other.height, height));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,sku,const DeepCollectionEquality().hash(variantCombination),const DeepCollectionEquality().hash(price),const DeepCollectionEquality().hash(stock),const DeepCollectionEquality().hash(minPurchase),const DeepCollectionEquality().hash(weight),const DeepCollectionEquality().hash(length),const DeepCollectionEquality().hash(width),const DeepCollectionEquality().hash(height));

@override
String toString() {
  return 'MerchantOrderProductVariantSnapshot(id: $id, sku: $sku, variantCombination: $variantCombination, price: $price, stock: $stock, minPurchase: $minPurchase, weight: $weight, length: $length, width: $width, height: $height)';
}


}

/// @nodoc
abstract mixin class $MerchantOrderProductVariantSnapshotCopyWith<$Res>  {
  factory $MerchantOrderProductVariantSnapshotCopyWith(MerchantOrderProductVariantSnapshot value, $Res Function(MerchantOrderProductVariantSnapshot) _then) = _$MerchantOrderProductVariantSnapshotCopyWithImpl;
@useResult
$Res call({
 String? id, String? sku, Map<String, dynamic>? variantCombination, dynamic price, dynamic stock, dynamic minPurchase, dynamic weight, dynamic length, dynamic width, dynamic height
});




}
/// @nodoc
class _$MerchantOrderProductVariantSnapshotCopyWithImpl<$Res>
    implements $MerchantOrderProductVariantSnapshotCopyWith<$Res> {
  _$MerchantOrderProductVariantSnapshotCopyWithImpl(this._self, this._then);

  final MerchantOrderProductVariantSnapshot _self;
  final $Res Function(MerchantOrderProductVariantSnapshot) _then;

/// Create a copy of MerchantOrderProductVariantSnapshot
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? sku = freezed,Object? variantCombination = freezed,Object? price = freezed,Object? stock = freezed,Object? minPurchase = freezed,Object? weight = freezed,Object? length = freezed,Object? width = freezed,Object? height = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,sku: freezed == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String?,variantCombination: freezed == variantCombination ? _self.variantCombination : variantCombination // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as dynamic,stock: freezed == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as dynamic,minPurchase: freezed == minPurchase ? _self.minPurchase : minPurchase // ignore: cast_nullable_to_non_nullable
as dynamic,weight: freezed == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as dynamic,length: freezed == length ? _self.length : length // ignore: cast_nullable_to_non_nullable
as dynamic,width: freezed == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as dynamic,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}

}


/// Adds pattern-matching-related methods to [MerchantOrderProductVariantSnapshot].
extension MerchantOrderProductVariantSnapshotPatterns on MerchantOrderProductVariantSnapshot {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MerchantOrderProductVariantSnapshotEntity value)?  entity,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MerchantOrderProductVariantSnapshotEntity() when entity != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MerchantOrderProductVariantSnapshotEntity value)  entity,}){
final _that = this;
switch (_that) {
case MerchantOrderProductVariantSnapshotEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MerchantOrderProductVariantSnapshotEntity value)?  entity,}){
final _that = this;
switch (_that) {
case MerchantOrderProductVariantSnapshotEntity() when entity != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String? id,  String? sku,  Map<String, dynamic>? variantCombination,  dynamic price,  dynamic stock,  dynamic minPurchase,  dynamic weight,  dynamic length,  dynamic width,  dynamic height)?  entity,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MerchantOrderProductVariantSnapshotEntity() when entity != null:
return entity(_that.id,_that.sku,_that.variantCombination,_that.price,_that.stock,_that.minPurchase,_that.weight,_that.length,_that.width,_that.height);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String? id,  String? sku,  Map<String, dynamic>? variantCombination,  dynamic price,  dynamic stock,  dynamic minPurchase,  dynamic weight,  dynamic length,  dynamic width,  dynamic height)  entity,}) {final _that = this;
switch (_that) {
case MerchantOrderProductVariantSnapshotEntity():
return entity(_that.id,_that.sku,_that.variantCombination,_that.price,_that.stock,_that.minPurchase,_that.weight,_that.length,_that.width,_that.height);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String? id,  String? sku,  Map<String, dynamic>? variantCombination,  dynamic price,  dynamic stock,  dynamic minPurchase,  dynamic weight,  dynamic length,  dynamic width,  dynamic height)?  entity,}) {final _that = this;
switch (_that) {
case MerchantOrderProductVariantSnapshotEntity() when entity != null:
return entity(_that.id,_that.sku,_that.variantCombination,_that.price,_that.stock,_that.minPurchase,_that.weight,_that.length,_that.width,_that.height);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class MerchantOrderProductVariantSnapshotEntity implements MerchantOrderProductVariantSnapshot {
  const MerchantOrderProductVariantSnapshotEntity({this.id, this.sku, final  Map<String, dynamic>? variantCombination, this.price, this.stock, this.minPurchase, this.weight, this.length, this.width, this.height}): _variantCombination = variantCombination;
  factory MerchantOrderProductVariantSnapshotEntity.fromJson(Map<String, dynamic> json) => _$MerchantOrderProductVariantSnapshotEntityFromJson(json);

@override final  String? id;
@override final  String? sku;
 final  Map<String, dynamic>? _variantCombination;
@override Map<String, dynamic>? get variantCombination {
  final value = _variantCombination;
  if (value == null) return null;
  if (_variantCombination is EqualUnmodifiableMapView) return _variantCombination;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override final  dynamic price;
@override final  dynamic stock;
@override final  dynamic minPurchase;
@override final  dynamic weight;
@override final  dynamic length;
@override final  dynamic width;
@override final  dynamic height;

/// Create a copy of MerchantOrderProductVariantSnapshot
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantOrderProductVariantSnapshotEntityCopyWith<MerchantOrderProductVariantSnapshotEntity> get copyWith => _$MerchantOrderProductVariantSnapshotEntityCopyWithImpl<MerchantOrderProductVariantSnapshotEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MerchantOrderProductVariantSnapshotEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantOrderProductVariantSnapshotEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.sku, sku) || other.sku == sku)&&const DeepCollectionEquality().equals(other._variantCombination, _variantCombination)&&const DeepCollectionEquality().equals(other.price, price)&&const DeepCollectionEquality().equals(other.stock, stock)&&const DeepCollectionEquality().equals(other.minPurchase, minPurchase)&&const DeepCollectionEquality().equals(other.weight, weight)&&const DeepCollectionEquality().equals(other.length, length)&&const DeepCollectionEquality().equals(other.width, width)&&const DeepCollectionEquality().equals(other.height, height));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,sku,const DeepCollectionEquality().hash(_variantCombination),const DeepCollectionEquality().hash(price),const DeepCollectionEquality().hash(stock),const DeepCollectionEquality().hash(minPurchase),const DeepCollectionEquality().hash(weight),const DeepCollectionEquality().hash(length),const DeepCollectionEquality().hash(width),const DeepCollectionEquality().hash(height));

@override
String toString() {
  return 'MerchantOrderProductVariantSnapshot.entity(id: $id, sku: $sku, variantCombination: $variantCombination, price: $price, stock: $stock, minPurchase: $minPurchase, weight: $weight, length: $length, width: $width, height: $height)';
}


}

/// @nodoc
abstract mixin class $MerchantOrderProductVariantSnapshotEntityCopyWith<$Res> implements $MerchantOrderProductVariantSnapshotCopyWith<$Res> {
  factory $MerchantOrderProductVariantSnapshotEntityCopyWith(MerchantOrderProductVariantSnapshotEntity value, $Res Function(MerchantOrderProductVariantSnapshotEntity) _then) = _$MerchantOrderProductVariantSnapshotEntityCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? sku, Map<String, dynamic>? variantCombination, dynamic price, dynamic stock, dynamic minPurchase, dynamic weight, dynamic length, dynamic width, dynamic height
});




}
/// @nodoc
class _$MerchantOrderProductVariantSnapshotEntityCopyWithImpl<$Res>
    implements $MerchantOrderProductVariantSnapshotEntityCopyWith<$Res> {
  _$MerchantOrderProductVariantSnapshotEntityCopyWithImpl(this._self, this._then);

  final MerchantOrderProductVariantSnapshotEntity _self;
  final $Res Function(MerchantOrderProductVariantSnapshotEntity) _then;

/// Create a copy of MerchantOrderProductVariantSnapshot
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? sku = freezed,Object? variantCombination = freezed,Object? price = freezed,Object? stock = freezed,Object? minPurchase = freezed,Object? weight = freezed,Object? length = freezed,Object? width = freezed,Object? height = freezed,}) {
  return _then(MerchantOrderProductVariantSnapshotEntity(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,sku: freezed == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String?,variantCombination: freezed == variantCombination ? _self._variantCombination : variantCombination // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as dynamic,stock: freezed == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as dynamic,minPurchase: freezed == minPurchase ? _self.minPurchase : minPurchase // ignore: cast_nullable_to_non_nullable
as dynamic,weight: freezed == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as dynamic,length: freezed == length ? _self.length : length // ignore: cast_nullable_to_non_nullable
as dynamic,width: freezed == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as dynamic,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

// dart format on
