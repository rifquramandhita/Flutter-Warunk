import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/auth/presentation/register/bloc/auth_register_bloc.dart';
import 'package:warunk/app/features/auth/presentation/register/bloc/auth_register_event.dart';
import 'package:warunk/app/features/auth/presentation/register/bloc/auth_register_state.dart';
import 'package:warunk/core/dependency/dependency.dart';
import 'package:warunk/core/helper/dialog_helper.dart';
import 'package:warunk/main.dart';
import 'package:warunk/theme/app_colors.dart';
import 'package:warunk/core/widgets/primary_button.dart';
import 'package:warunk/core/widgets/loading_app_widget.dart';

class AuthRegisterScreen extends StatelessWidget {
  const AuthRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthRegisterBloc>(),
      child: BlocConsumer<AuthRegisterBloc, AuthRegisterState>(
        listener: (context, state) {
          if (state.errorMessage != null) {
            DialogHelper.showErrorSnackBar(
              context: context,
              text: state.errorMessage!,
            );
          } else if (state.isSuccess) {
            DialogHelper.showBottomSheetDialog(
              canDismiss: false,
              context: context,
              title: 'Sukses',
              content: Column(
                children: [
                  Text('Silahkan cek inbox email untuk verifikasi email.'),
                  SizedBox(height: 16),
                  PrimaryButton(
                    label: 'Tutup',
                    onPressed: () {
                      navigatorKey.currentState?.pop();
                      navigatorKey.currentState?.pop();
                    },
                  ),
                ],
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.background,
            body: _bodyBuild(context),
          );
        },
      ),
    );
  }

  Widget _bodyBuild(BuildContext context) {
    final state = context.watch<AuthRegisterBloc>().state;
    return SafeArea(
      child: Stack(
        children: [
          _bodyLayout(context),
          (state.isLoading) ? const LoadingAppWidget() : const SizedBox(),
        ],
      ),
    );
  }

  Widget _bodyLayout(BuildContext context) {
    final state = context.watch<AuthRegisterBloc>().state;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),

            // ── Top logo row ────────────────────────────────────────
            _buildTopLogo(),
            const SizedBox(height: 20),

