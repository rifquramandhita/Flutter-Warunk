import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/merchant/presentation/input_promo/merchant_input_promo_screen.dart';
import 'package:warunk/app/features/merchant/presentation/promotion/bloc/merchant_promo_bloc.dart';
import 'package:warunk/theme/app_colors.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Entry point — provides BLoC
// ─────────────────────────────────────────────────────────────────────────────
class MerchantPromoScreen extends StatelessWidget {
  const MerchantPromoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MerchantPromoBloc(),
      child: const _MerchantPromoView(),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Main view
// ─────────────────────────────────────────────────────────────────────────────
class _MerchantPromoView extends StatelessWidget {
  const _MerchantPromoView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: _buildAppBar(context),
      body: const Column(
        children: [
          SizedBox(height: 12),
          _TabFilter(),
          SizedBox(height: 12),
          Expanded(child: _PromoList()),
        ],
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.background,
      elevation: 0,
      centerTitle: true,
      leading: GestureDetector(
        onTap: () => Navigator.of(context).maybePop(),
        child: Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.white,
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.greyBorder),
          ),
          child: const Icon(
            Icons.arrow_back,
            color: AppColors.textDark,
            size: 18,
          ),
        ),
      ),
      title: const Text(
        'Promo Saya',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: AppColors.textDark,
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => const MerchantInputPromoScreen()),
          ),
          child: Container(
            margin: const EdgeInsets.only(right: 16),
            width: 38,
            height: 38,
            decoration: const BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.add, color: AppColors.white, size: 22),
          ),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Tab Filter
// ─────────────────────────────────────────────────────────────────────────────
class _TabFilter extends StatelessWidget {
  const _TabFilter();

  static const _labels = ['Aktif', 'Akan Datang', 'Selesai'];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MerchantPromoBloc, MerchantPromoState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: List.generate(_labels.length, (index) {
              final isSelected = state.selectedTab == index;
              return Padding(
                padding: EdgeInsets.only(
                  right: index < _labels.length - 1 ? 10 : 0,
                ),
                child: GestureDetector(
                  onTap: () => context.read<MerchantPromoBloc>().add(
                    MerchantPromoTabChanged(index),
                  ),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 9,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppColors.primary.withValues(alpha: 0.13)
                          : AppColors.white,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        color: isSelected
                            ? AppColors.primary.withValues(alpha: 0.4)
                            : AppColors.greyBorder,
                      ),
                    ),
                    child: Text(
                      _labels[index],
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: isSelected
                            ? FontWeight.w700
                            : FontWeight.w500,
                        color: isSelected
                            ? AppColors.primary
                            : AppColors.greyText,
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        );
      },
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Promo List
// ─────────────────────────────────────────────────────────────────────────────
class _PromoList extends StatelessWidget {
  const _PromoList();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MerchantPromoBloc, MerchantPromoState>(
      builder: (context, state) {
        final promos = state.filteredPromos;

        if (promos.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.local_offer_outlined,
                  size: 64,
                  color: AppColors.greyText.withValues(alpha: 0.4),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Belum ada promo',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.greyText,
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'Tambah promo baru dengan tombol + di atas',
                  style: TextStyle(fontSize: 13, color: AppColors.greyText),
                ),
              ],
            ),
          );
        }

        return ListView.separated(
          padding: const EdgeInsets.fromLTRB(20, 4, 20, 24),
          itemCount: promos.length,
          separatorBuilder: (_, _) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            return _PromoCard(promo: promos[index]);
          },
        );
      },
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Promo Card
// ─────────────────────────────────────────────────────────────────────────────
class _PromoCard extends StatelessWidget {
  const _PromoCard({required this.promo});
  final PromoItem promo;

  @override
  Widget build(BuildContext context) {
    final (typeLabel, typeBg, typeText) = _typeStyle(promo.type);
    final valueColor = _valueColor(promo.type);
    final isPercentage = promo.value.contains('%');

    return Container(
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
          // ── Top section ──────────────────────────────────────────────────
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Type badge + title
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _TypeBadge(label: typeLabel, bg: typeBg, text: typeText),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        promo.title,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textDark,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                // Value + meta
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Value (big)
                    Text(
                      promo.value,
                      style: TextStyle(
                        fontSize: isPercentage ? 32 : 26,
                        fontWeight: FontWeight.w800,
                        color: valueColor,
                        height: 1.1,
                      ),
                    ),
                    const SizedBox(width: 16),
                    // Meta info
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (promo.minPurchase.isNotEmpty) ...[
                            Text(
                              promo.minPurchase,
                              style: const TextStyle(
                                fontSize: 12,
                                color: AppColors.greyText,
                              ),
                            ),
                            const SizedBox(height: 2),
                          ],
                          Text(
                            promo.dateRange,
                            style: const TextStyle(
                              fontSize: 12,
                              color: AppColors.greyText,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // ── Divider ──────────────────────────────────────────────────────
          const Divider(height: 1, color: AppColors.greyBorder),
          // ── Bottom section: usage + toggle ───────────────────────────────
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Text(
                  '${promo.usedCount} digunakan',
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppColors.greyText,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                _PromoToggle(promo: promo),
              ],
            ),
          ),
        ],
      ),
    );
  }

  (String, Color, Color) _typeStyle(PromoType type) {
    return switch (type) {
      PromoType.diskon => (
        'DISKON',
        const Color(0xFFFFF3C4),
        const Color(0xFFF59E0B),
      ),
      PromoType.potongan => (
        'POTONGAN',
        const Color(0xFFDCEEFD),
        const Color(0xFF2563EB),
      ),
      PromoType.diskonProduk => (
        'DISKON PRODUK',
        const Color(0xFFFFF3C4),
        const Color(0xFFF59E0B),
      ),
    };
  }

  Color _valueColor(PromoType type) {
    return switch (type) {
      PromoType.diskon => const Color(0xFFF59E0B),
      PromoType.potongan => const Color(0xFF2563EB),
      PromoType.diskonProduk => const Color(0xFFF59E0B),
    };
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Type Badge
// ─────────────────────────────────────────────────────────────────────────────
class _TypeBadge extends StatelessWidget {
  const _TypeBadge({required this.label, required this.bg, required this.text});
  final String label;
  final Color bg;
  final Color text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w700,
          color: text,
          letterSpacing: 0.3,
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Animated Toggle Switch
// ─────────────────────────────────────────────────────────────────────────────
class _PromoToggle extends StatelessWidget {
  const _PromoToggle({required this.promo});
  final PromoItem promo;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          context.read<MerchantPromoBloc>().add(MerchantPromoToggled(promo.id)),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        width: 48,
        height: 28,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: promo.isActive ? AppColors.primary : AppColors.greyBorder,
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 220),
              curve: Curves.easeInOut,
              left: promo.isActive ? 22 : 2,
              top: 2,
              child: Container(
                width: 24,
                height: 24,
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 4,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
