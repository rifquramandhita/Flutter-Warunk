import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/auth/presentation/logout/auth_logout_screen.dart';
import 'package:warunk/app/features/merchant/presentation/delivery_method/merchant_delivery_method_screen.dart';
import 'package:warunk/app/features/merchant/presentation/edit_profil/merchant_edit_profil_screen.dart';
import 'package:warunk/app/features/merchant/presentation/information_store/merchant_information_store_screen.dart';
import 'package:warunk/app/features/merchant/presentation/operational_hours/merchant_operational_hours_screen.dart';
import 'package:warunk/app/features/merchant/presentation/payment_method/merchant_payment_method_screen.dart';
import 'package:warunk/app/features/merchant/presentation/profil/bloc/merchant_profil_bloc.dart';
import 'package:warunk/core/dependency/dependency.dart';
import 'package:warunk/core/helper/global_helper.dart';
import 'package:warunk/core/helper/dialog_helper.dart';
import 'package:warunk/core/widgets/loading_app_widget.dart';
import 'package:warunk/main.dart';

class MerchantProfilScreen extends StatelessWidget {
  const MerchantProfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<MerchantProfilBloc>()..add(MerchantProfilEventGet()),
      child: BlocConsumer<MerchantProfilBloc, MerchantProfilState>(
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
    final state = context.watch<MerchantProfilBloc>().state;
    return SafeArea(
      child: Stack(
        children: [
          _bodyLayout(context, state),
          if (state.isLoading) const LoadingAppWidget(),
        ],
      ),
    );
  }

