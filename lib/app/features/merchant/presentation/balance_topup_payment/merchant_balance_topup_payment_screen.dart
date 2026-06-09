import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:warunk/app/features/merchant/presentation/balance_topup_payment/bloc/merchant_balance_topup_payment_bloc.dart';
import 'package:warunk/app/features/merchant/presentation/balance_topup_payment/bloc/merchant_balance_topup_payment_event.dart';
import 'package:warunk/app/features/merchant/presentation/balance_topup_payment/bloc/merchant_balance_topup_payment_state.dart';
import 'package:warunk/core/dependency/dependency.dart';
import 'package:warunk/core/helper/global_helper.dart';

// ignore: must_be_immutable
class MerchantBalanceTopupPaymentScreen extends StatelessWidget {
  final String paymentUrl;
  WebViewController? _controller;

  MerchantBalanceTopupPaymentScreen({
    super.key,
    required this.paymentUrl,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MerchantBalanceTopupPaymentBloc>(),
      child: BlocConsumer<MerchantBalanceTopupPaymentBloc,
          MerchantBalanceTopupPaymentState>(
        listener: (context, state) {},
        builder: (context, state) {
          final colorSchema = GlobalHelper.getColorSchema(context);
          final titleLarge = GlobalHelper.getTextTheme(context,
              appTextStyle: AppTextStyle.TITLE_LARGE);

          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: const Text('Pembayaran'),
              backgroundColor: Colors.white,
              elevation: 0,
              iconTheme: IconThemeData(color: colorSchema.primary),
              titleTextStyle: titleLarge?.copyWith(
                  fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            body: _bodyBuild(context),
          );
        },
      ),
    );
  }

  Widget _bodyBuild(BuildContext context) {
    final state = context.watch<MerchantBalanceTopupPaymentBloc>().state;

    return Stack(
      children: [
        _bodyLayout(context),
        if (state.isLoading)
          Center(
            child: CircularProgressIndicator(
              color: GlobalHelper.getColorSchema(context).primary,
            ),
          ),
      ],
    );
  }

  Widget _bodyLayout(BuildContext context) {
    _controller ??= WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (String url) {
            context.read<MerchantBalanceTopupPaymentBloc>().add(
                  MerchantBalanceTopupPaymentEventPageFinished(),
                );
          },
        ),
      )
      ..loadRequest(Uri.parse(paymentUrl));

    return WebViewWidget(controller: _controller!);
  }
}
