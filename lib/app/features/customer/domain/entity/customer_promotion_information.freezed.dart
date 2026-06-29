// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_promotion_information.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
CustomerPromotionInformation _$CustomerPromotionInformationFromJson(
  Map<String, dynamic> json
) {
    return CustomerPromotionInformationEntity.fromJson(
      json
    );
}

/// @nodoc
mixin _$CustomerPromotionInformation {

 String? get id; String? get type; String? get eyebrow; String? get title; String? get description; String? get image; String? get badge; String? get href; String? get detailUrl; String? get buttonLabel; int? get sortOrder; String? get startsAt; String? get endsAt;
/// Create a copy of CustomerPromotionInformation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerPromotionInformationCopyWith<CustomerPromotionInformation> get copyWith => _$CustomerPromotionInformationCopyWithImpl<CustomerPromotionInformation>(this as CustomerPromotionInformation, _$identity);

  /// Serializes this CustomerPromotionInformation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerPromotionInformation&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.eyebrow, eyebrow) || other.eyebrow == eyebrow)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.image, image) || other.image == image)&&(identical(other.badge, badge) || other.badge == badge)&&(identical(other.href, href) || other.href == href)&&(identical(other.detailUrl, detailUrl) || other.detailUrl == detailUrl)&&(identical(other.buttonLabel, buttonLabel) || other.buttonLabel == buttonLabel)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&(identical(other.startsAt, startsAt) || other.startsAt == startsAt)&&(identical(other.endsAt, endsAt) || other.endsAt == endsAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,eyebrow,title,description,image,badge,href,detailUrl,buttonLabel,sortOrder,startsAt,endsAt);

@override
String toString() {
  return 'CustomerPromotionInformation(id: $id, type: $type, eyebrow: $eyebrow, title: $title, description: $description, image: $image, badge: $badge, href: $href, detailUrl: $detailUrl, buttonLabel: $buttonLabel, sortOrder: $sortOrder, startsAt: $startsAt, endsAt: $endsAt)';
}


}

