// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'merchant_balance_history_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MerchantBalanceHistoryResponseModel {

@JsonKey(fromJson: _intFromDynamic) int? get currentBalance;@JsonKey(fromJson: _intFromDynamic) int? get minimumBalanceForOrders; bool? get isActive; List<MerchantBalanceHistoryModel> get histories;
/// Create a copy of MerchantBalanceHistoryResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantBalanceHistoryResponseModelCopyWith<MerchantBalanceHistoryResponseModel> get copyWith => _$MerchantBalanceHistoryResponseModelCopyWithImpl<MerchantBalanceHistoryResponseModel>(this as MerchantBalanceHistoryResponseModel, _$identity);

  /// Serializes this MerchantBalanceHistoryResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantBalanceHistoryResponseModel&&(identical(other.currentBalance, currentBalance) || other.currentBalance == currentBalance)&&(identical(other.minimumBalanceForOrders, minimumBalanceForOrders) || other.minimumBalanceForOrders == minimumBalanceForOrders)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&const DeepCollectionEquality().equals(other.histories, histories));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currentBalance,minimumBalanceForOrders,isActive,const DeepCollectionEquality().hash(histories));

@override
String toString() {
  return 'MerchantBalanceHistoryResponseModel(currentBalance: $currentBalance, minimumBalanceForOrders: $minimumBalanceForOrders, isActive: $isActive, histories: $histories)';
}


}

/// @nodoc
abstract mixin class $MerchantBalanceHistoryResponseModelCopyWith<$Res>  {
  factory $MerchantBalanceHistoryResponseModelCopyWith(MerchantBalanceHistoryResponseModel value, $Res Function(MerchantBalanceHistoryResponseModel) _then) = _$MerchantBalanceHistoryResponseModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _intFromDynamic) int? currentBalance,@JsonKey(fromJson: _intFromDynamic) int? minimumBalanceForOrders, bool? isActive, List<MerchantBalanceHistoryModel> histories
});




}
/// @nodoc
class _$MerchantBalanceHistoryResponseModelCopyWithImpl<$Res>
    implements $MerchantBalanceHistoryResponseModelCopyWith<$Res> {
  _$MerchantBalanceHistoryResponseModelCopyWithImpl(this._self, this._then);

  final MerchantBalanceHistoryResponseModel _self;
  final $Res Function(MerchantBalanceHistoryResponseModel) _then;

/// Create a copy of MerchantBalanceHistoryResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentBalance = freezed,Object? minimumBalanceForOrders = freezed,Object? isActive = freezed,Object? histories = null,}) {
  return _then(_self.copyWith(
currentBalance: freezed == currentBalance ? _self.currentBalance : currentBalance // ignore: cast_nullable_to_non_nullable
as int?,minimumBalanceForOrders: freezed == minimumBalanceForOrders ? _self.minimumBalanceForOrders : minimumBalanceForOrders // ignore: cast_nullable_to_non_nullable
as int?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,histories: null == histories ? _self.histories : histories // ignore: cast_nullable_to_non_nullable
as List<MerchantBalanceHistoryModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [MerchantBalanceHistoryResponseModel].
extension MerchantBalanceHistoryResponseModelPatterns on MerchantBalanceHistoryResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MerchantBalanceHistoryResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MerchantBalanceHistoryResponseModel() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MerchantBalanceHistoryResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _MerchantBalanceHistoryResponseModel():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MerchantBalanceHistoryResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _MerchantBalanceHistoryResponseModel() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _intFromDynamic)  int? currentBalance, @JsonKey(fromJson: _intFromDynamic)  int? minimumBalanceForOrders,  bool? isActive,  List<MerchantBalanceHistoryModel> histories)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MerchantBalanceHistoryResponseModel() when $default != null:
return $default(_that.currentBalance,_that.minimumBalanceForOrders,_that.isActive,_that.histories);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _intFromDynamic)  int? currentBalance, @JsonKey(fromJson: _intFromDynamic)  int? minimumBalanceForOrders,  bool? isActive,  List<MerchantBalanceHistoryModel> histories)  $default,) {final _that = this;
switch (_that) {
case _MerchantBalanceHistoryResponseModel():
return $default(_that.currentBalance,_that.minimumBalanceForOrders,_that.isActive,_that.histories);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _intFromDynamic)  int? currentBalance, @JsonKey(fromJson: _intFromDynamic)  int? minimumBalanceForOrders,  bool? isActive,  List<MerchantBalanceHistoryModel> histories)?  $default,) {final _that = this;
switch (_that) {
case _MerchantBalanceHistoryResponseModel() when $default != null:
return $default(_that.currentBalance,_that.minimumBalanceForOrders,_that.isActive,_that.histories);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class _MerchantBalanceHistoryResponseModel implements MerchantBalanceHistoryResponseModel {
  const _MerchantBalanceHistoryResponseModel({@JsonKey(fromJson: _intFromDynamic) this.currentBalance, @JsonKey(fromJson: _intFromDynamic) this.minimumBalanceForOrders, this.isActive, final  List<MerchantBalanceHistoryModel> histories = const []}): _histories = histories;
  factory _MerchantBalanceHistoryResponseModel.fromJson(Map<String, dynamic> json) => _$MerchantBalanceHistoryResponseModelFromJson(json);

@override@JsonKey(fromJson: _intFromDynamic) final  int? currentBalance;
@override@JsonKey(fromJson: _intFromDynamic) final  int? minimumBalanceForOrders;
@override final  bool? isActive;
 final  List<MerchantBalanceHistoryModel> _histories;
@override@JsonKey() List<MerchantBalanceHistoryModel> get histories {
  if (_histories is EqualUnmodifiableListView) return _histories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_histories);
}


/// Create a copy of MerchantBalanceHistoryResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MerchantBalanceHistoryResponseModelCopyWith<_MerchantBalanceHistoryResponseModel> get copyWith => __$MerchantBalanceHistoryResponseModelCopyWithImpl<_MerchantBalanceHistoryResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MerchantBalanceHistoryResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MerchantBalanceHistoryResponseModel&&(identical(other.currentBalance, currentBalance) || other.currentBalance == currentBalance)&&(identical(other.minimumBalanceForOrders, minimumBalanceForOrders) || other.minimumBalanceForOrders == minimumBalanceForOrders)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&const DeepCollectionEquality().equals(other._histories, _histories));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currentBalance,minimumBalanceForOrders,isActive,const DeepCollectionEquality().hash(_histories));

@override
String toString() {
  return 'MerchantBalanceHistoryResponseModel(currentBalance: $currentBalance, minimumBalanceForOrders: $minimumBalanceForOrders, isActive: $isActive, histories: $histories)';
}


}

/// @nodoc
abstract mixin class _$MerchantBalanceHistoryResponseModelCopyWith<$Res> implements $MerchantBalanceHistoryResponseModelCopyWith<$Res> {
  factory _$MerchantBalanceHistoryResponseModelCopyWith(_MerchantBalanceHistoryResponseModel value, $Res Function(_MerchantBalanceHistoryResponseModel) _then) = __$MerchantBalanceHistoryResponseModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _intFromDynamic) int? currentBalance,@JsonKey(fromJson: _intFromDynamic) int? minimumBalanceForOrders, bool? isActive, List<MerchantBalanceHistoryModel> histories
});




}
/// @nodoc
class __$MerchantBalanceHistoryResponseModelCopyWithImpl<$Res>
    implements _$MerchantBalanceHistoryResponseModelCopyWith<$Res> {
  __$MerchantBalanceHistoryResponseModelCopyWithImpl(this._self, this._then);

  final _MerchantBalanceHistoryResponseModel _self;
  final $Res Function(_MerchantBalanceHistoryResponseModel) _then;

/// Create a copy of MerchantBalanceHistoryResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentBalance = freezed,Object? minimumBalanceForOrders = freezed,Object? isActive = freezed,Object? histories = null,}) {
  return _then(_MerchantBalanceHistoryResponseModel(
currentBalance: freezed == currentBalance ? _self.currentBalance : currentBalance // ignore: cast_nullable_to_non_nullable
as int?,minimumBalanceForOrders: freezed == minimumBalanceForOrders ? _self.minimumBalanceForOrders : minimumBalanceForOrders // ignore: cast_nullable_to_non_nullable
as int?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,histories: null == histories ? _self._histories : histories // ignore: cast_nullable_to_non_nullable
as List<MerchantBalanceHistoryModel>,
  ));
}


}


