import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/customer/presentation/order_success/bloc/customer_order_success_bloc.dart';
import 'package:warunk/app/features/customer/presentation/order_success/bloc/customer_order_success_event.dart';
import 'package:warunk/app/features/customer/presentation/order_success/bloc/customer_order_success_state.dart';
import 'package:warunk/core/constants/app_colors.dart';

class CustomerOrderSuccessScreen extends StatelessWidget {
  final String paymentMethod;
  const CustomerOrderSuccessScreen({super.key, required this.paymentMethod});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CustomerOrderSuccessBloc()..add(CustomerLoadOrderSuccessData()),
      child: _OrderSuccessView(paymentMethod: paymentMethod),
    );
  }
}

class _OrderSuccessView extends StatefulWidget {
  final String paymentMethod;
  const _OrderSuccessView({required this.paymentMethod});

  @override
  State<_OrderSuccessView> createState() => _OrderSuccessViewState();
}

class _OrderSuccessViewState extends State<_OrderSuccessView>
    with TickerProviderStateMixin {
  late final AnimationController _checkCtrl;
  late final AnimationController _confettiCtrl;
  late final Animation<double> _checkScale;
  late final Animation<double> _checkFade;
  late final Animation<double> _contentFade;
  late final Animation<Offset> _contentSlide;



  static const _relatedProducts = [
    (
      'Indomie Goreng',
      'Rp3.500',
      Icons.ramen_dining_rounded,
      Color(0xFFFFF8E1),
      true,
    ),
    (
      'Teh Botol',
      'Rp4.500',
      Icons.local_drink_rounded,
      Color(0xFFFFE0E0),
      false,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _checkCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    _confettiCtrl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();
    _checkScale = CurvedAnimation(parent: _checkCtrl, curve: Curves.elasticOut);
    _checkFade = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _checkCtrl, curve: Curves.easeIn));
    _contentFade = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _checkCtrl, curve: const Interval(0.5, 1.0)),
    );
    _contentSlide = Tween<Offset>(begin: const Offset(0, 0.2), end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: _checkCtrl,
            curve: const Interval(0.5, 1.0, curve: Curves.easeOut),
          ),
        );
    _checkCtrl.forward();
  }

  @override
  void dispose() {
    _checkCtrl.dispose();
    _confettiCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: BlocBuilder<CustomerOrderSuccessBloc, CustomerOrderSuccessState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 40),

                  // ── Confetti + checkmark ────────────────────────────────────
                  SizedBox(
                    height: 180,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        AnimatedBuilder(
                          animation: _confettiCtrl,
                          builder: (context, child) => CustomPaint(
                            size: const Size(280, 180),
                            painter: _ConfettiPainter(_confettiCtrl.value),
                          ),
                        ),
                        FadeTransition(
                          opacity: _checkFade,
                          child: ScaleTransition(
                            scale: _checkScale,
                            child: Container(
                              width: 96,
                              height: 96,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color(0xFF52B788),
                                    Color(0xFF2D6A4F),
                                  ],
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.primary.withValues(
                                      alpha: 0.4,
                                    ),
                                    blurRadius: 24,
                                    offset: const Offset(0, 8),
                                  ),
                                ],
                              ),
                              child: const Icon(
                                Icons.check_rounded,
                                color: Colors.white,
                                size: 48,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // ── Title ───────────────────────────────────────────────────
                  SlideTransition(
                    position: _contentSlide,
                    child: FadeTransition(
                      opacity: _contentFade,
                      child: const Column(
                        children: [
                          Text(
                            'Pesanan Berhasil!',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w900,
                              color: AppColors.primary,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Pesananmu sudah diterima merchant\ndan sedang diproses.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.greyText,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // ── Order detail card ───────────────────────────────────────
                  SlideTransition(
                    position: _contentSlide,
                    child: FadeTransition(
                      opacity: _contentFade,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: AppColors.greyBorder),
                          ),
                          child: Column(
                            children: [
                              _detailRow(
                                Icons.receipt_long_rounded,
                                'No. Pesanan',
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      state.orderId,
                                      style: const TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.textDark,
                                      ),
                                    ),
                                    const SizedBox(width: 6),
                                    GestureDetector(
                                      onTap: () => Clipboard.setData(
                                        ClipboardData(text: state.orderId),
                                      ),
                                      child: const Icon(
                                        Icons.copy_rounded,
                                        size: 16,
                                        color: AppColors.greyText,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Divider(
                                height: 1,
                                color: AppColors.greyBorder,
                                indent: 16,
                                endIndent: 16,
                              ),
                              _detailRow(
                                Icons.storefront_rounded,
                                'Merchant',
                                trailing: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Warung Madura Cahaya',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.textDark,
                                      ),
                                    ),
                                    Icon(
                                      Icons.chevron_right_rounded,
                                      size: 16,
                                      color: AppColors.greyText,
                                    ),
                                  ],
                                ),
                              ),
                              const Divider(
                                height: 1,
                                color: AppColors.greyBorder,
                                indent: 16,
                                endIndent: 16,
                              ),
                              _detailRow(
                                Icons.delivery_dining_rounded,
                                'Estimasi antar',
                                trailing: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      '10–20 menit',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.textDark,
                                      ),
                                    ),
                                    Icon(
                                      Icons.chevron_right_rounded,
                                      size: 16,
                                      color: AppColors.greyText,
                                    ),
                                  ],
                                ),
                              ),
                              const Divider(
                                height: 1,
                                color: AppColors.greyBorder,
                              ),
                              _detailRow(
                                Icons.local_offer_rounded,
                                'Total bayar',
                                trailing: const Text(
                                  'Rp20.000',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.textDark,
                                  ),
                                ),
                              ),
                              const Divider(
                                height: 1,
                                color: AppColors.greyBorder,
                                indent: 16,
                                endIndent: 16,
                              ),
                              _detailRow(
                                Icons.credit_card_rounded,
                                'Metode bayar',
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      widget.paymentMethod,
                                      style: const TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.textDark,
                                      ),
                                    ),
                                    const SizedBox(width: 6),
                                    Container(
                                      width: 28,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF005BAC),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          'BCA',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 9,
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Divider(
                                height: 1,
                                color: AppColors.greyBorder,
                                indent: 16,
                                endIndent: 16,
                              ),
                              _detailRow(
                                Icons.access_time_rounded,
                                'Status',
                                trailing: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.primary.withValues(
                                      alpha: 0.1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Text(
                                    'Diproses',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // ── Action buttons ──────────────────────────────────────────
                  SlideTransition(
                    position: _contentSlide,
                    child: FadeTransition(
                      opacity: _contentFade,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: ElevatedButton.icon(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.location_on_outlined,
                                  size: 20,
                                ),
                                label: const Text(
                                  'Lacak Pesanan',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primary,
                                  foregroundColor: Colors.white,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: OutlinedButton.icon(
                                onPressed: () => Navigator.of(
                                  context,
                                ).popUntil((r) => r.isFirst),
                                icon: const Icon(
                                  Icons.home_outlined,
                                  size: 20,
                                  color: AppColors.primary,
                                ),
                                label: const Text(
                                  'Kembali ke Home',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15,
                                    color: AppColors.primary,
                                  ),
                                ),
                                style: OutlinedButton.styleFrom(
                                  side: const BorderSide(
                                    color: AppColors.primary,
                                    width: 1.5,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // ── Reorder section ─────────────────────────────────────────
                  SlideTransition(
                    position: _contentSlide,
                    child: FadeTransition(
                      opacity: _contentFade,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Text(
                                  'Beli lagi dari Warung Madura Cahaya',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.textDark,
                                  ),
                                ),
                                const Spacer(),
                                GestureDetector(
                                  onTap: () {},
                                  child: const Row(
                                    children: [
                                      Text(
                                        'Lihat semua',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: AppColors.primary,
                                          fontWeight: FontWeight.w600,
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
                            const SizedBox(height: 12),
                            SizedBox(
                              height: 160,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemCount: _relatedProducts.length,
                                separatorBuilder: (context, index) =>
                                    const SizedBox(width: 12),
                                itemBuilder: (_, i) {
                                  final (
                                    name,
                                    price,
                                    icon,
                                    color,
                                    isBestSeller,
                                  ) = _relatedProducts[i];
                                  return Container(
                                    width: 130,
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius: BorderRadius.circular(14),
                                      border: Border.all(
                                        color: AppColors.greyBorder,
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color: color,
                                              borderRadius:
                                                  const BorderRadius.vertical(
                                                    top: Radius.circular(13),
                                                  ),
                                            ),
                                            child: Center(
                                              child: Icon(
                                                icon,
                                                size: 46,
                                                color: AppColors.primaryLight,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                name,
                                                style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w700,
                                                  color: AppColors.textDark,
                                                ),
                                              ),
                                              if (isBestSeller)
                                                Row(
                                                  children: const [
                                                    Icon(
                                                      Icons.star_rounded,
                                                      size: 11,
                                                      color: Color(0xFFFBBC05),
                                                    ),
                                                    SizedBox(width: 3),
                                                    Text(
                                                      'Best Seller',
                                                      style: TextStyle(
                                                        fontSize: 10,
                                                        color: Color(
                                                          0xFFF59E0B,
                                                        ),
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              const SizedBox(height: 4),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    price,
                                                    style: const TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: AppColors.primary,
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 22,
                                                    height: 22,
                                                    decoration: BoxDecoration(
                                                      color: AppColors.primary,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            6,
                                                          ),
                                                    ),
                                                    child: const Icon(
                                                      Icons.add,
                                                      color: Colors.white,
                                                      size: 14,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // ── Footer ──────────────────────────────────────────────────
                  FadeTransition(
                    opacity: _contentFade,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.verified_user_outlined,
                          size: 14,
                          color: AppColors.primary,
                        ),
                        SizedBox(width: 6),
                        Text(
                          'Belanja aman & nyaman hanya di ',
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.greyText,
                          ),
                        ),
                        Text(
                          'WARRUNK',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w900,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _detailRow(IconData icon, String label, {required Widget trailing}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
      child: Row(
        children: [
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(9),
            ),
            child: Icon(icon, color: AppColors.primary, size: 18),
          ),
          const SizedBox(width: 12),
          Text(
            label,
            style: const TextStyle(fontSize: 13, color: AppColors.greyText),
          ),
          const Spacer(),
          trailing,
        ],
      ),
    );
  }
}

// ── Confetti Painter ──────────────────────────────────────────────────────────
class _ConfettiPainter extends CustomPainter {
  final double progress;
  _ConfettiPainter(this.progress);

  static final _rng = math.Random(42);
  static final _particles = List.generate(
    30,
    (i) => (
      x: _rng.nextDouble(),
      y: _rng.nextDouble(),
      color: [
        const Color(0xFF52B788),
        const Color(0xFFFBBC05),
        const Color(0xFFEA4335),
        const Color(0xFF4285F4),
        const Color(0xFFF59E0B),
        const Color(0xFF74C69D),
      ][i % 6],
      size: 4.0 + _rng.nextDouble() * 5,
      speed: 0.3 + _rng.nextDouble() * 0.7,
      angle: _rng.nextDouble() * math.pi * 2,
    ),
  );

  @override
  void paint(Canvas canvas, Size size) {
    for (final p in _particles) {
      final t = (progress * p.speed + p.y) % 1.0;
      final x = p.x * size.width + math.sin(t * math.pi * 2 + p.angle) * 20;
      final y = t * size.height;
      final paint = Paint()
        ..color = p.color.withValues(alpha: (1 - t).clamp(0.0, 1.0));
      canvas.save();
      canvas.translate(x, y);
      canvas.rotate(t * math.pi * 4);
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromCenter(
            center: Offset.zero,
            width: p.size,
            height: p.size * 0.6,
          ),
          const Radius.circular(2),
        ),
        paint,
      );
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(_ConfettiPainter old) => old.progress != progress;
}
