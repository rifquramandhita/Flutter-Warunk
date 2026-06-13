import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:warunk/main.dart';
import 'package:warunk/app/features/merchant/presentation/accept_cancel_order/bloc/merchant_accept_cancel_order_bloc.dart';
import 'package:warunk/core/dependency/dependency.dart';
import 'package:warunk/core/helper/dialog_helper.dart';
import 'package:warunk/core/helper/global_helper.dart';
import 'package:warunk/core/widgets/loading_app_widget.dart';

class MerchantAcceptCancelOrderScreen extends StatelessWidget {
  final String orderId;

  const MerchantAcceptCancelOrderScreen({super.key, required this.orderId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<MerchantAcceptCancelOrderBloc>(param1: orderId),
      child: BlocConsumer<MerchantAcceptCancelOrderBloc, MerchantAcceptCancelOrderState>(
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
                'Setujui Pembatalan',
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

  Widget _bodyBuild(BuildContext context, MerchantAcceptCancelOrderState state) {
    return SafeArea(
      child: Stack(
        children: [
          _bodyLayout(context, state),
          if (state.isLoading) const LoadingAppWidget(),
        ],
      ),
    );
  }

  Widget _bodyLayout(BuildContext context, MerchantAcceptCancelOrderState state) {
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
                  Text(
                    'Bukti Refund',
                    style:
                        GlobalHelper.getTextTheme(
                          context,
                          appTextStyle: AppTextStyle.LABEL_MEDIUM,
                        )?.copyWith(
                          color: GlobalHelper.getColorSchema(
                            context,
                          ).onSurfaceVariant,
                        ),
                  ),
                  const SizedBox(height: 8),
                  GestureDetector(
                    onTap: () => _pickImage(context),
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: GlobalHelper.getColorSchema(
                            context,
                          ).outlineVariant,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: state.refundProof != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.file(
                                state.refundProof!,
                                fit: BoxFit.cover,
                              ),
                            )
                          : Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.image,
                                    size: 40,
                                    color: GlobalHelper.getColorSchema(
                                      context,
                                    ).outlineVariant,
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'Pilih Gambar',
                                    style:
                                        GlobalHelper.getTextTheme(
                                          context,
                                          appTextStyle: AppTextStyle.BODY_SMALL,
                                        )?.copyWith(
                                          color: GlobalHelper.getColorSchema(
                                            context,
                                          ).onSurfaceVariant,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                    ),
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
              backgroundColor: GlobalHelper.getColorSchema(context).primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              'Setujui Pembatalan',
              style:
                  GlobalHelper.getTextTheme(
                    context,
                    appTextStyle: AppTextStyle.LABEL_LARGE,
                  )?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: GlobalHelper.getColorSchema(context).onPrimary,
                  ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _pickImage(BuildContext context) async {
    final picker = ImagePicker();
    try {
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null && context.mounted) {
        context.read<MerchantAcceptCancelOrderBloc>().add(
          MerchantAcceptCancelOrderEventRefundProofPicked(File(image.path)),
        );
      }
    } catch (e) {
      debugPrint('ImagePicker error: $e');
    }
  }

  void _submit(BuildContext context, MerchantAcceptCancelOrderState state) {
    if (state.refundProof == null) {
      DialogHelper.showErrorSnackBar(
        context: context,
        text: 'Harap upload bukti refund',
      );
      return;
    }

    context.read<MerchantAcceptCancelOrderBloc>().add(
      MerchantAcceptCancelOrderEventSubmit(),
    );
  }
}
