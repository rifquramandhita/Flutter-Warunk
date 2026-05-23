import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_account.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_merchant_get_use_case.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_merchant_update_account_use_case.dart';
import 'package:warunk/core/network/data_state.dart';

part 'merchant_input_account_event.dart';
part 'merchant_input_account_state.dart';

class MerchantInputAccountBloc
    extends Bloc<MerchantInputAccountEvent, MerchantInputAccountState> {
  final MerchantMerchantGetUseCase _getUseCase;
  final MerchantMerchantUpdateAccountUseCase _updateAccountUseCase;

  MerchantInputAccountBloc(this._getUseCase, this._updateAccountUseCase)
      : super(const MerchantInputAccountState()) {
    on<MerchantInputAccountEventFetchStarted>(_onFetchStarted);
    on<MerchantInputAccountEventAddAccount>(_onAddAccount);
    on<MerchantInputAccountEventRemoveAccount>(_onRemoveAccount);
    on<MerchantInputAccountEventBankNameChanged>(_onBankNameChanged);
    on<MerchantInputAccountEventAccountNameChanged>(_onAccountNameChanged);
    on<MerchantInputAccountEventAccountNumberChanged>(_onAccountNumberChanged);
    on<MerchantInputAccountEventSubmitted>(_onSubmitted);
  }

  Future<void> _onFetchStarted(
    MerchantInputAccountEventFetchStarted event,
    Emitter<MerchantInputAccountState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final response = await _getUseCase.call();
    if (response is SuccessState) {
      final accounts = response.data?.merchantAccounts;
      if (accounts != null && accounts.isNotEmpty) {
        final List<MerchantAccountUpdateParam> paramAccounts = accounts.map((e) {
          return MerchantAccountUpdateParam(
            bankName: e.bankName,
            accountName: e.accountName,
            accountNumber: e.accountNumber,
          );
        }).toList();
        emit(state.copyWith(accounts: paramAccounts));
      } else {
        emit(state.copyWith(accounts: [
          const MerchantAccountUpdateParam(
              bankName: '', accountName: '', accountNumber: '')
        ]));
      }
    } else {
      emit(state.copyWith(errorMessage: response.message));
    }
    emit(state.copyWith(isLoading: false));
  }

  void _onAddAccount(
    MerchantInputAccountEventAddAccount event,
    Emitter<MerchantInputAccountState> emit,
  ) {
    final updated = List<MerchantAccountUpdateParam>.from(state.accounts);
    updated.add(const MerchantAccountUpdateParam(
        bankName: '', accountName: '', accountNumber: ''));
    emit(state.copyWith(accounts: updated));
  }

  void _onRemoveAccount(
    MerchantInputAccountEventRemoveAccount event,
    Emitter<MerchantInputAccountState> emit,
  ) {
    final updated = List<MerchantAccountUpdateParam>.from(state.accounts);
    if (updated.length > 1) {
      updated.removeAt(event.index);
      emit(state.copyWith(accounts: updated));
    } else {
      emit(state.copyWith(errorMessage: 'Harus ada minimal 1 akun bank'));
    }
  }

  void _onBankNameChanged(
    MerchantInputAccountEventBankNameChanged event,
    Emitter<MerchantInputAccountState> emit,
  ) {
    final updated = List<MerchantAccountUpdateParam>.from(state.accounts);
    final old = updated[event.index];
    updated[event.index] = MerchantAccountUpdateParam(
        bankName: event.bankName,
        accountName: old.accountName,
        accountNumber: old.accountNumber);
    emit(state.copyWith(accounts: updated));
  }

  void _onAccountNameChanged(
    MerchantInputAccountEventAccountNameChanged event,
    Emitter<MerchantInputAccountState> emit,
  ) {
    final updated = List<MerchantAccountUpdateParam>.from(state.accounts);
    final old = updated[event.index];
    updated[event.index] = MerchantAccountUpdateParam(
        bankName: old.bankName,
        accountName: event.accountName,
        accountNumber: old.accountNumber);
    emit(state.copyWith(accounts: updated));
  }

  void _onAccountNumberChanged(
    MerchantInputAccountEventAccountNumberChanged event,
    Emitter<MerchantInputAccountState> emit,
  ) {
    final updated = List<MerchantAccountUpdateParam>.from(state.accounts);
    final old = updated[event.index];
    updated[event.index] = MerchantAccountUpdateParam(
        bankName: old.bankName,
        accountName: old.accountName,
        accountNumber: event.accountNumber);
    emit(state.copyWith(accounts: updated));
  }

  Future<void> _onSubmitted(
    MerchantInputAccountEventSubmitted event,
    Emitter<MerchantInputAccountState> emit,
  ) async {
    for (var acc in state.accounts) {
      if (acc.bankName.isEmpty ||
          acc.accountName.isEmpty ||
          acc.accountNumber.isEmpty) {
        emit(state.copyWith(errorMessage: 'Semua kolom akun harus diisi'));
        return;
      }
    }

    emit(state.copyWith(isLoading: true));

    final response = await _updateAccountUseCase.call(accounts: state.accounts);

    if (response is SuccessState) {
      emit(state.copyWith(isSuccess: true));
    } else {
      emit(state.copyWith(errorMessage: response.message));
    }
    emit(state.copyWith(isLoading: false));
  }
}
