import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/auth/presentation/reset_password/bloc/auth_reset_password_bloc.dart';
import 'package:warunk/app/features/auth/presentation/reset_password/bloc/auth_reset_password_event.dart';
import 'package:warunk/app/features/auth/presentation/reset_password/bloc/auth_reset_password_state.dart';
import 'package:warunk/core/dependency/dependency.dart';
import 'package:warunk/core/helper/dialog_helper.dart';
import 'package:warunk/main.dart';
import 'package:warunk/core/helper/global_helper.dart';
import 'package:warunk/core/widgets/loading_app_widget.dart';
import 'package:warunk/core/widgets/primary_button.dart';

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
          if (state.successMessage != null) {
            DialogHelper.showBottomSheetDialog(
              context: context,
              canDismiss: false,
              title: "Success",
              content: Column(
                children: [
                  const Icon(Icons.check_circle, color: Colors.green, size: 48),
                  const SizedBox(height: 16),
                  Text(
                    state.successMessage!,
                    style:
                        GlobalHelper.getTextTheme(
                          context,
                          appTextStyle: AppTextStyle.BODY_MEDIUM,
                        )?.copyWith(
                          color: GlobalHelper.getColorSchema(
                            context,
                          ).onSurfaceVariant,
                        ),
                  ),
                  const SizedBox(height: 24),
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
            appBar: AppBar(
              iconTheme: IconThemeData(
                color: GlobalHelper.getColorSchema(context).onSurface,
              ),
            ),
            body: _bodyBuild(context, state),
          );
        },
      ),
    );
  }

  Widget _bodyBuild(BuildContext context, AuthResetPasswordState state) {
    return SafeArea(
      child: Stack(
        children: [
          _bodyLayout(context),
          if (state.isLoading) const LoadingAppWidget(),
        ],
      ),
    );
  }

  Widget _bodyLayout(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Text(
              'Lupa Password',
              style:
                  GlobalHelper.getTextTheme(
                    context,
                    appTextStyle: AppTextStyle.HEADLINE_SMALL,
                  )?.copyWith(
                    fontWeight: FontWeight.w800,
                    color: GlobalHelper.getColorSchema(context).onSurface,
                  ),
            ),
            const SizedBox(height: 6),
            Text(
              'Masukkan email Anda untuk menerima link reset password',
              style:
                  GlobalHelper.getTextTheme(
                    context,
                    appTextStyle: AppTextStyle.BODY_MEDIUM,
                  )?.copyWith(
                    color: GlobalHelper.getColorSchema(
                      context,
                    ).onSurfaceVariant,
                  ),
            ),
            const SizedBox(height: 32),
            _emailTextFieldLayout(context),
            const SizedBox(height: 24),
            _submitButtonLayout(context),
          ],
        ),
      ),
    );
  }

  Widget _emailTextFieldLayout(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: GlobalHelper.getColorSchema(context).surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: GlobalHelper.getColorSchema(context).outline),
      ),
      child: TextField(
        onChanged: (value) => context.read<AuthResetPasswordBloc>().add(
          AuthResetEmailChanged(value),
        ),
        style: GlobalHelper.getTextTheme(
          context,
          appTextStyle: AppTextStyle.BODY_MEDIUM,
        )?.copyWith(color: GlobalHelper.getColorSchema(context).onSurface),
        decoration: InputDecoration(
          hintText: 'Email',
          hintStyle:
              GlobalHelper.getTextTheme(
                context,
                appTextStyle: AppTextStyle.BODY_MEDIUM,
              )?.copyWith(
                color: GlobalHelper.getColorSchema(context).onSurfaceVariant,
              ),
          prefixIcon: Icon(
            Icons.mail_outline_rounded,
            color: GlobalHelper.getColorSchema(context).onSurfaceVariant,
            size: 20,
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

  Widget _submitButtonLayout(BuildContext context) {
    final state = context.watch<AuthResetPasswordBloc>().state;
    return PrimaryButton(
      label: 'Kirim Link',
      isLoading: state.isLoading,
      onPressed: () => context.read<AuthResetPasswordBloc>().add(
        AuthResetPasswordSubmitted(),
      ),
    );
  }
}
