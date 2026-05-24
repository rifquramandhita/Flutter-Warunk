// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'merchant_product_image.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
MerchantProductImage _$MerchantProductImageFromJson(
  Map<String, dynamic> json
) {
    return MerchantProductImageEntity.fromJson(
      json
    );
}

/// @nodoc
mixin _$MerchantProductImage {

 String get id; String get filePath; String get url; String get fileName; int get fileSize; String get mimeType; String get altText; int get sortOrder; DateTime? get createdAt; DateTime? get updatedAt;
/// Create a copy of MerchantProductImage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantProductImageCopyWith<MerchantProductImage> get copyWith => _$MerchantProductImageCopyWithImpl<MerchantProductImage>(this as MerchantProductImage, _$identity);

  /// Serializes this MerchantProductImage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantProductImage&&(identical(other.id, id) || other.id == id)&&(identical(other.filePath, filePath) || other.filePath == filePath)&&(identical(other.url, url) || other.url == url)&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.fileSize, fileSize) || other.fileSize == fileSize)&&(identical(other.mimeType, mimeType) || other.mimeType == mimeType)&&(identical(other.altText, altText) || other.altText == altText)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,filePath,url,fileName,fileSize,mimeType,altText,sortOrder,createdAt,updatedAt);

@override
String toString() {
  return 'MerchantProductImage(id: $id, filePath: $filePath, url: $url, fileName: $fileName, fileSize: $fileSize, mimeType: $mimeType, altText: $altText, sortOrder: $sortOrder, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $MerchantProductImageCopyWith<$Res>  {
  factory $MerchantProductImageCopyWith(MerchantProductImage value, $Res Function(MerchantProductImage) _then) = _$MerchantProductImageCopyWithImpl;
@useResult
$Res call({
 String id, String filePath, String url, String fileName, int fileSize, String mimeType, String altText, int sortOrder, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class _$MerchantProductImageCopyWithImpl<$Res>
    implements $MerchantProductImageCopyWith<$Res> {
  _$MerchantProductImageCopyWithImpl(this._self, this._then);

  final MerchantProductImage _self;
  final $Res Function(MerchantProductImage) _then;

/// Create a copy of MerchantProductImage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? filePath = null,Object? url = null,Object? fileName = null,Object? fileSize = null,Object? mimeType = null,Object? altText = null,Object? sortOrder = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,filePath: null == filePath ? _self.filePath : filePath // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,fileName: null == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String,fileSize: null == fileSize ? _self.fileSize : fileSize // ignore: cast_nullable_to_non_nullable
as int,mimeType: null == mimeType ? _self.mimeType : mimeType // ignore: cast_nullable_to_non_nullable
as String,altText: null == altText ? _self.altText : altText // ignore: cast_nullable_to_non_nullable
as String,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [MerchantProductImage].
extension MerchantProductImagePatterns on MerchantProductImage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MerchantProductImageEntity value)?  entity,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MerchantProductImageEntity() when entity != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MerchantProductImageEntity value)  entity,}){
final _that = this;
switch (_that) {
case MerchantProductImageEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MerchantProductImageEntity value)?  entity,}){
final _that = this;
switch (_that) {
case MerchantProductImageEntity() when entity != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String id,  String filePath,  String url,  String fileName,  int fileSize,  String mimeType,  String altText,  int sortOrder,  DateTime? createdAt,  DateTime? updatedAt)?  entity,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MerchantProductImageEntity() when entity != null:
return entity(_that.id,_that.filePath,_that.url,_that.fileName,_that.fileSize,_that.mimeType,_that.altText,_that.sortOrder,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String id,  String filePath,  String url,  String fileName,  int fileSize,  String mimeType,  String altText,  int sortOrder,  DateTime? createdAt,  DateTime? updatedAt)  entity,}) {final _that = this;
switch (_that) {
case MerchantProductImageEntity():
return entity(_that.id,_that.filePath,_that.url,_that.fileName,_that.fileSize,_that.mimeType,_that.altText,_that.sortOrder,_that.createdAt,_that.updatedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String id,  String filePath,  String url,  String fileName,  int fileSize,  String mimeType,  String altText,  int sortOrder,  DateTime? createdAt,  DateTime? updatedAt)?  entity,}) {final _that = this;
switch (_that) {
case MerchantProductImageEntity() when entity != null:
return entity(_that.id,_that.filePath,_that.url,_that.fileName,_that.fileSize,_that.mimeType,_that.altText,_that.sortOrder,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class MerchantProductImageEntity implements MerchantProductImage {
  const MerchantProductImageEntity({required this.id, required this.filePath, required this.url, required this.fileName, required this.fileSize, required this.mimeType, required this.altText, required this.sortOrder, this.createdAt, this.updatedAt});
  factory MerchantProductImageEntity.fromJson(Map<String, dynamic> json) => _$MerchantProductImageEntityFromJson(json);

@override final  String id;
@override final  String filePath;
@override final  String url;
@override final  String fileName;
@override final  int fileSize;
@override final  String mimeType;
@override final  String altText;
@override final  int sortOrder;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of MerchantProductImage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantProductImageEntityCopyWith<MerchantProductImageEntity> get copyWith => _$MerchantProductImageEntityCopyWithImpl<MerchantProductImageEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MerchantProductImageEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantProductImageEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.filePath, filePath) || other.filePath == filePath)&&(identical(other.url, url) || other.url == url)&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.fileSize, fileSize) || other.fileSize == fileSize)&&(identical(other.mimeType, mimeType) || other.mimeType == mimeType)&&(identical(other.altText, altText) || other.altText == altText)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,filePath,url,fileName,fileSize,mimeType,altText,sortOrder,createdAt,updatedAt);

@override
String toString() {
  return 'MerchantProductImage.entity(id: $id, filePath: $filePath, url: $url, fileName: $fileName, fileSize: $fileSize, mimeType: $mimeType, altText: $altText, sortOrder: $sortOrder, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $MerchantProductImageEntityCopyWith<$Res> implements $MerchantProductImageCopyWith<$Res> {
  factory $MerchantProductImageEntityCopyWith(MerchantProductImageEntity value, $Res Function(MerchantProductImageEntity) _then) = _$MerchantProductImageEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String filePath, String url, String fileName, int fileSize, String mimeType, String altText, int sortOrder, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class _$MerchantProductImageEntityCopyWithImpl<$Res>
    implements $MerchantProductImageEntityCopyWith<$Res> {
  _$MerchantProductImageEntityCopyWithImpl(this._self, this._then);

  final MerchantProductImageEntity _self;
  final $Res Function(MerchantProductImageEntity) _then;

/// Create a copy of MerchantProductImage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? filePath = null,Object? url = null,Object? fileName = null,Object? fileSize = null,Object? mimeType = null,Object? altText = null,Object? sortOrder = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(MerchantProductImageEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,filePath: null == filePath ? _self.filePath : filePath // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,fileName: null == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String,fileSize: null == fileSize ? _self.fileSize : fileSize // ignore: cast_nullable_to_non_nullable
as int,mimeType: null == mimeType ? _self.mimeType : mimeType // ignore: cast_nullable_to_non_nullable
as String,altText: null == altText ? _self.altText : altText // ignore: cast_nullable_to_non_nullable
as String,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
