// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'merchant_balance_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MerchantBalanceHistorySummary {

 int? get currentBalance; int? get minimumBalanceForOrders; bool? get isActive; List<MerchantBalanceHistoryItemEntity> get histories;
/// Create a copy of MerchantBalanceHistorySummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantBalanceHistorySummaryCopyWith<MerchantBalanceHistorySummary> get copyWith => _$MerchantBalanceHistorySummaryCopyWithImpl<MerchantBalanceHistorySummary>(this as MerchantBalanceHistorySummary, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantBalanceHistorySummary&&(identical(other.currentBalance, currentBalance) || other.currentBalance == currentBalance)&&(identical(other.minimumBalanceForOrders, minimumBalanceForOrders) || other.minimumBalanceForOrders == minimumBalanceForOrders)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&const DeepCollectionEquality().equals(other.histories, histories));
}


@override
int get hashCode => Object.hash(runtimeType,currentBalance,minimumBalanceForOrders,isActive,const DeepCollectionEquality().hash(histories));

@override
String toString() {
  return 'MerchantBalanceHistorySummary(currentBalance: $currentBalance, minimumBalanceForOrders: $minimumBalanceForOrders, isActive: $isActive, histories: $histories)';
}


}

/// @nodoc
abstract mixin class $MerchantBalanceHistorySummaryCopyWith<$Res>  {
  factory $MerchantBalanceHistorySummaryCopyWith(MerchantBalanceHistorySummary value, $Res Function(MerchantBalanceHistorySummary) _then) = _$MerchantBalanceHistorySummaryCopyWithImpl;
@useResult
$Res call({
 int? currentBalance, int? minimumBalanceForOrders, bool? isActive, List<MerchantBalanceHistoryItemEntity> histories
});




}
/// @nodoc
class _$MerchantBalanceHistorySummaryCopyWithImpl<$Res>
    implements $MerchantBalanceHistorySummaryCopyWith<$Res> {
  _$MerchantBalanceHistorySummaryCopyWithImpl(this._self, this._then);

  final MerchantBalanceHistorySummary _self;
  final $Res Function(MerchantBalanceHistorySummary) _then;

/// Create a copy of MerchantBalanceHistorySummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentBalance = freezed,Object? minimumBalanceForOrders = freezed,Object? isActive = freezed,Object? histories = null,}) {
  return _then(_self.copyWith(
currentBalance: freezed == currentBalance ? _self.currentBalance : currentBalance // ignore: cast_nullable_to_non_nullable
as int?,minimumBalanceForOrders: freezed == minimumBalanceForOrders ? _self.minimumBalanceForOrders : minimumBalanceForOrders // ignore: cast_nullable_to_non_nullable
as int?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,histories: null == histories ? _self.histories : histories // ignore: cast_nullable_to_non_nullable
as List<MerchantBalanceHistoryItemEntity>,
  ));
}

}


/// Adds pattern-matching-related methods to [MerchantBalanceHistorySummary].
extension MerchantBalanceHistorySummaryPatterns on MerchantBalanceHistorySummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MerchantBalanceHistorySummaryEntity value)?  entity,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MerchantBalanceHistorySummaryEntity() when entity != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MerchantBalanceHistorySummaryEntity value)  entity,}){
final _that = this;
switch (_that) {
case MerchantBalanceHistorySummaryEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MerchantBalanceHistorySummaryEntity value)?  entity,}){
final _that = this;
switch (_that) {
case MerchantBalanceHistorySummaryEntity() when entity != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int? currentBalance,  int? minimumBalanceForOrders,  bool? isActive,  List<MerchantBalanceHistoryItemEntity> histories)?  entity,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MerchantBalanceHistorySummaryEntity() when entity != null:
return entity(_that.currentBalance,_that.minimumBalanceForOrders,_that.isActive,_that.histories);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int? currentBalance,  int? minimumBalanceForOrders,  bool? isActive,  List<MerchantBalanceHistoryItemEntity> histories)  entity,}) {final _that = this;
switch (_that) {
case MerchantBalanceHistorySummaryEntity():
return entity(_that.currentBalance,_that.minimumBalanceForOrders,_that.isActive,_that.histories);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int? currentBalance,  int? minimumBalanceForOrders,  bool? isActive,  List<MerchantBalanceHistoryItemEntity> histories)?  entity,}) {final _that = this;
switch (_that) {
case MerchantBalanceHistorySummaryEntity() when entity != null:
return entity(_that.currentBalance,_that.minimumBalanceForOrders,_that.isActive,_that.histories);case _:
  return null;

}
}

}

