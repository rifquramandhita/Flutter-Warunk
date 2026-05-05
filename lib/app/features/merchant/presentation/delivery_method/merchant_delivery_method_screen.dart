import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:warunk/app/features/merchant/presentation/delivery_method/bloc/merchant_delivery_method_bloc.dart';
import 'package:warunk/core/constants/app_colors.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Entry point
// ─────────────────────────────────────────────────────────────────────────────
class MerchantDeliveryMethodScreen extends StatelessWidget {
  const MerchantDeliveryMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MerchantDeliveryMethodBloc(),
      child: const _MerchantDeliveryMethodView(),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Main view
// ─────────────────────────────────────────────────────────────────────────────
class _MerchantDeliveryMethodView extends StatelessWidget {
  const _MerchantDeliveryMethodView();

  @override
  Widget build(BuildContext context) {
    return BlocListener<MerchantDeliveryMethodBloc, MerchantDeliveryMethodState>(
      listenWhen: (prev, curr) => curr.isSaved && !prev.isSaved,
      listener: (context, _) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Metode pengiriman berhasil disimpan!'),
            backgroundColor: AppColors.primary,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        );
        Navigator.of(context).pop();
      },
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: _buildAppBar(context),
        body: BlocBuilder<MerchantDeliveryMethodBloc, MerchantDeliveryMethodState>(
          builder: (context, state) {
            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          'Pilih metode pengiriman yang Anda sediakan.',
                          style: TextStyle(
                            fontSize: 13,
                            color: AppColors.greyText,
                          ),
                        ),
                        const SizedBox(height: 20),
                        
                        // Methods Card
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: AppColors.greyBorder.withValues(alpha: 0.5)),
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
                        
                        // Ongkir Diantar Toko Card
                        _ShippingFeeCard(state: state),
                      ],
                    ),
                  ),
                ),
                
                // Bottom Button
                _BottomActionButtons(state: state),
              ],
            );
          },
        ),
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
        'Metode Pengiriman',
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
  final DeliveryMethodItem item;

  Widget _buildIcon() {
    switch (item.iconType) {
      case 'pickup':
        return Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: const Color(0xFFF0FDF4),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(Icons.storefront, color: Color(0xFF14B8A6)),
        );
      case 'store_delivery':
        return Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: const Color(0xFFF0FDFA),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(Icons.delivery_dining, color: Color(0xFF0D9488)),
        );
      case 'third_party':
      default:
        return Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: const Color(0xFFEFF6FF),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(Icons.local_shipping, color: Color(0xFF3B82F6)),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                  item.description,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.greyText,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  item.isActive ? 'Aktif' : 'Nonaktif',
                  style: TextStyle(
                    fontSize: 12,
                    color: item.isActive ? AppColors.primary : AppColors.greyText,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: _CustomSwitch(
              isActive: item.isActive,
              onChanged: () => context.read<MerchantDeliveryMethodBloc>().add(MerchantDeliveryMethodToggled(item.id)),
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Shipping Fee Card
// ─────────────────────────────────────────────────────────────────────────────
class _ShippingFeeCard extends StatelessWidget {
  const _ShippingFeeCard({required this.state});
  final MerchantDeliveryMethodState state;

  static final _currency = NumberFormat.currency(
    locale: 'id',
    symbol: 'Rp',
    decimalDigits: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.greyBorder.withValues(alpha: 0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Ongkir Diantar Toko',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AppColors.textDark,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Atur ongkir berdasarkan jarak (km)',
            style: TextStyle(
              fontSize: 12,
              color: AppColors.greyText,
            ),
          ),
          const SizedBox(height: 16),
          for (var i = 0; i < state.feeTiers.length; i++) ...[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    state.feeTiers[i].distance,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textDark,
                    ),
                  ),
                  Text(
                    _currency.format(state.feeTiers[i].fee),
                    style: const TextStyle(
                      fontSize: 13,
                      color: AppColors.textDark,
                    ),
                  ),
                ],
              ),
            ),
            if (i < state.feeTiers.length - 1)
              const Divider(height: 1, color: AppColors.greyBorder),
          ],
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

// ─────────────────────────────────────────────────────────────────────────────
// Bottom Actions
// ─────────────────────────────────────────────────────────────────────────────
class _BottomActionButtons extends StatelessWidget {
  const _BottomActionButtons({required this.state});
  final MerchantDeliveryMethodState state;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SizedBox(
        width: double.infinity,
        height: 48,
        child: ElevatedButton(
          onPressed: state.isSaving
              ? null
              : () => context.read<MerchantDeliveryMethodBloc>().add(MerchantDeliveryMethodSaved()),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            disabledBackgroundColor: AppColors.primary.withValues(alpha: 0.5),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 0,
          ),
          child: state.isSaving
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2.5, color: Colors.white),
                )
              : const Text(
                  'Simpan Pengaturan',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
        ),
      ),
    );
  }
}