/// @nodoc
mixin _$MerchantDestinationBankAccountModel {

 String? get bankName; String? get accountNumber; String? get accountName;
/// Create a copy of MerchantDestinationBankAccountModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantDestinationBankAccountModelCopyWith<MerchantDestinationBankAccountModel> get copyWith => _$MerchantDestinationBankAccountModelCopyWithImpl<MerchantDestinationBankAccountModel>(this as MerchantDestinationBankAccountModel, _$identity);

  /// Serializes this MerchantDestinationBankAccountModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantDestinationBankAccountModel&&(identical(other.bankName, bankName) || other.bankName == bankName)&&(identical(other.accountNumber, accountNumber) || other.accountNumber == accountNumber)&&(identical(other.accountName, accountName) || other.accountName == accountName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,bankName,accountNumber,accountName);

@override
String toString() {
  return 'MerchantDestinationBankAccountModel(bankName: $bankName, accountNumber: $accountNumber, accountName: $accountName)';
}


}

/// @nodoc
abstract mixin class $MerchantDestinationBankAccountModelCopyWith<$Res>  {
  factory $MerchantDestinationBankAccountModelCopyWith(MerchantDestinationBankAccountModel value, $Res Function(MerchantDestinationBankAccountModel) _then) = _$MerchantDestinationBankAccountModelCopyWithImpl;
@useResult
$Res call({
 String? bankName, String? accountNumber, String? accountName
});




}
/// @nodoc
class _$MerchantDestinationBankAccountModelCopyWithImpl<$Res>
    implements $MerchantDestinationBankAccountModelCopyWith<$Res> {
  _$MerchantDestinationBankAccountModelCopyWithImpl(this._self, this._then);

  final MerchantDestinationBankAccountModel _self;
  final $Res Function(MerchantDestinationBankAccountModel) _then;

/// Create a copy of MerchantDestinationBankAccountModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? bankName = freezed,Object? accountNumber = freezed,Object? accountName = freezed,}) {
  return _then(_self.copyWith(
bankName: freezed == bankName ? _self.bankName : bankName // ignore: cast_nullable_to_non_nullable
as String?,accountNumber: freezed == accountNumber ? _self.accountNumber : accountNumber // ignore: cast_nullable_to_non_nullable
as String?,accountName: freezed == accountName ? _self.accountName : accountName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MerchantDestinationBankAccountModel].
extension MerchantDestinationBankAccountModelPatterns on MerchantDestinationBankAccountModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MerchantDestinationBankAccountModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MerchantDestinationBankAccountModel() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MerchantDestinationBankAccountModel value)  $default,){
final _that = this;
switch (_that) {
case _MerchantDestinationBankAccountModel():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MerchantDestinationBankAccountModel value)?  $default,){
final _that = this;
switch (_that) {
case _MerchantDestinationBankAccountModel() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? bankName,  String? accountNumber,  String? accountName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MerchantDestinationBankAccountModel() when $default != null:
return $default(_that.bankName,_that.accountNumber,_that.accountName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? bankName,  String? accountNumber,  String? accountName)  $default,) {final _that = this;
switch (_that) {
case _MerchantDestinationBankAccountModel():
return $default(_that.bankName,_that.accountNumber,_that.accountName);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? bankName,  String? accountNumber,  String? accountName)?  $default,) {final _that = this;
switch (_that) {
case _MerchantDestinationBankAccountModel() when $default != null:
return $default(_that.bankName,_that.accountNumber,_that.accountName);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class _MerchantDestinationBankAccountModel implements MerchantDestinationBankAccountModel {
  const _MerchantDestinationBankAccountModel({this.bankName, this.accountNumber, this.accountName});
  factory _MerchantDestinationBankAccountModel.fromJson(Map<String, dynamic> json) => _$MerchantDestinationBankAccountModelFromJson(json);

@override final  String? bankName;
@override final  String? accountNumber;
@override final  String? accountName;

/// Create a copy of MerchantDestinationBankAccountModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MerchantDestinationBankAccountModelCopyWith<_MerchantDestinationBankAccountModel> get copyWith => __$MerchantDestinationBankAccountModelCopyWithImpl<_MerchantDestinationBankAccountModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MerchantDestinationBankAccountModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MerchantDestinationBankAccountModel&&(identical(other.bankName, bankName) || other.bankName == bankName)&&(identical(other.accountNumber, accountNumber) || other.accountNumber == accountNumber)&&(identical(other.accountName, accountName) || other.accountName == accountName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,bankName,accountNumber,accountName);

@override
String toString() {
  return 'MerchantDestinationBankAccountModel(bankName: $bankName, accountNumber: $accountNumber, accountName: $accountName)';
}


}

/// @nodoc
abstract mixin class _$MerchantDestinationBankAccountModelCopyWith<$Res> implements $MerchantDestinationBankAccountModelCopyWith<$Res> {
  factory _$MerchantDestinationBankAccountModelCopyWith(_MerchantDestinationBankAccountModel value, $Res Function(_MerchantDestinationBankAccountModel) _then) = __$MerchantDestinationBankAccountModelCopyWithImpl;
@override @useResult
$Res call({
 String? bankName, String? accountNumber, String? accountName
});




}
/// @nodoc
class __$MerchantDestinationBankAccountModelCopyWithImpl<$Res>
    implements _$MerchantDestinationBankAccountModelCopyWith<$Res> {
  __$MerchantDestinationBankAccountModelCopyWithImpl(this._self, this._then);

  final _MerchantDestinationBankAccountModel _self;
  final $Res Function(_MerchantDestinationBankAccountModel) _then;

/// Create a copy of MerchantDestinationBankAccountModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? bankName = freezed,Object? accountNumber = freezed,Object? accountName = freezed,}) {
  return _then(_MerchantDestinationBankAccountModel(
bankName: freezed == bankName ? _self.bankName : bankName // ignore: cast_nullable_to_non_nullable
as String?,accountNumber: freezed == accountNumber ? _self.accountNumber : accountNumber // ignore: cast_nullable_to_non_nullable
as String?,accountName: freezed == accountName ? _self.accountName : accountName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$MerchantBalanceHistoryModel {

@JsonKey(fromJson: _stringFromDynamic) String get id; String? get status; String? get statusLabel; String? get paymentStatus; String? get paymentStatusLabel;@JsonKey(fromJson: _intFromDynamic) int? get amount; String? get reason; String? get reasonLabel; String? get reference; String? get provider; String? get providerOrderId; String? get providerTransactionId; String? get paymentType; String? get paymentUrl; bool? get isPayable; String? get paymentMethod; bool get isManualTransfer; List<MerchantDestinationBankAccountModel> get destinationBankAccounts; String? get transferInstructions; String? get transferProofUrl; String? get transferProofUploadedAt; bool get canUploadTransferProof; bool get canCancel; String? get verifiedAt; String? get adminNote; String? get paidAt; String? get expiredAt; String? get failedAt; String? get createdAt; String? get updatedAt;
/// Create a copy of MerchantBalanceHistoryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantBalanceHistoryModelCopyWith<MerchantBalanceHistoryModel> get copyWith => _$MerchantBalanceHistoryModelCopyWithImpl<MerchantBalanceHistoryModel>(this as MerchantBalanceHistoryModel, _$identity);

  /// Serializes this MerchantBalanceHistoryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantBalanceHistoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.statusLabel, statusLabel) || other.statusLabel == statusLabel)&&(identical(other.paymentStatus, paymentStatus) || other.paymentStatus == paymentStatus)&&(identical(other.paymentStatusLabel, paymentStatusLabel) || other.paymentStatusLabel == paymentStatusLabel)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.reasonLabel, reasonLabel) || other.reasonLabel == reasonLabel)&&(identical(other.reference, reference) || other.reference == reference)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.providerOrderId, providerOrderId) || other.providerOrderId == providerOrderId)&&(identical(other.providerTransactionId, providerTransactionId) || other.providerTransactionId == providerTransactionId)&&(identical(other.paymentType, paymentType) || other.paymentType == paymentType)&&(identical(other.paymentUrl, paymentUrl) || other.paymentUrl == paymentUrl)&&(identical(other.isPayable, isPayable) || other.isPayable == isPayable)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.isManualTransfer, isManualTransfer) || other.isManualTransfer == isManualTransfer)&&const DeepCollectionEquality().equals(other.destinationBankAccounts, destinationBankAccounts)&&(identical(other.transferInstructions, transferInstructions) || other.transferInstructions == transferInstructions)&&(identical(other.transferProofUrl, transferProofUrl) || other.transferProofUrl == transferProofUrl)&&(identical(other.transferProofUploadedAt, transferProofUploadedAt) || other.transferProofUploadedAt == transferProofUploadedAt)&&(identical(other.canUploadTransferProof, canUploadTransferProof) || other.canUploadTransferProof == canUploadTransferProof)&&(identical(other.canCancel, canCancel) || other.canCancel == canCancel)&&(identical(other.verifiedAt, verifiedAt) || other.verifiedAt == verifiedAt)&&(identical(other.adminNote, adminNote) || other.adminNote == adminNote)&&(identical(other.paidAt, paidAt) || other.paidAt == paidAt)&&(identical(other.expiredAt, expiredAt) || other.expiredAt == expiredAt)&&(identical(other.failedAt, failedAt) || other.failedAt == failedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,status,statusLabel,paymentStatus,paymentStatusLabel,amount,reason,reasonLabel,reference,provider,providerOrderId,providerTransactionId,paymentType,paymentUrl,isPayable,paymentMethod,isManualTransfer,const DeepCollectionEquality().hash(destinationBankAccounts),transferInstructions,transferProofUrl,transferProofUploadedAt,canUploadTransferProof,canCancel,verifiedAt,adminNote,paidAt,expiredAt,failedAt,createdAt,updatedAt]);

@override
String toString() {
  return 'MerchantBalanceHistoryModel(id: $id, status: $status, statusLabel: $statusLabel, paymentStatus: $paymentStatus, paymentStatusLabel: $paymentStatusLabel, amount: $amount, reason: $reason, reasonLabel: $reasonLabel, reference: $reference, provider: $provider, providerOrderId: $providerOrderId, providerTransactionId: $providerTransactionId, paymentType: $paymentType, paymentUrl: $paymentUrl, isPayable: $isPayable, paymentMethod: $paymentMethod, isManualTransfer: $isManualTransfer, destinationBankAccounts: $destinationBankAccounts, transferInstructions: $transferInstructions, transferProofUrl: $transferProofUrl, transferProofUploadedAt: $transferProofUploadedAt, canUploadTransferProof: $canUploadTransferProof, canCancel: $canCancel, verifiedAt: $verifiedAt, adminNote: $adminNote, paidAt: $paidAt, expiredAt: $expiredAt, failedAt: $failedAt, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $MerchantBalanceHistoryModelCopyWith<$Res>  {
  factory $MerchantBalanceHistoryModelCopyWith(MerchantBalanceHistoryModel value, $Res Function(MerchantBalanceHistoryModel) _then) = _$MerchantBalanceHistoryModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _stringFromDynamic) String id, String? status, String? statusLabel, String? paymentStatus, String? paymentStatusLabel,@JsonKey(fromJson: _intFromDynamic) int? amount, String? reason, String? reasonLabel, String? reference, String? provider, String? providerOrderId, String? providerTransactionId, String? paymentType, String? paymentUrl, bool? isPayable, String? paymentMethod, bool isManualTransfer, List<MerchantDestinationBankAccountModel> destinationBankAccounts, String? transferInstructions, String? transferProofUrl, String? transferProofUploadedAt, bool canUploadTransferProof, bool canCancel, String? verifiedAt, String? adminNote, String? paidAt, String? expiredAt, String? failedAt, String? createdAt, String? updatedAt
});




}
/// @nodoc
class _$MerchantBalanceHistoryModelCopyWithImpl<$Res>
    implements $MerchantBalanceHistoryModelCopyWith<$Res> {
  _$MerchantBalanceHistoryModelCopyWithImpl(this._self, this._then);

  final MerchantBalanceHistoryModel _self;
  final $Res Function(MerchantBalanceHistoryModel) _then;

/// Create a copy of MerchantBalanceHistoryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? status = freezed,Object? statusLabel = freezed,Object? paymentStatus = freezed,Object? paymentStatusLabel = freezed,Object? amount = freezed,Object? reason = freezed,Object? reasonLabel = freezed,Object? reference = freezed,Object? provider = freezed,Object? providerOrderId = freezed,Object? providerTransactionId = freezed,Object? paymentType = freezed,Object? paymentUrl = freezed,Object? isPayable = freezed,Object? paymentMethod = freezed,Object? isManualTransfer = null,Object? destinationBankAccounts = null,Object? transferInstructions = freezed,Object? transferProofUrl = freezed,Object? transferProofUploadedAt = freezed,Object? canUploadTransferProof = null,Object? canCancel = null,Object? verifiedAt = freezed,Object? adminNote = freezed,Object? paidAt = freezed,Object? expiredAt = freezed,Object? failedAt = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
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
as bool?,paymentMethod: freezed == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String?,isManualTransfer: null == isManualTransfer ? _self.isManualTransfer : isManualTransfer // ignore: cast_nullable_to_non_nullable
as bool,destinationBankAccounts: null == destinationBankAccounts ? _self.destinationBankAccounts : destinationBankAccounts // ignore: cast_nullable_to_non_nullable
as List<MerchantDestinationBankAccountModel>,transferInstructions: freezed == transferInstructions ? _self.transferInstructions : transferInstructions // ignore: cast_nullable_to_non_nullable
as String?,transferProofUrl: freezed == transferProofUrl ? _self.transferProofUrl : transferProofUrl // ignore: cast_nullable_to_non_nullable
as String?,transferProofUploadedAt: freezed == transferProofUploadedAt ? _self.transferProofUploadedAt : transferProofUploadedAt // ignore: cast_nullable_to_non_nullable
as String?,canUploadTransferProof: null == canUploadTransferProof ? _self.canUploadTransferProof : canUploadTransferProof // ignore: cast_nullable_to_non_nullable
as bool,canCancel: null == canCancel ? _self.canCancel : canCancel // ignore: cast_nullable_to_non_nullable
as bool,verifiedAt: freezed == verifiedAt ? _self.verifiedAt : verifiedAt // ignore: cast_nullable_to_non_nullable
as String?,adminNote: freezed == adminNote ? _self.adminNote : adminNote // ignore: cast_nullable_to_non_nullable
as String?,paidAt: freezed == paidAt ? _self.paidAt : paidAt // ignore: cast_nullable_to_non_nullable
as String?,expiredAt: freezed == expiredAt ? _self.expiredAt : expiredAt // ignore: cast_nullable_to_non_nullable
as String?,failedAt: freezed == failedAt ? _self.failedAt : failedAt // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MerchantBalanceHistoryModel].
extension MerchantBalanceHistoryModelPatterns on MerchantBalanceHistoryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MerchantBalanceHistoryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MerchantBalanceHistoryModel() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MerchantBalanceHistoryModel value)  $default,){
final _that = this;
switch (_that) {
case _MerchantBalanceHistoryModel():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MerchantBalanceHistoryModel value)?  $default,){
final _that = this;
switch (_that) {
case _MerchantBalanceHistoryModel() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _stringFromDynamic)  String id,  String? status,  String? statusLabel,  String? paymentStatus,  String? paymentStatusLabel, @JsonKey(fromJson: _intFromDynamic)  int? amount,  String? reason,  String? reasonLabel,  String? reference,  String? provider,  String? providerOrderId,  String? providerTransactionId,  String? paymentType,  String? paymentUrl,  bool? isPayable,  String? paymentMethod,  bool isManualTransfer,  List<MerchantDestinationBankAccountModel> destinationBankAccounts,  String? transferInstructions,  String? transferProofUrl,  String? transferProofUploadedAt,  bool canUploadTransferProof,  bool canCancel,  String? verifiedAt,  String? adminNote,  String? paidAt,  String? expiredAt,  String? failedAt,  String? createdAt,  String? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MerchantBalanceHistoryModel() when $default != null:
return $default(_that.id,_that.status,_that.statusLabel,_that.paymentStatus,_that.paymentStatusLabel,_that.amount,_that.reason,_that.reasonLabel,_that.reference,_that.provider,_that.providerOrderId,_that.providerTransactionId,_that.paymentType,_that.paymentUrl,_that.isPayable,_that.paymentMethod,_that.isManualTransfer,_that.destinationBankAccounts,_that.transferInstructions,_that.transferProofUrl,_that.transferProofUploadedAt,_that.canUploadTransferProof,_that.canCancel,_that.verifiedAt,_that.adminNote,_that.paidAt,_that.expiredAt,_that.failedAt,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _stringFromDynamic)  String id,  String? status,  String? statusLabel,  String? paymentStatus,  String? paymentStatusLabel, @JsonKey(fromJson: _intFromDynamic)  int? amount,  String? reason,  String? reasonLabel,  String? reference,  String? provider,  String? providerOrderId,  String? providerTransactionId,  String? paymentType,  String? paymentUrl,  bool? isPayable,  String? paymentMethod,  bool isManualTransfer,  List<MerchantDestinationBankAccountModel> destinationBankAccounts,  String? transferInstructions,  String? transferProofUrl,  String? transferProofUploadedAt,  bool canUploadTransferProof,  bool canCancel,  String? verifiedAt,  String? adminNote,  String? paidAt,  String? expiredAt,  String? failedAt,  String? createdAt,  String? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _MerchantBalanceHistoryModel():
return $default(_that.id,_that.status,_that.statusLabel,_that.paymentStatus,_that.paymentStatusLabel,_that.amount,_that.reason,_that.reasonLabel,_that.reference,_that.provider,_that.providerOrderId,_that.providerTransactionId,_that.paymentType,_that.paymentUrl,_that.isPayable,_that.paymentMethod,_that.isManualTransfer,_that.destinationBankAccounts,_that.transferInstructions,_that.transferProofUrl,_that.transferProofUploadedAt,_that.canUploadTransferProof,_that.canCancel,_that.verifiedAt,_that.adminNote,_that.paidAt,_that.expiredAt,_that.failedAt,_that.createdAt,_that.updatedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _stringFromDynamic)  String id,  String? status,  String? statusLabel,  String? paymentStatus,  String? paymentStatusLabel, @JsonKey(fromJson: _intFromDynamic)  int? amount,  String? reason,  String? reasonLabel,  String? reference,  String? provider,  String? providerOrderId,  String? providerTransactionId,  String? paymentType,  String? paymentUrl,  bool? isPayable,  String? paymentMethod,  bool isManualTransfer,  List<MerchantDestinationBankAccountModel> destinationBankAccounts,  String? transferInstructions,  String? transferProofUrl,  String? transferProofUploadedAt,  bool canUploadTransferProof,  bool canCancel,  String? verifiedAt,  String? adminNote,  String? paidAt,  String? expiredAt,  String? failedAt,  String? createdAt,  String? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _MerchantBalanceHistoryModel() when $default != null:
return $default(_that.id,_that.status,_that.statusLabel,_that.paymentStatus,_that.paymentStatusLabel,_that.amount,_that.reason,_that.reasonLabel,_that.reference,_that.provider,_that.providerOrderId,_that.providerTransactionId,_that.paymentType,_that.paymentUrl,_that.isPayable,_that.paymentMethod,_that.isManualTransfer,_that.destinationBankAccounts,_that.transferInstructions,_that.transferProofUrl,_that.transferProofUploadedAt,_that.canUploadTransferProof,_that.canCancel,_that.verifiedAt,_that.adminNote,_that.paidAt,_that.expiredAt,_that.failedAt,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class _MerchantBalanceHistoryModel implements MerchantBalanceHistoryModel {
  const _MerchantBalanceHistoryModel({@JsonKey(fromJson: _stringFromDynamic) required this.id, this.status, this.statusLabel, this.paymentStatus, this.paymentStatusLabel, @JsonKey(fromJson: _intFromDynamic) this.amount, this.reason, this.reasonLabel, this.reference, this.provider, this.providerOrderId, this.providerTransactionId, this.paymentType, this.paymentUrl, this.isPayable, this.paymentMethod, this.isManualTransfer = false, final  List<MerchantDestinationBankAccountModel> destinationBankAccounts = const [], this.transferInstructions, this.transferProofUrl, this.transferProofUploadedAt, this.canUploadTransferProof = false, this.canCancel = false, this.verifiedAt, this.adminNote, this.paidAt, this.expiredAt, this.failedAt, this.createdAt, this.updatedAt}): _destinationBankAccounts = destinationBankAccounts;
  factory _MerchantBalanceHistoryModel.fromJson(Map<String, dynamic> json) => _$MerchantBalanceHistoryModelFromJson(json);

@override@JsonKey(fromJson: _stringFromDynamic) final  String id;
@override final  String? status;
@override final  String? statusLabel;
@override final  String? paymentStatus;
@override final  String? paymentStatusLabel;
@override@JsonKey(fromJson: _intFromDynamic) final  int? amount;
@override final  String? reason;
@override final  String? reasonLabel;
@override final  String? reference;
@override final  String? provider;
@override final  String? providerOrderId;
@override final  String? providerTransactionId;
@override final  String? paymentType;
@override final  String? paymentUrl;
@override final  bool? isPayable;
@override final  String? paymentMethod;
@override@JsonKey() final  bool isManualTransfer;
 final  List<MerchantDestinationBankAccountModel> _destinationBankAccounts;
@override@JsonKey() List<MerchantDestinationBankAccountModel> get destinationBankAccounts {
  if (_destinationBankAccounts is EqualUnmodifiableListView) return _destinationBankAccounts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_destinationBankAccounts);
}

@override final  String? transferInstructions;
@override final  String? transferProofUrl;
@override final  String? transferProofUploadedAt;
@override@JsonKey() final  bool canUploadTransferProof;
@override@JsonKey() final  bool canCancel;
@override final  String? verifiedAt;
@override final  String? adminNote;
@override final  String? paidAt;
@override final  String? expiredAt;
@override final  String? failedAt;
@override final  String? createdAt;
@override final  String? updatedAt;

/// Create a copy of MerchantBalanceHistoryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MerchantBalanceHistoryModelCopyWith<_MerchantBalanceHistoryModel> get copyWith => __$MerchantBalanceHistoryModelCopyWithImpl<_MerchantBalanceHistoryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MerchantBalanceHistoryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MerchantBalanceHistoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.statusLabel, statusLabel) || other.statusLabel == statusLabel)&&(identical(other.paymentStatus, paymentStatus) || other.paymentStatus == paymentStatus)&&(identical(other.paymentStatusLabel, paymentStatusLabel) || other.paymentStatusLabel == paymentStatusLabel)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.reasonLabel, reasonLabel) || other.reasonLabel == reasonLabel)&&(identical(other.reference, reference) || other.reference == reference)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.providerOrderId, providerOrderId) || other.providerOrderId == providerOrderId)&&(identical(other.providerTransactionId, providerTransactionId) || other.providerTransactionId == providerTransactionId)&&(identical(other.paymentType, paymentType) || other.paymentType == paymentType)&&(identical(other.paymentUrl, paymentUrl) || other.paymentUrl == paymentUrl)&&(identical(other.isPayable, isPayable) || other.isPayable == isPayable)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.isManualTransfer, isManualTransfer) || other.isManualTransfer == isManualTransfer)&&const DeepCollectionEquality().equals(other._destinationBankAccounts, _destinationBankAccounts)&&(identical(other.transferInstructions, transferInstructions) || other.transferInstructions == transferInstructions)&&(identical(other.transferProofUrl, transferProofUrl) || other.transferProofUrl == transferProofUrl)&&(identical(other.transferProofUploadedAt, transferProofUploadedAt) || other.transferProofUploadedAt == transferProofUploadedAt)&&(identical(other.canUploadTransferProof, canUploadTransferProof) || other.canUploadTransferProof == canUploadTransferProof)&&(identical(other.canCancel, canCancel) || other.canCancel == canCancel)&&(identical(other.verifiedAt, verifiedAt) || other.verifiedAt == verifiedAt)&&(identical(other.adminNote, adminNote) || other.adminNote == adminNote)&&(identical(other.paidAt, paidAt) || other.paidAt == paidAt)&&(identical(other.expiredAt, expiredAt) || other.expiredAt == expiredAt)&&(identical(other.failedAt, failedAt) || other.failedAt == failedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,status,statusLabel,paymentStatus,paymentStatusLabel,amount,reason,reasonLabel,reference,provider,providerOrderId,providerTransactionId,paymentType,paymentUrl,isPayable,paymentMethod,isManualTransfer,const DeepCollectionEquality().hash(_destinationBankAccounts),transferInstructions,transferProofUrl,transferProofUploadedAt,canUploadTransferProof,canCancel,verifiedAt,adminNote,paidAt,expiredAt,failedAt,createdAt,updatedAt]);

@override
String toString() {
  return 'MerchantBalanceHistoryModel(id: $id, status: $status, statusLabel: $statusLabel, paymentStatus: $paymentStatus, paymentStatusLabel: $paymentStatusLabel, amount: $amount, reason: $reason, reasonLabel: $reasonLabel, reference: $reference, provider: $provider, providerOrderId: $providerOrderId, providerTransactionId: $providerTransactionId, paymentType: $paymentType, paymentUrl: $paymentUrl, isPayable: $isPayable, paymentMethod: $paymentMethod, isManualTransfer: $isManualTransfer, destinationBankAccounts: $destinationBankAccounts, transferInstructions: $transferInstructions, transferProofUrl: $transferProofUrl, transferProofUploadedAt: $transferProofUploadedAt, canUploadTransferProof: $canUploadTransferProof, canCancel: $canCancel, verifiedAt: $verifiedAt, adminNote: $adminNote, paidAt: $paidAt, expiredAt: $expiredAt, failedAt: $failedAt, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$MerchantBalanceHistoryModelCopyWith<$Res> implements $MerchantBalanceHistoryModelCopyWith<$Res> {
  factory _$MerchantBalanceHistoryModelCopyWith(_MerchantBalanceHistoryModel value, $Res Function(_MerchantBalanceHistoryModel) _then) = __$MerchantBalanceHistoryModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _stringFromDynamic) String id, String? status, String? statusLabel, String? paymentStatus, String? paymentStatusLabel,@JsonKey(fromJson: _intFromDynamic) int? amount, String? reason, String? reasonLabel, String? reference, String? provider, String? providerOrderId, String? providerTransactionId, String? paymentType, String? paymentUrl, bool? isPayable, String? paymentMethod, bool isManualTransfer, List<MerchantDestinationBankAccountModel> destinationBankAccounts, String? transferInstructions, String? transferProofUrl, String? transferProofUploadedAt, bool canUploadTransferProof, bool canCancel, String? verifiedAt, String? adminNote, String? paidAt, String? expiredAt, String? failedAt, String? createdAt, String? updatedAt
});




}
/// @nodoc
class __$MerchantBalanceHistoryModelCopyWithImpl<$Res>
    implements _$MerchantBalanceHistoryModelCopyWith<$Res> {
  __$MerchantBalanceHistoryModelCopyWithImpl(this._self, this._then);

  final _MerchantBalanceHistoryModel _self;
  final $Res Function(_MerchantBalanceHistoryModel) _then;

/// Create a copy of MerchantBalanceHistoryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? status = freezed,Object? statusLabel = freezed,Object? paymentStatus = freezed,Object? paymentStatusLabel = freezed,Object? amount = freezed,Object? reason = freezed,Object? reasonLabel = freezed,Object? reference = freezed,Object? provider = freezed,Object? providerOrderId = freezed,Object? providerTransactionId = freezed,Object? paymentType = freezed,Object? paymentUrl = freezed,Object? isPayable = freezed,Object? paymentMethod = freezed,Object? isManualTransfer = null,Object? destinationBankAccounts = null,Object? transferInstructions = freezed,Object? transferProofUrl = freezed,Object? transferProofUploadedAt = freezed,Object? canUploadTransferProof = null,Object? canCancel = null,Object? verifiedAt = freezed,Object? adminNote = freezed,Object? paidAt = freezed,Object? expiredAt = freezed,Object? failedAt = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_MerchantBalanceHistoryModel(
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
as bool?,paymentMethod: freezed == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String?,isManualTransfer: null == isManualTransfer ? _self.isManualTransfer : isManualTransfer // ignore: cast_nullable_to_non_nullable
as bool,destinationBankAccounts: null == destinationBankAccounts ? _self._destinationBankAccounts : destinationBankAccounts // ignore: cast_nullable_to_non_nullable
as List<MerchantDestinationBankAccountModel>,transferInstructions: freezed == transferInstructions ? _self.transferInstructions : transferInstructions // ignore: cast_nullable_to_non_nullable
as String?,transferProofUrl: freezed == transferProofUrl ? _self.transferProofUrl : transferProofUrl // ignore: cast_nullable_to_non_nullable
as String?,transferProofUploadedAt: freezed == transferProofUploadedAt ? _self.transferProofUploadedAt : transferProofUploadedAt // ignore: cast_nullable_to_non_nullable
as String?,canUploadTransferProof: null == canUploadTransferProof ? _self.canUploadTransferProof : canUploadTransferProof // ignore: cast_nullable_to_non_nullable
as bool,canCancel: null == canCancel ? _self.canCancel : canCancel // ignore: cast_nullable_to_non_nullable
as bool,verifiedAt: freezed == verifiedAt ? _self.verifiedAt : verifiedAt // ignore: cast_nullable_to_non_nullable
as String?,adminNote: freezed == adminNote ? _self.adminNote : adminNote // ignore: cast_nullable_to_non_nullable
as String?,paidAt: freezed == paidAt ? _self.paidAt : paidAt // ignore: cast_nullable_to_non_nullable
as String?,expiredAt: freezed == expiredAt ? _self.expiredAt : expiredAt // ignore: cast_nullable_to_non_nullable
as String?,failedAt: freezed == failedAt ? _self.failedAt : failedAt // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$MerchantBalanceTopUpResponseModel {

@JsonKey(fromJson: _intFromDynamic) int? get currentBalance;@JsonKey(fromJson: _intFromDynamic) int? get minimumBalanceForOrders; bool? get isActive; String? get paymentUrl;@JsonKey(fromJson: _intFromDynamic) int? get waitingProofCount; MerchantBalanceHistoryModel? get topUp;
/// Create a copy of MerchantBalanceTopUpResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantBalanceTopUpResponseModelCopyWith<MerchantBalanceTopUpResponseModel> get copyWith => _$MerchantBalanceTopUpResponseModelCopyWithImpl<MerchantBalanceTopUpResponseModel>(this as MerchantBalanceTopUpResponseModel, _$identity);

  /// Serializes this MerchantBalanceTopUpResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantBalanceTopUpResponseModel&&(identical(other.currentBalance, currentBalance) || other.currentBalance == currentBalance)&&(identical(other.minimumBalanceForOrders, minimumBalanceForOrders) || other.minimumBalanceForOrders == minimumBalanceForOrders)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.paymentUrl, paymentUrl) || other.paymentUrl == paymentUrl)&&(identical(other.waitingProofCount, waitingProofCount) || other.waitingProofCount == waitingProofCount)&&(identical(other.topUp, topUp) || other.topUp == topUp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currentBalance,minimumBalanceForOrders,isActive,paymentUrl,waitingProofCount,topUp);

@override
String toString() {
  return 'MerchantBalanceTopUpResponseModel(currentBalance: $currentBalance, minimumBalanceForOrders: $minimumBalanceForOrders, isActive: $isActive, paymentUrl: $paymentUrl, waitingProofCount: $waitingProofCount, topUp: $topUp)';
}


}

/// @nodoc
abstract mixin class $MerchantBalanceTopUpResponseModelCopyWith<$Res>  {
  factory $MerchantBalanceTopUpResponseModelCopyWith(MerchantBalanceTopUpResponseModel value, $Res Function(MerchantBalanceTopUpResponseModel) _then) = _$MerchantBalanceTopUpResponseModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _intFromDynamic) int? currentBalance,@JsonKey(fromJson: _intFromDynamic) int? minimumBalanceForOrders, bool? isActive, String? paymentUrl,@JsonKey(fromJson: _intFromDynamic) int? waitingProofCount, MerchantBalanceHistoryModel? topUp
});