/// @nodoc


class MerchantBalanceHistorySummaryEntity implements MerchantBalanceHistorySummary {
  const MerchantBalanceHistorySummaryEntity({this.currentBalance, this.minimumBalanceForOrders, this.isActive, final  List<MerchantBalanceHistoryItemEntity> histories = const []}): _histories = histories;
  

@override final  int? currentBalance;
@override final  int? minimumBalanceForOrders;
@override final  bool? isActive;
 final  List<MerchantBalanceHistoryItemEntity> _histories;
@override@JsonKey() List<MerchantBalanceHistoryItemEntity> get histories {
  if (_histories is EqualUnmodifiableListView) return _histories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_histories);
}


/// Create a copy of MerchantBalanceHistorySummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantBalanceHistorySummaryEntityCopyWith<MerchantBalanceHistorySummaryEntity> get copyWith => _$MerchantBalanceHistorySummaryEntityCopyWithImpl<MerchantBalanceHistorySummaryEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantBalanceHistorySummaryEntity&&(identical(other.currentBalance, currentBalance) || other.currentBalance == currentBalance)&&(identical(other.minimumBalanceForOrders, minimumBalanceForOrders) || other.minimumBalanceForOrders == minimumBalanceForOrders)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&const DeepCollectionEquality().equals(other._histories, _histories));
}


@override
int get hashCode => Object.hash(runtimeType,currentBalance,minimumBalanceForOrders,isActive,const DeepCollectionEquality().hash(_histories));

@override
String toString() {
  return 'MerchantBalanceHistorySummary.entity(currentBalance: $currentBalance, minimumBalanceForOrders: $minimumBalanceForOrders, isActive: $isActive, histories: $histories)';
}


}

/// @nodoc
abstract mixin class $MerchantBalanceHistorySummaryEntityCopyWith<$Res> implements $MerchantBalanceHistorySummaryCopyWith<$Res> {
  factory $MerchantBalanceHistorySummaryEntityCopyWith(MerchantBalanceHistorySummaryEntity value, $Res Function(MerchantBalanceHistorySummaryEntity) _then) = _$MerchantBalanceHistorySummaryEntityCopyWithImpl;
@override @useResult
$Res call({
 int? currentBalance, int? minimumBalanceForOrders, bool? isActive, List<MerchantBalanceHistoryItemEntity> histories
});




}
/// @nodoc
class _$MerchantBalanceHistorySummaryEntityCopyWithImpl<$Res>
    implements $MerchantBalanceHistorySummaryEntityCopyWith<$Res> {
  _$MerchantBalanceHistorySummaryEntityCopyWithImpl(this._self, this._then);

  final MerchantBalanceHistorySummaryEntity _self;
  final $Res Function(MerchantBalanceHistorySummaryEntity) _then;

/// Create a copy of MerchantBalanceHistorySummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentBalance = freezed,Object? minimumBalanceForOrders = freezed,Object? isActive = freezed,Object? histories = null,}) {
  return _then(MerchantBalanceHistorySummaryEntity(
currentBalance: freezed == currentBalance ? _self.currentBalance : currentBalance // ignore: cast_nullable_to_non_nullable
as int?,minimumBalanceForOrders: freezed == minimumBalanceForOrders ? _self.minimumBalanceForOrders : minimumBalanceForOrders // ignore: cast_nullable_to_non_nullable
as int?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,histories: null == histories ? _self._histories : histories // ignore: cast_nullable_to_non_nullable
as List<MerchantBalanceHistoryItemEntity>,
  ));
}


}

