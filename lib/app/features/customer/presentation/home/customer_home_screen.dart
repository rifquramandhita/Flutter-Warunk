import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/customer/presentation/home/bloc/customer_home_bloc.dart';
import 'package:warunk/app/features/customer/presentation/cart/customer_cart_screen.dart';
import 'package:warunk/main.dart';
import 'package:warunk/app/features/customer/presentation/search/customer_search_screen.dart';
import 'package:warunk/core/dependency/dependency.dart';
import 'package:warunk/theme/app_colors.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Home Screen — entry point, menyediakan CustomerHomeBloc
// ─────────────────────────────────────────────────────────────────────────────

class CustomerHomeScreen extends StatelessWidget {
  const CustomerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          sl<CustomerHomeBloc>()..add(CustomerHomeGetCategoriesStarted()),
      child: const _HomeView(),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Home View — layout utama halaman home
// ─────────────────────────────────────────────────────────────────────────────

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _HomeHeader(),
              _HomeSearchBar(),
              _HomeModeChip(),
              _HomeBannerCarousel(),
              _HomeCategoriesSection(),
              _HomeNearbyStoresSection(),
              _HomeMapPreview(),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Header Section
// ─────────────────────────────────────────────────────────────────────────────

class _HomeHeader extends StatelessWidget {
  const _HomeHeader();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
      child: Row(
        children: [
          const Expanded(child: _GreetingText()),
          const SizedBox(width: 12),
          _LocationChip(),
          const SizedBox(width: 8),
          const _CartButton(),
        ],
      ),
    );
  }
}

class _GreetingText extends StatelessWidget {
  const _GreetingText();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Hai, Andi! ',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
            Text('👋', style: TextStyle(fontSize: 20)),
          ],
        ),
        Text(
          'Mau belanja apa hari ini?',
          style: TextStyle(fontSize: 13, color: AppColors.greyText),
        ),
      ],
    );
  }
}

class _LocationChip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.greyBorder),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.location_on, color: AppColors.primary, size: 14),
          SizedBox(width: 4),
          Text(
            'Jakarta',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppColors.primary,
            ),
          ),
          Icon(Icons.keyboard_arrow_down, color: AppColors.primary, size: 16),
        ],
      ),
    );
  }
}

class _CartButton extends StatelessWidget {
  const _CartButton();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => navigatorKey.currentState?.push(
        MaterialPageRoute(builder: (_) => const CustomerCartScreen()),
      ),
      child: Stack(
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: AppColors.white,
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.greyBorder),
            ),
            child: const Icon(
              Icons.shopping_cart_outlined,
              color: AppColors.primary,
              size: 20,
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              width: 16,
              height: 16,
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: Text(
                  '3',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 9,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Search Bar Section
// ─────────────────────────────────────────────────────────────────────────────

class _HomeSearchBar extends StatelessWidget {
  const _HomeSearchBar();

  void _openSearch(BuildContext context) {
    navigatorKey.currentState?.push(
      MaterialPageRoute(builder: (_) => const CustomerSearchScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => _openSearch(context),
              child: AbsorbPointer(
                child: Container(
                  height: 48,
                  decoration: BoxDecoration(
                    color: AppColors.white,
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
                      const Icon(
                        Icons.search,
                        color: AppColors.greyText,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Cari produk atau warung',
                        style: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: () => _openSearch(context),
            child: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.tune, color: AppColors.white, size: 20),
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Mode Chip Section
// ─────────────────────────────────────────────────────────────────────────────

class _HomeModeChip extends StatelessWidget {
  const _HomeModeChip();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: AppColors.primary.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.primary.withValues(alpha: 0.3)),
        ),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.person_outline, color: AppColors.primary, size: 16),
            SizedBox(width: 6),
            Text(
              'Mode: Customer',
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Banner Carousel Section
// ─────────────────────────────────────────────────────────────────────────────

class _HomeBannerCarousel extends StatelessWidget {
  const _HomeBannerCarousel();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
      child: Column(
        children: [
          const _BannerCard(),
          const SizedBox(height: 10),
          BlocBuilder<CustomerHomeBloc, CustomerHomeState>(
            builder: (context, state) {
              return _BannerDotIndicator(
                total: 3,
                currentIndex: state.currentBanner,
              );
            },
          ),
        ],
      ),
    );
  }
}

class _BannerCard extends StatelessWidget {
  const _BannerCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        color: AppColors.yellow,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          // Left content
          Positioned(
            left: 20,
            top: 16,
            bottom: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.yellowDark.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text(
                    'Promo Spesial',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF92400E),
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'Diskon Ongkir\nHingga 10RB!',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textDark,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Belanja di warung favoritmu\nlebih hemat setiap hari.',
                  style: TextStyle(fontSize: 10, color: AppColors.textMuted),
                ),
                const Spacer(),
                _BannerButton(label: 'Belanja Sekarang', onPressed: () {}),
              ],
            ),
          ),
          // Right illustration
          const Positioned(right: 12, bottom: 0, child: _BannerIllustration()),
        ],
      ),
    );
  }
}

