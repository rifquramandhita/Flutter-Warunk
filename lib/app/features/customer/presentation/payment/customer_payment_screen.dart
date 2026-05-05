// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/customer/presentation/order_success/customer_order_success_screen.dart';
import 'package:warunk/app/features/customer/presentation/payment/bloc/customer_payment_bloc.dart';
import 'package:warunk/core/widgets/checkout_step_indicator.dart';
import 'package:warunk/core/constants/app_colors.dart';

// ── Data ──────────────────────────────────────────────────────────────────────
class _Method {
  final String name;
  final String subtitle;
  final Color iconColor;
  final IconData icon;
  const _Method(this.name, this.subtitle, this.iconColor, this.icon);
}

const _eWallets = [
  _Method('GoPay', '', Color(0xFF00AED6), Icons.account_balance_wallet_rounded),
  _Method('OVO', '', Color(0xFF4C3494), Icons.account_balance_wallet_rounded),
  _Method('DANA', '', Color(0xFF118EEA), Icons.account_balance_wallet_rounded),
];

const _virtualAccounts = [
  _Method(
    'BCA VA',
    'Transfer via BCA Virtual Account',
    Color(0xFF005BAC),
    Icons.account_balance_rounded,
  ),
  _Method(
    'BNI VA',
    'Transfer via BNI Virtual Account',
    Color(0xFFE05B0B),
    Icons.account_balance_rounded,
  ),
  _Method(
    'Mandiri VA',
    'Transfer via Mandiri Virtual Account',
    Color(0xFF003D79),
    Icons.account_balance_rounded,
  ),
];

const _cod = [
  _Method(
    'Bayar di tempat',
    'Bayar tunai saat pesanan diterima',
    Color(0xFF2D6A4F),
    Icons.payments_rounded,
  ),
];

// ─────────────────────────────────────────────────────────────────────────────
class CustomerPaymentScreen extends StatelessWidget {
  const CustomerPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CustomerPaymentBloc(),
      child: const _PaymentView(),
    );
  }
}

