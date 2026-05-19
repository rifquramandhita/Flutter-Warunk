import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/merchant/presentation/payment_method/bloc/merchant_payment_method_bloc.dart';
import 'package:warunk/theme/app_colors.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Entry point
// ─────────────────────────────────────────────────────────────────────────────
class MerchantPaymentMethodScreen extends StatelessWidget {
  const MerchantPaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MerchantPaymentMethodBloc(),
      child: const _MerchantPaymentMethodView(),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Main view
// ─────────────────────────────────────────────────────────────────────────────
class _MerchantPaymentMethodView extends StatelessWidget {
  const _MerchantPaymentMethodView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: _buildAppBar(context),
      body: BlocBuilder<MerchantPaymentMethodBloc, MerchantPaymentMethodState>(
        builder: (context, state) {
          return SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Pilih metode pembayaran yang tersedia di toko Anda.',
                  style: TextStyle(fontSize: 13, color: AppColors.greyText),
                ),
                const SizedBox(height: 20),

                // Methods Card
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: AppColors.greyBorder.withValues(alpha: 0.5),
                    ),
                  ),
                  child: Column(
                    children: [
                      for (var i = 0; i < state.methods.length; i++) ...[
                        _MethodItemRow(item: state.methods[i]),
                        if (i < state.methods.length - 1)
                          const Divider(height: 1, color: AppColors.greyBorder),
                      ],
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // Info Card
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF0F9FF), // very light blue bg
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: const Color(0xFFE0F2FE),
                    ), // light blue border
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Icon(
                            Icons.info_outline,
                            color: Color(0xFF0284C7),
                            size: 18,
                          ), // blue icon
                          SizedBox(width: 8),
                          Text(
                            'Info',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF0284C7), // blue text
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Aktifkan minimal 1 metode pembayaran untuk menerima pesanan.',
                        style: TextStyle(
                          fontSize: 13,
                          color: Color(0xFF0369A1), // slightly darker blue text
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.background,
      elevation: 0,
      centerTitle: true,
      leading: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
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
        'Metode Pembayaran',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: AppColors.textDark,
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Method item row
// ─────────────────────────────────────────────────────────────────────────────
class _MethodItemRow extends StatelessWidget {
  const _MethodItemRow({required this.item});
  final PaymentMethodItem item;

  Widget _buildIcon() {
    switch (item.iconType) {
      case 'cash':
        return Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: const Color(0xFFFFF7ED),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(
            Icons.account_balance_wallet_outlined,
            color: Color(0xFFF97316),
          ),
        );
      case 'bank':
        return Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: const Color(0xFFFEF9C3),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(
            Icons.account_balance_outlined,
            color: Color(0xFFEAB308),
          ),
        );
      case 'qris':
        return Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: const Color(0xFFEFF6FF),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(Icons.qr_code_scanner, color: Color(0xFF3B82F6)),
        );
      case 'ewallet':
        return Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: const Color(0xFFF0F9FF),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(
            Icons.account_balance_wallet,
            color: Color(0xFF0EA5E9),
          ),
        );
      case 'gateway':
      default:
        return Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: const Color(0xFFF3F4F6),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(
            Icons.receipt_long_outlined,
            color: Color(0xFF6B7280),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        children: [
          _buildIcon(),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textDark,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  item.isActive ? 'Aktif' : 'Nonaktif',
                  style: TextStyle(
                    fontSize: 12,
                    color: item.isActive
                        ? AppColors.primary
                        : AppColors.greyText,
                  ),
                ),
              ],
            ),
          ),
          _CustomSwitch(
            isActive: item.isActive,
            onChanged: () => context.read<MerchantPaymentMethodBloc>().add(
              MerchantPaymentMethodToggled(item.id),
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Animated Toggle Switch
// ─────────────────────────────────────────────────────────────────────────────
class _CustomSwitch extends StatelessWidget {
  const _CustomSwitch({required this.isActive, required this.onChanged});
  final bool isActive;
  final VoidCallback onChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onChanged,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        width: 48,
        height: 28,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: isActive ? AppColors.primary : AppColors.greyBorder,
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 220),
              curve: Curves.easeInOut,
              left: isActive ? 22 : 2,
              top: 2,
              child: Container(
                width: 24,
                height: 24,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 4,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
