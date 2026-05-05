import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:warunk/app/features/auth/presentation/login/auth_login_screen.dart';
import 'package:warunk/core/constants/app_colors.dart';

class AuthSplashScreen extends StatefulWidget {
  const AuthSplashScreen({super.key});

  @override
  State<AuthSplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<AuthSplashScreen>
    with TickerProviderStateMixin {
  // Logo scale + fade
  late final AnimationController _logoController;
  late final Animation<double> _logoScale;
  late final Animation<double> _logoFade;

  // Text fade-slide
  late final AnimationController _textController;
  late final Animation<double> _textFade;
  late final Animation<Offset> _textSlide;

  // Floating icons
  late final AnimationController _floatController;

  // Dots indicator
  int _activeDot = 0;
  Timer? _dotTimer;

  @override
  void initState() {
    super.initState();

    // ── Logo animation ──────────────────────────────────────────────────
    _logoController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _logoScale = CurvedAnimation(
      parent: _logoController,
      curve: Curves.elasticOut,
    );
    _logoFade = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _logoController, curve: Curves.easeIn));

    // ── Text animation ──────────────────────────────────────────────────
    _textController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _textFade = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _textController, curve: Curves.easeIn));
    _textSlide = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _textController, curve: Curves.easeOut));

    // ── Float animation ─────────────────────────────────────────────────
    _floatController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);

    // ── Sequence ────────────────────────────────────────────────────────
    _logoController.forward().then((_) {
      _textController.forward();
    });

    // Dot cycle
    _dotTimer = Timer.periodic(const Duration(milliseconds: 700), (_) {
      if (mounted) setState(() => _activeDot = (_activeDot + 1) % 3);
    });

    // Navigate after 3 seconds
    Timer(const Duration(seconds: 3), _navigateToLogin);
  }

  void _navigateToLogin() {
    if (!mounted) return;
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500),
        pageBuilder: (context, animation, secondaryAnimation) =>
            const AuthLoginScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    );
  }

  @override
  void dispose() {
    _logoController.dispose();
    _textController.dispose();
    _floatController.dispose();
    _dotTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          // ── Background blobs ──────────────────────────────────────────
          _buildBlob(
            left: -60,
            top: size.height * 0.05,
            width: 260,
            height: 260,
            color: AppColors.primaryLight.withValues(alpha: 0.18),
          ),
          _buildBlob(
            right: -80,
            top: size.height * 0.25,
            width: 220,
            height: 220,
            color: AppColors.primaryLight.withValues(alpha: 0.13),
          ),
          _buildBlob(
            left: -40,
            bottom: size.height * 0.1,
            width: 200,
            height: 200,
            color: AppColors.primaryLight.withValues(alpha: 0.15),
          ),
          _buildBlob(
            right: -20,
            bottom: size.height * 0.05,
            width: 180,
            height: 180,
            color: AppColors.primaryLight.withValues(alpha: 0.12),
          ),

          // ── Floating decorative icons ─────────────────────────────────
          _FloatingIcon(
            controller: _floatController,
            floatOffset: 8,
            phase: 0.0,
            left: size.width * 0.06,
            top: size.height * 0.18,
            color: AppColors.primaryLight.withValues(alpha: 0.25),
            iconColor: AppColors.primary,
            icon: Icons.shopping_basket_outlined,
          ),
          _FloatingIcon(
            controller: _floatController,
            floatOffset: 10,
            phase: 0.4,
            right: size.width * 0.1,
            top: size.height * 0.22,
            color: const Color(0xFFFFF3C4),
            iconColor: const Color(0xFFF59E0B),
            icon: Icons.percent_rounded,
          ),
          _FloatingIcon(
            controller: _floatController,
            floatOffset: 7,
            phase: 0.7,
            right: size.width * 0.08,
            bottom: size.height * 0.22,
            color: const Color(0xFFD6E8FF),
            iconColor: const Color(0xFF4A90D9),
            icon: Icons.shopping_bag_outlined,
          ),

          // ── Small decorative dots ─────────────────────────────────────
          _buildDot(left: size.width * 0.28, top: size.height * 0.15),
          _buildDot(right: size.width * 0.25, top: size.height * 0.32),
          _buildDot(left: size.width * 0.12, bottom: size.height * 0.30),
          _buildDot(right: size.width * 0.38, bottom: size.height * 0.18),

          // ── Center content ────────────────────────────────────────────
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Logo
                FadeTransition(
                  opacity: _logoFade,
                  child: ScaleTransition(
                    scale: _logoScale,
                    child: _buildStoreLogo(),
                  ),
                ),
                const SizedBox(height: 24),

                // Brand name
                SlideTransition(
                  position: _textSlide,
                  child: FadeTransition(
                    opacity: _textFade,
                    child: const Text(
                      'WARRUNK',
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.w900,
                        color: AppColors.textDark,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),

                // Tagline
                SlideTransition(
                  position: _textSlide,
                  child: FadeTransition(
                    opacity: _textFade,
                    child: const Text(
                      'Warung dekat, belanja cepat',
                      style: TextStyle(
                        fontSize: 15,
                        color: AppColors.greyText,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // ── Dots indicator ────────────────────────────────────────────
          Positioned(
            bottom: 48,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (i) {
                final isActive = i == _activeDot;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: isActive ? 20 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: isActive
                        ? AppColors.primary
                        : AppColors.primary.withValues(alpha: 0.25),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  // ── Helpers ──────────────────────────────────────────────────────────────
  Widget _buildBlob({
    double? left,
    double? right,
    double? top,
    double? bottom,
    required double width,
    required double height,
    required Color color,
  }) {
    return Positioned(
      left: left,
      right: right,
      top: top,
      bottom: bottom,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      ),
    );
  }

  Widget _buildDot({double? left, double? right, double? top, double? bottom}) {
    return Positioned(
      left: left,
      right: right,
      top: top,
      bottom: bottom,
      child: Container(
        width: 7,
        height: 7,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.primaryLight.withValues(alpha: 0.55),
        ),
      ),
    );
  }

  // ── Store Logo ────────────────────────────────────────────────────────────
  Widget _buildStoreLogo() {
    return SizedBox(
      width: 120,
      height: 120,
      child: CustomPaint(painter: _StoreLogoPainter()),
    );
  }
}

// ── Floating Icon Widget ───────────────────────────────────────────────────
class _FloatingIcon extends StatelessWidget {
  const _FloatingIcon({
    required this.controller,
    required this.floatOffset,
    required this.phase,
    required this.color,
    required this.iconColor,
    required this.icon,
    this.left,
    this.right,
    this.top,
    this.bottom,
  });

  final AnimationController controller;
  final double floatOffset;
  final double phase;
  final Color color;
  final Color iconColor;
  final IconData icon;
  final double? left;
  final double? right;
  final double? top;
  final double? bottom;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      right: right,
      top: top,
      bottom: bottom,
      child: AnimatedBuilder(
        animation: controller,
        builder: (_, child) {
          final t = (controller.value + phase) % 1.0;
          final dy = math.sin(t * math.pi * 2) * floatOffset;
          return Transform.translate(offset: Offset(0, dy), child: child);
        },
        child: Container(
          width: 52,
          height: 52,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Icon(icon, color: iconColor, size: 26),
        ),
      ),
    );
  }
}

// ── Store Logo Custom Painter ─────────────────────────────────────────────
class _StoreLogoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    // Outer rounded rectangle background
    final bgPaint = Paint()..color = const Color(0xFFE8F5EE);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, w, h),
        const Radius.circular(28),
      ),
      bgPaint,
    );

    // ── Roof / awning ────────────────────────────────────────────────────
    // Base green trapezoid
    final roofPath = Path()
      ..moveTo(w * 0.08, h * 0.42)
      ..lineTo(w * 0.15, h * 0.20)
      ..lineTo(w * 0.85, h * 0.20)
      ..lineTo(w * 0.92, h * 0.42)
      ..close();

    canvas.drawPath(roofPath, Paint()..color = const Color(0xFF52B788));

    // White stripes on roof
    final stripePaint = Paint()..color = Colors.white;
    final stripeCount = 5;
    for (int i = 0; i < stripeCount; i++) {
      final x = w * 0.15 + (w * 0.70 / (stripeCount)) * i;
      final x2 = x + w * 0.06;
      final stripePath = Path()
        ..moveTo(x, h * 0.20)
        ..lineTo(x2, h * 0.20)
        ..lineTo(x2 + w * 0.04, h * 0.42)
        ..lineTo(x + w * 0.01, h * 0.42)
        ..close();
      canvas.drawPath(stripePath, stripePaint);
    }

    // Awning scallop border
    final scallop = Paint()
      ..color = const Color(0xFF2D6A4F)
      ..style = PaintingStyle.fill;
    final scallopPath = Path();
    final scallopCount = 6;
    final scallopW = w * 0.84 / scallopCount;
    scallopPath.moveTo(w * 0.08, h * 0.44);
    for (int i = 0; i < scallopCount; i++) {
      final x0 = w * 0.08 + scallopW * i;
      scallopPath.arcToPoint(
        Offset(x0 + scallopW, h * 0.44),
        radius: Radius.circular(scallopW / 2),
        clockwise: false,
      );
    }
    scallopPath.lineTo(w * 0.92, h * 0.42);
    scallopPath.lineTo(w * 0.08, h * 0.42);
    scallopPath.close();
    canvas.drawPath(scallopPath, scallop);

    // ── Building body ─────────────────────────────────────────────────────
    final bodyPaint = Paint()..color = const Color(0xFF52B788);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(w * 0.14, h * 0.42, w * 0.72, h * 0.46),
        const Radius.circular(6),
      ),
      bodyPaint,
    );

    // Body lighter shade overlay
    final bodyLightPaint = Paint()..color = const Color(0xFF74C69D);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(w * 0.14, h * 0.42, w * 0.72, h * 0.08),
        const Radius.circular(4),
      ),
      bodyLightPaint,
    );

    // ── Door ──────────────────────────────────────────────────────────────
    final doorPaint = Paint()..color = const Color(0xFF1B4332);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(w * 0.30, h * 0.60, w * 0.20, h * 0.28),
        const Radius.circular(4),
      ),
      doorPaint,
    );
    // Door knob
    canvas.drawCircle(
      Offset(w * 0.47, h * 0.74),
      3,
      Paint()..color = const Color(0xFFF59E0B),
    );

    // ── Window ────────────────────────────────────────────────────────────
    final winPaint = Paint()..color = const Color(0xFFB7E4C7);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(w * 0.56, h * 0.57, w * 0.22, h * 0.18),
        const Radius.circular(4),
      ),
      winPaint,
    );
    // Window frame cross
    final framePaint = Paint()
      ..color = const Color(0xFF2D6A4F)
      ..strokeWidth = 2;
    canvas.drawLine(
      Offset(w * 0.67, h * 0.57),
      Offset(w * 0.67, h * 0.75),
      framePaint,
    );
    canvas.drawLine(
      Offset(w * 0.56, h * 0.66),
      Offset(w * 0.78, h * 0.66),
      framePaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