$MerchantBalanceHistoryModelCopyWith<$Res>? get topUp;

}
/// @nodoc
class _$MerchantBalanceTopUpResponseModelCopyWithImpl<$Res>
    implements $MerchantBalanceTopUpResponseModelCopyWith<$Res> {
  _$MerchantBalanceTopUpResponseModelCopyWithImpl(this._self, this._then);

  final MerchantBalanceTopUpResponseModel _self;
  final $Res Function(MerchantBalanceTopUpResponseModel) _then;

/// Create a copy of MerchantBalanceTopUpResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentBalance = freezed,Object? minimumBalanceForOrders = freezed,Object? isActive = freezed,Object? paymentUrl = freezed,Object? waitingProofCount = freezed,Object? topUp = freezed,}) {
  return _then(_self.copyWith(
currentBalance: freezed == currentBalance ? _self.currentBalance : currentBalance // ignore: cast_nullable_to_non_nullable
as int?,minimumBalanceForOrders: freezed == minimumBalanceForOrders ? _self.minimumBalanceForOrders : minimumBalanceForOrders // ignore: cast_nullable_to_non_nullable
as int?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,paymentUrl: freezed == paymentUrl ? _self.paymentUrl : paymentUrl // ignore: cast_nullable_to_non_nullable
as String?,waitingProofCount: freezed == waitingProofCount ? _self.waitingProofCount : waitingProofCount // ignore: cast_nullable_to_non_nullable
as int?,topUp: freezed == topUp ? _self.topUp : topUp // ignore: cast_nullable_to_non_nullable
as MerchantBalanceHistoryModel?,
  ));
}
/// Create a copy of MerchantBalanceTopUpResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MerchantBalanceHistoryModelCopyWith<$Res>? get topUp {
    if (_self.topUp == null) {
    return null;
  }

  return $MerchantBalanceHistoryModelCopyWith<$Res>(_self.topUp!, (value) {
    return _then(_self.copyWith(topUp: value));
  });
}
}