/// @nodoc
abstract mixin class $CustomerPromotionInformationCopyWith<$Res>  {
  factory $CustomerPromotionInformationCopyWith(CustomerPromotionInformation value, $Res Function(CustomerPromotionInformation) _then) = _$CustomerPromotionInformationCopyWithImpl;
@useResult
$Res call({
 String? id, String? type, String? eyebrow, String? title, String? description, String? image, String? badge, String? href, String? detailUrl, String? buttonLabel, int? sortOrder, String? startsAt, String? endsAt
});




}
/// @nodoc
class _$CustomerPromotionInformationCopyWithImpl<$Res>
    implements $CustomerPromotionInformationCopyWith<$Res> {
  _$CustomerPromotionInformationCopyWithImpl(this._self, this._then);

  final CustomerPromotionInformation _self;
  final $Res Function(CustomerPromotionInformation) _then;

/// Create a copy of CustomerPromotionInformation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? type = freezed,Object? eyebrow = freezed,Object? title = freezed,Object? description = freezed,Object? image = freezed,Object? badge = freezed,Object? href = freezed,Object? detailUrl = freezed,Object? buttonLabel = freezed,Object? sortOrder = freezed,Object? startsAt = freezed,Object? endsAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,eyebrow: freezed == eyebrow ? _self.eyebrow : eyebrow // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,badge: freezed == badge ? _self.badge : badge // ignore: cast_nullable_to_non_nullable
as String?,href: freezed == href ? _self.href : href // ignore: cast_nullable_to_non_nullable
as String?,detailUrl: freezed == detailUrl ? _self.detailUrl : detailUrl // ignore: cast_nullable_to_non_nullable
as String?,buttonLabel: freezed == buttonLabel ? _self.buttonLabel : buttonLabel // ignore: cast_nullable_to_non_nullable
as String?,sortOrder: freezed == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int?,startsAt: freezed == startsAt ? _self.startsAt : startsAt // ignore: cast_nullable_to_non_nullable
as String?,endsAt: freezed == endsAt ? _self.endsAt : endsAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CustomerPromotionInformation].
extension CustomerPromotionInformationPatterns on CustomerPromotionInformation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CustomerPromotionInformationEntity value)?  entity,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CustomerPromotionInformationEntity() when entity != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CustomerPromotionInformationEntity value)  entity,}){
final _that = this;
switch (_that) {
case CustomerPromotionInformationEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CustomerPromotionInformationEntity value)?  entity,}){
final _that = this;
switch (_that) {
case CustomerPromotionInformationEntity() when entity != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String? id,  String? type,  String? eyebrow,  String? title,  String? description,  String? image,  String? badge,  String? href,  String? detailUrl,  String? buttonLabel,  int? sortOrder,  String? startsAt,  String? endsAt)?  entity,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CustomerPromotionInformationEntity() when entity != null:
return entity(_that.id,_that.type,_that.eyebrow,_that.title,_that.description,_that.image,_that.badge,_that.href,_that.detailUrl,_that.buttonLabel,_that.sortOrder,_that.startsAt,_that.endsAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String? id,  String? type,  String? eyebrow,  String? title,  String? description,  String? image,  String? badge,  String? href,  String? detailUrl,  String? buttonLabel,  int? sortOrder,  String? startsAt,  String? endsAt)  entity,}) {final _that = this;
switch (_that) {
case CustomerPromotionInformationEntity():
return entity(_that.id,_that.type,_that.eyebrow,_that.title,_that.description,_that.image,_that.badge,_that.href,_that.detailUrl,_that.buttonLabel,_that.sortOrder,_that.startsAt,_that.endsAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String? id,  String? type,  String? eyebrow,  String? title,  String? description,  String? image,  String? badge,  String? href,  String? detailUrl,  String? buttonLabel,  int? sortOrder,  String? startsAt,  String? endsAt)?  entity,}) {final _that = this;
switch (_that) {
case CustomerPromotionInformationEntity() when entity != null:
return entity(_that.id,_that.type,_that.eyebrow,_that.title,_that.description,_that.image,_that.badge,_that.href,_that.detailUrl,_that.buttonLabel,_that.sortOrder,_that.startsAt,_that.endsAt);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class CustomerPromotionInformationEntity implements CustomerPromotionInformation {
  const CustomerPromotionInformationEntity({this.id, this.type, this.eyebrow, this.title, this.description, this.image, this.badge, this.href, this.detailUrl, this.buttonLabel, this.sortOrder, this.startsAt, this.endsAt});
  factory CustomerPromotionInformationEntity.fromJson(Map<String, dynamic> json) => _$CustomerPromotionInformationEntityFromJson(json);

@override final  String? id;
@override final  String? type;
@override final  String? eyebrow;
@override final  String? title;
@override final  String? description;
@override final  String? image;
@override final  String? badge;
@override final  String? href;
@override final  String? detailUrl;
@override final  String? buttonLabel;
@override final  int? sortOrder;
@override final  String? startsAt;
@override final  String? endsAt;

/// Create a copy of CustomerPromotionInformation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerPromotionInformationEntityCopyWith<CustomerPromotionInformationEntity> get copyWith => _$CustomerPromotionInformationEntityCopyWithImpl<CustomerPromotionInformationEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomerPromotionInformationEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerPromotionInformationEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.eyebrow, eyebrow) || other.eyebrow == eyebrow)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.image, image) || other.image == image)&&(identical(other.badge, badge) || other.badge == badge)&&(identical(other.href, href) || other.href == href)&&(identical(other.detailUrl, detailUrl) || other.detailUrl == detailUrl)&&(identical(other.buttonLabel, buttonLabel) || other.buttonLabel == buttonLabel)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&(identical(other.startsAt, startsAt) || other.startsAt == startsAt)&&(identical(other.endsAt, endsAt) || other.endsAt == endsAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,eyebrow,title,description,image,badge,href,detailUrl,buttonLabel,sortOrder,startsAt,endsAt);

@override
String toString() {
  return 'CustomerPromotionInformation.entity(id: $id, type: $type, eyebrow: $eyebrow, title: $title, description: $description, image: $image, badge: $badge, href: $href, detailUrl: $detailUrl, buttonLabel: $buttonLabel, sortOrder: $sortOrder, startsAt: $startsAt, endsAt: $endsAt)';
}


}

/// @nodoc
abstract mixin class $CustomerPromotionInformationEntityCopyWith<$Res> implements $CustomerPromotionInformationCopyWith<$Res> {
  factory $CustomerPromotionInformationEntityCopyWith(CustomerPromotionInformationEntity value, $Res Function(CustomerPromotionInformationEntity) _then) = _$CustomerPromotionInformationEntityCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? type, String? eyebrow, String? title, String? description, String? image, String? badge, String? href, String? detailUrl, String? buttonLabel, int? sortOrder, String? startsAt, String? endsAt
});




}
/// @nodoc
class _$CustomerPromotionInformationEntityCopyWithImpl<$Res>
    implements $CustomerPromotionInformationEntityCopyWith<$Res> {
  _$CustomerPromotionInformationEntityCopyWithImpl(this._self, this._then);

  final CustomerPromotionInformationEntity _self;
  final $Res Function(CustomerPromotionInformationEntity) _then;

/// Create a copy of CustomerPromotionInformation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? type = freezed,Object? eyebrow = freezed,Object? title = freezed,Object? description = freezed,Object? image = freezed,Object? badge = freezed,Object? href = freezed,Object? detailUrl = freezed,Object? buttonLabel = freezed,Object? sortOrder = freezed,Object? startsAt = freezed,Object? endsAt = freezed,}) {
  return _then(CustomerPromotionInformationEntity(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,eyebrow: freezed == eyebrow ? _self.eyebrow : eyebrow // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,badge: freezed == badge ? _self.badge : badge // ignore: cast_nullable_to_non_nullable
as String?,href: freezed == href ? _self.href : href // ignore: cast_nullable_to_non_nullable
as String?,detailUrl: freezed == detailUrl ? _self.detailUrl : detailUrl // ignore: cast_nullable_to_non_nullable
as String?,buttonLabel: freezed == buttonLabel ? _self.buttonLabel : buttonLabel // ignore: cast_nullable_to_non_nullable
as String?,sortOrder: freezed == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int?,startsAt: freezed == startsAt ? _self.startsAt : startsAt // ignore: cast_nullable_to_non_nullable
as String?,endsAt: freezed == endsAt ? _self.endsAt : endsAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