class _BannerButton extends StatelessWidget {
  const _BannerButton({required this.label, required this.onPressed});

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.primary,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 0,
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class _BannerIllustration extends StatelessWidget {
  const _BannerIllustration();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        const Text('🛵', style: TextStyle(fontSize: 70)),
        Positioned(
          top: 0,
          right: 0,
          child: Container(
            width: 52,
            height: 52,
            decoration: const BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Text(
                'ONGKIR\n10RB',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.white,
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
}

class _BannerDotIndicator extends StatelessWidget {
  const _BannerDotIndicator({required this.total, required this.currentIndex});

  final int total;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
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
            color: isActive ? AppColors.primary : AppColors.greyBorder,
            borderRadius: BorderRadius.circular(3),
          ),
        );
      }),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Categories Section
// ─────────────────────────────────────────────────────────────────────────────

class _HomeCategoriesSection extends StatelessWidget {
  const _HomeCategoriesSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Column(
        children: [
          _SectionHeader(title: 'Kategori', onTapSeeAll: () {}),
          const SizedBox(height: 12),
          BlocBuilder<CustomerHomeBloc, CustomerHomeState>(
            builder: (context, state) {
              if (state.isLoadingCategories) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state.categories.isEmpty) {
                return const Center(
                  child: Text(
                    'Tidak ada kategori',
                    style: TextStyle(color: AppColors.greyText, fontSize: 12),
                  ),
                );
              }

              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: state.categories
                      .map(
                        (c) => Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: SizedBox(
                            width: 60,
                            child: _CategoryItem(
                              icon: Icons.category,
                              label: c.name,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  const _CategoryItem({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 52,
          height: 52,
          decoration: BoxDecoration(
            color: AppColors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.06),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Center(child: Icon(icon, color: AppColors.primary, size: 24)),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 10, color: Colors.black87),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Nearby Stores Section
// ─────────────────────────────────────────────────────────────────────────────

class _HomeNearbyStoresSection extends StatelessWidget {
  const _HomeNearbyStoresSection();

  static const List<_StoreData> _stores = [
    _StoreData(
      name: 'Warung Madura Cahaya',
      status: 'Buka',
      statusColor: AppColors.primary,
      rating: '4.7',
      reviews: '128',
      distance: '0,6 km',
      location: 'Jakarta Timur',
      promo: 'Promo Ongkir',
      emoji: '🏪',
    ),
    _StoreData(
      name: 'Toko Sumber Rezeki',
      status: 'Promo',
      statusColor: AppColors.yellowDark,
      rating: '4.5',
      reviews: '95',
      distance: '1,2 km',
      location: 'Jakarta Timur',
      promo: 'Promo Ongkir',
      emoji: '🛒',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Column(
        children: [
          _SectionHeader(title: 'Warung Terdekat', onTapSeeAll: () {}),
          const SizedBox(height: 8),
          ..._stores.map((store) => _StoreCard(data: store)),
        ],
      ),
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
  });
}

class _StoreCard extends StatelessWidget {
  const _StoreCard({required this.data});

  final _StoreData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: AppColors.white,
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
          // Store thumbnail
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
            ),
            child: Center(
              child: Text(data.emoji, style: const TextStyle(fontSize: 40)),
            ),
          ),
          const SizedBox(width: 12),
          // Store info
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _StoreNameRow(
                    name: data.name,
                    status: data.status,
                    statusColor: data.statusColor,
                  ),
                  const SizedBox(height: 4),
                  _StoreMetaRow(
                    rating: data.rating,
                    reviews: data.reviews,
                    distance: data.distance,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    data.location,
                    style: const TextStyle(
                      fontSize: 11,
                      color: AppColors.greyText,
                    ),
                  ),
                  const SizedBox(height: 6),
                  _StorePromoTag(promo: data.promo),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 12),
            child: Icon(Icons.chevron_right, color: AppColors.greyText),
          ),
        ],
      ),
    );
  }
}

class _StoreNameRow extends StatelessWidget {
  const _StoreNameRow({
    required this.name,
    required this.status,
    required this.statusColor,
  });