/// Adds pattern-matching-related methods to [MerchantBalanceTopUpResponseModel].
extension MerchantBalanceTopUpResponseModelPatterns on MerchantBalanceTopUpResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MerchantBalanceTopUpResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MerchantBalanceTopUpResponseModel() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MerchantBalanceTopUpResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _MerchantBalanceTopUpResponseModel():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MerchantBalanceTopUpResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _MerchantBalanceTopUpResponseModel() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _intFromDynamic)  int? currentBalance, @JsonKey(fromJson: _intFromDynamic)  int? minimumBalanceForOrders,  bool? isActive,  String? paymentUrl, @JsonKey(fromJson: _intFromDynamic)  int? waitingProofCount,  MerchantBalanceHistoryModel? topUp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MerchantBalanceTopUpResponseModel() when $default != null:
return $default(_that.currentBalance,_that.minimumBalanceForOrders,_that.isActive,_that.paymentUrl,_that.waitingProofCount,_that.topUp);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _intFromDynamic)  int? currentBalance, @JsonKey(fromJson: _intFromDynamic)  int? minimumBalanceForOrders,  bool? isActive,  String? paymentUrl, @JsonKey(fromJson: _intFromDynamic)  int? waitingProofCount,  MerchantBalanceHistoryModel? topUp)  $default,) {final _that = this;
switch (_that) {
case _MerchantBalanceTopUpResponseModel():
return $default(_that.currentBalance,_that.minimumBalanceForOrders,_that.isActive,_that.paymentUrl,_that.waitingProofCount,_that.topUp);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _intFromDynamic)  int? currentBalance, @JsonKey(fromJson: _intFromDynamic)  int? minimumBalanceForOrders,  bool? isActive,  String? paymentUrl, @JsonKey(fromJson: _intFromDynamic)  int? waitingProofCount,  MerchantBalanceHistoryModel? topUp)?  $default,) {final _that = this;
switch (_that) {
case _MerchantBalanceTopUpResponseModel() when $default != null:
return $default(_that.currentBalance,_that.minimumBalanceForOrders,_that.isActive,_that.paymentUrl,_that.waitingProofCount,_that.topUp);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class _MerchantBalanceTopUpResponseModel implements MerchantBalanceTopUpResponseModel {
  const _MerchantBalanceTopUpResponseModel({@JsonKey(fromJson: _intFromDynamic) this.currentBalance, @JsonKey(fromJson: _intFromDynamic) this.minimumBalanceForOrders, this.isActive, this.paymentUrl, @JsonKey(fromJson: _intFromDynamic) this.waitingProofCount, this.topUp});
  factory _MerchantBalanceTopUpResponseModel.fromJson(Map<String, dynamic> json) => _$MerchantBalanceTopUpResponseModelFromJson(json);

@override@JsonKey(fromJson: _intFromDynamic) final  int? currentBalance;
@override@JsonKey(fromJson: _intFromDynamic) final  int? minimumBalanceForOrders;
@override final  bool? isActive;
@override final  String? paymentUrl;
@override@JsonKey(fromJson: _intFromDynamic) final  int? waitingProofCount;
@override final  MerchantBalanceHistoryModel? topUp;

/// Create a copy of MerchantBalanceTopUpResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MerchantBalanceTopUpResponseModelCopyWith<_MerchantBalanceTopUpResponseModel> get copyWith => __$MerchantBalanceTopUpResponseModelCopyWithImpl<_MerchantBalanceTopUpResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MerchantBalanceTopUpResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MerchantBalanceTopUpResponseModel&&(identical(other.currentBalance, currentBalance) || other.currentBalance == currentBalance)&&(identical(other.minimumBalanceForOrders, minimumBalanceForOrders) || other.minimumBalanceForOrders == minimumBalanceForOrders)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.paymentUrl, paymentUrl) || other.paymentUrl == paymentUrl)&&(identical(other.waitingProofCount, waitingProofCount) || other.waitingProofCount == waitingProofCount)&&(identical(other.topUp, topUp) || other.topUp == topUp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currentBalance,minimumBalanceForOrders,isActive,paymentUrl,waitingProofCount,topUp);

@override
String toString() {
  return 'MerchantBalanceTopUpResponseModel(currentBalance: $currentBalance, minimumBalanceForOrders: $minimumBalanceForOrders, isActive: $isActive, paymentUrl: $paymentUrl, waitingProofCount: $waitingProofCount, topUp: $topUp)';
}


}

/// @nodoc
abstract mixin class _$MerchantBalanceTopUpResponseModelCopyWith<$Res> implements $MerchantBalanceTopUpResponseModelCopyWith<$Res> {
  factory _$MerchantBalanceTopUpResponseModelCopyWith(_MerchantBalanceTopUpResponseModel value, $Res Function(_MerchantBalanceTopUpResponseModel) _then) = __$MerchantBalanceTopUpResponseModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _intFromDynamic) int? currentBalance,@JsonKey(fromJson: _intFromDynamic) int? minimumBalanceForOrders, bool? isActive, String? paymentUrl,@JsonKey(fromJson: _intFromDynamic) int? waitingProofCount, MerchantBalanceHistoryModel? topUp
});


