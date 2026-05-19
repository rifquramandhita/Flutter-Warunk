// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/customer/presentation/checkout/bloc/customer_checkout_bloc.dart';
import 'package:warunk/app/features/customer/presentation/payment/customer_payment_screen.dart';
import 'package:warunk/core/widgets/checkout_step_indicator.dart';
import 'package:warunk/theme/app_colors.dart';

class CustomerCheckoutScreen extends StatelessWidget {
  const CustomerCheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CustomerCheckoutBloc(),
      child: const _CheckoutView(),
    );
  }
}

class _CheckoutView extends StatelessWidget {
  const _CheckoutView();

  static const _items = [
    ('Indomie Goreng', '1×', 'Rp3.500'),
    ('Telur Ayam Negeri', '1×', 'Rp23.000'),
    ('Teh Botol Sosro 450ml', '1×', 'Rp4.500'),
    ('Kopi Sachet Kapal Api Special Mix', '1×', 'Rp1.500'),
  ];

  static const _deliveryOptions = [
    (label: 'Ambil Sendiri', subtitle: '', price: 'Rp0'),
    (
      label: 'Kurir Toko',
      subtitle: 'Diantar oleh kurir warung',
      price: 'Rp8.000',
    ),
    (
      label: 'Pihak Ketiga',
      subtitle: 'GrabExpress / Lalamove',
      price: 'Rp12.000',
    ),
  ];