            // ── Title ───────────────────────────────────────────────
            const Center(
              child: Text(
                'Buat Akun Baru',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w800,
                  color: AppColors.textDark,
                ),
              ),
            ),
            const SizedBox(height: 6),
            const Center(
              child: Text(
                'Daftar sebagai customer atau merchant',
                style: TextStyle(fontSize: 14, color: AppColors.greyText),
              ),
            ),
            const SizedBox(height: 28),

            // ── Form fields ─────────────────────────────────────────
            _buildField(
              hint: 'Nama Lengkap',
              icon: Icons.person_outline_rounded,
              onChanged: (v) => context.read<AuthRegisterBloc>().add(
                AuthRegisterEventNameChanged(v),
              ),
            ),
            const SizedBox(height: 14),
            _buildField(
              hint: 'Email',
              icon: Icons.mail_outline_rounded,
              keyboardType: TextInputType.emailAddress,
              onChanged: (v) => context.read<AuthRegisterBloc>().add(
                AuthRegisterEventEmailChanged(v),
              ),
            ),
            const SizedBox(height: 14),
            _buildField(
              hint: 'Nomor HP',
              icon: Icons.phone_outlined,
              keyboardType: TextInputType.phone,
              onChanged: (v) => context.read<AuthRegisterBloc>().add(
                AuthRegisterEventPhoneChanged(v),
              ),
            ),
            const SizedBox(height: 14),
            _buildPasswordField(context, state),
            const SizedBox(height: 14),
            _buildPasswordConfirmationField(context, state),
            const SizedBox(height: 28),

            // ── Role section label ──────────────────────────────────
            const Text(
              'Daftar sebagai',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: AppColors.textDark,
              ),
            ),
            const SizedBox(height: 14),

            // ── Role cards ──────────────────────────────────────────
            _buildRoleCards(context, state),
            const SizedBox(height: 22),

            // ── Terms checkbox ──────────────────────────────────────
            _buildTermsRow(context, state),
            const SizedBox(height: 24),

            // ── Register button ─────────────────────────────────────
            _buildRegisterButton(context, state),
            const SizedBox(height: 20),

            // ── Login link ──────────────────────────────────────────
            _buildLoginLink(context),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  // ── Top Logo ──────────────────────────────────────────────────────────────
  Widget _buildTopLogo() {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.storefront_rounded,
              color: Colors.white,
              size: 22,
            ),
          ),
          const SizedBox(width: 10),
          const Text(
            'WARRUNK',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
              color: AppColors.primary,
              letterSpacing: 1.2,
            ),
          ),
        ],
      ),
    );
  }

  // ── Generic Text Field ────────────────────────────────────────────────────
  Widget _buildField({
    required String hint,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
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
        keyboardType: keyboardType,
        style: const TextStyle(fontSize: 14, color: AppColors.textDark),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: AppColors.greyText, fontSize: 14),
          prefixIcon: _iconBadge(icon),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
        ),
      ),
    );
  }

  // ── Password Field ────────────────────────────────────────────────────────
  Widget _buildPasswordField(BuildContext context, AuthRegisterState state) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.greyBorder),
      ),
      child: TextField(
        onChanged: (v) => context.read<AuthRegisterBloc>().add(
          AuthRegisterEventPasswordChanged(v),
        ),
        obscureText: state.obscurePassword,
        style: const TextStyle(fontSize: 14, color: AppColors.textDark),
        decoration: InputDecoration(
          hintText: 'Password',
          hintStyle: const TextStyle(color: AppColors.greyText, fontSize: 14),
          prefixIcon: _iconBadge(Icons.lock_outline_rounded),
          suffixIcon: IconButton(
            onPressed: () => context.read<AuthRegisterBloc>().add(
              AuthRegisterEventObscurePasswordToggled(),
            ),
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

  // ── Password Confirmation Field ───────────────────────────────────────────
  Widget _buildPasswordConfirmationField(
    BuildContext context,
    AuthRegisterState state,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.greyBorder),
      ),
      child: TextField(
        onChanged: (v) => context.read<AuthRegisterBloc>().add(
          AuthRegisterEventPasswordConfirmationChanged(v),
        ),
        obscureText: state.obscurePassword,
        style: const TextStyle(fontSize: 14, color: AppColors.textDark),
        decoration: InputDecoration(
          hintText: 'Konfirmasi Password',
          hintStyle: const TextStyle(color: AppColors.greyText, fontSize: 14),
          prefixIcon: _iconBadge(Icons.lock_outline_rounded),
          suffixIcon: IconButton(
            onPressed: () => context.read<AuthRegisterBloc>().add(
              AuthRegisterEventObscurePasswordToggled(),
            ),
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

  /// Rounded icon badge used as prefix inside text fields
  Widget _iconBadge(IconData icon) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: AppColors.primary.withValues(alpha: 0.10),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: AppColors.primary, size: 18),
      ),
    );
  }

  // ── Role Cards ────────────────────────────────────────────────────────────
  Widget _buildRoleCards(BuildContext context, AuthRegisterState state) {
    return Row(
      children: [
        Expanded(
          child: _buildRoleCard(
            context: context,
            state: state,
            index: 0,
            label: 'Customer',
            description: 'Belanja kebutuhan harian dengan mudah & cepat.',
            icon: Icons.person_rounded,
            iconBgColor: AppColors.primary.withValues(alpha: 0.12),
            iconColor: AppColors.primary,
          ),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: _buildRoleCard(
            context: context,
            state: state,
            index: 1,
            label: 'Merchant',
            description: 'Kelola tokomu dan jangkau lebih banyak pelanggan.',
            icon: Icons.storefront_rounded,
            iconBgColor: const Color(0xFFD6E8FF),
            iconColor: const Color(0xFF4A90D9),
          ),
        ),
      ],
    );
  }

  Widget _buildRoleCard({
    required BuildContext context,
    required AuthRegisterState state,
    required int index,
    required String label,
    required String description,
    required IconData icon,
    required Color iconBgColor,
    required Color iconColor,
  }) {
    final isSelected = state.selectedRole == index;

    return GestureDetector(
      onTap: () => context.read<AuthRegisterBloc>().add(
        AuthRegisterEventRoleSelected(index),
      ),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.greyBorder,
            width: isSelected ? 2.0 : 1.0,
          ),
        ),
        child: Stack(
          children: [
            // ── Checkmark badge (only when selected) ──────────────
            if (isSelected)
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.check, color: Colors.white, size: 13),
                ),
              ),

            // ── Card body ─────────────────────────────────────────
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 4),
                // Role icon
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    color: iconBgColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, color: iconColor, size: 28),
                ),
                const SizedBox(height: 10),
                // Label
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: isSelected ? AppColors.primary : AppColors.textDark,
                  ),
                ),
                const SizedBox(height: 6),
                // Description
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 11,
                    color: AppColors.greyText,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ── Terms Checkbox ────────────────────────────────────────────────────────
  Widget _buildTermsRow(BuildContext context, AuthRegisterState state) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 22,
          height: 22,
          child: Checkbox(
            value: state.agreeToTerms,
            onChanged: (v) => context.read<AuthRegisterBloc>().add(
              AuthRegisterEventTermsToggled(v ?? false),
            ),
            activeColor: AppColors.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            side: BorderSide(
              color: state.agreeToTerms
                  ? AppColors.primary
                  : AppColors.greyText,
              width: 1.5,
            ),
          ),
        ),
        const SizedBox(width: 10),
        const Text(
          'Saya setuju dengan ',
          style: TextStyle(fontSize: 13, color: AppColors.greyText),
        ),
        GestureDetector(
          onTap: () {},
          child: const Text(
            'Syarat & Ketentuan',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: AppColors.primary,
            ),
          ),
        ),
      ],
    );
  }

  // ── Register Button ───────────────────────────────────────────────────────
  Widget _buildRegisterButton(BuildContext context, AuthRegisterState state) {
    return PrimaryButton(
      label: 'Daftar Sekarang',
      isLoading: state.isLoading,
      onPressed: state.agreeToTerms
          ? () => context.read<AuthRegisterBloc>().add(AuthRegisterEventSend())
          : null,
    );
  }

  // ── Login Link ────────────────────────────────────────────────────────────
  Widget _buildLoginLink(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Sudah punya akun? ',
            style: TextStyle(fontSize: 14, color: AppColors.greyText),
          ),
          GestureDetector(
            onTap: () => navigatorKey.currentState?.pop(),
            child: const Text(
              'Masuk',
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
}
