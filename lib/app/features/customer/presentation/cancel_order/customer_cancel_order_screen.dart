import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_order.dart';
import 'package:warunk/core/dependency/dependency.dart';
import 'package:warunk/core/helper/dialog_helper.dart';
import 'package:warunk/core/helper/global_helper.dart';
import 'package:warunk/core/widgets/loading_app_widget.dart';
import 'package:warunk/main.dart';

import 'bloc/customer_cancel_order_bloc.dart';

class CustomerCancelOrderScreen extends StatelessWidget {
  final CustomerOrderEntity order;

  final _formKey = GlobalKey<FormState>();
  final _reasonController = TextEditingController();
  final _bankController = TextEditingController();
  final _accountNumberController = TextEditingController();
  final _accountNameController = TextEditingController();

  CustomerCancelOrderScreen({super.key, required this.order});

  void _submit(BuildContext context) {
    if (_formKey.currentState?.validate() ?? false) {
      context.read<CustomerCancelOrderBloc>().add(
        CustomerCancelOrderSubmitted(
          orderId: order.id!,
          reason: _reasonController.text,
          customerBank: _bankController.text.isNotEmpty
              ? _bankController.text
              : null,
          customerAccountNumber: _accountNumberController.text.isNotEmpty
              ? _accountNumberController.text
              : null,
          customerAccountName: _accountNameController.text.isNotEmpty
              ? _accountNameController.text
              : null,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CustomerCancelOrderBloc>(),
      child: BlocConsumer<CustomerCancelOrderBloc, CustomerCancelOrderState>(
        listener: (context, state) {
          if (state.status == CustomerCancelOrderStatus.failure) {
            DialogHelper.showErrorSnackBar(
              context: context,
              text: state.errorMessage ?? 'Gagal membatalkan pesanan',
            );
          } else if (state.status == CustomerCancelOrderStatus.success) {
            DialogHelper.showSnackBar(
              context: context,
              text: state.successMessage ?? 'Pesanan berhasil dibatalkan',
            );
            navigatorKey.currentState?.pop(true);
          }
        },
        builder: (context, state) {
          final colorSchema = GlobalHelper.getColorSchema(context);
          final titleStyle = GlobalHelper.getTextTheme(
            context,
            appTextStyle: AppTextStyle.TITLE_SMALL,
          );

          return Scaffold(
            backgroundColor: colorSchema.surface,
            appBar: AppBar(title: const Text('Batalkan Pesanan'), elevation: 0),
            body: SafeArea(
              child: Stack(
                children: [
                  _buildBody(context),
                  if (state.status == CustomerCancelOrderStatus.loading)
                    const LoadingAppWidget(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    final state = context.read<CustomerCancelOrderBloc>().state;
    final colorSchema = GlobalHelper.getColorSchema(context);
    final bodyStyle = GlobalHelper.getTextTheme(
      context,
      appTextStyle: AppTextStyle.BODY_SMALL,
    );
    final titleStyle = GlobalHelper.getTextTheme(
      context,
      appTextStyle: AppTextStyle.TITLE_SMALL,
    );

    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: colorSchema.errorContainer,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: colorSchema.error.withValues(alpha: 0.3),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.info_outline,
                          color: colorSchema.error,
                          size: 20,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            'Pesanan dengan ID ${order.invoiceNumber ?? '-'} akan dibatalkan. Jika Anda sudah melakukan pembayaran melalui transfer, silakan masukkan informasi rekening Anda untuk proses refund.',
                            style: bodyStyle?.copyWith(
                              color: colorSchema.error,
                              height: 1.4,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  _buildTextField(
                    context: context,
                    label: 'Alasan Pembatalan',
                    controller: _reasonController,
                    hintText: 'Cth: Salah pilih produk',
                    maxLines: 3,
                    validator: (val) {
                      if (val == null || val.trim().isEmpty) {
                        return 'Alasan pembatalan harus diisi';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Informasi Rekening Pengembalian Dana (Jika Ada)',
                    style: titleStyle?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: colorSchema.onSurface,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildTextField(
                    context: context,
                    label: 'Nama Bank',
                    controller: _bankController,
                    hintText: 'Cth: BCA, BNI, Mandiri',
                  ),
                  const SizedBox(height: 12),
                  _buildTextField(
                    context: context,
                    label: 'Nomor Rekening',
                    controller: _accountNumberController,
                    hintText: 'Cth: 1234567890',
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 12),
                  _buildTextField(
                    context: context,
                    label: 'Nama Pemilik Rekening',
                    controller: _accountNameController,
                    hintText: 'Cth: Andi Pratama',
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: colorSchema.surface,
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 16,
                offset: Offset(0, -4),
              ),
            ],
          ),
          child: ElevatedButton(
            onPressed: state.status == CustomerCancelOrderStatus.loading
                ? null
                : () => _submit(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: colorSchema.error,
              foregroundColor: colorSchema.onError,
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            child: Text(
              'Konfirmasi Pembatalan',
              style: titleStyle?.copyWith(
                fontWeight: FontWeight.w700,
                color: colorSchema.onError,
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
    required TextEditingController controller,
    String? hintText,
    int maxLines = 1,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
  }) {
    final colorSchema = GlobalHelper.getColorSchema(context);
    final labelStyle = GlobalHelper.getTextTheme(
      context,
      appTextStyle: AppTextStyle.LABEL_MEDIUM,
    );
    final bodyStyle = GlobalHelper.getTextTheme(
      context,
      appTextStyle: AppTextStyle.BODY_SMALL,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: labelStyle?.copyWith(
            fontWeight: FontWeight.w600,
            color: colorSchema.onSurface,
          ),
        ),
        const SizedBox(height: 6),
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          keyboardType: keyboardType,
          validator: validator,
          style: bodyStyle?.copyWith(color: colorSchema.onSurface),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: bodyStyle?.copyWith(color: colorSchema.onSurfaceVariant),
            filled: true,
            fillColor: colorSchema.surface,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: colorSchema.outline),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: colorSchema.outline),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: colorSchema.primary),
            ),
          ),
        ),
      ],
    );
  }
}