/// @nodoc
mixin _$MerchantBalanceHistoryItem {

 String get id; String? get status; String? get statusLabel; String? get paymentStatus; String? get paymentStatusLabel; int? get amount; String? get reason; String? get reasonLabel; String? get reference; String? get provider; String? get providerOrderId; String? get providerTransactionId; String? get paymentType; String? get paymentUrl; bool? get isPayable; String? get paidAt; String? get expiredAt; String? get failedAt; String? get createdAt; String? get updatedAt;
/// Create a copy of MerchantBalanceHistoryItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantBalanceHistoryItemCopyWith<MerchantBalanceHistoryItem> get copyWith => _$MerchantBalanceHistoryItemCopyWithImpl<MerchantBalanceHistoryItem>(this as MerchantBalanceHistoryItem, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantBalanceHistoryItem&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.statusLabel, statusLabel) || other.statusLabel == statusLabel)&&(identical(other.paymentStatus, paymentStatus) || other.paymentStatus == paymentStatus)&&(identical(other.paymentStatusLabel, paymentStatusLabel) || other.paymentStatusLabel == paymentStatusLabel)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.reasonLabel, reasonLabel) || other.reasonLabel == reasonLabel)&&(identical(other.reference, reference) || other.reference == reference)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.providerOrderId, providerOrderId) || other.providerOrderId == providerOrderId)&&(identical(other.providerTransactionId, providerTransactionId) || other.providerTransactionId == providerTransactionId)&&(identical(other.paymentType, paymentType) || other.paymentType == paymentType)&&(identical(other.paymentUrl, paymentUrl) || other.paymentUrl == paymentUrl)&&(identical(other.isPayable, isPayable) || other.isPayable == isPayable)&&(identical(other.paidAt, paidAt) || other.paidAt == paidAt)&&(identical(other.expiredAt, expiredAt) || other.expiredAt == expiredAt)&&(identical(other.failedAt, failedAt) || other.failedAt == failedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hashAll([runtimeType,id,status,statusLabel,paymentStatus,paymentStatusLabel,amount,reason,reasonLabel,reference,provider,providerOrderId,providerTransactionId,paymentType,paymentUrl,isPayable,paidAt,expiredAt,failedAt,createdAt,updatedAt]);

@override
String toString() {
  return 'MerchantBalanceHistoryItem(id: $id, status: $status, statusLabel: $statusLabel, paymentStatus: $paymentStatus, paymentStatusLabel: $paymentStatusLabel, amount: $amount, reason: $reason, reasonLabel: $reasonLabel, reference: $reference, provider: $provider, providerOrderId: $providerOrderId, providerTransactionId: $providerTransactionId, paymentType: $paymentType, paymentUrl: $paymentUrl, isPayable: $isPayable, paidAt: $paidAt, expiredAt: $expiredAt, failedAt: $failedAt, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $MerchantBalanceHistoryItemCopyWith<$Res>  {
  factory $MerchantBalanceHistoryItemCopyWith(MerchantBalanceHistoryItem value, $Res Function(MerchantBalanceHistoryItem) _then) = _$MerchantBalanceHistoryItemCopyWithImpl;
@useResult
$Res call({
 String id, String? status, String? statusLabel, String? paymentStatus, String? paymentStatusLabel, int? amount, String? reason, String? reasonLabel, String? reference, String? provider, String? providerOrderId, String? providerTransactionId, String? paymentType, String? paymentUrl, bool? isPayable, String? paidAt, String? expiredAt, String? failedAt, String? createdAt, String? updatedAt
});




}
/// @nodoc
class _$MerchantBalanceHistoryItemCopyWithImpl<$Res>
    implements $MerchantBalanceHistoryItemCopyWith<$Res> {
  _$MerchantBalanceHistoryItemCopyWithImpl(this._self, this._then);

  final MerchantBalanceHistoryItem _self;
  final $Res Function(MerchantBalanceHistoryItem) _then;

/// Create a copy of MerchantBalanceHistoryItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? status = freezed,Object? statusLabel = freezed,Object? paymentStatus = freezed,Object? paymentStatusLabel = freezed,Object? amount = freezed,Object? reason = freezed,Object? reasonLabel = freezed,Object? reference = freezed,Object? provider = freezed,Object? providerOrderId = freezed,Object? providerTransactionId = freezed,Object? paymentType = freezed,Object? paymentUrl = freezed,Object? isPayable = freezed,Object? paidAt = freezed,Object? expiredAt = freezed,Object? failedAt = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,statusLabel: freezed == statusLabel ? _self.statusLabel : statusLabel // ignore: cast_nullable_to_non_nullable
as String?,paymentStatus: freezed == paymentStatus ? _self.paymentStatus : paymentStatus // ignore: cast_nullable_to_non_nullable
as String?,paymentStatusLabel: freezed == paymentStatusLabel ? _self.paymentStatusLabel : paymentStatusLabel // ignore: cast_nullable_to_non_nullable
as String?,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int?,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,reasonLabel: freezed == reasonLabel ? _self.reasonLabel : reasonLabel // ignore: cast_nullable_to_non_nullable
as String?,reference: freezed == reference ? _self.reference : reference // ignore: cast_nullable_to_non_nullable
as String?,provider: freezed == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as String?,providerOrderId: freezed == providerOrderId ? _self.providerOrderId : providerOrderId // ignore: cast_nullable_to_non_nullable
as String?,providerTransactionId: freezed == providerTransactionId ? _self.providerTransactionId : providerTransactionId // ignore: cast_nullable_to_non_nullable
as String?,paymentType: freezed == paymentType ? _self.paymentType : paymentType // ignore: cast_nullable_to_non_nullable
as String?,paymentUrl: freezed == paymentUrl ? _self.paymentUrl : paymentUrl // ignore: cast_nullable_to_non_nullable
as String?,isPayable: freezed == isPayable ? _self.isPayable : isPayable // ignore: cast_nullable_to_non_nullable
as bool?,paidAt: freezed == paidAt ? _self.paidAt : paidAt // ignore: cast_nullable_to_non_nullable
as String?,expiredAt: freezed == expiredAt ? _self.expiredAt : expiredAt // ignore: cast_nullable_to_non_nullable
as String?,failedAt: freezed == failedAt ? _self.failedAt : failedAt // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MerchantBalanceHistoryItem].
extension MerchantBalanceHistoryItemPatterns on MerchantBalanceHistoryItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MerchantBalanceHistoryItemEntity value)?  entity,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MerchantBalanceHistoryItemEntity() when entity != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MerchantBalanceHistoryItemEntity value)  entity,}){
final _that = this;
switch (_that) {
case MerchantBalanceHistoryItemEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MerchantBalanceHistoryItemEntity value)?  entity,}){
final _that = this;
switch (_that) {
case MerchantBalanceHistoryItemEntity() when entity != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String id,  String? status,  String? statusLabel,  String? paymentStatus,  String? paymentStatusLabel,  int? amount,  String? reason,  String? reasonLabel,  String? reference,  String? provider,  String? providerOrderId,  String? providerTransactionId,  String? paymentType,  String? paymentUrl,  bool? isPayable,  String? paidAt,  String? expiredAt,  String? failedAt,  String? createdAt,  String? updatedAt)?  entity,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MerchantBalanceHistoryItemEntity() when entity != null:
return entity(_that.id,_that.status,_that.statusLabel,_that.paymentStatus,_that.paymentStatusLabel,_that.amount,_that.reason,_that.reasonLabel,_that.reference,_that.provider,_that.providerOrderId,_that.providerTransactionId,_that.paymentType,_that.paymentUrl,_that.isPayable,_that.paidAt,_that.expiredAt,_that.failedAt,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String id,  String? status,  String? statusLabel,  String? paymentStatus,  String? paymentStatusLabel,  int? amount,  String? reason,  String? reasonLabel,  String? reference,  String? provider,  String? providerOrderId,  String? providerTransactionId,  String? paymentType,  String? paymentUrl,  bool? isPayable,  String? paidAt,  String? expiredAt,  String? failedAt,  String? createdAt,  String? updatedAt)  entity,}) {final _that = this;
switch (_that) {
case MerchantBalanceHistoryItemEntity():
return entity(_that.id,_that.status,_that.statusLabel,_that.paymentStatus,_that.paymentStatusLabel,_that.amount,_that.reason,_that.reasonLabel,_that.reference,_that.provider,_that.providerOrderId,_that.providerTransactionId,_that.paymentType,_that.paymentUrl,_that.isPayable,_that.paidAt,_that.expiredAt,_that.failedAt,_that.createdAt,_that.updatedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String id,  String? status,  String? statusLabel,  String? paymentStatus,  String? paymentStatusLabel,  int? amount,  String? reason,  String? reasonLabel,  String? reference,  String? provider,  String? providerOrderId,  String? providerTransactionId,  String? paymentType,  String? paymentUrl,  bool? isPayable,  String? paidAt,  String? expiredAt,  String? failedAt,  String? createdAt,  String? updatedAt)?  entity,}) {final _that = this;
switch (_that) {
case MerchantBalanceHistoryItemEntity() when entity != null:
return entity(_that.id,_that.status,_that.statusLabel,_that.paymentStatus,_that.paymentStatusLabel,_that.amount,_that.reason,_that.reasonLabel,_that.reference,_that.provider,_that.providerOrderId,_that.providerTransactionId,_that.paymentType,_that.paymentUrl,_that.isPayable,_that.paidAt,_that.expiredAt,_that.failedAt,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class MerchantBalanceHistoryItemEntity implements MerchantBalanceHistoryItem {
  const MerchantBalanceHistoryItemEntity({required this.id, this.status, this.statusLabel, this.paymentStatus, this.paymentStatusLabel, this.amount, this.reason, this.reasonLabel, this.reference, this.provider, this.providerOrderId, this.providerTransactionId, this.paymentType, this.paymentUrl, this.isPayable, this.paidAt, this.expiredAt, this.failedAt, this.createdAt, this.updatedAt});
  

@override final  String id;
@override final  String? status;
@override final  String? statusLabel;
@override final  String? paymentStatus;
@override final  String? paymentStatusLabel;
@override final  int? amount;
@override final  String? reason;
@override final  String? reasonLabel;
@override final  String? reference;
@override final  String? provider;
@override final  String? providerOrderId;
@override final  String? providerTransactionId;
@override final  String? paymentType;
@override final  String? paymentUrl;
@override final  bool? isPayable;
@override final  String? paidAt;
@override final  String? expiredAt;
@override final  String? failedAt;
@override final  String? createdAt;
@override final  String? updatedAt;

/// Create a copy of MerchantBalanceHistoryItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantBalanceHistoryItemEntityCopyWith<MerchantBalanceHistoryItemEntity> get copyWith => _$MerchantBalanceHistoryItemEntityCopyWithImpl<MerchantBalanceHistoryItemEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantBalanceHistoryItemEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.statusLabel, statusLabel) || other.statusLabel == statusLabel)&&(identical(other.paymentStatus, paymentStatus) || other.paymentStatus == paymentStatus)&&(identical(other.paymentStatusLabel, paymentStatusLabel) || other.paymentStatusLabel == paymentStatusLabel)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.reasonLabel, reasonLabel) || other.reasonLabel == reasonLabel)&&(identical(other.reference, reference) || other.reference == reference)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.providerOrderId, providerOrderId) || other.providerOrderId == providerOrderId)&&(identical(other.providerTransactionId, providerTransactionId) || other.providerTransactionId == providerTransactionId)&&(identical(other.paymentType, paymentType) || other.paymentType == paymentType)&&(identical(other.paymentUrl, paymentUrl) || other.paymentUrl == paymentUrl)&&(identical(other.isPayable, isPayable) || other.isPayable == isPayable)&&(identical(other.paidAt, paidAt) || other.paidAt == paidAt)&&(identical(other.expiredAt, expiredAt) || other.expiredAt == expiredAt)&&(identical(other.failedAt, failedAt) || other.failedAt == failedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hashAll([runtimeType,id,status,statusLabel,paymentStatus,paymentStatusLabel,amount,reason,reasonLabel,reference,provider,providerOrderId,providerTransactionId,paymentType,paymentUrl,isPayable,paidAt,expiredAt,failedAt,createdAt,updatedAt]);

@override
String toString() {
  return 'MerchantBalanceHistoryItem.entity(id: $id, status: $status, statusLabel: $statusLabel, paymentStatus: $paymentStatus, paymentStatusLabel: $paymentStatusLabel, amount: $amount, reason: $reason, reasonLabel: $reasonLabel, reference: $reference, provider: $provider, providerOrderId: $providerOrderId, providerTransactionId: $providerTransactionId, paymentType: $paymentType, paymentUrl: $paymentUrl, isPayable: $isPayable, paidAt: $paidAt, expiredAt: $expiredAt, failedAt: $failedAt, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $MerchantBalanceHistoryItemEntityCopyWith<$Res> implements $MerchantBalanceHistoryItemCopyWith<$Res> {
  factory $MerchantBalanceHistoryItemEntityCopyWith(MerchantBalanceHistoryItemEntity value, $Res Function(MerchantBalanceHistoryItemEntity) _then) = _$MerchantBalanceHistoryItemEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String? status, String? statusLabel, String? paymentStatus, String? paymentStatusLabel, int? amount, String? reason, String? reasonLabel, String? reference, String? provider, String? providerOrderId, String? providerTransactionId, String? paymentType, String? paymentUrl, bool? isPayable, String? paidAt, String? expiredAt, String? failedAt, String? createdAt, String? updatedAt
});




}
/// @nodoc
class _$MerchantBalanceHistoryItemEntityCopyWithImpl<$Res>
    implements $MerchantBalanceHistoryItemEntityCopyWith<$Res> {
  _$MerchantBalanceHistoryItemEntityCopyWithImpl(this._self, this._then);

  final MerchantBalanceHistoryItemEntity _self;
  final $Res Function(MerchantBalanceHistoryItemEntity) _then;

/// Create a copy of MerchantBalanceHistoryItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? status = freezed,Object? statusLabel = freezed,Object? paymentStatus = freezed,Object? paymentStatusLabel = freezed,Object? amount = freezed,Object? reason = freezed,Object? reasonLabel = freezed,Object? reference = freezed,Object? provider = freezed,Object? providerOrderId = freezed,Object? providerTransactionId = freezed,Object? paymentType = freezed,Object? paymentUrl = freezed,Object? isPayable = freezed,Object? paidAt = freezed,Object? expiredAt = freezed,Object? failedAt = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(MerchantBalanceHistoryItemEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,statusLabel: freezed == statusLabel ? _self.statusLabel : statusLabel // ignore: cast_nullable_to_non_nullable
as String?,paymentStatus: freezed == paymentStatus ? _self.paymentStatus : paymentStatus // ignore: cast_nullable_to_non_nullable
as String?,paymentStatusLabel: freezed == paymentStatusLabel ? _self.paymentStatusLabel : paymentStatusLabel // ignore: cast_nullable_to_non_nullable
as String?,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int?,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,reasonLabel: freezed == reasonLabel ? _self.reasonLabel : reasonLabel // ignore: cast_nullable_to_non_nullable
as String?,reference: freezed == reference ? _self.reference : reference // ignore: cast_nullable_to_non_nullable
as String?,provider: freezed == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as String?,providerOrderId: freezed == providerOrderId ? _self.providerOrderId : providerOrderId // ignore: cast_nullable_to_non_nullable
as String?,providerTransactionId: freezed == providerTransactionId ? _self.providerTransactionId : providerTransactionId // ignore: cast_nullable_to_non_nullable
as String?,paymentType: freezed == paymentType ? _self.paymentType : paymentType // ignore: cast_nullable_to_non_nullable
as String?,paymentUrl: freezed == paymentUrl ? _self.paymentUrl : paymentUrl // ignore: cast_nullable_to_non_nullable
as String?,isPayable: freezed == isPayable ? _self.isPayable : isPayable // ignore: cast_nullable_to_non_nullable
as bool?,paidAt: freezed == paidAt ? _self.paidAt : paidAt // ignore: cast_nullable_to_non_nullable
as String?,expiredAt: freezed == expiredAt ? _self.expiredAt : expiredAt // ignore: cast_nullable_to_non_nullable
as String?,failedAt: freezed == failedAt ? _self.failedAt : failedAt // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
