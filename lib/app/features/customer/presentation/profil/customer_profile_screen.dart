import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/customer/presentation/address/customer_address_screen.dart';
import 'package:warunk/app/features/customer/presentation/notification/customer_notification_screen.dart';
import 'package:warunk/app/features/customer/presentation/edit_profil/customer_edit_profile_screen.dart';
import 'package:warunk/app/features/customer/presentation/profil/bloc/customer_profil_bloc.dart';
import 'package:warunk/app/features/customer/presentation/profil/bloc/customer_profil_event.dart';
import 'package:warunk/app/features/customer/presentation/profil/bloc/customer_profil_state.dart';
import 'package:warunk/core/constants/app_colors.dart';
import 'package:warunk/core/widgets/custom_dotted_divider.dart';
import 'package:warunk/core/widgets/shadow_card.dart';

class CustomerProfileScreen extends StatelessWidget {
  const CustomerProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CustomerProfilBloc()..add(CustomerLoadProfilData()),
      child: const _ProfileView(),
    );
  }
}

class _ProfileView extends StatelessWidget {
  const _ProfileView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: BlocBuilder<CustomerProfilBloc, CustomerProfilState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(
                child: CircularProgressIndicator(color: AppColors.primary),
              );
            }
            return SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ── Header ──────────────────────────────────────────────────
                  _buildHeader(context, state),
                  const SizedBox(height: 20),

                  // ── User Info Card ──────────────────────────────────────────
                  _buildUserCard(context, state),
                  const SizedBox(height: 16),

                  // ── Stats Card ──────────────────────────────────────────────
                  _buildStatsCard(state),
                  const SizedBox(height: 16),

                  // ── Menu List ───────────────────────────────────────────────
                  _buildMenuList(context),
                  const SizedBox(height: 16),

                  // ── Promo Banner ────────────────────────────────────────────
                  _buildPromoBanner(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  // ── Header ────────────────────────────────────────────────────────────────
  Widget _buildHeader(BuildContext context, CustomerProfilState state) {
    return Row(
      children: [
        const Text(
          'Profil',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w900,
            color: AppColors.textDark,
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () => Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (_) => const CustomerNotificationScreen())),
          child: Stack(
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.greyBorder),
                ),
                child: const Icon(
                  Icons.notifications_outlined,
                  color: AppColors.textDark,
                  size: 22,
                ),
              ),
              if (state.unreadNotifications > 0)
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    width: 18,
                    height: 18,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        '${state.unreadNotifications}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }

  // ── User Info Card ────────────────────────────────────────────────────────
  Widget _buildUserCard(BuildContext context, CustomerProfilState state) {
    return ShadowCard(
      child: Row(
        children: [
          // Avatar
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: const Color(0xFFB9E4C9), // Light green bg for avatar
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.white, width: 2),
            ),
            child: const Center(
              child: Text('👨🏻', style: TextStyle(fontSize: 40)),
            ),
          ),
          const SizedBox(width: 16),
          // Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  state.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: AppColors.textDark,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(
                      Icons.phone_outlined,
                      size: 14,
                      color: AppColors.primary,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      state.phone,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.greyText,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      size: 14,
                      color: AppColors.primary,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      state.location,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.greyText,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Edit Button
          GestureDetector(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const CustomerEditProfileScreen()),
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.primary),
              ),
              child: Row(
                children: const [
                  Icon(Icons.edit_outlined, size: 14, color: AppColors.primary),
                  SizedBox(width: 4),
                  Text(
                    'Edit',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── Stats Card ────────────────────────────────────────────────────────────
  Widget _buildStatsCard(CustomerProfilState state) {
    return ShadowCard(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          _statItem(
            icon: Icons.shopping_bag_outlined,
            iconColor: AppColors.primary,
            iconBgColor: AppColors.primary.withValues(alpha: 0.1),
            label: 'Transaksi',
            value: '${state.transactionCount}',
          ),
          _verticalDivider(),
          _statItem(
            icon: Icons.confirmation_number_outlined,
            iconColor: const Color(0xFFF59E0B),
            iconBgColor: const Color(0xFFFFF3E0),
            label: 'Voucher',
            value: '${state.voucherCount}',
          ),
          _verticalDivider(),
          _statItem(
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
                style: const TextStyle(fontSize: 11, color: AppColors.greyText),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                  color: AppColors.textDark,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _verticalDivider() {
    return Container(
      width: 1,
      height: 30,
      color: AppColors.greyBorder.withValues(alpha: 0.5),
    );
  }

  // ── Menu List ─────────────────────────────────────────────────────────────
  Widget _buildMenuList(BuildContext context) {
    return ShadowCard(
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          _menuItem(
            Icons.person_outline,
            'Edit Profil',
            AppColors.primary,
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const CustomerEditProfileScreen()),
            ),
          ),
          _divider(),
          _menuItem(
            Icons.location_on_outlined,
            'Alamat Saya',
            AppColors.primary,
            onTap: () => Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (_) => const CustomerAddressScreen())),
          ),
          _divider(),
          _menuItem(
            Icons.credit_card_outlined,
            'Metode Pembayaran',
            AppColors.primary,
          ),
          _divider(),
          _menuItem(
            Icons.confirmation_number_outlined,
            'Voucher Saya',
            AppColors.primary,
          ),

          // Dotted divider
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: CustomDottedDivider(),
          ),

          _menuItem(Icons.help_outline_rounded, 'Bantuan', AppColors.primary),
          _divider(),
          _menuItem(
            Icons.description_outlined,
            'Syarat & Ketentuan',
            AppColors.primary,
          ),
          _divider(),
          _menuItem(
            Icons.logout_rounded,
            'Keluar',
            Colors.red,
            textColor: Colors.red,
            hideChevron: true,
            onTap: () {
              // TODO: Handle logout
            },
          ),
        ],
      ),
    );
  }

  Widget _menuItem(
    IconData icon,
    String label,
    Color iconColor, {
    Color textColor = AppColors.textDark,
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
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: textColor,
                ),
              ),
            ),
            if (!hideChevron)
              const Icon(
                Icons.chevron_right_rounded,
                color: AppColors.primary,
                size: 22,
              ),
          ],
        ),
      ),
    );
  }

  Widget _divider() {
    return const Padding(
      padding: EdgeInsets.only(left: 56, right: 16),
      child: Divider(height: 1, color: AppColors.greyBorder),
    );
  }

  // ── Promo Banner ──────────────────────────────────────────────────────────
  Widget _buildPromoBanner() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF0FDF4), // Light green bg
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.primary.withValues(alpha: 0.2)),
      ),
      child: Row(
        children: [
          // Gift Icon (using a large text emoji since we don't have assets)
          const Text('🎁', style: TextStyle(fontSize: 48)),
          const SizedBox(width: 16),
          // Text content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Ajak teman,\ndapat voucher gratis ongkir',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                    color: AppColors.textDark,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Semakin banyak teman, semakin banyak\nvoucher yang kamu dapatkan!',
                  style: TextStyle(
                    fontSize: 10,
                    color: AppColors.greyText,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 10),
                // Button
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'Ajak Sekarang',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primary,
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
}
