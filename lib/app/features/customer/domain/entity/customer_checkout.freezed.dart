// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_checkout.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
CustomerCheckout _$CustomerCheckoutFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'optionEntity':
          return CustomerCheckoutOptionEntity.fromJson(
            json
          );
                case 'sendParam':
          return CustomerCheckoutSendParam.fromJson(
            json
          );
                case 'getShippingOptionParam':
          return CustomerCheckoutGetShippingOptionParam.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'CustomerCheckout',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$CustomerCheckout {



  /// Serializes this CustomerCheckout to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerCheckout);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CustomerCheckout()';
}


}

/// @nodoc
class $CustomerCheckoutCopyWith<$Res>  {
$CustomerCheckoutCopyWith(CustomerCheckout _, $Res Function(CustomerCheckout) __);
}


/// Adds pattern-matching-related methods to [CustomerCheckout].
extension CustomerCheckoutPatterns on CustomerCheckout {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CustomerCheckoutOptionEntity value)?  optionEntity,TResult Function( CustomerCheckoutSendParam value)?  sendParam,TResult Function( CustomerCheckoutGetShippingOptionParam value)?  getShippingOptionParam,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CustomerCheckoutOptionEntity() when optionEntity != null:
return optionEntity(_that);case CustomerCheckoutSendParam() when sendParam != null:
return sendParam(_that);case CustomerCheckoutGetShippingOptionParam() when getShippingOptionParam != null:
return getShippingOptionParam(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CustomerCheckoutOptionEntity value)  optionEntity,required TResult Function( CustomerCheckoutSendParam value)  sendParam,required TResult Function( CustomerCheckoutGetShippingOptionParam value)  getShippingOptionParam,}){
final _that = this;
switch (_that) {
case CustomerCheckoutOptionEntity():
return optionEntity(_that);case CustomerCheckoutSendParam():
return sendParam(_that);case CustomerCheckoutGetShippingOptionParam():
return getShippingOptionParam(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CustomerCheckoutOptionEntity value)?  optionEntity,TResult? Function( CustomerCheckoutSendParam value)?  sendParam,TResult? Function( CustomerCheckoutGetShippingOptionParam value)?  getShippingOptionParam,}){
final _that = this;
switch (_that) {
case CustomerCheckoutOptionEntity() when optionEntity != null:
return optionEntity(_that);case CustomerCheckoutSendParam() when sendParam != null:
return sendParam(_that);case CustomerCheckoutGetShippingOptionParam() when getShippingOptionParam != null:
return getShippingOptionParam(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( CustomerMerchantEntity? merchant,  String? blockingMessage,  List<CustomerCheckoutShippingOptionEntity>? shippingOptions,  List<CustomerCheckoutShippingOptionEntity>? biteshipShippingOptions,  String? selectedShippingKey,  String? selectedBiteshipRateKey,  CustomerCheckoutShippingOptionEntity? selectedShippingOption,  String? selectedMerchantAccountId,  List<CustomerCheckoutPaymentMethodEntity>? paymentMethods,  CustomerCheckoutSummaryEntity? summary,  List<CustomerPromotionEntity>? availablePromotions,  CustomerPromotionEntity? promotion)?  optionEntity,TResult Function( List<String> cartIds,  String? notes)?  sendParam,TResult Function( List<String> cartIds,  String? addressId,  String? shippingKey,  List<Map<String, String>>? promotions)?  getShippingOptionParam,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CustomerCheckoutOptionEntity() when optionEntity != null:
return optionEntity(_that.merchant,_that.blockingMessage,_that.shippingOptions,_that.biteshipShippingOptions,_that.selectedShippingKey,_that.selectedBiteshipRateKey,_that.selectedShippingOption,_that.selectedMerchantAccountId,_that.paymentMethods,_that.summary,_that.availablePromotions,_that.promotion);case CustomerCheckoutSendParam() when sendParam != null:
return sendParam(_that.cartIds,_that.notes);case CustomerCheckoutGetShippingOptionParam() when getShippingOptionParam != null:
return getShippingOptionParam(_that.cartIds,_that.addressId,_that.shippingKey,_that.promotions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( CustomerMerchantEntity? merchant,  String? blockingMessage,  List<CustomerCheckoutShippingOptionEntity>? shippingOptions,  List<CustomerCheckoutShippingOptionEntity>? biteshipShippingOptions,  String? selectedShippingKey,  String? selectedBiteshipRateKey,  CustomerCheckoutShippingOptionEntity? selectedShippingOption,  String? selectedMerchantAccountId,  List<CustomerCheckoutPaymentMethodEntity>? paymentMethods,  CustomerCheckoutSummaryEntity? summary,  List<CustomerPromotionEntity>? availablePromotions,  CustomerPromotionEntity? promotion)  optionEntity,required TResult Function( List<String> cartIds,  String? notes)  sendParam,required TResult Function( List<String> cartIds,  String? addressId,  String? shippingKey,  List<Map<String, String>>? promotions)  getShippingOptionParam,}) {final _that = this;
switch (_that) {
case CustomerCheckoutOptionEntity():
return optionEntity(_that.merchant,_that.blockingMessage,_that.shippingOptions,_that.biteshipShippingOptions,_that.selectedShippingKey,_that.selectedBiteshipRateKey,_that.selectedShippingOption,_that.selectedMerchantAccountId,_that.paymentMethods,_that.summary,_that.availablePromotions,_that.promotion);case CustomerCheckoutSendParam():
return sendParam(_that.cartIds,_that.notes);case CustomerCheckoutGetShippingOptionParam():
return getShippingOptionParam(_that.cartIds,_that.addressId,_that.shippingKey,_that.promotions);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( CustomerMerchantEntity? merchant,  String? blockingMessage,  List<CustomerCheckoutShippingOptionEntity>? shippingOptions,  List<CustomerCheckoutShippingOptionEntity>? biteshipShippingOptions,  String? selectedShippingKey,  String? selectedBiteshipRateKey,  CustomerCheckoutShippingOptionEntity? selectedShippingOption,  String? selectedMerchantAccountId,  List<CustomerCheckoutPaymentMethodEntity>? paymentMethods,  CustomerCheckoutSummaryEntity? summary,  List<CustomerPromotionEntity>? availablePromotions,  CustomerPromotionEntity? promotion)?  optionEntity,TResult? Function( List<String> cartIds,  String? notes)?  sendParam,TResult? Function( List<String> cartIds,  String? addressId,  String? shippingKey,  List<Map<String, String>>? promotions)?  getShippingOptionParam,}) {final _that = this;
switch (_that) {
case CustomerCheckoutOptionEntity() when optionEntity != null:
return optionEntity(_that.merchant,_that.blockingMessage,_that.shippingOptions,_that.biteshipShippingOptions,_that.selectedShippingKey,_that.selectedBiteshipRateKey,_that.selectedShippingOption,_that.selectedMerchantAccountId,_that.paymentMethods,_that.summary,_that.availablePromotions,_that.promotion);case CustomerCheckoutSendParam() when sendParam != null:
return sendParam(_that.cartIds,_that.notes);case CustomerCheckoutGetShippingOptionParam() when getShippingOptionParam != null:
return getShippingOptionParam(_that.cartIds,_that.addressId,_that.shippingKey,_that.promotions);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class CustomerCheckoutOptionEntity implements CustomerCheckout {
  const CustomerCheckoutOptionEntity({this.merchant, this.blockingMessage, final  List<CustomerCheckoutShippingOptionEntity>? shippingOptions, final  List<CustomerCheckoutShippingOptionEntity>? biteshipShippingOptions, this.selectedShippingKey, this.selectedBiteshipRateKey, this.selectedShippingOption, this.selectedMerchantAccountId, final  List<CustomerCheckoutPaymentMethodEntity>? paymentMethods, this.summary, final  List<CustomerPromotionEntity>? availablePromotions, this.promotion, final  String? $type}): _shippingOptions = shippingOptions,_biteshipShippingOptions = biteshipShippingOptions,_paymentMethods = paymentMethods,_availablePromotions = availablePromotions,$type = $type ?? 'optionEntity';
  factory CustomerCheckoutOptionEntity.fromJson(Map<String, dynamic> json) => _$CustomerCheckoutOptionEntityFromJson(json);

 final  CustomerMerchantEntity? merchant;
 final  String? blockingMessage;
 final  List<CustomerCheckoutShippingOptionEntity>? _shippingOptions;
 List<CustomerCheckoutShippingOptionEntity>? get shippingOptions {
  final value = _shippingOptions;
  if (value == null) return null;
  if (_shippingOptions is EqualUnmodifiableListView) return _shippingOptions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<CustomerCheckoutShippingOptionEntity>? _biteshipShippingOptions;
 List<CustomerCheckoutShippingOptionEntity>? get biteshipShippingOptions {
  final value = _biteshipShippingOptions;
  if (value == null) return null;
  if (_biteshipShippingOptions is EqualUnmodifiableListView) return _biteshipShippingOptions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  String? selectedShippingKey;
 final  String? selectedBiteshipRateKey;
 final  CustomerCheckoutShippingOptionEntity? selectedShippingOption;
 final  String? selectedMerchantAccountId;
 final  List<CustomerCheckoutPaymentMethodEntity>? _paymentMethods;
 List<CustomerCheckoutPaymentMethodEntity>? get paymentMethods {
  final value = _paymentMethods;
  if (value == null) return null;
  if (_paymentMethods is EqualUnmodifiableListView) return _paymentMethods;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  CustomerCheckoutSummaryEntity? summary;
 final  List<CustomerPromotionEntity>? _availablePromotions;
 List<CustomerPromotionEntity>? get availablePromotions {
  final value = _availablePromotions;
  if (value == null) return null;
  if (_availablePromotions is EqualUnmodifiableListView) return _availablePromotions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  CustomerPromotionEntity? promotion;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of CustomerCheckout
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerCheckoutOptionEntityCopyWith<CustomerCheckoutOptionEntity> get copyWith => _$CustomerCheckoutOptionEntityCopyWithImpl<CustomerCheckoutOptionEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomerCheckoutOptionEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerCheckoutOptionEntity&&const DeepCollectionEquality().equals(other.merchant, merchant)&&(identical(other.blockingMessage, blockingMessage) || other.blockingMessage == blockingMessage)&&const DeepCollectionEquality().equals(other._shippingOptions, _shippingOptions)&&const DeepCollectionEquality().equals(other._biteshipShippingOptions, _biteshipShippingOptions)&&(identical(other.selectedShippingKey, selectedShippingKey) || other.selectedShippingKey == selectedShippingKey)&&(identical(other.selectedBiteshipRateKey, selectedBiteshipRateKey) || other.selectedBiteshipRateKey == selectedBiteshipRateKey)&&const DeepCollectionEquality().equals(other.selectedShippingOption, selectedShippingOption)&&(identical(other.selectedMerchantAccountId, selectedMerchantAccountId) || other.selectedMerchantAccountId == selectedMerchantAccountId)&&const DeepCollectionEquality().equals(other._paymentMethods, _paymentMethods)&&const DeepCollectionEquality().equals(other.summary, summary)&&const DeepCollectionEquality().equals(other._availablePromotions, _availablePromotions)&&const DeepCollectionEquality().equals(other.promotion, promotion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(merchant),blockingMessage,const DeepCollectionEquality().hash(_shippingOptions),const DeepCollectionEquality().hash(_biteshipShippingOptions),selectedShippingKey,selectedBiteshipRateKey,const DeepCollectionEquality().hash(selectedShippingOption),selectedMerchantAccountId,const DeepCollectionEquality().hash(_paymentMethods),const DeepCollectionEquality().hash(summary),const DeepCollectionEquality().hash(_availablePromotions),const DeepCollectionEquality().hash(promotion));

@override
String toString() {
  return 'CustomerCheckout.optionEntity(merchant: $merchant, blockingMessage: $blockingMessage, shippingOptions: $shippingOptions, biteshipShippingOptions: $biteshipShippingOptions, selectedShippingKey: $selectedShippingKey, selectedBiteshipRateKey: $selectedBiteshipRateKey, selectedShippingOption: $selectedShippingOption, selectedMerchantAccountId: $selectedMerchantAccountId, paymentMethods: $paymentMethods, summary: $summary, availablePromotions: $availablePromotions, promotion: $promotion)';
}


}

/// @nodoc
abstract mixin class $CustomerCheckoutOptionEntityCopyWith<$Res> implements $CustomerCheckoutCopyWith<$Res> {
  factory $CustomerCheckoutOptionEntityCopyWith(CustomerCheckoutOptionEntity value, $Res Function(CustomerCheckoutOptionEntity) _then) = _$CustomerCheckoutOptionEntityCopyWithImpl;
@useResult
$Res call({
 CustomerMerchantEntity? merchant, String? blockingMessage, List<CustomerCheckoutShippingOptionEntity>? shippingOptions, List<CustomerCheckoutShippingOptionEntity>? biteshipShippingOptions, String? selectedShippingKey, String? selectedBiteshipRateKey, CustomerCheckoutShippingOptionEntity? selectedShippingOption, String? selectedMerchantAccountId, List<CustomerCheckoutPaymentMethodEntity>? paymentMethods, CustomerCheckoutSummaryEntity? summary, List<CustomerPromotionEntity>? availablePromotions, CustomerPromotionEntity? promotion
});




}
/// @nodoc
class _$CustomerCheckoutOptionEntityCopyWithImpl<$Res>
    implements $CustomerCheckoutOptionEntityCopyWith<$Res> {
  _$CustomerCheckoutOptionEntityCopyWithImpl(this._self, this._then);

  final CustomerCheckoutOptionEntity _self;
  final $Res Function(CustomerCheckoutOptionEntity) _then;

/// Create a copy of CustomerCheckout
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? merchant = freezed,Object? blockingMessage = freezed,Object? shippingOptions = freezed,Object? biteshipShippingOptions = freezed,Object? selectedShippingKey = freezed,Object? selectedBiteshipRateKey = freezed,Object? selectedShippingOption = freezed,Object? selectedMerchantAccountId = freezed,Object? paymentMethods = freezed,Object? summary = freezed,Object? availablePromotions = freezed,Object? promotion = freezed,}) {
  return _then(CustomerCheckoutOptionEntity(
merchant: freezed == merchant ? _self.merchant : merchant // ignore: cast_nullable_to_non_nullable
as CustomerMerchantEntity?,blockingMessage: freezed == blockingMessage ? _self.blockingMessage : blockingMessage // ignore: cast_nullable_to_non_nullable
as String?,shippingOptions: freezed == shippingOptions ? _self._shippingOptions : shippingOptions // ignore: cast_nullable_to_non_nullable
as List<CustomerCheckoutShippingOptionEntity>?,biteshipShippingOptions: freezed == biteshipShippingOptions ? _self._biteshipShippingOptions : biteshipShippingOptions // ignore: cast_nullable_to_non_nullable
as List<CustomerCheckoutShippingOptionEntity>?,selectedShippingKey: freezed == selectedShippingKey ? _self.selectedShippingKey : selectedShippingKey // ignore: cast_nullable_to_non_nullable
as String?,selectedBiteshipRateKey: freezed == selectedBiteshipRateKey ? _self.selectedBiteshipRateKey : selectedBiteshipRateKey // ignore: cast_nullable_to_non_nullable
as String?,selectedShippingOption: freezed == selectedShippingOption ? _self.selectedShippingOption : selectedShippingOption // ignore: cast_nullable_to_non_nullable
as CustomerCheckoutShippingOptionEntity?,selectedMerchantAccountId: freezed == selectedMerchantAccountId ? _self.selectedMerchantAccountId : selectedMerchantAccountId // ignore: cast_nullable_to_non_nullable
as String?,paymentMethods: freezed == paymentMethods ? _self._paymentMethods : paymentMethods // ignore: cast_nullable_to_non_nullable
as List<CustomerCheckoutPaymentMethodEntity>?,summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as CustomerCheckoutSummaryEntity?,availablePromotions: freezed == availablePromotions ? _self._availablePromotions : availablePromotions // ignore: cast_nullable_to_non_nullable
as List<CustomerPromotionEntity>?,promotion: freezed == promotion ? _self.promotion : promotion // ignore: cast_nullable_to_non_nullable
as CustomerPromotionEntity?,
  ));
}


}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class CustomerCheckoutSendParam implements CustomerCheckout {
  const CustomerCheckoutSendParam({required final  List<String> cartIds, this.notes, final  String? $type}): _cartIds = cartIds,$type = $type ?? 'sendParam';
  factory CustomerCheckoutSendParam.fromJson(Map<String, dynamic> json) => _$CustomerCheckoutSendParamFromJson(json);

 final  List<String> _cartIds;
 List<String> get cartIds {
  if (_cartIds is EqualUnmodifiableListView) return _cartIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_cartIds);
}

 final  String? notes;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of CustomerCheckout
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerCheckoutSendParamCopyWith<CustomerCheckoutSendParam> get copyWith => _$CustomerCheckoutSendParamCopyWithImpl<CustomerCheckoutSendParam>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomerCheckoutSendParamToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerCheckoutSendParam&&const DeepCollectionEquality().equals(other._cartIds, _cartIds)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_cartIds),notes);

@override
String toString() {
  return 'CustomerCheckout.sendParam(cartIds: $cartIds, notes: $notes)';
}


}

/// @nodoc
abstract mixin class $CustomerCheckoutSendParamCopyWith<$Res> implements $CustomerCheckoutCopyWith<$Res> {
  factory $CustomerCheckoutSendParamCopyWith(CustomerCheckoutSendParam value, $Res Function(CustomerCheckoutSendParam) _then) = _$CustomerCheckoutSendParamCopyWithImpl;
@useResult
$Res call({
 List<String> cartIds, String? notes
});




}
/// @nodoc
class _$CustomerCheckoutSendParamCopyWithImpl<$Res>
    implements $CustomerCheckoutSendParamCopyWith<$Res> {
  _$CustomerCheckoutSendParamCopyWithImpl(this._self, this._then);

  final CustomerCheckoutSendParam _self;
  final $Res Function(CustomerCheckoutSendParam) _then;

/// Create a copy of CustomerCheckout
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? cartIds = null,Object? notes = freezed,}) {
  return _then(CustomerCheckoutSendParam(
cartIds: null == cartIds ? _self._cartIds : cartIds // ignore: cast_nullable_to_non_nullable
as List<String>,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class CustomerCheckoutGetShippingOptionParam implements CustomerCheckout {
  const CustomerCheckoutGetShippingOptionParam({required final  List<String> cartIds, this.addressId, this.shippingKey, final  List<Map<String, String>>? promotions, final  String? $type}): _cartIds = cartIds,_promotions = promotions,$type = $type ?? 'getShippingOptionParam';
  factory CustomerCheckoutGetShippingOptionParam.fromJson(Map<String, dynamic> json) => _$CustomerCheckoutGetShippingOptionParamFromJson(json);

 final  List<String> _cartIds;
 List<String> get cartIds {
  if (_cartIds is EqualUnmodifiableListView) return _cartIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_cartIds);
}

 final  String? addressId;
 final  String? shippingKey;
 final  List<Map<String, String>>? _promotions;
 List<Map<String, String>>? get promotions {
  final value = _promotions;
  if (value == null) return null;
  if (_promotions is EqualUnmodifiableListView) return _promotions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of CustomerCheckout
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerCheckoutGetShippingOptionParamCopyWith<CustomerCheckoutGetShippingOptionParam> get copyWith => _$CustomerCheckoutGetShippingOptionParamCopyWithImpl<CustomerCheckoutGetShippingOptionParam>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomerCheckoutGetShippingOptionParamToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerCheckoutGetShippingOptionParam&&const DeepCollectionEquality().equals(other._cartIds, _cartIds)&&(identical(other.addressId, addressId) || other.addressId == addressId)&&(identical(other.shippingKey, shippingKey) || other.shippingKey == shippingKey)&&const DeepCollectionEquality().equals(other._promotions, _promotions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_cartIds),addressId,shippingKey,const DeepCollectionEquality().hash(_promotions));

@override
String toString() {
  return 'CustomerCheckout.getShippingOptionParam(cartIds: $cartIds, addressId: $addressId, shippingKey: $shippingKey, promotions: $promotions)';
}


}

/// @nodoc
abstract mixin class $CustomerCheckoutGetShippingOptionParamCopyWith<$Res> implements $CustomerCheckoutCopyWith<$Res> {
  factory $CustomerCheckoutGetShippingOptionParamCopyWith(CustomerCheckoutGetShippingOptionParam value, $Res Function(CustomerCheckoutGetShippingOptionParam) _then) = _$CustomerCheckoutGetShippingOptionParamCopyWithImpl;
@useResult
$Res call({
 List<String> cartIds, String? addressId, String? shippingKey, List<Map<String, String>>? promotions
});




}
/// @nodoc
class _$CustomerCheckoutGetShippingOptionParamCopyWithImpl<$Res>
    implements $CustomerCheckoutGetShippingOptionParamCopyWith<$Res> {
  _$CustomerCheckoutGetShippingOptionParamCopyWithImpl(this._self, this._then);

  final CustomerCheckoutGetShippingOptionParam _self;
  final $Res Function(CustomerCheckoutGetShippingOptionParam) _then;

/// Create a copy of CustomerCheckout
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? cartIds = null,Object? addressId = freezed,Object? shippingKey = freezed,Object? promotions = freezed,}) {
  return _then(CustomerCheckoutGetShippingOptionParam(
cartIds: null == cartIds ? _self._cartIds : cartIds // ignore: cast_nullable_to_non_nullable
as List<String>,addressId: freezed == addressId ? _self.addressId : addressId // ignore: cast_nullable_to_non_nullable
as String?,shippingKey: freezed == shippingKey ? _self.shippingKey : shippingKey // ignore: cast_nullable_to_non_nullable
as String?,promotions: freezed == promotions ? _self._promotions : promotions // ignore: cast_nullable_to_non_nullable
as List<Map<String, String>>?,
  ));
}


}

CustomerCheckoutShippingOption _$CustomerCheckoutShippingOptionFromJson(
  Map<String, dynamic> json
) {
    return CustomerCheckoutShippingOptionEntity.fromJson(
      json
    );
}

/// @nodoc
mixin _$CustomerCheckoutShippingOption {

 String? get key; String? get title; String? get description; int? get price; String? get eta; bool? get isCanUsed; String? get disabledReason;
/// Create a copy of CustomerCheckoutShippingOption
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerCheckoutShippingOptionCopyWith<CustomerCheckoutShippingOption> get copyWith => _$CustomerCheckoutShippingOptionCopyWithImpl<CustomerCheckoutShippingOption>(this as CustomerCheckoutShippingOption, _$identity);

  /// Serializes this CustomerCheckoutShippingOption to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerCheckoutShippingOption&&(identical(other.key, key) || other.key == key)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price)&&(identical(other.eta, eta) || other.eta == eta)&&(identical(other.isCanUsed, isCanUsed) || other.isCanUsed == isCanUsed)&&(identical(other.disabledReason, disabledReason) || other.disabledReason == disabledReason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key,title,description,price,eta,isCanUsed,disabledReason);

@override
String toString() {
  return 'CustomerCheckoutShippingOption(key: $key, title: $title, description: $description, price: $price, eta: $eta, isCanUsed: $isCanUsed, disabledReason: $disabledReason)';
}


}

/// @nodoc
abstract mixin class $CustomerCheckoutShippingOptionCopyWith<$Res>  {
  factory $CustomerCheckoutShippingOptionCopyWith(CustomerCheckoutShippingOption value, $Res Function(CustomerCheckoutShippingOption) _then) = _$CustomerCheckoutShippingOptionCopyWithImpl;
@useResult
$Res call({
 String? key, String? title, String? description, int? price, String? eta, bool? isCanUsed, String? disabledReason
});




}
/// @nodoc
class _$CustomerCheckoutShippingOptionCopyWithImpl<$Res>
    implements $CustomerCheckoutShippingOptionCopyWith<$Res> {
  _$CustomerCheckoutShippingOptionCopyWithImpl(this._self, this._then);

  final CustomerCheckoutShippingOption _self;
  final $Res Function(CustomerCheckoutShippingOption) _then;

/// Create a copy of CustomerCheckoutShippingOption
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? key = freezed,Object? title = freezed,Object? description = freezed,Object? price = freezed,Object? eta = freezed,Object? isCanUsed = freezed,Object? disabledReason = freezed,}) {
  return _then(_self.copyWith(
key: freezed == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int?,eta: freezed == eta ? _self.eta : eta // ignore: cast_nullable_to_non_nullable
as String?,isCanUsed: freezed == isCanUsed ? _self.isCanUsed : isCanUsed // ignore: cast_nullable_to_non_nullable
as bool?,disabledReason: freezed == disabledReason ? _self.disabledReason : disabledReason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CustomerCheckoutShippingOption].
extension CustomerCheckoutShippingOptionPatterns on CustomerCheckoutShippingOption {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CustomerCheckoutShippingOptionEntity value)?  entity,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CustomerCheckoutShippingOptionEntity() when entity != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CustomerCheckoutShippingOptionEntity value)  entity,}){
final _that = this;
switch (_that) {
case CustomerCheckoutShippingOptionEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CustomerCheckoutShippingOptionEntity value)?  entity,}){
final _that = this;
switch (_that) {
case CustomerCheckoutShippingOptionEntity() when entity != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String? key,  String? title,  String? description,  int? price,  String? eta,  bool? isCanUsed,  String? disabledReason)?  entity,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CustomerCheckoutShippingOptionEntity() when entity != null:
return entity(_that.key,_that.title,_that.description,_that.price,_that.eta,_that.isCanUsed,_that.disabledReason);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String? key,  String? title,  String? description,  int? price,  String? eta,  bool? isCanUsed,  String? disabledReason)  entity,}) {final _that = this;
switch (_that) {
case CustomerCheckoutShippingOptionEntity():
return entity(_that.key,_that.title,_that.description,_that.price,_that.eta,_that.isCanUsed,_that.disabledReason);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String? key,  String? title,  String? description,  int? price,  String? eta,  bool? isCanUsed,  String? disabledReason)?  entity,}) {final _that = this;
switch (_that) {
case CustomerCheckoutShippingOptionEntity() when entity != null:
return entity(_that.key,_that.title,_that.description,_that.price,_that.eta,_that.isCanUsed,_that.disabledReason);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class CustomerCheckoutShippingOptionEntity implements CustomerCheckoutShippingOption {
  const CustomerCheckoutShippingOptionEntity({this.key, this.title, this.description, this.price, this.eta, this.isCanUsed, this.disabledReason});
  factory CustomerCheckoutShippingOptionEntity.fromJson(Map<String, dynamic> json) => _$CustomerCheckoutShippingOptionEntityFromJson(json);

@override final  String? key;
@override final  String? title;
@override final  String? description;
@override final  int? price;
@override final  String? eta;
@override final  bool? isCanUsed;
@override final  String? disabledReason;

/// Create a copy of CustomerCheckoutShippingOption
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerCheckoutShippingOptionEntityCopyWith<CustomerCheckoutShippingOptionEntity> get copyWith => _$CustomerCheckoutShippingOptionEntityCopyWithImpl<CustomerCheckoutShippingOptionEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomerCheckoutShippingOptionEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerCheckoutShippingOptionEntity&&(identical(other.key, key) || other.key == key)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price)&&(identical(other.eta, eta) || other.eta == eta)&&(identical(other.isCanUsed, isCanUsed) || other.isCanUsed == isCanUsed)&&(identical(other.disabledReason, disabledReason) || other.disabledReason == disabledReason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key,title,description,price,eta,isCanUsed,disabledReason);

@override
String toString() {
  return 'CustomerCheckoutShippingOption.entity(key: $key, title: $title, description: $description, price: $price, eta: $eta, isCanUsed: $isCanUsed, disabledReason: $disabledReason)';
}


}

/// @nodoc
abstract mixin class $CustomerCheckoutShippingOptionEntityCopyWith<$Res> implements $CustomerCheckoutShippingOptionCopyWith<$Res> {
  factory $CustomerCheckoutShippingOptionEntityCopyWith(CustomerCheckoutShippingOptionEntity value, $Res Function(CustomerCheckoutShippingOptionEntity) _then) = _$CustomerCheckoutShippingOptionEntityCopyWithImpl;
@override @useResult
$Res call({
 String? key, String? title, String? description, int? price, String? eta, bool? isCanUsed, String? disabledReason
});




}
/// @nodoc
class _$CustomerCheckoutShippingOptionEntityCopyWithImpl<$Res>
    implements $CustomerCheckoutShippingOptionEntityCopyWith<$Res> {
  _$CustomerCheckoutShippingOptionEntityCopyWithImpl(this._self, this._then);

  final CustomerCheckoutShippingOptionEntity _self;
  final $Res Function(CustomerCheckoutShippingOptionEntity) _then;

/// Create a copy of CustomerCheckoutShippingOption
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? key = freezed,Object? title = freezed,Object? description = freezed,Object? price = freezed,Object? eta = freezed,Object? isCanUsed = freezed,Object? disabledReason = freezed,}) {
  return _then(CustomerCheckoutShippingOptionEntity(
key: freezed == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int?,eta: freezed == eta ? _self.eta : eta // ignore: cast_nullable_to_non_nullable
as String?,isCanUsed: freezed == isCanUsed ? _self.isCanUsed : isCanUsed // ignore: cast_nullable_to_non_nullable
as bool?,disabledReason: freezed == disabledReason ? _self.disabledReason : disabledReason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

CustomerCheckoutPaymentMethod _$CustomerCheckoutPaymentMethodFromJson(
  Map<String, dynamic> json
) {
    return CustomerCheckoutPaymentMethodEntity.fromJson(
      json
    );
}

/// @nodoc
mixin _$CustomerCheckoutPaymentMethod {

 String? get key; String? get label; String? get description; String? get bankName; String? get accountName; String? get accountNumber;
/// Create a copy of CustomerCheckoutPaymentMethod
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerCheckoutPaymentMethodCopyWith<CustomerCheckoutPaymentMethod> get copyWith => _$CustomerCheckoutPaymentMethodCopyWithImpl<CustomerCheckoutPaymentMethod>(this as CustomerCheckoutPaymentMethod, _$identity);

  /// Serializes this CustomerCheckoutPaymentMethod to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerCheckoutPaymentMethod&&(identical(other.key, key) || other.key == key)&&(identical(other.label, label) || other.label == label)&&(identical(other.description, description) || other.description == description)&&(identical(other.bankName, bankName) || other.bankName == bankName)&&(identical(other.accountName, accountName) || other.accountName == accountName)&&(identical(other.accountNumber, accountNumber) || other.accountNumber == accountNumber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key,label,description,bankName,accountName,accountNumber);

@override
String toString() {
  return 'CustomerCheckoutPaymentMethod(key: $key, label: $label, description: $description, bankName: $bankName, accountName: $accountName, accountNumber: $accountNumber)';
}


}

/// @nodoc
abstract mixin class $CustomerCheckoutPaymentMethodCopyWith<$Res>  {
  factory $CustomerCheckoutPaymentMethodCopyWith(CustomerCheckoutPaymentMethod value, $Res Function(CustomerCheckoutPaymentMethod) _then) = _$CustomerCheckoutPaymentMethodCopyWithImpl;
@useResult
$Res call({
 String? key, String? label, String? description, String? bankName, String? accountName, String? accountNumber
});




}
/// @nodoc
class _$CustomerCheckoutPaymentMethodCopyWithImpl<$Res>
    implements $CustomerCheckoutPaymentMethodCopyWith<$Res> {
  _$CustomerCheckoutPaymentMethodCopyWithImpl(this._self, this._then);

  final CustomerCheckoutPaymentMethod _self;
  final $Res Function(CustomerCheckoutPaymentMethod) _then;

/// Create a copy of CustomerCheckoutPaymentMethod
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? key = freezed,Object? label = freezed,Object? description = freezed,Object? bankName = freezed,Object? accountName = freezed,Object? accountNumber = freezed,}) {
  return _then(_self.copyWith(
key: freezed == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String?,label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,bankName: freezed == bankName ? _self.bankName : bankName // ignore: cast_nullable_to_non_nullable
as String?,accountName: freezed == accountName ? _self.accountName : accountName // ignore: cast_nullable_to_non_nullable
as String?,accountNumber: freezed == accountNumber ? _self.accountNumber : accountNumber // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CustomerCheckoutPaymentMethod].
extension CustomerCheckoutPaymentMethodPatterns on CustomerCheckoutPaymentMethod {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CustomerCheckoutPaymentMethodEntity value)?  entity,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CustomerCheckoutPaymentMethodEntity() when entity != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CustomerCheckoutPaymentMethodEntity value)  entity,}){
final _that = this;
switch (_that) {
case CustomerCheckoutPaymentMethodEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CustomerCheckoutPaymentMethodEntity value)?  entity,}){
final _that = this;
switch (_that) {
case CustomerCheckoutPaymentMethodEntity() when entity != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String? key,  String? label,  String? description,  String? bankName,  String? accountName,  String? accountNumber)?  entity,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CustomerCheckoutPaymentMethodEntity() when entity != null:
return entity(_that.key,_that.label,_that.description,_that.bankName,_that.accountName,_that.accountNumber);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String? key,  String? label,  String? description,  String? bankName,  String? accountName,  String? accountNumber)  entity,}) {final _that = this;
switch (_that) {
case CustomerCheckoutPaymentMethodEntity():
return entity(_that.key,_that.label,_that.description,_that.bankName,_that.accountName,_that.accountNumber);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String? key,  String? label,  String? description,  String? bankName,  String? accountName,  String? accountNumber)?  entity,}) {final _that = this;
switch (_that) {
case CustomerCheckoutPaymentMethodEntity() when entity != null:
return entity(_that.key,_that.label,_that.description,_that.bankName,_that.accountName,_that.accountNumber);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class CustomerCheckoutPaymentMethodEntity implements CustomerCheckoutPaymentMethod {
  const CustomerCheckoutPaymentMethodEntity({this.key, this.label, this.description, this.bankName, this.accountName, this.accountNumber});
  factory CustomerCheckoutPaymentMethodEntity.fromJson(Map<String, dynamic> json) => _$CustomerCheckoutPaymentMethodEntityFromJson(json);

@override final  String? key;
@override final  String? label;
@override final  String? description;
@override final  String? bankName;
@override final  String? accountName;
@override final  String? accountNumber;

/// Create a copy of CustomerCheckoutPaymentMethod
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerCheckoutPaymentMethodEntityCopyWith<CustomerCheckoutPaymentMethodEntity> get copyWith => _$CustomerCheckoutPaymentMethodEntityCopyWithImpl<CustomerCheckoutPaymentMethodEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomerCheckoutPaymentMethodEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerCheckoutPaymentMethodEntity&&(identical(other.key, key) || other.key == key)&&(identical(other.label, label) || other.label == label)&&(identical(other.description, description) || other.description == description)&&(identical(other.bankName, bankName) || other.bankName == bankName)&&(identical(other.accountName, accountName) || other.accountName == accountName)&&(identical(other.accountNumber, accountNumber) || other.accountNumber == accountNumber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key,label,description,bankName,accountName,accountNumber);

@override
String toString() {
  return 'CustomerCheckoutPaymentMethod.entity(key: $key, label: $label, description: $description, bankName: $bankName, accountName: $accountName, accountNumber: $accountNumber)';
}


}

/// @nodoc
abstract mixin class $CustomerCheckoutPaymentMethodEntityCopyWith<$Res> implements $CustomerCheckoutPaymentMethodCopyWith<$Res> {
  factory $CustomerCheckoutPaymentMethodEntityCopyWith(CustomerCheckoutPaymentMethodEntity value, $Res Function(CustomerCheckoutPaymentMethodEntity) _then) = _$CustomerCheckoutPaymentMethodEntityCopyWithImpl;
@override @useResult
$Res call({
 String? key, String? label, String? description, String? bankName, String? accountName, String? accountNumber
});




}
/// @nodoc
class _$CustomerCheckoutPaymentMethodEntityCopyWithImpl<$Res>
    implements $CustomerCheckoutPaymentMethodEntityCopyWith<$Res> {
  _$CustomerCheckoutPaymentMethodEntityCopyWithImpl(this._self, this._then);

  final CustomerCheckoutPaymentMethodEntity _self;
  final $Res Function(CustomerCheckoutPaymentMethodEntity) _then;

/// Create a copy of CustomerCheckoutPaymentMethod
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? key = freezed,Object? label = freezed,Object? description = freezed,Object? bankName = freezed,Object? accountName = freezed,Object? accountNumber = freezed,}) {
  return _then(CustomerCheckoutPaymentMethodEntity(
key: freezed == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String?,label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,bankName: freezed == bankName ? _self.bankName : bankName // ignore: cast_nullable_to_non_nullable
as String?,accountName: freezed == accountName ? _self.accountName : accountName // ignore: cast_nullable_to_non_nullable
as String?,accountNumber: freezed == accountNumber ? _self.accountNumber : accountNumber // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

CustomerCheckoutSummary _$CustomerCheckoutSummaryFromJson(
  Map<String, dynamic> json
) {
    return CustomerCheckoutSummaryEntity.fromJson(
      json
    );
}

/// @nodoc
mixin _$CustomerCheckoutSummary {

 int? get totalProduct; int? get subtotal; int? get discount; int? get shippingCost; int? get serviceFee; int? get total;
/// Create a copy of CustomerCheckoutSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerCheckoutSummaryCopyWith<CustomerCheckoutSummary> get copyWith => _$CustomerCheckoutSummaryCopyWithImpl<CustomerCheckoutSummary>(this as CustomerCheckoutSummary, _$identity);

  /// Serializes this CustomerCheckoutSummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerCheckoutSummary&&(identical(other.totalProduct, totalProduct) || other.totalProduct == totalProduct)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.discount, discount) || other.discount == discount)&&(identical(other.shippingCost, shippingCost) || other.shippingCost == shippingCost)&&(identical(other.serviceFee, serviceFee) || other.serviceFee == serviceFee)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalProduct,subtotal,discount,shippingCost,serviceFee,total);

@override
String toString() {
  return 'CustomerCheckoutSummary(totalProduct: $totalProduct, subtotal: $subtotal, discount: $discount, shippingCost: $shippingCost, serviceFee: $serviceFee, total: $total)';
}


}

/// @nodoc
abstract mixin class $CustomerCheckoutSummaryCopyWith<$Res>  {
  factory $CustomerCheckoutSummaryCopyWith(CustomerCheckoutSummary value, $Res Function(CustomerCheckoutSummary) _then) = _$CustomerCheckoutSummaryCopyWithImpl;
@useResult
$Res call({
 int? totalProduct, int? subtotal, int? discount, int? shippingCost, int? serviceFee, int? total
});




}
/// @nodoc
class _$CustomerCheckoutSummaryCopyWithImpl<$Res>
    implements $CustomerCheckoutSummaryCopyWith<$Res> {
  _$CustomerCheckoutSummaryCopyWithImpl(this._self, this._then);

  final CustomerCheckoutSummary _self;
  final $Res Function(CustomerCheckoutSummary) _then;

/// Create a copy of CustomerCheckoutSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalProduct = freezed,Object? subtotal = freezed,Object? discount = freezed,Object? shippingCost = freezed,Object? serviceFee = freezed,Object? total = freezed,}) {
  return _then(_self.copyWith(
totalProduct: freezed == totalProduct ? _self.totalProduct : totalProduct // ignore: cast_nullable_to_non_nullable
as int?,subtotal: freezed == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as int?,discount: freezed == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as int?,shippingCost: freezed == shippingCost ? _self.shippingCost : shippingCost // ignore: cast_nullable_to_non_nullable
as int?,serviceFee: freezed == serviceFee ? _self.serviceFee : serviceFee // ignore: cast_nullable_to_non_nullable
as int?,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [CustomerCheckoutSummary].
extension CustomerCheckoutSummaryPatterns on CustomerCheckoutSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CustomerCheckoutSummaryEntity value)?  entity,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CustomerCheckoutSummaryEntity() when entity != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CustomerCheckoutSummaryEntity value)  entity,}){
final _that = this;
switch (_that) {
case CustomerCheckoutSummaryEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CustomerCheckoutSummaryEntity value)?  entity,}){
final _that = this;
switch (_that) {
case CustomerCheckoutSummaryEntity() when entity != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int? totalProduct,  int? subtotal,  int? discount,  int? shippingCost,  int? serviceFee,  int? total)?  entity,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CustomerCheckoutSummaryEntity() when entity != null:
return entity(_that.totalProduct,_that.subtotal,_that.discount,_that.shippingCost,_that.serviceFee,_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int? totalProduct,  int? subtotal,  int? discount,  int? shippingCost,  int? serviceFee,  int? total)  entity,}) {final _that = this;
switch (_that) {
case CustomerCheckoutSummaryEntity():
return entity(_that.totalProduct,_that.subtotal,_that.discount,_that.shippingCost,_that.serviceFee,_that.total);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int? totalProduct,  int? subtotal,  int? discount,  int? shippingCost,  int? serviceFee,  int? total)?  entity,}) {final _that = this;
switch (_that) {
case CustomerCheckoutSummaryEntity() when entity != null:
return entity(_that.totalProduct,_that.subtotal,_that.discount,_that.shippingCost,_that.serviceFee,_that.total);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class CustomerCheckoutSummaryEntity implements CustomerCheckoutSummary {
  const CustomerCheckoutSummaryEntity({this.totalProduct, this.subtotal, this.discount, this.shippingCost, this.serviceFee, this.total});
  factory CustomerCheckoutSummaryEntity.fromJson(Map<String, dynamic> json) => _$CustomerCheckoutSummaryEntityFromJson(json);

@override final  int? totalProduct;
@override final  int? subtotal;
@override final  int? discount;
@override final  int? shippingCost;
@override final  int? serviceFee;
@override final  int? total;

/// Create a copy of CustomerCheckoutSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerCheckoutSummaryEntityCopyWith<CustomerCheckoutSummaryEntity> get copyWith => _$CustomerCheckoutSummaryEntityCopyWithImpl<CustomerCheckoutSummaryEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomerCheckoutSummaryEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerCheckoutSummaryEntity&&(identical(other.totalProduct, totalProduct) || other.totalProduct == totalProduct)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.discount, discount) || other.discount == discount)&&(identical(other.shippingCost, shippingCost) || other.shippingCost == shippingCost)&&(identical(other.serviceFee, serviceFee) || other.serviceFee == serviceFee)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalProduct,subtotal,discount,shippingCost,serviceFee,total);

@override
String toString() {
  return 'CustomerCheckoutSummary.entity(totalProduct: $totalProduct, subtotal: $subtotal, discount: $discount, shippingCost: $shippingCost, serviceFee: $serviceFee, total: $total)';
}


}

/// @nodoc
abstract mixin class $CustomerCheckoutSummaryEntityCopyWith<$Res> implements $CustomerCheckoutSummaryCopyWith<$Res> {
  factory $CustomerCheckoutSummaryEntityCopyWith(CustomerCheckoutSummaryEntity value, $Res Function(CustomerCheckoutSummaryEntity) _then) = _$CustomerCheckoutSummaryEntityCopyWithImpl;
@override @useResult
$Res call({
 int? totalProduct, int? subtotal, int? discount, int? shippingCost, int? serviceFee, int? total
});




}
/// @nodoc
class _$CustomerCheckoutSummaryEntityCopyWithImpl<$Res>
    implements $CustomerCheckoutSummaryEntityCopyWith<$Res> {
  _$CustomerCheckoutSummaryEntityCopyWithImpl(this._self, this._then);

  final CustomerCheckoutSummaryEntity _self;
  final $Res Function(CustomerCheckoutSummaryEntity) _then;

/// Create a copy of CustomerCheckoutSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalProduct = freezed,Object? subtotal = freezed,Object? discount = freezed,Object? shippingCost = freezed,Object? serviceFee = freezed,Object? total = freezed,}) {
  return _then(CustomerCheckoutSummaryEntity(
totalProduct: freezed == totalProduct ? _self.totalProduct : totalProduct // ignore: cast_nullable_to_non_nullable
as int?,subtotal: freezed == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as int?,discount: freezed == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as int?,shippingCost: freezed == shippingCost ? _self.shippingCost : shippingCost // ignore: cast_nullable_to_non_nullable
as int?,serviceFee: freezed == serviceFee ? _self.serviceFee : serviceFee // ignore: cast_nullable_to_non_nullable
as int?,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
