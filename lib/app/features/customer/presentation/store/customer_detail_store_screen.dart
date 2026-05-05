import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/customer/presentation/cart/customer_cart_screen.dart';
import 'package:warunk/app/features/customer/presentation/product/customer_detail_product_screen.dart';
import 'package:warunk/app/features/customer/presentation/store/bloc/customer_store_bloc.dart';
import 'package:warunk/app/features/customer/presentation/store/bloc/customer_store_event.dart';
import 'package:warunk/app/features/customer/presentation/store/bloc/customer_store_state.dart';
import 'package:warunk/core/constants/app_colors.dart';
import 'package:warunk/core/widgets/primary_button.dart';

class CustomerDetailStoreScreen extends StatelessWidget {
  final String storeName;
  const CustomerDetailStoreScreen({super.key, required this.storeName});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CustomerStoreBloc()..add(CustomerLoadStoreDetails(storeName)),
      child: _DetailStoreView(),
    );
  }
}

class _DetailStoreView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomerStoreBloc, CustomerStoreState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Scaffold(
            backgroundColor: AppColors.background,
            body: Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            ),
          );
        }

        return Scaffold(
          backgroundColor: AppColors.background,
          body: Stack(
            children: [
              CustomScrollView(
                slivers: [
                  // ── Hero image ────────────────────────────────────────────────────
                  SliverToBoxAdapter(
                    child: _buildHero(context, state.storeName),
                  ),

                  // ── Store info card ───────────────────────────────────────────────
                  SliverToBoxAdapter(
                    child: Transform.translate(
                      offset: const Offset(0, -24),
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 0),
                        decoration: const BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(24),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
                              child: Row(
                                children: [
                                  Container(
                                    width: 52,
                                    height: 52,
                                    decoration: BoxDecoration(
                                      color: AppColors.primary.withValues(
                                        alpha: 0.1,
                                      ),
                                      borderRadius: BorderRadius.circular(14),
                                    ),
                                    child: const Icon(
                                      Icons.storefront_rounded,
                                      color: AppColors.primary,
                                      size: 30,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              state.storeName,
                                              style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w800,
                                                color: AppColors.textDark,
                                              ),
                                            ),
                                            const SizedBox(width: 8),
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 8,
                                                    vertical: 3,
                                                  ),
                                              decoration: BoxDecoration(
                                                color: AppColors.primary
                                                    .withValues(alpha: 0.1),
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                              ),
                                              child: const Text(
                                                'Buka',
                                                style: TextStyle(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w700,
                                                  color: AppColors.primary,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 4),
                                        Row(
                                          children: const [
                                            Icon(
                                              Icons.star_rounded,
                                              color: Color(0xFFFBBC05),
                                              size: 15,
                                            ),
                                            SizedBox(width: 3),
                                            Text(
                                              '4.7 (128)',
                                              style: TextStyle(
                                                fontSize: 13,
                                                color: AppColors.textDark,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 3),
                                        Row(
                                          children: const [
                                            Icon(
                                              Icons.location_on_rounded,
                                              size: 13,
                                              color: AppColors.greyText,
                                            ),
                                            SizedBox(width: 3),
                                            Text(
                                              'Jl. Raya Bekasi, Jakarta Timur',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: AppColors.greyText,
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

                            // Stats row
                            Padding(
                              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.background,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    _statItem(
                                      Icons.access_time_rounded,
                                      'Buka sampai',
                                      '22:00',
                                    ),
                                    Container(
                                      width: 1,
                                      height: 36,
                                      color: AppColors.greyBorder,
                                    ),
                                    _statItem(
                                      Icons.delivery_dining_rounded,
                                      'Estimasi antar',
                                      '10–20 min',
                                    ),
                                    Container(
                                      width: 1,
                                      height: 36,
                                      color: AppColors.greyBorder,
                                    ),
                                    _statItem(
                                      Icons.shopping_bag_outlined,
                                      'Min. belanja',
                                      'Rp10.000',
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            // Category tabs
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                ),
                                child: Row(
                                  children: List.generate(
                                    state.categories.length,
                                    (i) {
                                      final selected =
                                          state.selectedCategory == i;
                                      return GestureDetector(
                                        onTap: () => context
                                            .read<CustomerStoreBloc>()
                                            .add(CustomerSelectCategory(i)),
                                        child: Container(
                                          margin: const EdgeInsets.only(
                                            right: 10,
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 18,
                                            vertical: 8,
                                          ),
                                          decoration: BoxDecoration(
                                            color: selected
                                                ? AppColors.primary
                                                : AppColors.white,
                                            borderRadius: BorderRadius.circular(
                                              20,
                                            ),
                                            border: Border.all(
                                              color: selected
                                                  ? AppColors.primary
                                                  : AppColors.greyBorder,
                                            ),
                                          ),
                                          child: Text(
                                            state.categories[i],
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600,
                                              color: selected
                                                  ? Colors.white
                                                  : AppColors.textDark,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),

                            // Search bar in store
                            Padding(
                              padding: const EdgeInsets.fromLTRB(16, 14, 16, 0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppColors.background,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: AppColors.greyBorder,
                                  ),
                                ),
                                child: const TextField(
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: AppColors.textDark,
                                  ),
                                  decoration: InputDecoration(
                                    hintText: 'Cari produk di toko ini',
                                    hintStyle: TextStyle(
                                      color: AppColors.greyText,
                                      fontSize: 14,
                                    ),
                                    prefixIcon: Icon(
                                      Icons.search_rounded,
                                      color: AppColors.greyText,
                                      size: 20,
                                    ),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 12,
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            // Product grid
                            Padding(
                              padding: const EdgeInsets.fromLTRB(16, 14, 16, 0),
                              child: GridView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 12,
                                      crossAxisSpacing: 12,
                                      childAspectRatio: 0.85,
                                    ),
                                itemCount: state.products.length,
                                itemBuilder: (_, i) =>
                                    _productCard(context, state.products[i]),
                              ),
                            ),

                            // Promo banner
                            Padding(
                              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                              child: Container(
                                padding: const EdgeInsets.all(14),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFFFF8E1),
                                  borderRadius: BorderRadius.circular(14),
                                  border: Border.all(
                                    color: const Color(
                                      0xFFF59E0B,
                                    ).withValues(alpha: 0.3),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFFFF3C4),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: const Icon(
                                        Icons.delivery_dining_rounded,
                                        color: Color(0xFFF59E0B),
                                        size: 24,
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    const Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Gratis ongkir min. belanja 30RB',
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w700,
                                              color: AppColors.textDark,
                                            ),
                                          ),
                                          SizedBox(height: 2),
                                          Text(
                                            'Berlaku untuk pengiriman ke area kamu.',
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: AppColors.greyText,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Icon(
                                      Icons.chevron_right_rounded,
                                      color: AppColors.greyText,
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            const SizedBox(height: 100), // space for bottom bar
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // ── Bottom cart bar ───────────────────────────────────────────────────
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.fromLTRB(
                    16,
                    12,
                    16,
                    MediaQuery.of(context).padding.bottom + 12,
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 12,
                        offset: Offset(0, -4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: 46,
                            height: 46,
                            decoration: BoxDecoration(
                              color: AppColors.primary.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(
                              Icons.shopping_cart_outlined,
                              color: AppColors.primary,
                              size: 24,
                            ),
                          ),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: Container(
                              width: 18,
                              height: 18,
                              decoration: const BoxDecoration(
                                color: AppColors.primary,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Text(
                                  '${state.cartCount}',
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
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${state.cartCount} item',
                            style: const TextStyle(
                              fontSize: 12,
                              color: AppColors.greyText,
                            ),
                          ),
                          Text(
                            state.formattedCartTotal,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: AppColors.textDark,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Expanded(
                        child: PrimaryButton(
                          onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => const CustomerCartScreen(),
                            ),
                          ),
                          label: 'Lihat Keranjang',
                          height: 46,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHero(BuildContext context, String storeName) {
    return SizedBox(
      height: 240,
      child: Stack(
        children: [
          // Gradient background simulating store photo
          Container(
            width: double.infinity,
            height: 240,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF1B5E20),
                  Color(0xFF388E3C),
                  Color(0xFF66BB6A),
                ],
              ),
            ),
            child: Center(
              child: Text(
                storeName.toUpperCase(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.5,
                  shadows: [Shadow(color: Colors.black45, blurRadius: 8)],
                ),
              ),
            ),
          ),
          // Gradient overlay bottom
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 80,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.black45, Colors.transparent],
                ),
              ),
            ),
          ),
          // Back button
          Positioned(
            top: 16,
            left: 16,
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.9),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.arrow_back_rounded,
                  color: AppColors.textDark,
                  size: 20,
                ),
              ),
            ),
          ),
          // Share + favorite
          Positioned(
            top: 16,
            right: 16,
            child: Row(
              children: [
                _heroBtn(Icons.share_outlined),
                const SizedBox(width: 8),
                _heroBtn(Icons.favorite_border_rounded),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _heroBtn(IconData icon) => Container(
    width: 38,
    height: 38,
    decoration: BoxDecoration(
      color: Colors.white.withValues(alpha: 0.9),
      shape: BoxShape.circle,
    ),
    child: Icon(icon, color: AppColors.textDark, size: 20),
  );

  Widget _statItem(IconData icon, String label, String value) => Column(
    children: [
      Icon(icon, color: AppColors.primary, size: 20),
      const SizedBox(height: 4),
      Text(
        label,
        style: const TextStyle(fontSize: 10, color: AppColors.greyText),
      ),
      const SizedBox(height: 2),
      Text(
        value,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          color: AppColors.textDark,
        ),
      ),
    ],
  );

  Widget _productCard(BuildContext context, CustomerProductItem p) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => CustomerDetailProductScreen(
            productName: p.name,
            price: p.price,
            subtitle: p.subtitle,
            color: p.color,
            icon: p.icon,
          ),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.greyBorder),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: p.color,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(13),
                  ),
                ),
                child: Center(
                  child: Icon(
                    p.icon,
                    size: 48,
                    color: p.color == const Color(0xFFF0F7EE)
                        ? AppColors.primary
                        : AppColors.primaryLight,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 8, 10, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    p.name,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textDark,
                    ),
                  ),
                  if (p.subtitle.isNotEmpty)
                    Text(
                      p.subtitle,
                      style: const TextStyle(
                        fontSize: 11,
                        color: AppColors.greyText,
                      ),
                    ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        p.price,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primary,
                        ),
                      ),
                      GestureDetector(
                        onTap: () =>
                            context.read<CustomerStoreBloc>().add(CustomerAddToCart(p)),
                        child: Container(
                          width: 28,
                          height: 28,
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 18,
                          ),
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
    );
  }
}