  String _fmt(int v) {
    final s = v.toString();
    final buf = StringBuffer('Rp');
    for (var i = 0; i < s.length; i++) {
      if (i > 0 && (s.length - i) % 3 == 0) buf.write('.');
      buf.write(s[i]);
    }
    return buf.toString();
  }

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
          'Checkout',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: AppColors.textDark,
          ),
        ),
      ),
      body: BlocBuilder<CustomerCheckoutBloc, CustomerCheckoutState>(
        builder: (context, state) {
          return Stack(
            children: [
              SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 140),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Step indicator – step 1 (Checkout) active
                    CheckoutStepIndicator(currentStep: 1),
                    const SizedBox(height: 20),

                    // ① Alamat Pengiriman
                    _sectionCard(
                      icon: Icons.location_on_rounded,
                      title: 'Alamat Pengiriman',
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Andi Pratama',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.textDark,
                                  ),
                                ),
                                SizedBox(height: 3),
                                Text(
                                  '0812-3456-7890',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: AppColors.greyText,
                                  ),
                                ),
                                SizedBox(height: 3),
                                Text(
                                  'Jl. Raya Bekasi No. 10, Jakarta Timur',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: AppColors.greyText,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.primary.withValues(alpha: 0.08),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Ubah',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.primary,
                                  ),
                                ),
                                Icon(
                                  Icons.chevron_right_rounded,
                                  size: 14,
                                  color: AppColors.primary,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),

                    // ② Pesanan
                    _sectionCard(
                      icon: Icons.storefront_rounded,
                      title: 'Pesanan',
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 36,
                                height: 36,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF4A7C59),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Center(
                                  child: Text(
                                    'WM',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              const Text(
                                'Warung Madura Cahaya',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.textDark,
                                ),
                              ),
                              const SizedBox(width: 8),
                              _badge('Buka'),
                            ],
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            '4 item',
                            style: TextStyle(
                              fontSize: 12,
                              color: AppColors.greyText,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Divider(
                              height: 1,
                              color: AppColors.greyBorder,
                            ),
                          ),
                          ..._items.map(
                            (item) => Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      item.$1,
                                      style: const TextStyle(
                                        fontSize: 13,
                                        color: AppColors.greyText,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '${item.$2}  ',
                                    style: const TextStyle(
                                      fontSize: 13,
                                      color: AppColors.greyText,
                                    ),
                                  ),
                                  Text(
                                    item.$3,
                                    style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.textDark,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 2, bottom: 10),
                            child: Divider(
                              height: 1,
                              color: AppColors.greyBorder,
                            ),
                          ),
                          Row(
                            children: const [
                              Text(
                                'Subtotal',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.textDark,
                                ),
                              ),
                              Spacer(),
                              Text(
                                'Rp18.000',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.textDark,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),

                    // ③ Metode Pengiriman
                    _sectionCard(
                      icon: Icons.delivery_dining_rounded,
                      title: 'Metode Pengiriman',
                      child: Column(
                        children: _deliveryOptions.indexed.map((e) {
                          final (i, opt) = e;
                          final selected = state.deliveryMethod == i;
                          return GestureDetector(
                            onTap: () => context
                                .read<CustomerCheckoutBloc>()
                                .add(CustomerCheckoutDeliveryChanged(i)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Row(
                                children: [
                                  Radio<int>(
                                    value: i,
                                    groupValue: state.deliveryMethod,
                                    onChanged: (v) => context
                                        .read<CustomerCheckoutBloc>()
                                        .add(
                                          CustomerCheckoutDeliveryChanged(v!),
                                        ),
                                    activeColor: AppColors.primary,
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          opt.label,
                                          style: const TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.textDark,
                                          ),
                                        ),
                                        if (opt.subtitle.isNotEmpty)
                                          Text(
                                            opt.subtitle,
                                            style: const TextStyle(
                                              fontSize: 11,
                                              color: AppColors.greyText,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    opt.price,
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w700,
                                      color: selected
                                          ? AppColors.primary
                                          : AppColors.textDark,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(height: 12),

                    // ④ Voucher & Promo
                    if (state.hasVoucher)
                      _sectionCard(
                        icon: Icons.local_offer_rounded,
                        title: 'Voucher & Promo',
                        trailing: const Icon(
                          Icons.chevron_right_rounded,
                          color: AppColors.greyText,
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.primary.withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: AppColors.primary.withValues(
                                    alpha: 0.3,
                                  ),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(
                                    Icons.local_offer_rounded,
                                    size: 12,
                                    color: AppColors.primary,
                                  ),
                                  const SizedBox(width: 5),
                                  const Text(
                                    'Gratis Ongkir',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  GestureDetector(
                                    onTap: () => context
                                        .read<CustomerCheckoutBloc>()
                                        .add(CustomerCheckoutVoucherRemoved()),
                                    child: const Icon(
                                      Icons.close,
                                      size: 12,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    if (state.hasVoucher) const SizedBox(height: 12),

                    // ⑤ Ringkasan Pembayaran
                    _sectionCard(
                      icon: Icons.receipt_long_rounded,
                      title: 'Ringkasan Pembayaran',
                      child: Column(
                        children: [
                          _priceRow('Subtotal', 'Rp18.000'),
                          const SizedBox(height: 10),
                          _priceRow('Ongkir', _fmt(state.ongkir)),
                          const SizedBox(height: 10),
                          Row(
                            children: const [
                              Text(
                                'Biaya layanan',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: AppColors.greyText,
                                ),
                              ),
                              SizedBox(width: 4),
                              Icon(
                                Icons.info_outline,
                                size: 13,
                                color: AppColors.greyText,
                              ),
                              Spacer(),
                              Text(
                                'Rp2.000',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: AppColors.textDark,
                                ),
                              ),
                            ],
                          ),
                          if (state.hasVoucher) ...[
                            const SizedBox(height: 10),
                            Row(
                              children: const [
                                Text(
                                  'Diskon',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: AppColors.primary,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  '-Rp8.000',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ],
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 12),
                            child: Divider(
                              height: 1,
                              color: AppColors.greyBorder,
                            ),
                          ),
                          Row(
                            children: [
                              const Text(
                                'Total',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w800,
                                  color: AppColors.textDark,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                _fmt(state.total),
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w900,
                                  color: AppColors.textDark,
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

              // ── Bottom bar ──────────────────────────────────────────────
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Total',
                            style: TextStyle(
                              fontSize: 12,
                              color: AppColors.greyText,
                            ),
                          ),
                          Text(
                            _fmt(state.total),
                            style: const TextStyle(
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
                        child: ElevatedButton(
                          onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => const CustomerPaymentScreen(),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            foregroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                          ),
                          child: const Text(
                            'Pilih Pembayaran',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                            ),
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

  static Widget _sectionCard({
    required IconData icon,
    required String title,
    required Widget child,
    Widget? trailing,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.greyBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: AppColors.primary, size: 20),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  color: AppColors.textDark,
                ),
              ),
              if (trailing != null) ...[const Spacer(), trailing],
            ],
          ),
          const SizedBox(height: 14),
          child,
        ],
      ),
    );
  }

  static Widget _badge(String text) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
    decoration: BoxDecoration(
      color: AppColors.primary.withValues(alpha: 0.1),
      borderRadius: BorderRadius.circular(6),
    ),
    child: Text(
      text,
      style: const TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w700,
        color: AppColors.primary,
      ),
    ),
  );

  static Widget _priceRow(String label, String value) => Row(
    children: [
      Text(
        label,
        style: const TextStyle(fontSize: 13, color: AppColors.greyText),
      ),
      const Spacer(),
      Text(
        value,
        style: const TextStyle(fontSize: 13, color: AppColors.textDark),
      ),
    ],
  );
}
