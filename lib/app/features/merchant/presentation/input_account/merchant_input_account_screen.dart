import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_account.dart';
import 'package:warunk/app/features/merchant/presentation/input_account/bloc/merchant_input_account_bloc.dart';
import 'package:warunk/core/dependency/dependency.dart';
import 'package:warunk/core/helper/dialog_helper.dart';
import 'package:warunk/core/helper/global_helper.dart';
import 'package:warunk/core/widgets/loading_app_widget.dart';
import 'package:warunk/main.dart';
import 'package:warunk/theme/app_colors.dart';

class MerchantInputAccountScreen extends StatelessWidget {
  const MerchantInputAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<MerchantInputAccountBloc>()
            ..add(MerchantInputAccountEventFetchStarted()),
      child: BlocConsumer<MerchantInputAccountBloc, MerchantInputAccountState>(
        listener: (context, state) {
          if (state.errorMessage != null) {
            DialogHelper.showErrorSnackBar(
              context: context,
              text: state.errorMessage!,
            );
          }
          if (state.isSuccess) {
            DialogHelper.showBottomSheetDialog(
              context: context,
              title: 'Berhasil',
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Informasi akun bank Anda berhasil disimpan.',
                    style: GlobalHelper.getTextTheme(
                      context,
                      appTextStyle: AppTextStyle.BODY_MEDIUM,
                    ),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      navigatorKey.currentState?.pop();
                      navigatorKey.currentState?.pop();
                    },
                    child: const Text('Tutup'),
                  ),
                ],
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(title: const Text('Akun Bank')),
            body: _bodyBuild(context),
          );
        },
      ),
    );
  }

  Widget _bodyBuild(BuildContext context) {
    final state = context.watch<MerchantInputAccountBloc>().state;
    return SafeArea(
      child: Stack(
        children: [
          _bodyLayout(context, state),
          (state.isLoading) ? const LoadingAppWidget() : const SizedBox(),
        ],
      ),
    );
  }

  Widget _bodyLayout(BuildContext context, MerchantInputAccountState state) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.accounts.length,
            separatorBuilder: (context, index) => const SizedBox(height: 24),
            itemBuilder: (context, index) {
              return _accountCard(context, state.accounts[index], index);
            },
          ),
          const SizedBox(height: 16),
          _addAccountButton(context),
          const SizedBox(height: 32),
          _submitButton(context),
        ],
      ),
    );
  }

  Widget _accountCard(
    BuildContext context,
    MerchantAccountUpdateParam account,
    int index,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.greyBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Akun ${index + 1}',
                style: GlobalHelper.getTextTheme(
                  context,
                  appTextStyle: AppTextStyle.TITLE_SMALL,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.delete_outline, color: Colors.red),
                onPressed: () {
                  context.read<MerchantInputAccountBloc>().add(
                    MerchantInputAccountEventRemoveAccount(index),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 8),
          _bankNameField(context, account.bankName, index),
          const SizedBox(height: 16),
          _accountNameField(context, account.accountName, index),
          const SizedBox(height: 16),
          _accountNumberField(context, account.accountNumber, index),
        ],
      ),
    );
  }

  Widget _bankNameField(BuildContext context, String initialValue, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Nama Bank',
          style: GlobalHelper.getTextTheme(
            context,
            appTextStyle: AppTextStyle.LABEL_MEDIUM,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          initialValue: initialValue,
          decoration: const InputDecoration(
            hintText: 'Cth: BCA, Mandiri, BRI',
            border: OutlineInputBorder(),
          ),
          onChanged: (value) {
            context.read<MerchantInputAccountBloc>().add(
              MerchantInputAccountEventBankNameChanged(index, value),
            );
          },
        ),
      ],
    );
  }

  Widget _accountNameField(
    BuildContext context,
    String initialValue,
    int index,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Nama Pemilik Rekening',
          style: GlobalHelper.getTextTheme(
            context,
            appTextStyle: AppTextStyle.LABEL_MEDIUM,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          initialValue: initialValue,
          decoration: const InputDecoration(
            hintText: 'Cth: Budi Santoso',
            border: OutlineInputBorder(),
          ),
          onChanged: (value) {
            context.read<MerchantInputAccountBloc>().add(
              MerchantInputAccountEventAccountNameChanged(index, value),
            );
          },
        ),
      ],
    );
  }

  Widget _accountNumberField(
    BuildContext context,
    String initialValue,
    int index,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Nomor Rekening',
          style: GlobalHelper.getTextTheme(
            context,
            appTextStyle: AppTextStyle.LABEL_MEDIUM,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          initialValue: initialValue,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            hintText: 'Cth: 1234567890',
            border: OutlineInputBorder(),
          ),
          onChanged: (value) {
            context.read<MerchantInputAccountBloc>().add(
              MerchantInputAccountEventAccountNumberChanged(index, value),
            );
          },
        ),
      ],
    );
  }

  Widget _addAccountButton(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () {
        context.read<MerchantInputAccountBloc>().add(
          MerchantInputAccountEventAddAccount(),
        );
      },
      icon: const Icon(Icons.add),
      label: const Text('Tambah Akun Bank'),
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
    );
  }

  Widget _submitButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.read<MerchantInputAccountBloc>().add(
          MerchantInputAccountEventSubmitted(),
        );
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
      child: const Text('Simpan Akun Bank'),
    );
  }
}