  Widget _bodyLayout(BuildContext context, MerchantProfilState state) {
    return CustomScrollView(
      slivers: [
        _buildSliverAppBar(context, state),
        SliverToBoxAdapter(
          child: Column(
            children: [
              const SizedBox(height: 20),
              _infoAkunCard(context, state),
              const SizedBox(height: 16),
              _pengaturanCard(context, state),
              const SizedBox(height: 24),
              _logoutButton(context, state),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSliverAppBar(BuildContext context, MerchantProfilState state) {
    final primaryColor = GlobalHelper.getColorSchema(context).primary;
    final textTheme = GlobalHelper.getTextTheme(
      context,
      appTextStyle: AppTextStyle.TITLE_MEDIUM,
    );

    return SliverAppBar(
      expandedHeight: 220,
      pinned: true,
      backgroundColor: primaryColor,
      title: Text(
        'Profil Merchant',
        style: textTheme?.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      actions: [
        GestureDetector(
          onTap: () => navigatorKey.currentState?.push(
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
      flexibleSpace: FlexibleSpaceBar(
        background: _profilHeader(context, state),
      ),
    );
  }

  Widget _profilHeader(BuildContext context, MerchantProfilState state) {
    final colorSchema = GlobalHelper.getColorSchema(context);
    final titleLarge = GlobalHelper.getTextTheme(
      context,
      appTextStyle: AppTextStyle.TITLE_LARGE,
    );
    final labelSmall = GlobalHelper.getTextTheme(
      context,
      appTextStyle: AppTextStyle.LABEL_SMALL,
    );
    final bodySmall = GlobalHelper.getTextTheme(
      context,
      appTextStyle: AppTextStyle.BODY_SMALL,
    );

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            colorSchema.primary,
            colorSchema.primary.withValues(alpha: 0.8),
          ],
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 60, 20, 24),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withValues(alpha: 0.2),
                  border: Border.all(color: Colors.white, width: 3),
                ),
                child: ClipOval(
                  child:
                      state.merchant?.photo != null &&
                          state.merchant!.photo!.isNotEmpty
                      ? Image.network(
                          state.merchant!.photo!,
                          fit: BoxFit.cover,
                          width: 80,
                          height: 80,
                          errorBuilder: (context, error, stackTrace) =>
                              Container(
                                color: colorSchema.primary.withValues(
                                  alpha: 0.3,
                                ),
                                child: const Center(
                                  child: Text(
                                    '🏪',
                                    style: TextStyle(fontSize: 36),
                                  ),
                                ),
                              ),
                        )
                      : Container(
                          color: colorSchema.primary.withValues(alpha: 0.3),
                          child: const Center(
                            child: Text('🏪', style: TextStyle(fontSize: 36)),
                          ),
                        ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      state.merchant?.name ?? '',
                      style: titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: colorSchema.secondary,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        state.merchant?.merchantCategory?.name ?? '',
                        style: labelSmall?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Icon(
                          Icons.phone,
                          color: Colors.white70,
                          size: 14,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          state.merchant?.phone ?? '',
                          style: bodySmall?.copyWith(color: Colors.white),
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

  Widget _infoAkunCard(BuildContext context, MerchantProfilState state) {
    return _sectionCard(
      context: context,
      title: 'Informasi Akun',
      children: [
        _infoRow(context: context, label: 'Nama Pemilik', value: state.name),
        _divider(context),
        _infoRow(context: context, label: 'Email', value: state.email),
        _divider(context),
        _infoRow(context: context, label: 'No. WhatsApp', value: state.phone),
        _divider(context),
        _passwordRow(context),
      ],
    );
  }

  Widget _pengaturanCard(BuildContext context, MerchantProfilState state) {
    return _sectionCard(
      context: context,
      title: 'Pengaturan',
      children: [
        _navRow(
          context: context,
          label: 'Informasi Toko',
          onTap: () => navigatorKey.currentState?.push(
            MaterialPageRoute(
              builder: (_) => const MerchantInformationStoreScreen(),
            ),
          ),
        ),
        _divider(context),
        _navRow(
          context: context,
          label: 'Metode Pembayaran',
          onTap: () => navigatorKey.currentState?.push(
            MaterialPageRoute(
              builder: (_) => const MerchantPaymentMethodScreen(),
            ),
          ),
        ),
        _divider(context),
        _navRow(
          context: context,
          label: 'Jam Operasional',
          onTap: () => navigatorKey.currentState?.push(
            MaterialPageRoute(
              builder: (_) => const MerchantOperationalHoursScreen(),
            ),
          ),
        ),
        _divider(context),
        _navRow(
          context: context,
          label: 'Metode Pengiriman',
          onTap: () => navigatorKey.currentState?.push(
            MaterialPageRoute(
              builder: (_) => const MerchantDeliveryMethodScreen(),
            ),
          ),
        ),
        _divider(context),
        _navRow(context: context, label: 'Keamanan Akun', onTap: () {}),
      ],
    );
  }

  Widget _sectionCard({
    required BuildContext context,
    required String title,
    required List<Widget> children,
  }) {
    final titleStyle = GlobalHelper.getTextTheme(
      context,
      appTextStyle: AppTextStyle.TITLE_SMALL,
    );
    final colorSchema = GlobalHelper.getColorSchema(context);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: colorSchema.surface,
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
              style: titleStyle?.copyWith(
                fontWeight: FontWeight.bold,
                color: colorSchema.onSurface,
              ),
            ),
          ),
          ...children,
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget _infoRow({
    required BuildContext context,
    required String label,
    required String value,
  }) {
    final bodyStyle = GlobalHelper.getTextTheme(
      context,
      appTextStyle: AppTextStyle.BODY_SMALL,
    );
    final colorSchema = GlobalHelper.getColorSchema(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: [
          Text(label, style: bodyStyle?.copyWith(color: colorSchema.onSurface)),
          const Spacer(),
          Text(
            value,
            style: bodyStyle?.copyWith(color: colorSchema.onSurfaceVariant),
          ),
        ],
      ),
    );
  }

  Widget _passwordRow(BuildContext context) {
    final bodyStyle = GlobalHelper.getTextTheme(
      context,
      appTextStyle: AppTextStyle.BODY_SMALL,
    );
    final colorSchema = GlobalHelper.getColorSchema(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: [
          Text(
            'Password',
            style: bodyStyle?.copyWith(color: colorSchema.onSurface),
          ),
          const Spacer(),
          Text(
            '••••••••',
            style: bodyStyle?.copyWith(
              color: colorSchema.onSurfaceVariant,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: () {},
            child: Text(
              'Ubah',
              style: bodyStyle?.copyWith(
                fontWeight: FontWeight.w600,
                color: colorSchema.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _navRow({
    required BuildContext context,
    required String label,
    required VoidCallback onTap,
    String? trailing,
  }) {
    final bodyStyle = GlobalHelper.getTextTheme(
      context,
      appTextStyle: AppTextStyle.BODY_SMALL,
    );
    final colorSchema = GlobalHelper.getColorSchema(context);

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            Text(
              label,
              style: bodyStyle?.copyWith(color: colorSchema.onSurface),
            ),
            const Spacer(),
            if (trailing != null)
              Text(
                trailing,
                style: bodyStyle?.copyWith(color: colorSchema.onSurfaceVariant),
              ),
            const SizedBox(width: 4),
            Icon(
              Icons.chevron_right,
              size: 18,
              color: colorSchema.onSurfaceVariant,
            ),
          ],
        ),
      ),
    );
  }

  Widget _divider(BuildContext context) {
    final colorSchema = GlobalHelper.getColorSchema(context);
    return Divider(
      height: 1,
      indent: 16,
      endIndent: 16,
      color: colorSchema.outlineVariant,
    );
  }

  Widget _logoutButton(BuildContext context, MerchantProfilState state) {
    final titleStyle = GlobalHelper.getTextTheme(
      context,
      appTextStyle: AppTextStyle.TITLE_SMALL,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
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
      ),
    );
  }
}
