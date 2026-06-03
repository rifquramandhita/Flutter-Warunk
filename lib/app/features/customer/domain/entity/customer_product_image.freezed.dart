// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_product_image.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
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
