import 'package:flutter/material.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_product.dart';
import 'package:warunk/core/dependency/dependency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/customer/presentation/cart/customer_cart_screen.dart';
import 'package:warunk/app/features/customer/presentation/product/customer_detail_product_screen.dart';
import 'package:warunk/app/features/customer/presentation/store/bloc/customer_store_bloc.dart';
import 'package:warunk/app/features/customer/presentation/store/bloc/customer_store_event.dart';
import 'package:warunk/app/features/customer/presentation/store/bloc/customer_store_state.dart';
import 'package:warunk/core/widgets/primary_button.dart';
import 'package:warunk/core/helper/global_helper.dart';
import 'package:warunk/core/helper/dialog_helper.dart';
import 'package:warunk/core/widgets/loading_app_widget.dart';
import 'package:warunk/main.dart';

class CustomerMerchantScreen extends StatelessWidget {
  final String storeId;
  const CustomerMerchantScreen({super.key, required this.storeId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<CustomerStoreBloc>()
            ..add(CustomerStoreEventLoadStoreDetails(storeId: storeId)),
      child: BlocConsumer<CustomerStoreBloc, CustomerStoreState>(
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
    final state = context.watch<CustomerStoreBloc>().state;
    return SafeArea(
      top: false, // since we have hero image
      child: Stack(
        children: [
          _bodyLayout(context),
          if (state.isLoading) const LoadingAppWidget(),
        ],
      ),
    );
  }

  Widget _bodyLayout(BuildContext context) {
    final state = context.watch<CustomerStoreBloc>().state;
    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            // ── Hero image ────────────────────────────────────────────────────
            SliverAppBar(
              pinned: true,
              expandedHeight: 240,
              backgroundColor: GlobalHelper.getColorSchema(context).primary,
              iconTheme: const IconThemeData(color: Colors.white),
              flexibleSpace: FlexibleSpaceBar(background: _buildHero(context)),
            ),

            // ── Store info card ───────────────────────────────────────────────
            SliverToBoxAdapter(
              child: Transform.translate(
                offset: const Offset(0, -24),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 0),
                  decoration: BoxDecoration(
                    color: GlobalHelper.getColorSchema(context).surface,
                    borderRadius: const BorderRadius.vertical(
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
                            ClipRRect(
                              borderRadius: BorderRadius.circular(14),
                              child: Container(
                                width: 52,
                                height: 52,
                                color: GlobalHelper.getColorSchema(
                                  context,
                                ).primary.withValues(alpha: 0.1),
                                child:
                                    (state.merchantDetail?.photo != null &&
                                        state.merchantDetail!.photo!.isNotEmpty)
                                    ? Image.network(
                                        state.merchantDetail!.photo!,
                                        fit: BoxFit.cover,
                                        errorBuilder: (_, __, ___) => Icon(
                                          Icons.storefront_rounded,
                                          color: GlobalHelper.getColorSchema(
                                            context,
                                          ).primary,
                                          size: 30,
                                        ),
                                      )
                                    : Icon(
                                        Icons.storefront_rounded,
                                        color: GlobalHelper.getColorSchema(
                                          context,
                                        ).primary,
                                        size: 30,
                                      ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        state.storeName,
                                        style:
                                            GlobalHelper.getTextTheme(
                                              context,
                                              appTextStyle:
                                                  AppTextStyle.BODY_LARGE,
                                            )?.copyWith(
                                              fontWeight: FontWeight.w800,
                                              color:
                                                  GlobalHelper.getColorSchema(
                                                    context,
                                                  ).onSurface,
                                            ),
                                      ),
                                      const SizedBox(width: 8),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8,
                                          vertical: 3,
                                        ),
                                        decoration: BoxDecoration(
                                          color: GlobalHelper.getColorSchema(
                                            context,
                                          ).primary.withValues(alpha: 0.1),
                                          borderRadius: BorderRadius.circular(
                                            6,
                                          ),
                                        ),
                                        child: Text(
                                          (state.merchantDetail?.isOpen ??
                                                  false)
                                              ? 'Buka'
                                              : 'Tutup',
                                          style:
                                              GlobalHelper.getTextTheme(
                                                context,
                                                appTextStyle:
                                                    AppTextStyle.LABEL_SMALL,
                                              )?.copyWith(
                                                fontWeight: FontWeight.w700,
                                                color:
                                                    GlobalHelper.getColorSchema(
                                                      context,
                                                    ).primary,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 4),

                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_on_rounded,
                                        size: 13,
                                        color: GlobalHelper.getColorSchema(
                                          context,
                                        ).onSurface.withValues(alpha: 0.6),
                                      ),
                                      const SizedBox(width: 3),
                                      Expanded(
                                        child: Text(
                                          state.merchantDetail?.address ?? '-',
                                          style:
                                              GlobalHelper.getTextTheme(
                                                context,
                                                appTextStyle:
                                                    AppTextStyle.BODY_SMALL,
                                              )?.copyWith(
                                                color:
                                                    GlobalHelper.getColorSchema(
                                                      context,
                                                    ).onSurface.withValues(
                                                      alpha: 0.6,
                                                    ),
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

                      // Stats row
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            color: GlobalHelper.getColorSchema(context).surface,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              _statItem(
                                context,
                                Icons.access_time_rounded,
                                'Buka sampai',
                                state.merchantDetail?.timeClose ?? '-',
                              ),
                              Container(
                                width: 1,
                                height: 36,
                                color: GlobalHelper.getColorSchema(
                                  context,
                                ).outlineVariant,
                              ),
                              _statItem(
                                context,
                                Icons.delivery_dining_rounded,
                                'Estimasi antar',
                                '-',
                              ),
                              Container(
                                width: 1,
                                height: 36,
                                color: GlobalHelper.getColorSchema(
                                  context,
                                ).outlineVariant,
                              ),
                              _statItem(
                                context,
                                Icons.map_outlined,
                                'Jarak',
                                '-',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // ── Categories Tabs ───────────────────────────────────────────────────
            SliverPersistentHeader(
              pinned: true,
              delegate: _SliverCategoryDelegate(
                child: Container(
                  height: 56,
                  color: GlobalHelper.getColorSchema(context).surface,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: List.generate(state.categories.length, (i) {
                        final selected = state.selectedCategory == i;
                        return GestureDetector(
                          onTap: () => context.read<CustomerStoreBloc>().add(
                            CustomerStoreEventSelectCategory(i),
                          ),
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 18,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: selected
                                  ? GlobalHelper.getColorSchema(context).primary
                                  : GlobalHelper.getColorSchema(
                                      context,
                                    ).surface,
                              borderRadius: BorderRadius.circular(20),
                              border: selected
                                  ? null
                                  : Border.all(
                                      color: GlobalHelper.getColorSchema(
                                        context,
                                      ).outlineVariant,
                                    ),
                            ),
                            child: Text(
                              state.categories[i],
                              style:
                                  GlobalHelper.getTextTheme(
                                    context,
                                    appTextStyle: AppTextStyle.LABEL_MEDIUM,
                                  )?.copyWith(
                                    fontWeight: selected
                                        ? FontWeight.w700
                                        : FontWeight.w500,
                                    color: selected
                                        ? GlobalHelper.getColorSchema(
                                            context,
                                          ).onPrimary
                                        : GlobalHelper.getColorSchema(
                                            context,
                                          ).onSurface.withValues(alpha: 0.6),
                                  ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              ),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 16)),

            // ── Product Grid ──────────────────────────────────────────────────────
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: Builder(
                builder: (context) {
                  final selectedCategoryName =
                      state.categories.isNotEmpty &&
                          state.selectedCategory < state.categories.length
                      ? state.categories[state.selectedCategory]
                      : 'Semua';
                  final filteredProducts = selectedCategoryName == 'Semua'
                      ? state.products
                      : state.products
                            .where((p) => p.category == selectedCategoryName)
                            .toList();

                  return SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.72,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                        ),
                    delegate: SliverChildBuilderDelegate((context, index) {
                      final p = filteredProducts[index];
                      return _productCard(context, p);
                    }, childCount: filteredProducts.length),
                  );
                },
              ),
            ),

            const SliverToBoxAdapter(
              child: SizedBox(height: 100), // padding for bottom cart
            ),
          ],
        ),

        // ── Bottom Cart Bar ───────────────────────────────────────────────────
        if (state.cartCount > 0)
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
              decoration: BoxDecoration(
                color: GlobalHelper.getColorSchema(context).surface,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    offset: const Offset(0, -4),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 46,
                    height: 46,
                    decoration: BoxDecoration(
                      color: GlobalHelper.getColorSchema(
                        context,
                      ).primary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Stack(
                      children: [
                        Center(
                          child: Icon(
                            Icons.shopping_cart_outlined,
                            color: GlobalHelper.getColorSchema(context).primary,
                          ),
                        ),
                        Positioned(
                          top: 8,
                          right: 8,
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: GlobalHelper.getColorSchema(context).error,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                '${state.cartCount}',
                                style:
                                    GlobalHelper.getTextTheme(
                                      context,
                                      appTextStyle: AppTextStyle.LABEL_SMALL,
                                    )?.copyWith(
                                      color: GlobalHelper.getColorSchema(
                                        context,
                                      ).onError,
                                      fontWeight: FontWeight.w700,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${state.cartCount} item',
                        style:
                            GlobalHelper.getTextTheme(
                              context,
                              appTextStyle: AppTextStyle.LABEL_SMALL,
                            )?.copyWith(
                              color: GlobalHelper.getColorSchema(
                                context,
                              ).onSurface.withValues(alpha: 0.6),
                            ),
                      ),
                      Text(
                        state.formattedCartTotal,
                        style:
                            GlobalHelper.getTextTheme(
                              context,
                              appTextStyle: AppTextStyle.BODY_LARGE,
                            )?.copyWith(
                              fontWeight: FontWeight.w700,
                              color: GlobalHelper.getColorSchema(
                                context,
                              ).onSurface,
                            ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Expanded(
                    child: PrimaryButton(
                      onPressed: () => navigatorKey.currentState?.push(
                        MaterialPageRoute(
                          builder: (_) => const CustomerCartScreen(),
                        ),
                      ),
                      label: 'Lihat Keranjang',
                      height: 60,
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildHero(BuildContext context) {
    final state = context.watch<CustomerStoreBloc>().state;
    final hasPhoto =
        state.merchantDetail?.photo != null &&
        state.merchantDetail!.photo!.isNotEmpty;

    return Stack(
      fit: StackFit.expand,
      children: [
        // Photo or Gradient background simulating store photo
        if (hasPhoto)
          Image.network(
            state.merchantDetail!.photo!,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) =>
                _buildHeroFallback(context, state.storeName),
          )
        else
          _buildHeroFallback(context, state.storeName),
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
      ],
    );
  }

  Widget _statItem(
    BuildContext context,
    IconData icon,
    String label,
    String value,
  ) => Column(
    children: [
      Icon(icon, color: GlobalHelper.getColorSchema(context).primary, size: 20),
      const SizedBox(height: 4),
      Text(
        label,
        style:
            GlobalHelper.getTextTheme(
              context,
              appTextStyle: AppTextStyle.LABEL_SMALL,
            )?.copyWith(
              color: GlobalHelper.getColorSchema(
                context,
              ).onSurface.withValues(alpha: 0.6),
            ),
      ),
      const SizedBox(height: 2),
      Text(
        value,
        style:
            GlobalHelper.getTextTheme(
              context,
              appTextStyle: AppTextStyle.LABEL_MEDIUM,
            )?.copyWith(
              fontWeight: FontWeight.w700,
              color: GlobalHelper.getColorSchema(context).onSurface,
            ),
      ),
    ],
  );

  Widget _productCard(BuildContext context, CustomerProductEntity p) {
    // Generate dummy color/icon based on index or just static if we don't have images yet
    final imgUrl = (p.images != null && p.images!.isNotEmpty)
        ? p.images!.first.url
        : null;

    return GestureDetector(
      onTap: () => navigatorKey.currentState?.push(
        MaterialPageRoute(
          builder: (_) => CustomerDetailProductScreen(
            productName: p.name,
            price: 'Rp${p.price}',
            subtitle: p.category,
            color: const Color(0xFFF0F7EE),
            icon: Icons.inventory_2_rounded,
          ),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: GlobalHelper.getColorSchema(context).surface,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: GlobalHelper.getColorSchema(context).outlineVariant,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: GlobalHelper.getColorSchema(context).primaryContainer,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(13),
                  ),
                ),
                child: Center(
                  child: imgUrl != null
                      ? ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(13),
                          ),
                          child: Image.network(
                            imgUrl,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        )
                      : Icon(
                          Icons.inventory_2_rounded,
                          size: 48,
                          color: GlobalHelper.getColorSchema(context).primary,
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
                    style:
                        GlobalHelper.getTextTheme(
                          context,
                          appTextStyle: AppTextStyle.BODY_SMALL,
                        )?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: GlobalHelper.getColorSchema(context).onSurface,
                        ),
                  ),
                  if (p.category.isNotEmpty)
                    Text(
                      p.category,
                      style:
                          GlobalHelper.getTextTheme(
                            context,
                            appTextStyle: AppTextStyle.LABEL_SMALL,
                          )?.copyWith(
                            color: GlobalHelper.getColorSchema(
                              context,
                            ).onSurface.withValues(alpha: 0.6),
                          ),
                    ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Rp${p.price}',
                        style:
                            GlobalHelper.getTextTheme(
                              context,
                              appTextStyle: AppTextStyle.BODY_SMALL,
                            )?.copyWith(
                              fontWeight: FontWeight.w700,
                              color: GlobalHelper.getColorSchema(
                                context,
                              ).primary,
                            ),
                      ),
                      GestureDetector(
                        onTap: () => context.read<CustomerStoreBloc>().add(
                          CustomerStoreEventAddToCart(p),
                        ),
                        child: Container(
                          width: 28,
                          height: 28,
                          decoration: BoxDecoration(
                            color: GlobalHelper.getColorSchema(context).primary,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            Icons.add,
                            color: GlobalHelper.getColorSchema(
                              context,
                            ).onPrimary,
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

  Widget _buildHeroFallback(BuildContext context, String storeName) {
    return Container(
      width: double.infinity,
      height: 240,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF1B5E20), Color(0xFF388E3C), Color(0xFF66BB6A)],
        ),
      ),
      child: Center(
        child: Text(
          storeName.toUpperCase(),
          textAlign: TextAlign.center,
          style:
              GlobalHelper.getTextTheme(
                context,
                appTextStyle: AppTextStyle.TITLE_LARGE,
              )?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                letterSpacing: 1.5,
                shadows: const [Shadow(color: Colors.black45, blurRadius: 8)],
              ),
        ),
      ),
    );
  }
}

class _SliverCategoryDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  _SliverCategoryDelegate({required this.child});

  @override
  double get minExtent => 56.0;
  @override
  double get maxExtent => 56.0;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return child;
  }

  @override
  bool shouldRebuild(covariant _SliverCategoryDelegate oldDelegate) {
    return true; // Simple re-build
  }
}
