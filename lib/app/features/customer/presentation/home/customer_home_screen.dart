import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/customer/presentation/home/bloc/customer_home_bloc.dart';
import 'package:warunk/app/features/customer/presentation/cart/customer_cart_screen.dart';
import 'package:warunk/main.dart';
import 'package:warunk/app/features/customer/presentation/search/customer_search_screen.dart';
import 'package:warunk/app/features/customer/presentation/merchant/customer_merchant_screen.dart';
import 'package:warunk/app/features/customer/presentation/detail_merchant/customer_detail_merchant_screen.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_promotion_information.dart';

import 'package:warunk/core/dependency/dependency.dart';
import 'package:warunk/theme/app_colors.dart';
import 'package:warunk/core/helper/global_helper.dart';
import 'package:warunk/core/helper/dialog_helper.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Home Screen — entry point, menyediakan CustomerHomeBloc
// ─────────────────────────────────────────────────────────────────────────────

class CustomerHomeScreen extends StatelessWidget {
  const CustomerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<CustomerHomeBloc>()
        ..add(CustomerHomeGetUserNameStarted())
        ..add(CustomerHomeGetCategoriesStarted())
        ..add(CustomerHomeGetNearbyStarted())
        ..add(CustomerHomeGetBannersStarted()),
      child: BlocConsumer<CustomerHomeBloc, CustomerHomeState>(
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
            backgroundColor: GlobalHelper.getColorSchema(context).surface,
            body: _bodyBuild(context),
          );
        },
      ),
    );
  }

  Widget _bodyBuild(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _homeHeader(context),
            _homeSearchBar(context),
            _homeBannerCarousel(context),
            _homeCategoriesSection(context),
            _homeNearbyStoresSection(context),
          ],
        ),
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────────────────────
  // Header Section
  // ─────────────────────────────────────────────────────────────────────────────

  Widget _homeHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
      child: Row(
        children: [
          Expanded(child: _greetingText(context)),
          const SizedBox(width: 8),
          _cartButton(context),
        ],
      ),
    );
  }

  Widget _greetingText(BuildContext context) {
    final state = context.watch<CustomerHomeBloc>().state;
    final name = state.userName.isNotEmpty ? state.userName : 'User';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Hai, $name! ',
              style:
                  GlobalHelper.getTextTheme(
                    context,
                    appTextStyle: AppTextStyle.TITLE_LARGE,
                  )?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: GlobalHelper.getColorSchema(context).primary,
                  ),
            ),
            Text(
              '👋',
              style: GlobalHelper.getTextTheme(
                context,
                appTextStyle: AppTextStyle.TITLE_LARGE,
              )?.copyWith(fontSize: 20),
            ),
          ],
        ),
        Text(
          'Mau belanja apa hari ini?',
          style:
              GlobalHelper.getTextTheme(
                context,
                appTextStyle: AppTextStyle.BODY_MEDIUM,
              )?.copyWith(
                color: GlobalHelper.getColorSchema(context).onSurfaceVariant,
              ),
        ),
      ],
    );
  }

  Widget _cartButton(BuildContext context) {
    return GestureDetector(
      onTap: () => navigatorKey.currentState?.push(
        MaterialPageRoute(builder: (_) => const CustomerCartScreen()),
      ),
      child: Icon(
        Icons.shopping_cart_rounded,
        color: GlobalHelper.getColorSchema(context).primary,
        size: 20,
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────────────────────
  // Search Bar Section
  // ─────────────────────────────────────────────────────────────────────────────

  void _openSearch(BuildContext context) {
    navigatorKey.currentState?.push(
      MaterialPageRoute(builder: (_) => const CustomerSearchScreen()),
    );
  }

  Widget _homeSearchBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: GestureDetector(
        onTap: () => _openSearch(context),
        child: AbsorbPointer(
          child: Container(
            height: 48,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                const SizedBox(width: 14),
                Icon(
                  Icons.search,
                  color: GlobalHelper.getColorSchema(context).onSurfaceVariant,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text(
                  'Cari produk atau warung',
                  style: GlobalHelper.getTextTheme(
                    context,
                    appTextStyle: AppTextStyle.BODY_MEDIUM,
                  )?.copyWith(color: Colors.grey.shade400),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _homeBannerCarousel(BuildContext context) {
    final state = context.watch<CustomerHomeBloc>().state;
    if (state.isLoadingBanners) {
      return const Padding(
        padding: EdgeInsets.fromLTRB(20, 16, 20, 0),
        child: SizedBox(
          height: 150,
          child: Center(child: CircularProgressIndicator()),
        ),
      );
    }

    if (state.banners.isEmpty) {
      return SizedBox();
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
      child: Column(
        children: [
          SizedBox(
            height: 150,
            child: _AutoSlidingBannerCarousel(
              banners: state.banners,
              onPageChanged: (index) {
                context.read<CustomerHomeBloc>().add(
                  CustomerHomeBannerChanged(index),
                );
              },
              itemBuilder: (context, banner) {
                return _dynamicBannerCard(context, banner);
              },
            ),
          ),
          const SizedBox(height: 10),
          _bannerDotIndicator(
            context,
            state.banners.length,
            state.currentBanner,
          ),
        ],
      ),
    );
  }

  Widget _dynamicBannerCard(
    BuildContext context,
    CustomerPromotionInformationEntity banner,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.yellow,
        borderRadius: BorderRadius.circular(16),
        image: banner.image != null && banner.image!.isNotEmpty
            ? DecorationImage(
                image: NetworkImage(banner.image!),
                fit: BoxFit.cover,
              )
            : null,
      ),
      child: Stack(
        children: [
          if (banner.image == null || banner.image!.isEmpty)
            Positioned(
              left: 20,
              top: 16,
              bottom: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (banner.badge != null)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.yellowDark.withValues(alpha: 0.3),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        banner.badge!,
                        style:
                            GlobalHelper.getTextTheme(
                              context,
                              appTextStyle: AppTextStyle.LABEL_SMALL,
                            )?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF92400E),
                            ),
                      ),
                    ),
                  const SizedBox(height: 6),
                  if (banner.title != null)
                    Text(
                      banner.title!,
                      style:
                          GlobalHelper.getTextTheme(
                            context,
                            appTextStyle: AppTextStyle.TITLE_MEDIUM,
                          )?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: GlobalHelper.getColorSchema(
                              context,
                            ).onSurface,
                            height: 1.2,
                          ),
                    ),
                  const SizedBox(height: 4),
                  if (banner.description != null)
                    Text(
                      banner.description!,
                      style:
                          GlobalHelper.getTextTheme(
                            context,
                            appTextStyle: AppTextStyle.BODY_SMALL,
                          )?.copyWith(
                            color: GlobalHelper.getColorSchema(
                              context,
                            ).onSurfaceVariant,
                          ),
                    ),
                  const Spacer(),
                  _bannerButton(
                    context,
                    banner.buttonLabel ?? 'Lihat Detail',
                    () {},
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _bannerButton(
    BuildContext context,
    String label,
    VoidCallback onPressed,
  ) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: GlobalHelper.getColorSchema(context).primary,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 0,
      ),
      child: Text(
        label,
        style: GlobalHelper.getTextTheme(
          context,
          appTextStyle: AppTextStyle.LABEL_MEDIUM,
        )?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _bannerIllustration(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Text(
          '🛵',
          style: GlobalHelper.getTextTheme(
            context,
            appTextStyle: AppTextStyle.DISPLAY_MEDIUM,
          )?.copyWith(fontSize: 70),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: GlobalHelper.getColorSchema(context).primary,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                'ONGKIR\n10RB',
                textAlign: TextAlign.center,
                style:
                    GlobalHelper.getTextTheme(
                      context,
                      appTextStyle: AppTextStyle.LABEL_SMALL,
                    )?.copyWith(
                      color: Colors.white,
                      fontSize: 9,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _bannerDotIndicator(
    BuildContext context,
    int total,
    int currentIndex,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(total, (i) {
        final isActive = i == currentIndex;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 3),
          width: isActive ? 20 : 6,
          height: 6,
          decoration: BoxDecoration(
            color: isActive
                ? GlobalHelper.getColorSchema(context).primary
                : GlobalHelper.getColorSchema(context).outlineVariant,
            borderRadius: BorderRadius.circular(3),
          ),
        );
      }),
    );
  }

  // ─────────────────────────────────────────────────────────────────────────────
  // Categories Section
  // ─────────────────────────────────────────────────────────────────────────────

  Widget _homeCategoriesSection(BuildContext context) {
    final state = context.watch<CustomerHomeBloc>().state;
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Column(
        children: [
          _sectionHeader(context, 'Kategori'),
          const SizedBox(height: 12),
          if (state.isLoadingCategories)
            const Center(child: CircularProgressIndicator())
          else if (state.categories.isEmpty)
            Center(
              child: Text(
                'Tidak ada kategori',
                style:
                    GlobalHelper.getTextTheme(
                      context,
                      appTextStyle: AppTextStyle.BODY_SMALL,
                    )?.copyWith(
                      color: GlobalHelper.getColorSchema(
                        context,
                      ).onSurfaceVariant,
                    ),
              ),
            )
          else
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: state.categories
                    .map(
                      (c) => Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: GestureDetector(
                          onTap: () {
                            navigatorKey.currentState?.push(
                              MaterialPageRoute(
                                builder: (_) =>
                                    CustomerMerchantScreen(category: c),
                              ),
                            );
                          },
                          child: SizedBox(
                            width: 60,
                            child: _categoryItem(
                              context,
                              Icons.category,
                              c.name,
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
        ],
      ),
    );
  }

  Widget _categoryItem(BuildContext context, IconData icon, String label) {
    return Column(
      children: [
        Container(
          width: 52,
          height: 52,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.06),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Center(
            child: Icon(
              icon,
              color: GlobalHelper.getColorSchema(context).primary,
              size: 24,
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: GlobalHelper.getTextTheme(
            context,
            appTextStyle: AppTextStyle.LABEL_SMALL,
          )?.copyWith(color: Colors.black87),
        ),
      ],
    );
  }

  // ─────────────────────────────────────────────────────────────────────────────
  // Nearby Stores Section
  // ─────────────────────────────────────────────────────────────────────────────

  Widget _homeNearbyStoresSection(BuildContext context) {
    final state = context.watch<CustomerHomeBloc>().state;
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Column(
        children: [
          _sectionHeader(context, 'Warung Terdekat'),
          const SizedBox(height: 8),
          if (state.isLoadingNearby)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Center(child: CircularProgressIndicator()),
            )
          else if (state.nearbyMerchants.isEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Center(
                child: Text(
                  'Tidak ada warung terdekat',
                  style:
                      GlobalHelper.getTextTheme(
                        context,
                        appTextStyle: AppTextStyle.BODY_SMALL,
                      )?.copyWith(
                        color: GlobalHelper.getColorSchema(
                          context,
                        ).onSurfaceVariant,
                      ),
                ),
              ),
            )
          else
            Column(
              children: state.nearbyMerchants.map((merchant) {
                return GestureDetector(
                  onTap: () {
                    navigatorKey.currentState?.push(
                      MaterialPageRoute(
                        builder: (_) =>
                            CustomerDetailMerchantScreen(storeId: merchant.id),
                      ),
                    );
                  },
                  child: _storeCard(
                    context,
                    _StoreData(
                      name: merchant.name,
                      status: merchant.isOpen ? 'Buka' : 'Tutup',
                      statusColor: merchant.isOpen
                          ? GlobalHelper.getColorSchema(context).primary
                          : GlobalHelper.getColorSchema(
                              context,
                            ).onSurfaceVariant,
                      rating: '0',
                      reviews: '0',
                      distance: '${merchant.distance ?? 0} km',
                      location: '',
                      promo:
                          (merchant.promoBadges != null &&
                              merchant.promoBadges!.isNotEmpty)
                          ? merchant.promoBadges!.first
                          : '',
                      emoji: '🏪',
                      photo: merchant.photo,
                    ),
                  ),
                );
              }).toList(),
            ),
        ],
      ),
    );
  }

  Widget _storeCard(BuildContext context, _StoreData data) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              color: GlobalHelper.getColorSchema(
                context,
              ).primary.withValues(alpha: 0.1),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
              image: data.photo != null && data.photo!.isNotEmpty
                  ? DecorationImage(
                      image: NetworkImage(data.photo!),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
            child: data.photo == null || data.photo!.isEmpty
                ? Center(
                    child: Text(
                      data.emoji,
                      style: GlobalHelper.getTextTheme(
                        context,
                        appTextStyle: AppTextStyle.DISPLAY_SMALL,
                      )?.copyWith(fontSize: 40),
                    ),
                  )
                : null,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _storeNameRow(
                    context,
                    data.name,
                    data.status,
                    data.statusColor,
                  ),
                  const SizedBox(height: 4),
                  _storeMetaRow(
                    context,
                    data.rating,
                    data.reviews,
                    data.distance,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    data.location,
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
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Icon(
              Icons.chevron_right,
              color: GlobalHelper.getColorSchema(context).onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  Widget _storeNameRow(
    BuildContext context,
    String name,
    String status,
    Color statusColor,
  ) {
    return Row(
      children: [
        Flexible(
          child: Text(
            name,
            style: GlobalHelper.getTextTheme(
              context,
              appTextStyle: AppTextStyle.TITLE_SMALL,
            )?.copyWith(fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(width: 6),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          decoration: BoxDecoration(
            color: statusColor.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: statusColor.withValues(alpha: 0.4)),
          ),
          child: Text(
            status,
            style: GlobalHelper.getTextTheme(
              context,
              appTextStyle: AppTextStyle.LABEL_SMALL,
            )?.copyWith(color: statusColor, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }

  Widget _storeMetaRow(
    BuildContext context,
    String rating,
    String reviews,
    String distance,
  ) {
    return Row(
      children: [
        Icon(
          Icons.location_on_outlined,
          size: 11,
          color: GlobalHelper.getColorSchema(context).onSurfaceVariant,
        ),
        Text(
          ' $distance',
          style:
              GlobalHelper.getTextTheme(
                context,
                appTextStyle: AppTextStyle.LABEL_SMALL,
              )?.copyWith(
                color: GlobalHelper.getColorSchema(context).onSurfaceVariant,
              ),
        ),
      ],
    );
  }

  // ─────────────────────────────────────────────────────────────────────────────
  // Shared Widgets
  // ─────────────────────────────────────────────────────────────────────────────

  Widget _sectionHeader(BuildContext context, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GlobalHelper.getTextTheme(
            context,
            appTextStyle: AppTextStyle.TITLE_MEDIUM,
          )?.copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class _StoreData {
  final String name;
  final String status;
  final Color statusColor;
  final String rating;
  final String reviews;
  final String distance;
  final String location;
  final String promo;
  final String emoji;
  final String? photo;

  const _StoreData({
    required this.name,
    required this.status,
    required this.statusColor,
    required this.rating,
    required this.reviews,
    required this.distance,
    required this.location,
    required this.promo,
    required this.emoji,
    this.photo,
  });
}

// ─────────────────────────────────────────────────────────────────────────────
// Custom Painter — Map Grid
// ─────────────────────────────────────────────────────────────────────────────

class _MapGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final gridPaint = Paint()
      ..color = AppColors.mapGridLine
      ..strokeWidth = 1;

    for (double y = 0; y < size.height; y += 20) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), gridPaint);
    }
    for (double x = 0; x < size.width; x += 20) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), gridPaint);
    }

    final roadPaint = Paint()
      ..color = AppColors.mapRoad
      ..strokeWidth = 10;

    canvas.drawLine(
      Offset(0, size.height * 0.55),
      Offset(size.width, size.height * 0.55),
      roadPaint,
    );
    canvas.drawLine(
      Offset(size.width * 0.65, 0),
      Offset(size.width * 0.65, size.height),
      roadPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// ─────────────────────────────────────────────────────────────────────────────
// Auto Sliding Banner Carousel
// ─────────────────────────────────────────────────────────────────────────────

class _AutoSlidingBannerCarousel extends StatefulWidget {
  final List<CustomerPromotionInformationEntity> banners;
  final Widget Function(BuildContext, CustomerPromotionInformationEntity)
  itemBuilder;
  final void Function(int) onPageChanged;

  const _AutoSlidingBannerCarousel({
    required this.banners,
    required this.itemBuilder,
    required this.onPageChanged,
  });

  @override
  State<_AutoSlidingBannerCarousel> createState() =>
      _AutoSlidingBannerCarouselState();
}

class _AutoSlidingBannerCarouselState
    extends State<_AutoSlidingBannerCarousel> {
  late PageController _pageController;
  Timer? _timer;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 4), (Timer timer) {
      if (widget.banners.isEmpty) return;
      if (_currentPage < widget.banners.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      if (_pageController.hasClients) {
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeIn,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      itemCount: widget.banners.length,
      onPageChanged: (index) {
        _currentPage = index;
        widget.onPageChanged(index);
      },
      itemBuilder: (context, index) {
        return widget.itemBuilder(context, widget.banners[index]);
      },
    );
  }
}
