import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/auth/presentation/logout/auth_logout_screen.dart';
import 'package:warunk/app/features/merchant/presentation/delivery_method/merchant_delivery_method_screen.dart';
import 'package:warunk/app/features/merchant/presentation/edit_profil/merchant_edit_profil_screen.dart';
import 'package:warunk/app/features/merchant/presentation/information_store/merchant_information_store_screen.dart';
import 'package:warunk/app/features/merchant/presentation/operational_hours/merchant_operational_hours_screen.dart';
import 'package:warunk/app/features/merchant/presentation/payment_method/merchant_payment_method_screen.dart';
import 'package:warunk/app/features/merchant/presentation/profil/bloc/merchant_profil_bloc.dart';
import 'package:warunk/theme/app_colors.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Entry point — provides BLoC
// ─────────────────────────────────────────────────────────────────────────────
class MerchantProfilScreen extends StatelessWidget {
  const MerchantProfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MerchantProfilBloc(),
      child: const _MerchantProfilView(),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Main view
// ─────────────────────────────────────────────────────────────────────────────
class _MerchantProfilView extends StatelessWidget {
  const _MerchantProfilView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MerchantProfilBloc, MerchantProfilState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.background,
          body: CustomScrollView(
            slivers: [
              _buildSliverAppBar(context, state),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    _InfoAkunCard(state: state),
                    const SizedBox(height: 16),
                    _PengaturanCard(state: state),
                    const SizedBox(height: 24),
                    _LogoutButton(state: state),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSliverAppBar(BuildContext context, MerchantProfilState state) {
    return SliverAppBar(
      expandedHeight: 220,
      pinned: true,
      backgroundColor: AppColors.primary,
      leading: GestureDetector(
        onTap: () => Navigator.of(context).maybePop(),
        child: Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.2),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.arrow_back, color: Colors.white, size: 18),
        ),
      ),
      title: const Text(
        'Profil Merchant',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      centerTitle: true,
      actions: [
        GestureDetector(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => const MerchantEditProfilScreen()),
          ),
          child: Container(
            margin: const EdgeInsets.only(right: 16),
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.edit_outlined,
              color: Colors.white,
              size: 18,
            ),
          ),
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(background: _ProfilHeader(state: state)),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Header (expanded area)
// ─────────────────────────────────────────────────────────────────────────────
class _ProfilHeader extends StatelessWidget {
  const _ProfilHeader({required this.state});
  final MerchantProfilState state;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF2D6A4F), Color(0xFF52B788)],
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 60, 20, 24),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Avatar
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withValues(alpha: 0.2),
                  border: Border.all(color: Colors.white, width: 3),
                ),
                child: ClipOval(
                  child: Container(
                    color: const Color(0xFF2D6A4F).withValues(alpha: 0.3),
                    child: const Center(
                      child: Text('🏪', style: TextStyle(fontSize: 36)),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              // Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      state.storeName,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 6),
                    // Merchant badge
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.yellowDark,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'Merchant',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Phone
                    Row(
                      children: [
                        const Icon(
                          Icons.phone,
                          color: Colors.white70,
                          size: 14,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          state.whatsapp,
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    // Email
                    Row(
                      children: [
                        const Icon(
                          Icons.email_outlined,
                          color: Colors.white70,
                          size: 14,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          state.email,
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.white,
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
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Informasi Akun Card
// ─────────────────────────────────────────────────────────────────────────────
class _InfoAkunCard extends StatelessWidget {
  const _InfoAkunCard({required this.state});
  final MerchantProfilState state;

  @override
  Widget build(BuildContext context) {
    return _SectionCard(
      title: 'Informasi Akun',
      children: [
        _InfoRow(label: 'Nama Pemilik', value: state.ownerName),
        _Divider(),
        _InfoRow(label: 'Email', value: state.email),
        _Divider(),
        _InfoRow(label: 'No. WhatsApp', value: state.whatsapp),
        _Divider(),
        _PasswordRow(),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Pengaturan Card
// ─────────────────────────────────────────────────────────────────────────────
class _PengaturanCard extends StatelessWidget {
  const _PengaturanCard({required this.state});
  final MerchantProfilState state;

  @override
  Widget build(BuildContext context) {
    return _SectionCard(
      title: 'Pengaturan',
      children: [
        _NavRow(
          label: 'Informasi Toko',
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => const MerchantInformationStoreScreen(),
            ),
          ),
        ),
        _Divider(),
        _NavRow(
          label: 'Metode Pembayaran',
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => const MerchantPaymentMethodScreen(),
            ),
          ),
        ),
        _Divider(),
        _NavRow(
          label: 'Jam Operasional',
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => const MerchantOperationalHoursScreen(),
            ),
          ),
        ),
        _Divider(),
        _NavRow(
          label: 'Metode Pengiriman',
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => const MerchantDeliveryMethodScreen(),
            ),
          ),
        ),
        _Divider(),
        _NavRow(label: 'Keamanan Akun', onTap: () {}),
        _Divider(),
        _NavRow(label: 'Bahasa', trailing: state.language, onTap: () {}),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Reusable Section Card wrapper
// ─────────────────────────────────────────────────────────────────────────────
class _SectionCard extends StatelessWidget {
  const _SectionCard({required this.title, required this.children});
  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppColors.textDark,
              ),
            ),
          ),
          ...children,
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Row widgets
// ─────────────────────────────────────────────────────────────────────────────
class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.label, required this.value});
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 13, color: AppColors.textDark),
          ),
          const Spacer(),
          Text(
            value,
            style: const TextStyle(fontSize: 13, color: AppColors.greyText),
          ),
        ],
      ),
    );
  }
}

class _PasswordRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: [
          const Text(
            'Password',
            style: TextStyle(fontSize: 13, color: AppColors.textDark),
          ),
          const Spacer(),
          const Text(
            '••••••••',
            style: TextStyle(
              fontSize: 13,
              color: AppColors.greyText,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: () {},
            child: const Text(
              'Ubah',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _NavRow extends StatelessWidget {
  const _NavRow({required this.label, required this.onTap, this.trailing});
  final String label;
  final String? trailing;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            Text(
              label,
              style: const TextStyle(fontSize: 13, color: AppColors.textDark),
            ),
            const Spacer(),
            if (trailing != null)
              Text(
                trailing!,
                style: const TextStyle(fontSize: 13, color: AppColors.greyText),
              ),
            const SizedBox(width: 4),
            const Icon(
              Icons.chevron_right,
              size: 18,
              color: AppColors.greyText,
            ),
          ],
        ),
      ),
    );
  }
}

class _Divider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 1,
      indent: 16,
      endIndent: 16,
      color: AppColors.greyBorder,
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Logout Button
// ─────────────────────────────────────────────────────────────────────────────
class _LogoutButton extends StatelessWidget {
  const _LogoutButton({required this.state});
  final MerchantProfilState state;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        width: double.infinity,
        height: 52,
        child: OutlinedButton(
          onPressed: () => Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (_) => const AuthLogoutScreen())),
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Colors.red, width: 1.5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            foregroundColor: Colors.red,
          ),
          child: const Text(
            'Logout',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
