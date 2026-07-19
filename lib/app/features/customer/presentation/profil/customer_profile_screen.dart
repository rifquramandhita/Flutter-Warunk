import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/auth/presentation/logout/auth_logout_screen.dart';
import 'package:warunk/app/features/customer/presentation/address/customer_address_screen.dart';
import 'package:warunk/app/features/customer/presentation/notification/customer_notification_screen.dart';
import 'package:warunk/app/features/customer/presentation/edit_profil/customer_edit_profile_screen.dart';
import 'package:warunk/app/features/customer/presentation/wishlist/customer_wishlist_screen.dart';
import 'package:warunk/app/features/customer/presentation/shell/bloc/customer_shell_bloc.dart';
import 'package:warunk/app/features/customer/presentation/profil/bloc/customer_profil_bloc.dart';
import 'package:warunk/app/features/customer/presentation/profil/bloc/customer_profil_event.dart';
import 'package:warunk/app/features/customer/presentation/profil/bloc/customer_profil_state.dart';
import 'package:warunk/core/constants/constant.dart';
import 'package:warunk/main.dart';
import 'package:warunk/core/widgets/custom_dotted_divider.dart';
import 'package:warunk/core/widgets/shadow_card.dart';
import 'package:warunk/core/widgets/loading_app_widget.dart';
import 'package:warunk/core/dependency/dependency.dart';
import 'package:warunk/core/helper/global_helper.dart';
import 'package:warunk/core/helper/dialog_helper.dart';
import 'package:warunk/core/bloc/auth/auth_bloc.dart';

class CustomerProfileScreen extends StatelessWidget {
  const CustomerProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<CustomerProfilBloc>()..add(CustomerLoadProfilData()),
      child: BlocConsumer<CustomerProfilBloc, CustomerProfilState>(
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
            body: _bodyBuild(context),
          );
        },
      ),
    );
  }



  Widget _bodyBuild(BuildContext context) {
    final state = context.watch<CustomerProfilBloc>().state;
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
    return RefreshIndicator(
      onRefresh: () async {
        context.read<CustomerProfilBloc>().add(CustomerLoadProfilData());
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





  Widget _statItem({
    required BuildContext context,
    required IconData icon,
    required Color iconColor,
    required Color iconBgColor,
    required String label,
    required String value,
    VoidCallback? onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: iconBgColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: iconColor, size: 18),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
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
                const SizedBox(height: 2),
                Text(
                  value,
                  style: GlobalHelper.getTextTheme(
                    context,
                    appTextStyle: AppTextStyle.BODY_MEDIUM,
                  )?.copyWith(fontWeight: FontWeight.w800),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _verticalDivider(BuildContext context) {
    return Container(
      width: 1,
      height: 30,
      color: GlobalHelper.getColorSchema(
        context,
      ).outline.withValues(alpha: 0.5),
    );
  }

  Widget _buildAccountMenu(BuildContext context) {
    final state = context.watch<CustomerProfilBloc>().state;
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
                                  child: Text('👨🏻', style: TextStyle(fontSize: 40)),
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
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                color: GlobalHelper.getColorSchema(context).surface,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: GlobalHelper.getColorSchema(context).shadow.withValues(alpha: 0.08),
                    blurRadius: 12,
                    spreadRadius: 1,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  _statItem(
                    context: context,
                    icon: Icons.shopping_bag_outlined,
                    iconColor: GlobalHelper.getColorSchema(context).primary,
                    iconBgColor: GlobalHelper.getColorSchema(
                      context,
                    ).primary.withValues(alpha: 0.1),
                    label: 'Transaksi',
                    value: '${state.transactionCount}',
                    onTap: () {
                      context.read<CustomerShellBloc>().add(CustomerShellTabChanged(2));
                    },
                  ),
                  _verticalDivider(context),
                  _statItem(
                    context: context,
                    icon: Icons.favorite_border_rounded,
                    iconColor: const Color(0xFF3B82F6),
                    iconBgColor: const Color(0xFFEFF6FF),
                    label: 'Wishlist',
                    value: '${state.favoriteCount}',
                    onTap: () {
                      navigatorKey.currentState
                          ?.push(
                            MaterialPageRoute(
                              builder: (_) => const CustomerWishlistScreen(),
                            ),
                          )
                          .then((_) {
                            if (context.mounted) {
                              context.read<CustomerProfilBloc>().add(
                                CustomerLoadProfilData(),
                              );
                            }
                          });
                    },
                  ),
                ],
              ),
            ),
          ),
          _menuItem(
            context: context,
            icon: Icons.person_outline,
            label: 'Edit Profil',
            iconColor: GlobalHelper.getColorSchema(context).primary,
            onTap: () => _onPressEditProfil(context),
          ),
          _divider(context),
          _menuItem(
            context: context,
            icon: Icons.location_on_outlined,
            label: 'Alamat Saya',
            iconColor: GlobalHelper.getColorSchema(context).primary,
            onTap: () => navigatorKey.currentState?.push(
              MaterialPageRoute(builder: (_) => const CustomerAddressScreen()),
            ),
          ),
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
            onTap: () => context.read<CustomerProfilBloc>().add(
              CustomerLaunchUrlEvent(
                '${(isProduction) ? BASE_URL_PROD : BASE_URL_DEV}/pusat-bantuan?mode=customer',
              ),
            ),
          ),
          _divider(context),
          _menuItem(
            context: context,
            icon: Icons.info_outline_rounded,
            label: 'Cara Pemesanan',
            iconColor: GlobalHelper.getColorSchema(context).primary,
            onTap: () => context.read<CustomerProfilBloc>().add(
              CustomerLaunchUrlEvent(
                '${(isProduction) ? BASE_URL_PROD : BASE_URL_DEV}/cara-pemesanan?mode=customer',
              ),
            ),
          ),
          _divider(context),
          _menuItem(
            context: context,
            icon: Icons.privacy_tip_outlined,
            label: 'Kebijakan Privasi',
            iconColor: GlobalHelper.getColorSchema(context).primary,
            onTap: () => context.read<CustomerProfilBloc>().add(
              CustomerLaunchUrlEvent(
                '${(isProduction) ? BASE_URL_PROD : BASE_URL_DEV}/kebijakan-privasi?mode=customer',
              ),
            ),
          ),
          _divider(context),
          _menuItem(
            context: context,
            icon: Icons.description_outlined,
            label: 'Syarat & Ketentuan',
            iconColor: GlobalHelper.getColorSchema(context).primary,
            onTap: () => context.read<CustomerProfilBloc>().add(
              CustomerLaunchUrlEvent(
                '${(isProduction) ? BASE_URL_PROD : BASE_URL_DEV}/syarat-ketentuan?mode=customer',
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
        onPressed: () => navigatorKey.currentState?.push(
          MaterialPageRoute(builder: (_) => const AuthLogoutScreen()),
        ),
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



  void _onPressEditProfil(BuildContext context) async {
    final bloc = context.read<AuthBloc>();
    final isSuccess = await navigatorKey.currentState?.push(
      MaterialPageRoute(builder: (_) => CustomerEditProfileScreen()),
    );
    if (isSuccess == true) bloc.add(AuthEventCheck());
  }
}