@override $MerchantBalanceHistoryModelCopyWith<$Res>? get topUp;

}
/// @nodoc
class __$MerchantBalanceTopUpResponseModelCopyWithImpl<$Res>
    implements _$MerchantBalanceTopUpResponseModelCopyWith<$Res> {
  __$MerchantBalanceTopUpResponseModelCopyWithImpl(this._self, this._then);

  final _MerchantBalanceTopUpResponseModel _self;
  final $Res Function(_MerchantBalanceTopUpResponseModel) _then;

/// Create a copy of MerchantBalanceTopUpResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentBalance = freezed,Object? minimumBalanceForOrders = freezed,Object? isActive = freezed,Object? paymentUrl = freezed,Object? waitingProofCount = freezed,Object? topUp = freezed,}) {
  return _then(_MerchantBalanceTopUpResponseModel(
currentBalance: freezed == currentBalance ? _self.currentBalance : currentBalance // ignore: cast_nullable_to_non_nullable
as int?,minimumBalanceForOrders: freezed == minimumBalanceForOrders ? _self.minimumBalanceForOrders : minimumBalanceForOrders // ignore: cast_nullable_to_non_nullable
as int?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,paymentUrl: freezed == paymentUrl ? _self.paymentUrl : paymentUrl // ignore: cast_nullable_to_non_nullable
as String?,waitingProofCount: freezed == waitingProofCount ? _self.waitingProofCount : waitingProofCount // ignore: cast_nullable_to_non_nullable
as int?,topUp: freezed == topUp ? _self.topUp : topUp // ignore: cast_nullable_to_non_nullable
as MerchantBalanceHistoryModel?,
  ));
}

/// Create a copy of MerchantBalanceTopUpResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MerchantBalanceHistoryModelCopyWith<$Res>? get topUp {
    if (_self.topUp == null) {
    return null;
  }

  return $MerchantBalanceHistoryModelCopyWith<$Res>(_self.topUp!, (value) {
    return _then(_self.copyWith(topUp: value));
  });
}
}

// dart format on
