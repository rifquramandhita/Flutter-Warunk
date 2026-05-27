import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/main.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_order_ship_param.dart';
import 'package:warunk/app/features/merchant/presentation/ship_order/bloc/merchant_ship_order_bloc.dart';
import 'package:warunk/core/dependency/dependency.dart';
import 'package:warunk/core/helper/dialog_helper.dart';
import 'package:warunk/core/widgets/loading_app_widget.dart';
import 'package:warunk/theme/app_colors.dart';

class MerchantShipOrderScreen extends StatelessWidget {
  final String orderId;

  const MerchantShipOrderScreen({super.key, required this.orderId});

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
            navigatorKey.currentState?.pop(true); // true indicates success
          }
        },
        builder: (context, state) {
          return const _MerchantShipOrderView();
        },
      ),
    );
  }
}

class _MerchantShipOrderView extends StatefulWidget {
  const _MerchantShipOrderView();

  @override
  State<_MerchantShipOrderView> createState() => _MerchantShipOrderViewState();
}

class _MerchantShipOrderViewState extends State<_MerchantShipOrderView> {
  final _driverNameCtrl = TextEditingController();
  final _driverPhoneCtrl = TextEditingController();
  final _trackingNumberCtrl = TextEditingController();
  final _notesCtrl = TextEditingController();

  @override
  void dispose() {
    _driverNameCtrl.dispose();
    _driverPhoneCtrl.dispose();
    _trackingNumberCtrl.dispose();
    _notesCtrl.dispose();
    super.dispose();
  }

  void _submit() {
    final param = MerchantOrderShipSendParam(
      driverName: _driverNameCtrl.text.trim().isEmpty ? null : _driverNameCtrl.text.trim(),
      driverPhone: _driverPhoneCtrl.text.trim().isEmpty ? null : _driverPhoneCtrl.text.trim(),
      trackingNumber: _trackingNumberCtrl.text.trim().isEmpty ? null : _trackingNumberCtrl.text.trim(),
      notes: _notesCtrl.text.trim().isEmpty ? null : _notesCtrl.text.trim(),
    );
    context.read<MerchantShipOrderBloc>().add(MerchantShipOrderEventShip(param));
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<MerchantShipOrderBloc>().state;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => navigatorKey.currentState?.pop(),
          child: Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.white,
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.greyBorder),
            ),
            child: const Icon(
              Icons.arrow_back,
              color: AppColors.textDark,
              size: 18,
            ),
          ),
        ),
        title: const Text(
          'Kirim Pesanan',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.textDark,
          ),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.white,
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
                    label: 'Nama Driver (opsional)',
                    controller: _driverNameCtrl,
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(
                    label: 'No. HP Driver (opsional)',
                    controller: _driverPhoneCtrl,
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(
                    label: 'No. Resi (opsional)',
                    controller: _trackingNumberCtrl,
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(
                    label: 'Catatan (opsional)',
                    controller: _notesCtrl,
                    maxLines: 3,
                  ),
                ],
              ),
            ),
          ),
          if (state.isLoading) const LoadingAppWidget(),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: state.isLoading ? null : _submit,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 14),
            backgroundColor: AppColors.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Text(
            'Kirim',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    TextInputType? keyboardType,
    int maxLines = 1,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: AppColors.greyText, fontSize: 13),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.greyBorder),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.greyBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.primary),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
    );
  }
}
