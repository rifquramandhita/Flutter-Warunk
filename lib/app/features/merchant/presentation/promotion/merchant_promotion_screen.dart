import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_promotion.dart';
import 'package:warunk/app/features/merchant/presentation/input_promotion/merchant_input_promotion_screen.dart';
import 'package:warunk/app/features/merchant/presentation/promotion/bloc/merchant_promotion_bloc.dart';
import 'package:warunk/app/features/merchant/presentation/promotion/merchant_detail_promotion_screen.dart';
import 'package:warunk/core/dependency/dependency.dart';
import 'package:warunk/core/helper/global_helper.dart';
import 'package:warunk/core/helper/dialog_helper.dart';
import 'package:warunk/core/widgets/loading_app_widget.dart';
import 'package:warunk/main.dart';
import 'package:warunk/core/helper/number_helper.dart';

class MerchantPromotionScreen extends StatelessWidget {
  const MerchantPromotionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<MerchantPromotionBloc>()..add(MerchantPromotionEventGet()),
      child: BlocConsumer<MerchantPromotionBloc, MerchantPromotionState>(
        listener: (context, state) {
          if (state.errorMessage != null) {
            DialogHelper.showErrorSnackBar(
              context: context,
              text: state.errorMessage!,
            );
          }
          if (state.isSuccess) {
            DialogHelper.showSnackBar(
              context: context,
              text: 'Promo berhasil dihapus',
              color: Colors.green,
            );
          }
          if (state.isJoinSuccess) {
            DialogHelper.showSnackBar(
              context: context,
              text: 'Berhasil mengikuti promo nasional',
              color: Colors.green,
            );
            context.read<MerchantPromotionBloc>().add(MerchantPromotionEventGet());
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: GlobalHelper.getColorSchema(context).surface,
            appBar: _buildAppBar(context),
            body: _bodyBuild(context),
            floatingActionButton: _buildFab(context),
          );
        },
      ),
    );
  }

  Widget _bodyBuild(BuildContext context) {
    final state = context.watch<MerchantPromotionBloc>().state;
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
    return Column(
      children: [
        const SizedBox(height: 12),
        _buildNationalPromoBanner(context),
        _buildTabFilter(context),
        const SizedBox(height: 12),
        Expanded(child: _buildPromoList(context)),
      ],
    );
  }

  Widget _buildNationalPromoBanner(BuildContext context) {
    final state = context.watch<MerchantPromotionBloc>().state;
    if (state.nationalPromos.isEmpty) return const SizedBox.shrink();

    return Container(
      height: 150,
      margin: const EdgeInsets.only(bottom: 12),
      child: PageView.builder(
        controller: PageController(viewportFraction: 0.9),
        itemCount: state.nationalPromos.length,
        itemBuilder: (context, index) {
          final promo = state.nationalPromos[index];
          final colors = GlobalHelper.getColorSchema(context);
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                colors: [
                  colors.primary,
                  colors.primary.withValues(alpha: 0.7),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              image: promo.bannerImage != null
                  ? DecorationImage(
                      image: NetworkImage(promo.bannerImage!),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.black.withValues(alpha: 0.4), BlendMode.darken),
                    )
                  : null,
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MerchantDetailPromotionScreen(promo: promo),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.25),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              'PROMO NASIONAL',
                              style: GlobalHelper.getTextTheme(context, appTextStyle: AppTextStyle.LABEL_SMALL)?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          if (promo.hasJoined)
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.check_circle, color: colors.primary, size: 14),
                                  const SizedBox(width: 4),
                                  Text(
                                    'Sudah Join',
                                    style: GlobalHelper.getTextTheme(context, appTextStyle: AppTextStyle.LABEL_SMALL)?.copyWith(
                                      color: colors.primary,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          else if (promo.isOpenToJoin && promo.joinUrl != null && promo.joinUrl!.isNotEmpty)
                            GestureDetector(
                              onTap: () {
                                context.read<MerchantPromotionBloc>().add(
                                  MerchantPromotionEventJoinNational(promo.id, joinUrl: promo.joinUrl),
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  'Join',
                                  style: GlobalHelper.getTextTheme(context, appTextStyle: AppTextStyle.LABEL_SMALL)?.copyWith(
                                    color: colors.primary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                      const Spacer(),
                      Text(
                        promo.title,
                        style: GlobalHelper.getTextTheme(context, appTextStyle: AppTextStyle.TITLE_MEDIUM)?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${DateFormat('d MMM yyyy').format(promo.datetimeStart)} - ${DateFormat('d MMM yyyy').format(promo.datetimeEnd)}',
                        style: GlobalHelper.getTextTheme(context, appTextStyle: AppTextStyle.BODY_SMALL)?.copyWith(
                          color: Colors.white.withValues(alpha: 0.9),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    final colors = GlobalHelper.getColorSchema(context);
    final textTheme = GlobalHelper.getTextTheme(
      context,
      appTextStyle: AppTextStyle.TITLE_MEDIUM,
    );

    return AppBar(
      backgroundColor: colors.surface,
      elevation: 0,
      centerTitle: true,
      title: Text(
        'Promo Saya',
        style: textTheme?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildTabFilter(BuildContext context) {
    final state = context.watch<MerchantPromotionBloc>().state;
    final labels = ['Semua', 'Aktif', 'Akan Datang', 'Selesai'];

    return SizedBox(
      height: 38,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: labels.length,
        separatorBuilder: (_, _) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final isSelected = state.selectedTab == index;
          return GestureDetector(
            onTap: () => context.read<MerchantPromotionBloc>().add(
              MerchantPromotionEventTabChanged(index),
            ),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 18),
              decoration: BoxDecoration(
                color: isSelected
                    ? GlobalHelper.getColorSchema(
                        context,
                      ).primary.withValues(alpha: 0.13)
                    : GlobalHelper.getColorSchema(context).surface,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: isSelected
                      ? GlobalHelper.getColorSchema(
                          context,
                        ).primary.withValues(alpha: 0.5)
                      : GlobalHelper.getColorSchema(context).outlineVariant,
                ),
              ),
              child: Center(
                child: Text(
                  labels[index],
                  style:
                      GlobalHelper.getTextTheme(
                        context,
                        appTextStyle: AppTextStyle.BODY_SMALL,
                      )?.copyWith(
                        fontWeight: isSelected
                            ? FontWeight.w700
                            : FontWeight.w500,
                        color: isSelected
                            ? GlobalHelper.getColorSchema(context).primary
                            : GlobalHelper.getColorSchema(
                                context,
                              ).onSurfaceVariant,
                      ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildPromoList(BuildContext context) {
    final state = context.watch<MerchantPromotionBloc>().state;
    final promos = state.filteredPromos;
    final colors = GlobalHelper.getColorSchema(context);
    final textThemeTitle = GlobalHelper.getTextTheme(
      context,
      appTextStyle: AppTextStyle.TITLE_MEDIUM,
    );
    final textThemeBody = GlobalHelper.getTextTheme(
      context,
      appTextStyle: AppTextStyle.BODY_SMALL,
    );

    if (promos.isEmpty && !state.isLoading) {
      return RefreshIndicator(
        onRefresh: () async {
          context.read<MerchantPromotionBloc>().add(
            MerchantPromotionEventGet(),
          );
          await Future.delayed(const Duration(seconds: 1));
        },
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.local_offer_outlined,
                      size: 64,
                      color: colors.onSurfaceVariant.withValues(alpha: 0.4),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Belum ada promo',
                      style: textThemeTitle?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: colors.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Tambah promo baru dengan tombol + di atas',
                      style: textThemeBody?.copyWith(
                        color: colors.onSurfaceVariant,
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

    return RefreshIndicator(
      onRefresh: () async {
        context.read<MerchantPromotionBloc>().add(MerchantPromotionEventGet());
        await Future.delayed(const Duration(seconds: 1));
      },
      child: ListView.separated(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(20, 4, 20, 24),
        itemCount: promos.length,
        separatorBuilder: (_, _) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          return _buildPromoCard(context, promos[index]);
        },
      ),
    );
  }

  Widget _buildPromoCard(BuildContext context, MerchantPromotionEntity promo) {
    final colors = GlobalHelper.getColorSchema(context);
    final textThemeTitle = GlobalHelper.getTextTheme(
      context,
      appTextStyle: AppTextStyle.TITLE_SMALL,
    );
    final textThemeValue = GlobalHelper.getTextTheme(
      context,
      appTextStyle: AppTextStyle.HEADLINE_MEDIUM,
    );
    final textThemeMeta = GlobalHelper.getTextTheme(
      context,
      appTextStyle: AppTextStyle.LABEL_SMALL,
    );

    final (typeLabel, typeBg, typeText) = _typeStyle(promo.type);
    final valueColor = _valueColor(promo.type, colors.primary);

    final minPurchaseStr =
        'Min. Pembelian ${NumberHelper.formatIDR(promo.minPurchase)}';
    final dateRangeStr =
        '${DateFormat('d MMM').format(promo.datetimeStart)} - ${DateFormat('d MMM yyyy').format(promo.datetimeEnd)}';
    final usedCount = promo.maxUse ?? 0;

    return GestureDetector(
      onTap: () => _onPressItem(context, promo),
      child: Container(
        decoration: BoxDecoration(
          color: colors.surface,
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
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _buildTypeBadge(context, typeLabel, typeBg, typeText),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          promo.title,
                          style: textThemeTitle?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: colors.onSurface,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        promo.discountLabel,
                        style: textThemeValue?.copyWith(
                          fontWeight: FontWeight.w800,
                          color: valueColor,
                          height: 1.1,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (minPurchaseStr.isNotEmpty) ...[
                              Text(
                                minPurchaseStr,
                                style: textThemeMeta?.copyWith(
                                  color: colors.onSurfaceVariant,
                                ),
                              ),
                              const SizedBox(height: 2),
                            ],
                            Text(
                              dateRangeStr,
                              style: textThemeMeta?.copyWith(
                                color: colors.onSurfaceVariant,
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
            Divider(height: 1, color: colors.outlineVariant),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  Text(
                    '$usedCount digunakan',
                    style: textThemeMeta?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: colors.onSurfaceVariant,
                    ),
                  ),
                  const Spacer(),
                  _buildPromoDeleteAction(context, promo),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTypeBadge(
    BuildContext context,
    String label,
    Color bg,
    Color text,
  ) {
    final textTheme = GlobalHelper.getTextTheme(
      context,
      appTextStyle: AppTextStyle.LABEL_SMALL,
    );
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        label,
        style: textTheme?.copyWith(
          fontWeight: FontWeight.w700,
          color: text,
          letterSpacing: 0.3,
        ),
      ),
    );
  }

  Widget _buildPromoDeleteAction(
    BuildContext context,
    MerchantPromotionEntity promo,
  ) {
    return IconButton(
      icon: Icon(
        Icons.delete_outline,
        color: GlobalHelper.getColorSchema(context).error,
      ),
      onPressed: () {
        DialogHelper.showBottomSheetDialog(
          context: context,
          title: 'Hapus Promo',
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Apakah Anda yakin ingin menghapus promo "${promo.title}"?',
                style: GlobalHelper.getTextTheme(
                  context,
                  appTextStyle: AppTextStyle.BODY_LARGE,
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  context.read<MerchantPromotionBloc>().add(
                    MerchantPromotionEventDeleted(promo.id),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: GlobalHelper.getColorSchema(context).error,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: Text(
                  'Hapus Promo',
                  style:
                      GlobalHelper.getTextTheme(
                        context,
                        appTextStyle: AppTextStyle.TITLE_SMALL,
                      )?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: GlobalHelper.getColorSchema(context).onError,
                      ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  (String, Color, Color) _typeStyle(String type) {
    if (type == 'order') {
      return ('DISKON', const Color(0xFFFFF3C4), const Color(0xFFF59E0B));
    } else {
      return ('POTONGAN', const Color(0xFFDCEEFD), const Color(0xFF2563EB));
    }
  }

  Color _valueColor(String type, Color primaryColor) {
    if (type == 'order') {
      return const Color(0xFFF59E0B);
    } else {
      return const Color(0xFF2563EB);
    }
  }

  Widget _buildFab(BuildContext context) {
    final colors = GlobalHelper.getColorSchema(context);
    final textTheme = GlobalHelper.getTextTheme(
      context,
      appTextStyle: AppTextStyle.TITLE_SMALL,
    );

    return GestureDetector(
      onTap: () => _onPressFab(context),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        decoration: BoxDecoration(
          color: colors.primary,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: colors.primary.withValues(alpha: 0.35),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.add, color: colors.onPrimary, size: 20),
            const SizedBox(width: 6),
            Text(
              'Tambah Promo',
              style: textTheme?.copyWith(
                color: colors.onPrimary,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onPressFab(BuildContext context) async {
    final bloc = context.read<MerchantPromotionBloc>();
    await navigatorKey.currentState?.push(
      MaterialPageRoute(builder: (_) => const MerchantInputPromotionScreen()),
    );
    bloc.add(MerchantPromotionEventGet());
  }
}

void _onPressItem(BuildContext context, MerchantPromotionEntity promo) async {
  final bloc = context.read<MerchantPromotionBloc>();
  await navigatorKey.currentState?.push(
    MaterialPageRoute(
      builder: (_) => MerchantInputPromotionScreen(id: promo.id),
    ),
  );
  bloc.add(MerchantPromotionEventGet());
}
