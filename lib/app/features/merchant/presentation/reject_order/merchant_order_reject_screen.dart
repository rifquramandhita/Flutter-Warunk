import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:warunk/main.dart';
import 'package:warunk/app/features/merchant/presentation/reject_order/bloc/merchant_reject_order_bloc.dart';
import 'package:warunk/core/dependency/dependency.dart';
import 'package:warunk/core/helper/dialog_helper.dart';
import 'package:warunk/core/helper/global_helper.dart';
import 'package:warunk/core/widgets/loading_app_widget.dart';
import 'package:warunk/core/widgets/error_button.dart';
import 'package:warunk/core/widgets/outline_button_custom.dart';
import 'package:url_launcher/url_launcher.dart';

class MerchantOrderRejectScreen extends StatelessWidget {
  final String orderId;

  const MerchantOrderRejectScreen({super.key, required this.orderId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<MerchantRejectOrderBloc>(param1: orderId),
      child: BlocConsumer<MerchantRejectOrderBloc, MerchantRejectOrderState>(
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
                'Tolak Pesanan',
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

  Widget _bodyBuild(BuildContext context, MerchantRejectOrderState state) {
    return SafeArea(
      child: Stack(
        children: [
          _bodyLayout(context, state),
          if (state.isLoading) const LoadingAppWidget(),
        ],
      ),
    );
  }

  Widget _bodyLayout(BuildContext context, MerchantRejectOrderState state) {
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
                        .read<MerchantRejectOrderBloc>()
                        .add(MerchantRejectOrderEventReasonChanged(val)),
                    maxLines: 3,
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(
                    context: context,
                    label: 'Bank Customer',
                    onChanged: (val) => context
                        .read<MerchantRejectOrderBloc>()
                        .add(MerchantRejectOrderEventBankChanged(val)),
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(
                    context: context,
                    label: 'Nomor Rekening',
                    onChanged: (val) => context
                        .read<MerchantRejectOrderBloc>()
                        .add(MerchantRejectOrderEventAccountNumberChanged(val)),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(
                    context: context,
                    label: 'Nama Pemilik Rekening',
                    onChanged: (val) => context
                        .read<MerchantRejectOrderBloc>()
                        .add(MerchantRejectOrderEventAccountNameChanged(val)),
                  ),
                  const SizedBox(height: 16),
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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              OutlineButtonCustom(
                label: 'Hubungi Customer Service',
                onPressed: () async {
                  final url = Uri.parse('https://wa.me/6281345678900');
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url, mode: LaunchMode.externalApplication);
                  }
                },
              ),
              const SizedBox(height: 12),
              ErrorButton(
                label: 'Tolak',
                onPressed: () => _submit(context, state),
                isLoading: state.isLoading,
              ),
            ],
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

  Future<void> _pickImage(BuildContext context) async {
    final picker = ImagePicker();
    try {
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null && context.mounted) {
        context.read<MerchantRejectOrderBloc>().add(
          MerchantRejectOrderEventRefundProofPicked(File(image.path)),
        );
      }
    } catch (e) {
      debugPrint('ImagePicker error: $e');
    }
  }

  void _submit(BuildContext context, MerchantRejectOrderState state) {
    if (state.reason.trim().isEmpty ||
        state.customerBank.trim().isEmpty ||
        state.customerAccountNumber.trim().isEmpty ||
        state.customerAccountName.trim().isEmpty) {
      DialogHelper.showErrorSnackBar(
        context: context,
        text: 'Harap isi semua field',
      );
      return;
    }

    if (state.refundProof == null) {
      DialogHelper.showErrorSnackBar(
        context: context,
        text: 'Harap upload bukti refund',
      );
      return;
    }

    context.read<MerchantRejectOrderBloc>().add(
      MerchantRejectOrderEventSubmit(),
    );
  }
}
