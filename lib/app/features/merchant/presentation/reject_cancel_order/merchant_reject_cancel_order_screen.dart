import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/main.dart';
import 'package:warunk/app/features/merchant/presentation/reject_cancel_order/bloc/merchant_reject_cancel_order_bloc.dart';
import 'package:warunk/core/dependency/dependency.dart';
import 'package:warunk/core/helper/dialog_helper.dart';
import 'package:warunk/core/helper/global_helper.dart';
import 'package:warunk/core/widgets/loading_app_widget.dart';

class MerchantRejectCancelOrderScreen extends StatelessWidget {
  final String orderId;

  const MerchantRejectCancelOrderScreen({super.key, required this.orderId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<MerchantRejectCancelOrderBloc>(param1: orderId),
      child: BlocConsumer<MerchantRejectCancelOrderBloc, MerchantRejectCancelOrderState>(
        listener: (context, state) {
          if (state.errorMessage != null) {
            DialogHelper.showErrorSnackBar(
              context: context,
              text: state.errorMessage!,
            );
          }
          if (state.isSuccess) {
            navigatorKey.currentState?.pop(true);
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: GlobalHelper.getColorSchema(context).surface,
            appBar: AppBar(
              backgroundColor: GlobalHelper.getColorSchema(context).surface,
              elevation: 0,
              centerTitle: true,
              title: Text(
                'Tolak Pembatalan',
                style:
                    GlobalHelper.getTextTheme(
                      context,
                      appTextStyle: AppTextStyle.TITLE_MEDIUM,
                    )?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: GlobalHelper.getColorSchema(context).onSurface,
                    ),
              ),
            ),
            body: _bodyBuild(context, state),
          );
        },
      ),
    );
  }

  Widget _bodyBuild(BuildContext context, MerchantRejectCancelOrderState state) {
    return SafeArea(
      child: Stack(
        children: [
          _bodyLayout(context, state),
          if (state.isLoading) const LoadingAppWidget(),
        ],
      ),
    );
  }

  Widget _bodyLayout(BuildContext context, MerchantRejectCancelOrderState state) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: GlobalHelper.getColorSchema(context).surface,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildTextField(
                    context: context,
                    label: 'Alasan Penolakan',
                    onChanged: (val) => context
                        .read<MerchantRejectCancelOrderBloc>()
                        .add(MerchantRejectCancelOrderEventReasonChanged(val)),
                    maxLines: 5,
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          width: double.maxFinite,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: GlobalHelper.getColorSchema(context).surface,
          ),
          child: ElevatedButton(
            onPressed: state.isLoading ? null : () => _submit(context, state),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 14),
              backgroundColor: GlobalHelper.getColorSchema(context).error,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              'Tolak',
              style:
                  GlobalHelper.getTextTheme(
                    context,
                    appTextStyle: AppTextStyle.LABEL_LARGE,
                  )?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: GlobalHelper.getColorSchema(context).onError,
                  ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTextField({
    required BuildContext context,
    required String label,
    required Function(String) onChanged,
    TextInputType? keyboardType,
    int maxLines = 1,
  }) {
    return TextField(
      onChanged: onChanged,
      keyboardType: keyboardType,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        labelStyle:
            GlobalHelper.getTextTheme(
              context,
              appTextStyle: AppTextStyle.BODY_SMALL,
            )?.copyWith(
              color: GlobalHelper.getColorSchema(context).onSurfaceVariant,
            ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: GlobalHelper.getColorSchema(context).outlineVariant,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: GlobalHelper.getColorSchema(context).outlineVariant,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: GlobalHelper.getColorSchema(context).primary,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
      ),
    );
  }

  void _submit(BuildContext context, MerchantRejectCancelOrderState state) {
    if (state.reason.trim().isEmpty) {
      DialogHelper.showErrorSnackBar(
        context: context,
        text: 'Harap isi alasan penolakan',
      );
      return;
    }

    context.read<MerchantRejectCancelOrderBloc>().add(
      MerchantRejectCancelOrderEventSubmit(),
    );
  }
}
