import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/auth/presentation/logout/auth_logout_screen.dart';
import 'package:warunk/app/features/customer/presentation/address/customer_address_screen.dart';
import 'package:warunk/app/features/customer/presentation/notification/customer_notification_screen.dart';
import 'package:warunk/app/features/customer/presentation/edit_profil/customer_edit_profile_screen.dart';
import 'package:warunk/app/features/customer/presentation/profil/bloc/customer_profil_bloc.dart';
import 'package:warunk/app/features/customer/presentation/profil/bloc/customer_profil_event.dart';
import 'package:warunk/app/features/customer/presentation/profil/bloc/customer_profil_state.dart';
import 'package:warunk/main.dart';
import 'package:warunk/core/widgets/custom_dotted_divider.dart';
import 'package:warunk/core/widgets/shadow_card.dart';
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
            appBar: _appBarBuild(context),
            body: _bodyBuild(context),
          );
        },
      ),
    );
  }

  AppBar _appBarBuild(BuildContext context) {
    final state = context.watch<CustomerProfilBloc>().state;
    return AppBar(
      title: const Text('Profil'),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: GestureDetector(
            onTap: () => navigatorKey.currentState?.push(
              MaterialPageRoute(
                builder: (_) => const CustomerNotificationScreen(),
              ),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Icon(
                  Icons.notifications_outlined,
                  color: GlobalHelper.getColorSchema(context).onSurface,
                  size: 26,
                ),
                if (state.unreadNotifications > 0)
                  Positioned(
                    top: 8,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 14,
                        minHeight: 14,
                      ),
                      child: Text(
                        '${state.unreadNotifications}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 8,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _bodyBuild(BuildContext context) {
    final state = context.watch<CustomerProfilBloc>().state;
    return SafeArea(
      child: Stack(
        children: [
          _bodyLayout(context),
          if (state.isLoading)
            Center(
              child: CircularProgressIndicator(
                color: GlobalHelper.getColorSchema(context).primary,
              ),
            ),
        ],
      ),
    );
  }

  Widget _bodyLayout(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildUserCard(context),
          const SizedBox(height: 16),
          _buildStatsCard(context),
          const SizedBox(height: 16),
          _buildMenuList(context),
          const SizedBox(height: 16),
          _buildPromoBanner(context),
        ],
      ),
    );
  }

  Widget _buildUserCard(BuildContext context) {
    final authState = context.watch<AuthBloc>().state;
    return ShadowCard(
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
                          const Center(child: Text('👨🏻', style: TextStyle(fontSize: 40))),
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
    );
  }

  Widget _buildStatsCard(BuildContext context) {
    final state = context.watch<CustomerProfilBloc>().state;
    return ShadowCard(
      padding: const EdgeInsets.symmetric(vertical: 16),
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
          ),
          _verticalDivider(context),
          _statItem(
            context: context,
            icon: Icons.confirmation_number_outlined,
            iconColor: const Color(0xFFF59E0B),
            iconBgColor: const Color(0xFFFFF3E0),
            label: 'Voucher',
            value: '${state.voucherCount}',
          ),
          _verticalDivider(context),
          _statItem(
            context: context,
            icon: Icons.favorite_border_rounded,
            iconColor: const Color(0xFF3B82F6),
            iconBgColor: const Color(0xFFEFF6FF),
            label: 'Favorit',
            value: '${state.favoriteCount}',
          ),
        ],
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
  }) {
    return Expanded(
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

  Widget _buildMenuList(BuildContext context) {
    return ShadowCard(
      padding: EdgeInsets.zero,
      child: Column(
        children: [
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
          _divider(context),
          _menuItem(
            context: context,
            icon: Icons.credit_card_outlined,
            label: 'Metode Pembayaran',
            iconColor: GlobalHelper.getColorSchema(context).primary,
          ),
          _divider(context),
          _menuItem(
            context: context,
            icon: Icons.confirmation_number_outlined,
            label: 'Voucher Saya',
            iconColor: GlobalHelper.getColorSchema(context).primary,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: CustomDottedDivider(),
          ),
          _menuItem(
            context: context,
            icon: Icons.help_outline_rounded,
            label: 'Bantuan',
            iconColor: GlobalHelper.getColorSchema(context).primary,
          ),
          _divider(context),
          _menuItem(
            context: context,
            icon: Icons.description_outlined,
            label: 'Syarat & Ketentuan',
            iconColor: GlobalHelper.getColorSchema(context).primary,
          ),
          _divider(context),
          _menuItem(
            context: context,
            icon: Icons.logout_rounded,
            label: 'Keluar',
            iconColor: Colors.red,
            textColor: Colors.red,
            hideChevron: true,
            onTap: () => navigatorKey.currentState?.push(
              MaterialPageRoute(builder: (context) => AuthLogoutScreen()),
            ),
          ),
        ],
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

  Widget _buildPromoBanner(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF0FDF4),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: GlobalHelper.getColorSchema(
            context,
          ).primary.withValues(alpha: 0.2),
        ),
      ),
      child: Row(
        children: [
          const Text('🎁', style: TextStyle(fontSize: 48)),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ajak teman,\ndapat voucher gratis ongkir',
                  style: GlobalHelper.getTextTheme(
                    context,
                    appTextStyle: AppTextStyle.BODY_SMALL,
                  )?.copyWith(fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 4),
                Text(
                  'Semakin banyak teman, semakin banyak\nvoucher yang kamu dapatkan!',
                  style:
                      GlobalHelper.getTextTheme(
                        context,
                        appTextStyle: AppTextStyle.LABEL_SMALL,
                      )?.copyWith(
                        color: GlobalHelper.getColorSchema(
                          context,
                        ).onSurfaceVariant,
                        height: 1.4,
                      ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: GlobalHelper.getColorSchema(
                      context,
                    ).primary.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Ajak Sekarang',
                    style:
                        GlobalHelper.getTextTheme(
                          context,
                          appTextStyle: AppTextStyle.LABEL_SMALL,
                        )?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: GlobalHelper.getColorSchema(context).primary,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ],
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
