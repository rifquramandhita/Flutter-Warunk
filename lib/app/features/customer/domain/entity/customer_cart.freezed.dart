// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_cart.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
CustomerCart _$CustomerCartFromJson(
  Map<String, dynamic> json
) {
    return CustomerCartEntity.fromJson(
      json
    );
}

/// @nodoc
mixin _$CustomerCart {

 String get id; int get userId; String get productId; String? get productVariantId; int get quantity; String? get notes; int get unitPrice; int get subtotal; CustomerProductEntity? get product; CustomerProductVariantEntity? get productVariant; String? get createdAt; String? get updatedAt;
/// Create a copy of CustomerCart
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerCartCopyWith<CustomerCart> get copyWith => _$CustomerCartCopyWithImpl<CustomerCart>(this as CustomerCart, _$identity);

  /// Serializes this CustomerCart to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerCart&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.productVariantId, productVariantId) || other.productVariantId == productVariantId)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&const DeepCollectionEquality().equals(other.product, product)&&const DeepCollectionEquality().equals(other.productVariant, productVariant)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,productId,productVariantId,quantity,notes,unitPrice,subtotal,const DeepCollectionEquality().hash(product),const DeepCollectionEquality().hash(productVariant),createdAt,updatedAt);

@override
String toString() {
  return 'CustomerCart(id: $id, userId: $userId, productId: $productId, productVariantId: $productVariantId, quantity: $quantity, notes: $notes, unitPrice: $unitPrice, subtotal: $subtotal, product: $product, productVariant: $productVariant, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $CustomerCartCopyWith<$Res>  {
  factory $CustomerCartCopyWith(CustomerCart value, $Res Function(CustomerCart) _then) = _$CustomerCartCopyWithImpl;
@useResult
$Res call({
 String id, int userId, String productId, String? productVariantId, int quantity, String? notes, int unitPrice, int subtotal, CustomerProductEntity? product, CustomerProductVariantEntity? productVariant, String? createdAt, String? updatedAt
});




}
/// @nodoc
class _$CustomerCartCopyWithImpl<$Res>
    implements $CustomerCartCopyWith<$Res> {
  _$CustomerCartCopyWithImpl(this._self, this._then);

  final CustomerCart _self;
  final $Res Function(CustomerCart) _then;

/// Create a copy of CustomerCart
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? productId = null,Object? productVariantId = freezed,Object? quantity = null,Object? notes = freezed,Object? unitPrice = null,Object? subtotal = null,Object? product = freezed,Object? productVariant = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,productVariantId: freezed == productVariantId ? _self.productVariantId : productVariantId // ignore: cast_nullable_to_non_nullable
as String?,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as int,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as int,product: freezed == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as CustomerProductEntity?,productVariant: freezed == productVariant ? _self.productVariant : productVariant // ignore: cast_nullable_to_non_nullable
as CustomerProductVariantEntity?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CustomerCart].
extension CustomerCartPatterns on CustomerCart {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CustomerCartEntity value)?  entity,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CustomerCartEntity() when entity != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CustomerCartEntity value)  entity,}){
final _that = this;
switch (_that) {
case CustomerCartEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CustomerCartEntity value)?  entity,}){
final _that = this;
switch (_that) {
case CustomerCartEntity() when entity != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String id,  int userId,  String productId,  String? productVariantId,  int quantity,  String? notes,  int unitPrice,  int subtotal,  CustomerProductEntity? product,  CustomerProductVariantEntity? productVariant,  String? createdAt,  String? updatedAt)?  entity,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CustomerCartEntity() when entity != null:
return entity(_that.id,_that.userId,_that.productId,_that.productVariantId,_that.quantity,_that.notes,_that.unitPrice,_that.subtotal,_that.product,_that.productVariant,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String id,  int userId,  String productId,  String? productVariantId,  int quantity,  String? notes,  int unitPrice,  int subtotal,  CustomerProductEntity? product,  CustomerProductVariantEntity? productVariant,  String? createdAt,  String? updatedAt)  entity,}) {final _that = this;
switch (_that) {
case CustomerCartEntity():
return entity(_that.id,_that.userId,_that.productId,_that.productVariantId,_that.quantity,_that.notes,_that.unitPrice,_that.subtotal,_that.product,_that.productVariant,_that.createdAt,_that.updatedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String id,  int userId,  String productId,  String? productVariantId,  int quantity,  String? notes,  int unitPrice,  int subtotal,  CustomerProductEntity? product,  CustomerProductVariantEntity? productVariant,  String? createdAt,  String? updatedAt)?  entity,}) {final _that = this;
switch (_that) {
case CustomerCartEntity() when entity != null:
return entity(_that.id,_that.userId,_that.productId,_that.productVariantId,_that.quantity,_that.notes,_that.unitPrice,_that.subtotal,_that.product,_that.productVariant,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class CustomerCartEntity implements CustomerCart {
  const CustomerCartEntity({required this.id, required this.userId, required this.productId, this.productVariantId, required this.quantity, this.notes, required this.unitPrice, required this.subtotal, this.product, this.productVariant, this.createdAt, this.updatedAt});
  factory CustomerCartEntity.fromJson(Map<String, dynamic> json) => _$CustomerCartEntityFromJson(json);

@override final  String id;
@override final  int userId;
@override final  String productId;
@override final  String? productVariantId;
@override final  int quantity;
@override final  String? notes;
@override final  int unitPrice;
@override final  int subtotal;
@override final  CustomerProductEntity? product;
@override final  CustomerProductVariantEntity? productVariant;
@override final  String? createdAt;
@override final  String? updatedAt;

/// Create a copy of CustomerCart
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerCartEntityCopyWith<CustomerCartEntity> get copyWith => _$CustomerCartEntityCopyWithImpl<CustomerCartEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomerCartEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerCartEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.productVariantId, productVariantId) || other.productVariantId == productVariantId)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&const DeepCollectionEquality().equals(other.product, product)&&const DeepCollectionEquality().equals(other.productVariant, productVariant)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,productId,productVariantId,quantity,notes,unitPrice,subtotal,const DeepCollectionEquality().hash(product),const DeepCollectionEquality().hash(productVariant),createdAt,updatedAt);

@override
String toString() {
  return 'CustomerCart.entity(id: $id, userId: $userId, productId: $productId, productVariantId: $productVariantId, quantity: $quantity, notes: $notes, unitPrice: $unitPrice, subtotal: $subtotal, product: $product, productVariant: $productVariant, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $CustomerCartEntityCopyWith<$Res> implements $CustomerCartCopyWith<$Res> {
  factory $CustomerCartEntityCopyWith(CustomerCartEntity value, $Res Function(CustomerCartEntity) _then) = _$CustomerCartEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, int userId, String productId, String? productVariantId, int quantity, String? notes, int unitPrice, int subtotal, CustomerProductEntity? product, CustomerProductVariantEntity? productVariant, String? createdAt, String? updatedAt
});




}
/// @nodoc
class _$CustomerCartEntityCopyWithImpl<$Res>
    implements $CustomerCartEntityCopyWith<$Res> {
  _$CustomerCartEntityCopyWithImpl(this._self, this._then);

  final CustomerCartEntity _self;
  final $Res Function(CustomerCartEntity) _then;

/// Create a copy of CustomerCart
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? productId = null,Object? productVariantId = freezed,Object? quantity = null,Object? notes = freezed,Object? unitPrice = null,Object? subtotal = null,Object? product = freezed,Object? productVariant = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(CustomerCartEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,productVariantId: freezed == productVariantId ? _self.productVariantId : productVariantId // ignore: cast_nullable_to_non_nullable
as String?,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as int,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as int,product: freezed == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as CustomerProductEntity?,productVariant: freezed == productVariant ? _self.productVariant : productVariant // ignore: cast_nullable_to_non_nullable
as CustomerProductVariantEntity?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