class _PaymentView extends StatelessWidget {
  const _PaymentView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.greyBorder),
            ),
            child: const Icon(
              Icons.arrow_back_rounded,
              color: AppColors.textDark,
              size: 20,
            ),
          ),
        ),
        title: const Text(
          'Metode Pembayaran',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: AppColors.textDark,
          ),
        ),
      ),
      body: BlocBuilder<CustomerPaymentBloc, CustomerPaymentState>(
        builder: (context, state) {
          return Stack(
            children: [
              SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 140),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Step indicator – step 2 (Bayar) active
                    CheckoutStepIndicator(
                      currentStep: 2,
                      labels: const ['Keranjang', 'Pengiriman', 'Bayar'],
                    ),
                    const SizedBox(height: 22),

                    const Text(
                      'Pilih metode',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        color: AppColors.textDark,
                      ),
                    ),
                    const SizedBox(height: 14),

                    // ── E-Wallet ──────────────────────────────────────────
                    _sectionLabel('E-Wallet'),
                    const SizedBox(height: 8),
                    _methodCard(context, state, _eWallets, startIndex: 0),
                    const SizedBox(height: 14),

                    // ── Virtual Account ────────────────────────────────────
                    _sectionLabel('Virtual Account'),
                    const SizedBox(height: 8),
                    _methodCard(
                      context,
                      state,
                      _virtualAccounts,
                      startIndex: 3,
                    ),
                    const SizedBox(height: 14),

                    // ── Tunai / COD ───────────────────────────────────────
                    _sectionLabel('Tunai / COD'),
                    const SizedBox(height: 8),
                    _methodCard(context, state, _cod, startIndex: 6),
                    const SizedBox(height: 20),

                    // ── Ringkasan Pesanan ─────────────────────────────────
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: AppColors.greyBorder),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Store header
                          Padding(
                            padding: const EdgeInsets.all(14),
                            child: Row(
                              children: [
                                // Gradient store thumbnail
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Container(
                                    width: 56,
                                    height: 56,
                                    decoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          Color(0xFF1B5E20),
                                          Color(0xFF52B788),
                                        ],
                                      ),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        'WM',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w900,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          const Text(
                                            'Warung Madura Cahaya',
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w700,
                                              color: AppColors.textDark,
                                            ),
                                          ),
                                          const SizedBox(width: 6),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 7,
                                              vertical: 2,
                                            ),
                                            decoration: BoxDecoration(
                                              color: AppColors.primary
                                                  .withValues(alpha: 0.1),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: const Text(
                                              'Buka',
                                              style: TextStyle(
                                                fontSize: 11,
                                                fontWeight: FontWeight.w700,
                                                color: AppColors.primary,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 5),
                                      const Row(
                                        children: [
                                          Icon(
                                            Icons.shopping_bag_outlined,
                                            size: 13,
                                            color: AppColors.greyText,
                                          ),
                                          SizedBox(width: 4),
                                          Text(
                                            '4 item',
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: AppColors.greyText,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 3),
                                      const Row(
                                        children: [
                                          Icon(
                                            Icons.delivery_dining_rounded,
                                            size: 13,
                                            color: AppColors.greyText,
                                          ),
                                          SizedBox(width: 4),
                                          Text(
                                            'Pengiriman oleh Kurir Toko',
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: AppColors.greyText,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 3),
                                      const Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.location_on_rounded,
                                            size: 13,
                                            color: AppColors.greyText,
                                          ),
                                          SizedBox(width: 4),
                                          Expanded(
                                            child: Text(
                                              'Jl. Raya Bekasi No. 123\nJakarta Timur, DKI Jakarta',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: AppColors.greyText,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Divider(height: 1, color: AppColors.greyBorder),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 12,
                            ),
                            child: Row(
                              children: const [
                                Text(
                                  'Total Bayar',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.textDark,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  'Rp20.000',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w900,
                                    color: AppColors.primary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),

                    // ── Info banner ───────────────────────────────────────
                    Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF8E1),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: const Color(0xFFF59E0B).withValues(alpha: 0.3),
                        ),
                      ),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.verified_user_outlined,
                            color: Color(0xFFF59E0B),
                            size: 20,
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              'Pembayaran akan diverifikasi otomatis',
                              style: TextStyle(
                                fontSize: 13,
                                color: AppColors.textDark,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // ── Bottom bar ────────────────────────────────────────────
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.fromLTRB(
                    16,
                    14,
                    16,
                    MediaQuery.of(context).padding.bottom + 14,
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 16,
                        offset: Offset(0, -4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total Bayar',
                            style: TextStyle(
                              fontSize: 12,
                              color: AppColors.greyText,
                            ),
                          ),
                          Text(
                            'Rp20.000',
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w900,
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      SizedBox(
                        height: 50,
                        child: ElevatedButton.icon(
                          onPressed: () =>
                              Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                  builder: (_) => CustomerOrderSuccessScreen(
                                    paymentMethod: state.selectedName,
                                  ),
                                ),
                                (route) => route.isFirst,
                              ),
                          icon: const Icon(
                            Icons.lock_outline_rounded,
                            size: 18,
                          ),
                          label: const Text(
                            'Bayar Sekarang',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            foregroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  // ── Section label ─────────────────────────────────────────────────────────
  Widget _sectionLabel(String label) => Text(
    label,
    style: const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      color: AppColors.greyText,
    ),
  );

  // ── Method card (section container) ──────────────────────────────────────
  Widget _methodCard(
    BuildContext context,
    CustomerPaymentState state,
    List<_Method> methods, {
    required int startIndex,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.greyBorder),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: List.generate(methods.length, (i) {
          final m = methods[i];
          final idx = startIndex + i;
          final selected = state.selectedIndex == idx;
          final isLast = i == methods.length - 1;
          return GestureDetector(
            onTap: () =>
                context.read<CustomerPaymentBloc>().add(CustomerPaymentMethodSelected(idx)),
            child: Container(
              color: selected
                  ? AppColors.primary.withValues(alpha: 0.07)
                  : Colors.transparent,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 13,
                    ),
                    child: Row(
                      children: [
                        // Method icon
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: m.iconColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(m.icon, color: Colors.white, size: 22),
                        ),
                        const SizedBox(width: 12),
                        // Name + subtitle
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                m.name,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: selected
                                      ? AppColors.primary
                                      : AppColors.textDark,
                                ),
                              ),
                              if (m.subtitle.isNotEmpty)
                                Text(
                                  m.subtitle,
                                  style: const TextStyle(
                                    fontSize: 11,
                                    color: AppColors.greyText,
                                  ),
                                ),
                            ],
                          ),
                        ),
                        // Radio
                        Radio<int>(
                          value: idx,
                          groupValue: state.selectedIndex,
                          onChanged: (v) => context.read<CustomerPaymentBloc>().add(
                            CustomerPaymentMethodSelected(v!),
                          ),
                          activeColor: AppColors.primary,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                        ),
                      ],
                    ),
                  ),
                  if (!isLast)
                    const Divider(
                      height: 1,
                      color: AppColors.greyBorder,
                      indent: 66,
                    ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
