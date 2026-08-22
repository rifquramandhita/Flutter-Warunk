import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/auth/presentation/logout/auth_logout_screen.dart';
import 'package:warunk/app/features/sales/presentation/shell/sales_shell_screen.dart';
import 'package:warunk/core/constants/constant.dart';
import 'package:warunk/main.dart';
import 'package:warunk/core/widgets/shadow_card.dart';
import 'package:warunk/core/widgets/loading_app_widget.dart';
import 'package:warunk/core/dependency/dependency.dart';
import 'package:warunk/core/helper/global_helper.dart';
import 'package:warunk/core/helper/dialog_helper.dart';
import 'package:warunk/core/bloc/auth/auth_bloc.dart';

import 'bloc/sales_profil_bloc.dart';
import 'bloc/sales_profil_event.dart';
import 'bloc/sales_profil_state.dart';

class SalesProfilScreen extends StatelessWidget {
  const SalesProfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SalesProfilBloc>()..add(SalesLoadProfilData()),
      child: BlocConsumer<SalesProfilBloc, SalesProfilState>(
        listener: (context, state) {
          if (state.errorMessage != null) {
            DialogHelper.showErrorSnackBar(
              context: context,
              text: state.errorMessage!,
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: Stack(
                children: [
                  _buildBody(context),
                  if (state.isLoading) const LoadingAppWidget(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<SalesProfilBloc>().add(SalesLoadProfilData());
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildAccountMenu(context),
            const SizedBox(height: 24),
            Text(
              'Bantuan & Informasi',
              style: GlobalHelper.getTextTheme(
                context,
                appTextStyle: AppTextStyle.TITLE_SMALL,
              )?.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 12),
            _buildInfoMenu(context),
            const SizedBox(height: 24),
            _logoutButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildAccountMenu(BuildContext context) {
    final authState = context.watch<AuthBloc>().state;
    return ShadowCard(
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    color: const Color(0xFFB9E4C9),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: authState.photoUrl.isNotEmpty
                      ? ClipOval(
                          child: Image.network(
                            authState.photoUrl,
                            fit: BoxFit.cover,
                            width: 70,
                            height: 70,
                            errorBuilder: (context, error, stackTrace) =>
                                const Center(
                                  child: Text(
                                    '👨🏻',
                                    style: TextStyle(fontSize: 40),
                                  ),
                                ),
                          ),
                        )
                      : const Center(
                          child: Text('👨🏻', style: TextStyle(fontSize: 40)),
                        ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        authState.name,
                        style: GlobalHelper.getTextTheme(
                          context,
                          appTextStyle: AppTextStyle.BODY_LARGE,
                        )?.copyWith(fontWeight: FontWeight.w800),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          Icon(
                            Icons.email_outlined,
                            size: 14,
                            color: GlobalHelper.getColorSchema(context).primary,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            authState.email,
                            style:
                                GlobalHelper.getTextTheme(
                                  context,
                                  appTextStyle: AppTextStyle.LABEL_SMALL,
                                )?.copyWith(
                                  color: GlobalHelper.getColorSchema(
                                    context,
                                  ).onSurfaceVariant,
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
          // We don't have Transactions/Wishlists for Sales for now
          // Could add Sales specific stats here in the future
        ],
      ),
    );
  }

  Widget _buildInfoMenu(BuildContext context) {
    return ShadowCard(
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          _menuItem(
            context: context,
            icon: Icons.help_outline_rounded,
            label: 'Pusat Bantuan',
            iconColor: GlobalHelper.getColorSchema(context).primary,
            onTap: () => context.read<SalesProfilBloc>().add(
              SalesLaunchUrlEvent(
                '${(isProduction) ? BASE_URL_PROD : BASE_URL_DEV}/pusat-bantuan?mode=sales',
              ),
            ),
          ),
          _divider(context),
          _menuItem(
            context: context,
            icon: Icons.info_outline_rounded,
            label: 'Cara Penggunaan',
            iconColor: GlobalHelper.getColorSchema(context).primary,
            onTap: () => context.read<SalesProfilBloc>().add(
              SalesLaunchUrlEvent(
                '${(isProduction) ? BASE_URL_PROD : BASE_URL_DEV}/cara-penggunaan?mode=sales',
              ),
            ),
          ),
          _divider(context),
          _menuItem(
            context: context,
            icon: Icons.privacy_tip_outlined,
            label: 'Kebijakan Privasi',
            iconColor: GlobalHelper.getColorSchema(context).primary,
            onTap: () => context.read<SalesProfilBloc>().add(
              SalesLaunchUrlEvent(
                '${(isProduction) ? BASE_URL_PROD : BASE_URL_DEV}/kebijakan-privasi?mode=sales',
              ),
            ),
          ),
          _divider(context),
          _menuItem(
            context: context,
            icon: Icons.description_outlined,
            label: 'Syarat & Ketentuan',
            iconColor: GlobalHelper.getColorSchema(context).primary,
            onTap: () => context.read<SalesProfilBloc>().add(
              SalesLaunchUrlEvent(
                '${(isProduction) ? BASE_URL_PROD : BASE_URL_DEV}/syarat-ketentuan?mode=sales',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _logoutButton(BuildContext context) {
    final titleStyle = GlobalHelper.getTextTheme(
      context,
      appTextStyle: AppTextStyle.TITLE_SMALL,
    );

    return SizedBox(
      width: double.infinity,
      height: 52,
      child: OutlinedButton(
        onPressed: () {
          SalesShellScreen.ignoreNextPop = true;
          navigatorKey.currentState?.push(
            MaterialPageRoute(builder: (_) => const AuthLogoutScreen()),
          );
        },
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Colors.red, width: 1.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          foregroundColor: Colors.red,
        ),
        child: Text(
          'Logout',
          style: titleStyle?.copyWith(
            fontWeight: FontWeight.w600,
            color: Colors.red,
          ),
        ),
      ),
    );
  }

  Widget _menuItem({
    required BuildContext context,
    required IconData icon,
    required String label,
    required Color iconColor,
    Color? textColor,
    bool hideChevron = false,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap ?? () {},
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: iconColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: iconColor, size: 20),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                label,
                style:
                    GlobalHelper.getTextTheme(
                      context,
                      appTextStyle: AppTextStyle.BODY_SMALL,
                    )?.copyWith(
                      fontWeight: FontWeight.w600,
                      color:
                          textColor ??
                          GlobalHelper.getColorSchema(context).onSurface,
                    ),
              ),
            ),
            if (!hideChevron)
              Icon(
                Icons.chevron_right_rounded,
                color: GlobalHelper.getColorSchema(context).primary,
                size: 22,
              ),
          ],
        ),
      ),
    );
  }

  Widget _divider(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 56, right: 16),
      child: Divider(
        height: 1,
        color: GlobalHelper.getColorSchema(context).outline,
      ),
    );
  }
}
