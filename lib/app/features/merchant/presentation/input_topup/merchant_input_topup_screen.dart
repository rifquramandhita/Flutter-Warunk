import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/merchant/presentation/balance_topup_payment/merchant_balance_topup_payment_screen.dart';
import 'package:warunk/app/features/merchant/presentation/input_topup/bloc/merchant_input_topup_bloc.dart';
import 'package:warunk/app/features/merchant/presentation/input_topup/bloc/merchant_input_topup_event.dart';
import 'package:warunk/app/features/merchant/presentation/input_topup/bloc/merchant_input_topup_state.dart';
import 'package:warunk/core/dependency/dependency.dart';
import 'package:warunk/core/helper/currency_input_formatter.dart';
import 'package:warunk/core/helper/dialog_helper.dart';
import 'package:warunk/core/helper/global_helper.dart';
import 'package:warunk/core/widgets/loading_app_widget.dart';
import 'package:warunk/core/widgets/primary_button.dart';
import 'package:warunk/main.dart';

class MerchantInputTopupScreen extends StatefulWidget {
  const MerchantInputTopupScreen({super.key});

  @override
  State<MerchantInputTopupScreen> createState() =>
      _MerchantInputTopupScreenState();
}

class _MerchantInputTopupScreenState extends State<MerchantInputTopupScreen> {
  final TextEditingController _amountController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MerchantInputTopupBloc>(),
      child: BlocConsumer<MerchantInputTopupBloc, MerchantInputTopupState>(
        listener: (context, state) {
          if (state.errorMessage != null) {
            DialogHelper.showErrorSnackBar(
              context: context,
              text: state.errorMessage!,
            );
          }

          if (state.paymentUrl != null) {
            navigatorKey.currentState?.pushReplacement(
              MaterialPageRoute(
                builder: (context) => MerchantBalanceTopupPaymentScreen(
                  paymentUrl: state.paymentUrl!,
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          final colorSchema = GlobalHelper.getColorSchema(context);
          final titleLarge = GlobalHelper.getTextTheme(
            context,
            appTextStyle: AppTextStyle.TITLE_LARGE,
          );

          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: const Text('Top Up Saldo'),
              backgroundColor: Colors.white,
              elevation: 0,
              iconTheme: IconThemeData(color: colorSchema.primary),
              titleTextStyle: titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            body: SafeArea(
              child: Stack(
                children: [
                  _bodyLayout(context),
                  if (state.isLoading) const LoadingAppWidget(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _bodyLayout(BuildContext context) {
    final bodyLarge = GlobalHelper.getTextTheme(
      context,
      appTextStyle: AppTextStyle.BODY_LARGE,
    );

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nominal Top Up',
              style: bodyLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              inputFormatters: [CurrencyInputFormatter()],
              decoration: InputDecoration(
                hintText: 'Contoh: 50000',
                prefixText: 'Rp ',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Nominal tidak boleh kosong';
                }
                final cleanValue = value.replaceAll('.', '');
                if (int.tryParse(cleanValue) == null || int.parse(cleanValue) < 10000) {
                  return 'Minimal top up Rp 10.000';
                }
                return null;
              },
            ),
            const SizedBox(height: 24),
            PrimaryButton(
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  final amount = int.parse(_amountController.text.replaceAll('.', ''));
                  context.read<MerchantInputTopupBloc>().add(
                    MerchantInputTopupEventSubmit(amount: amount),
                  );
                }
              },
              label: 'Top Up',
            ),
          ],
        ),
      ),
    );
  }
}
