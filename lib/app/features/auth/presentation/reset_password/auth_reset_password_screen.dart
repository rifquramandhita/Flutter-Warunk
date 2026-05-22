import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/auth/presentation/reset_password/bloc/auth_reset_password_bloc.dart';
import 'package:warunk/core/dependency/dependency.dart';
import 'package:warunk/core/helper/dialog_helper.dart';
import 'package:warunk/core/helper/global_helper.dart';
import 'package:warunk/core/widgets/loading_app_widget.dart';
import 'package:warunk/core/widgets/primary_button.dart';
import 'package:warunk/main.dart';

class AuthResetPasswordScreen extends StatelessWidget {
  const AuthResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthResetPasswordBloc>(),
      child: BlocConsumer<AuthResetPasswordBloc, AuthResetPasswordState>(
        listener: (context, state) {
          if (state.errorMessage != null) {
            DialogHelper.showErrorSnackBar(
              context: context,
              text: state.errorMessage!,
            );
          }
          if (state.isSuccess) {
            DialogHelper.showBottomSheetDialog(
              context: context,
              title: 'Berhasil',
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Password Anda telah berhasil diperbarui. Silakan gunakan password baru Anda untuk masuk di kemudian hari.',
                  ),
                  const SizedBox(height: 32),
                  PrimaryButton(
                    label: 'Tutup',
                    onPressed: () {
                      navigatorKey.currentState?.pop();
                    },
                  ),
                ],
              ),
            ).then((_) {
              navigatorKey.currentState?.pop();
            });
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: GlobalHelper.getColorSchema(context).surface,
            appBar: _buildAppBar(context),
            body: _bodyBuild(context),
          );
        },
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(title: Text('Ubah Password'));
  }

  Widget _bodyBuild(BuildContext context) {
    final state = context.watch<AuthResetPasswordBloc>().state;
    return SafeArea(
      child: Stack(
        children: [
          _bodyLayout(context),
          if (state.isLoading) const LoadingAppWidget() else const SizedBox(),
        ],
      ),
    );
  }

  Widget _bodyLayout(BuildContext context) {
    final colorSchema = GlobalHelper.getColorSchema(context);
    final labelStyle = GlobalHelper.getTextTheme(
      context,
      appTextStyle: AppTextStyle.LABEL_MEDIUM,
    );
    final hintStyle = GlobalHelper.getTextTheme(
      context,
      appTextStyle: AppTextStyle.BODY_SMALL,
    );
    final state = context.watch<AuthResetPasswordBloc>().state;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Buat password baru yang kuat agar akun Anda lebih aman.',
            style: hintStyle?.copyWith(color: colorSchema.onSurfaceVariant),
          ),
          const SizedBox(height: 32),

          // Current Password
          Text('Password Saat Ini', style: labelStyle),
          const SizedBox(height: 8),
          _buildTextField(
            context: context,
            hint: 'Masukkan password saat ini',
            obscureText: state.obscureCurrent,
            onChanged: (value) => context.read<AuthResetPasswordBloc>().add(
              AuthResetPasswordEventCurrentPasswordChanged(value),
            ),
            onToggleObscure: () => context.read<AuthResetPasswordBloc>().add(
              AuthResetPasswordEventToggleObscureCurrent(),
            ),
          ),
          const SizedBox(height: 24),

          // New Password
          Text('Password Baru', style: labelStyle),
          const SizedBox(height: 8),
          _buildTextField(
            context: context,
            hint: 'Masukkan password baru',
            obscureText: state.obscureNew,
            onChanged: (value) => context.read<AuthResetPasswordBloc>().add(
              AuthResetPasswordEventNewPasswordChanged(value),
            ),
            onToggleObscure: () => context.read<AuthResetPasswordBloc>().add(
              AuthResetPasswordEventToggleObscureNew(),
            ),
          ),
          const SizedBox(height: 24),

          // Confirm Password
          Text('Konfirmasi Password Baru', style: labelStyle),
          const SizedBox(height: 8),
          _buildTextField(
            context: context,
            hint: 'Ulangi password baru',
            obscureText: state.obscureConfirm,
            onChanged: (value) => context.read<AuthResetPasswordBloc>().add(
              AuthResetPasswordEventConfirmPasswordChanged(value),
            ),
            onToggleObscure: () => context.read<AuthResetPasswordBloc>().add(
              AuthResetPasswordEventToggleObscureConfirm(),
            ),
          ),
          const SizedBox(height: 48),

          // Submit Button
          PrimaryButton(
            label: 'Simpan Password',
            onPressed: () {
              context.read<AuthResetPasswordBloc>().add(
                AuthResetPasswordEventSubmit(),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required BuildContext context,
    required String hint,
    required bool obscureText,
    required ValueChanged<String> onChanged,
    required VoidCallback onToggleObscure,
  }) {
    final colorSchema = GlobalHelper.getColorSchema(context);
    final textStyle = GlobalHelper.getTextTheme(
      context,
      appTextStyle: AppTextStyle.BODY_MEDIUM,
    );

    return TextFormField(
      obscureText: obscureText,
      onChanged: onChanged,
      style: textStyle?.copyWith(color: colorSchema.onSurface),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: textStyle?.copyWith(color: colorSchema.onSurfaceVariant),
        filled: true,
        fillColor: colorSchema.surfaceContainerHighest.withValues(alpha: 0.3),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colorSchema.outlineVariant),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colorSchema.outlineVariant),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colorSchema.primary),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            obscureText ? Icons.visibility_off : Icons.visibility,
            color: colorSchema.onSurfaceVariant,
            size: 20,
          ),
          onPressed: onToggleObscure,
        ),
      ),
    );
  }
}