  final String name;
  final String status;
  final Color statusColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Text(
            name,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
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
            style: TextStyle(
              fontSize: 10,
              color: statusColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}

class _StoreMetaRow extends StatelessWidget {
  const _StoreMetaRow({
    required this.rating,
    required this.reviews,
    required this.distance,
  });

  final String rating;
  final String reviews;
  final String distance;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.star, color: AppColors.yellowDark, size: 13),
        const SizedBox(width: 2),
        Text(
          '$rating ($reviews)  •  ',
          style: const TextStyle(fontSize: 11, color: AppColors.greyText),
        ),
        const Icon(
          Icons.location_on_outlined,
          size: 11,
          color: AppColors.greyText,
        ),
        Text(
          ' $distance',
          style: const TextStyle(fontSize: 11, color: AppColors.greyText),
        ),
      ],
    );
  }
}

class _StorePromoTag extends StatelessWidget {
  const _StorePromoTag({required this.promo});

  final String promo;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('🏷️', style: TextStyle(fontSize: 11)),
        const SizedBox(width: 4),
        Text(
          promo,
          style: const TextStyle(
            fontSize: 11,
            color: AppColors.primary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Map Preview Section
// ─────────────────────────────────────────────────────────────────────────────

class _HomeMapPreview extends StatelessWidget {
  const _HomeMapPreview();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
      child: Container(
        height: 130,
        decoration: BoxDecoration(
          color: AppColors.mapGreen,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: CustomPaint(painter: _MapGridPainter()),
              ),
            ),
            const Positioned(
              right: 80,
              top: 30,
              child: Text('📍', style: TextStyle(fontSize: 28)),
            ),
            const Positioned(
              right: 40,
              top: 55,
              child: Text('📍', style: TextStyle(fontSize: 28)),
            ),
            const Positioned(
              right: 120,
              top: 55,
              child: Text('📍', style: TextStyle(fontSize: 28)),
            ),
            Positioned(
              left: 20,
              top: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Lihat di Peta',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textDark,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Temukan warung terdekat\ndi sekitarmu',
                    style: TextStyle(fontSize: 11, color: AppColors.textMuted),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: AppColors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Buka Peta',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Shared Widgets
// ─────────────────────────────────────────────────────────────────────────────

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title, required this.onTapSeeAll});

  final String title;
  final VoidCallback onTapSeeAll;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        TextButton(
          onPressed: onTapSeeAll,
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: const Text(
            'Lihat semua >',
            style: TextStyle(color: AppColors.primary, fontSize: 12),
          ),
        ),
      ],
    );
  }
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
