import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/main.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_order_ship_param.dart';
import 'package:warunk/app/features/merchant/presentation/ship_order/bloc/merchant_ship_order_bloc.dart';
import 'package:warunk/core/dependency/dependency.dart';
import 'package:warunk/core/helper/dialog_helper.dart';
import 'package:warunk/core/helper/global_helper.dart';
import 'package:warunk/core/widgets/loading_app_widget.dart';
import 'package:warunk/core/widgets/primary_button.dart';

class MerchantShipOrderScreen extends StatelessWidget {
  final String orderId;

  final TextEditingController _driverNameCtrl = TextEditingController();
  final TextEditingController _driverPhoneCtrl = TextEditingController();
  final TextEditingController _trackingNumberCtrl = TextEditingController();
  final TextEditingController _notesCtrl = TextEditingController();

  MerchantShipOrderScreen({super.key, required this.orderId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<MerchantShipOrderBloc>(param1: orderId),
      child: BlocConsumer<MerchantShipOrderBloc, MerchantShipOrderState>(
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
                'Kirim Pesanan',
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
            body: _bodyBuild(context),
          );
        },
      ),
    );
  }

  Widget _bodyBuild(BuildContext context) {
    final state = context.watch<MerchantShipOrderBloc>().state;
    return SafeArea(
      child: Stack(
        children: [
          _bodyLayout(context),
          if (state.isLoading) const LoadingAppWidget(),
        ],
      ),
    );
  }

  Widget _bodyLayout(BuildContext context) {
    final state = context.watch<MerchantShipOrderBloc>().state;

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
                    label: 'Nama Driver (opsional)',
                    controller: _driverNameCtrl,
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(
                    context: context,
                    label: 'No. HP Driver (opsional)',
                    controller: _driverPhoneCtrl,
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(
                    context: context,
                    label: 'No. Resi (opsional)',
                    controller: _trackingNumberCtrl,
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(
                    context: context,
                    label: 'Catatan (opsional)',
                    controller: _notesCtrl,
                    maxLines: 3,
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(20),
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: GlobalHelper.getColorSchema(context).surface,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 10,
                offset: const Offset(0, -5),
              ),
            ],
          ),
          child: PrimaryButton(
            label: 'Kirim',
            isLoading: state.isLoading,
            onPressed: () => _submit(context),
          ),
        ),
      ],
    );
  }

  Widget _buildTextField({
    required BuildContext context,
    required String label,
    required TextEditingController controller,
    TextInputType? keyboardType,
    int maxLines = 1,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      style: GlobalHelper.getTextTheme(
        context,
        appTextStyle: AppTextStyle.BODY_MEDIUM,
      )?.copyWith(color: GlobalHelper.getColorSchema(context).onSurface),
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
            color: GlobalHelper.getColorSchema(context).outline,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: GlobalHelper.getColorSchema(context).outline,
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

  void _submit(BuildContext context) {
    final param = MerchantOrderShipSendParam(
      driverName: _driverNameCtrl.text.trim().isEmpty
          ? null
          : _driverNameCtrl.text.trim(),
      driverPhone: _driverPhoneCtrl.text.trim().isEmpty
          ? null
          : _driverPhoneCtrl.text.trim(),
      trackingNumber: _trackingNumberCtrl.text.trim().isEmpty
          ? null
          : _trackingNumberCtrl.text.trim(),
      notes: _notesCtrl.text.trim().isEmpty ? null : _notesCtrl.text.trim(),
    );
    context.read<MerchantShipOrderBloc>().add(
      MerchantShipOrderEventShip(param),
    );
  }
}
