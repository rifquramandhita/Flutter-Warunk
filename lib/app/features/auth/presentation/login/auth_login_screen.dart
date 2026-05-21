import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:warunk/app/features/customer/presentation/shell/customer_shell.dart';
import 'package:warunk/app/features/merchant/presentation/shell/merchant_shell_screen.dart';
import 'package:warunk/app/features/auth/presentation/login/bloc/auth_login_bloc.dart';
import 'package:warunk/app/features/auth/presentation/login/bloc/auth_login_event.dart';
import 'package:warunk/app/features/auth/presentation/login/bloc/auth_login_state.dart';
import 'package:warunk/app/features/auth/presentation/register/auth_register_screen.dart';
import 'package:warunk/core/bloc/auth/auth_bloc.dart';
import 'package:warunk/core/dependency/dependency.dart';
import 'package:warunk/core/helper/dialog_helper.dart';
import 'package:warunk/main.dart';
import 'package:warunk/theme/app_colors.dart';
import 'package:warunk/core/widgets/loading_app_widget.dart';
import 'package:warunk/core/widgets/primary_button.dart';

class AuthLoginScreen extends StatelessWidget {
  const AuthLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthLoginBloc>(),
      child: BlocConsumer<AuthLoginBloc, AuthLoginState>(
        listenWhen: (previous, current) =>
            previous.errorMessage != current.errorMessage,
        listener: (context, state) {
          if (state.errorMessage != null) {
            DialogHelper.showErrorSnackBar(
              context: context,
              text: state.errorMessage!,
            );
          }
        },
        builder: (context, state) {
          return Scaffold(body: _bodyBuild(context));
        },
      ),
    );
  }

  Widget _bodyBuild(BuildContext context) {
    final state = context.watch<AuthLoginBloc>().state;
    return SafeArea(
      child: Stack(
        children: [
          _bodyLayout(context),
          (state.isLoading) ? LoadingAppWidget() : SizedBox(),
        ],
      ),
    );
  }

  Widget _bodyLayout(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_headerLayout(), _formLayout(context)],
      ),
    );
  }

  Widget _headerLayout() {
    return Container(
      width: double.infinity,
      height: 180,
      decoration: const BoxDecoration(color: AppColors.background),
      child: Stack(
        children: [
          Positioned(
            right: -30,
            top: -30,
            child: Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primaryLight.withValues(alpha: 0.12),
              ),
            ),
          ),
          Positioned(
            right: 40,
            top: 10,
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primaryLight.withValues(alpha: 0.1),
              ),
            ),
          ),

          Positioned(right: 16, bottom: 10, child: _buildScooterIllustration()),

          Positioned(
            right: 80,
            top: 20,
            child: Icon(Icons.location_on, color: AppColors.primary, size: 28),
          ),

          Positioned(
            left: 24,
            top: 32,
            child: Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.storefront_rounded,
                    color: Colors.white,
                    size: 26,
                  ),
                ),
                const SizedBox(width: 10),
                const Text(
                  'WARUNK',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                    color: AppColors.primary,
                    letterSpacing: 1.2,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _formLayout(BuildContext context) {
    final state = context.watch<AuthLoginBloc>().state;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),

          const Text(
            'Selamat Datang',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w800,
              color: AppColors.textDark,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'Masuk untuk belanja atau kelola tokomu',
            style: TextStyle(fontSize: 14, color: AppColors.greyText),
          ),
          const SizedBox(height: 24),

          _roleLayout(context, state),
          const SizedBox(height: 20),

          _emailTextFieldLayout(
            hintText: 'Email / Nomor HP',
            prefixIcon: Icons.mail_outline_rounded,
            onChanged: (value) =>
                context.read<AuthLoginBloc>().add(AuthEmailChanged(value)),
          ),
          const SizedBox(height: 14),

          _passwordTextFieldLayout(context, state),

          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: const Text(
                'Lupa password?',
                style: TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
              ),
            ),
          ),
          const SizedBox(height: 22),

          _loginButtonLayout(context, state),
          const SizedBox(height: 20),

          _dividerLayout(),
          const SizedBox(height: 16),

          _googleButtonLayout(),
          const SizedBox(height: 28),

          _registerLayout(context),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildScooterIllustration() {
    return SizedBox(
      width: 130,
      height: 90,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            bottom: 18,
            left: 0,
            child: Container(
              width: 80,
              height: 38,
              decoration: BoxDecoration(
                color: AppColors.primaryLight,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            right: 0,
            child: Container(
              width: 36,
              height: 30,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Center(
                child: Text(
                  'W',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          ),
          // Front wheel
          Positioned(
            bottom: 4,
            left: 6,
            child: Container(
              width: 26,
              height: 26,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.textDark,
                border: Border.all(color: AppColors.primaryLight, width: 4),
              ),
            ),
          ),
          // Back wheel
          Positioned(
            bottom: 4,
            right: 14,
            child: Container(
              width: 26,
              height: 26,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.textDark,
                border: Border.all(color: AppColors.primaryLight, width: 4),
              ),
            ),
          ),
          // Handlebar
          Positioned(
            bottom: 36,
            left: 4,
            child: Container(
              width: 6,
              height: 20,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(3),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _roleLayout(BuildContext context, AuthLoginState state) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.greyBorder),
      ),
      padding: const EdgeInsets.all(4),
      child: Row(
        children: [
          _itemRoleLayout(
            context: context,
            state: state,
            index: 0,
            label: 'Customer',
            icon: Icons.person_outline_rounded,
          ),
          _itemRoleLayout(
            context: context,
            state: state,
            index: 1,
            label: 'Merchant',
            icon: Icons.storefront_outlined,
          ),
        ],
      ),
    );
  }

  Widget _itemRoleLayout({
    required BuildContext context,
    required AuthLoginState state,
    required int index,
    required String label,
    required IconData icon,
  }) {
    final isSelected = state.selectedRole == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => context.read<AuthLoginBloc>().add(AuthRoleSelected(index)),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isSelected
                ? AppColors.primary.withValues(alpha: 0.13)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 18,
                color: isSelected ? AppColors.primary : AppColors.greyText,
              ),
              const SizedBox(width: 6),
              Text(
                label,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                  color: isSelected ? AppColors.primary : AppColors.greyText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _emailTextFieldLayout({
    required String hintText,
    required IconData prefixIcon,
    required ValueChanged<String> onChanged,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.greyBorder),
      ),
      child: TextField(
        onChanged: onChanged,
        style: const TextStyle(fontSize: 14, color: AppColors.textDark),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: AppColors.greyText, fontSize: 14),
          prefixIcon: Icon(prefixIcon, color: AppColors.greyText, size: 20),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
        ),
      ),
    );
  }

  Widget _passwordTextFieldLayout(BuildContext context, AuthLoginState state) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.greyBorder),
      ),
      child: TextField(
        onChanged: (value) =>
            context.read<AuthLoginBloc>().add(AuthPasswordChanged(value)),
        obscureText: state.obscurePassword,
        style: const TextStyle(fontSize: 14, color: AppColors.textDark),
        decoration: InputDecoration(
          hintText: 'Password',
          hintStyle: const TextStyle(color: AppColors.greyText, fontSize: 14),
          prefixIcon: const Icon(
            Icons.lock_outline_rounded,
            color: AppColors.greyText,
            size: 20,
          ),
          suffixIcon: IconButton(
            onPressed: () =>
                context.read<AuthLoginBloc>().add(AuthObscurePasswordToggled()),
            icon: Icon(
              state.obscurePassword
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
              color: AppColors.greyText,
              size: 20,
            ),
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
        ),
      ),
    );
  }

  Widget _loginButtonLayout(BuildContext context, AuthLoginState state) {
    return PrimaryButton(
      label: 'Masuk',
      isLoading: state.isLoading,
      onPressed: () => context.read<AuthLoginBloc>().add(AuthLoginSubmitted()),
    );
  }

  Widget _dividerLayout() {
    return Row(
      children: [
        const Expanded(
          child: Divider(color: AppColors.greyBorder, thickness: 1),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            'atau',
            style: TextStyle(color: AppColors.greyText, fontSize: 13),
          ),
        ),
        const Expanded(
          child: Divider(color: AppColors.greyBorder, thickness: 1),
        ),
      ],
    );
  }

  Widget _googleButtonLayout() {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: AppColors.greyBorder, width: 1.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          backgroundColor: AppColors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/images/google.svg', width: 22, height: 22),
            const SizedBox(width: 10),
            const Text(
              'Masuk dengan Google',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.textDark,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _registerLayout(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Belum punya akun? ',
            style: TextStyle(fontSize: 14, color: AppColors.greyText),
          ),
          GestureDetector(
            onTap: () => _onPressRegister(),
            child: const Text(
              'Daftar',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: AppColors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onPressRegister() {
    navigatorKey.currentState?.push(
      MaterialPageRoute(builder: (_) => const AuthRegisterScreen()),
    );
  }
}

class _GoogleLogoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    // Red arc (top-right)
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -0.52,
      1.57,
      false,
      Paint()
        ..color = const Color(0xFFEA4335)
        ..strokeWidth = 3.5
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round,
    );

    // Blue arc (top-left)
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -2.62,
      1.57,
      false,
      Paint()
        ..color = const Color(0xFF4285F4)
        ..strokeWidth = 3.5
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round,
    );

    // Yellow arc (bottom-left)
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      2.09,
      1.05,
      false,
      Paint()
        ..color = const Color(0xFFFBBC05)
        ..strokeWidth = 3.5
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round,
    );

    // Green arc (bottom-right)
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      1.05,
      1.05,
      false,
      Paint()
        ..color = const Color(0xFF34A853)
        ..strokeWidth = 3.5
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round,
    );

    // Horizontal bar of the "G"
    canvas.drawLine(
      Offset(center.dx, center.dy),
      Offset(center.dx + radius, center.dy),
      Paint()
        ..color = const Color(0xFF4285F4)
        ..strokeWidth = 3.5
        ..strokeCap = StrokeCap.round,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
