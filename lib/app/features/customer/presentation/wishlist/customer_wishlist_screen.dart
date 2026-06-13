import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_wishlist.dart';
import 'package:warunk/app/features/customer/presentation/product/customer_product_screen.dart';
import 'package:warunk/app/features/customer/presentation/wishlist/bloc/customer_wishlist_bloc.dart';
import 'package:warunk/app/features/customer/presentation/wishlist/bloc/customer_wishlist_event.dart';
import 'package:warunk/app/features/customer/presentation/wishlist/bloc/customer_wishlist_state.dart';
import 'package:warunk/core/dependency/dependency.dart';
import 'package:warunk/core/helper/dialog_helper.dart';
import 'package:warunk/core/helper/global_helper.dart';
import 'package:warunk/core/widgets/loading_app_widget.dart';
import 'package:warunk/main.dart';
import 'package:warunk/core/widgets/shadow_card.dart';

class CustomerWishlistScreen extends StatelessWidget {
  const CustomerWishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CustomerWishlistBloc>()..add(CustomerWishlistEventLoad()),
      child: BlocConsumer<CustomerWishlistBloc, CustomerWishlistState>(
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
            appBar: AppBar(
              title: const Text('Wishlist Saya'),
            ),
            body: _bodyBuild(context),
          );
        },
      ),
    );
  }

  Widget _bodyBuild(BuildContext context) {
    final state = context.watch<CustomerWishlistBloc>().state;
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
    final state = context.watch<CustomerWishlistBloc>().state;
    
    if (state.wishlists.isEmpty && !state.isLoading) {
      return _buildEmptyState(context);
    }
    
    if (state.wishlists.isEmpty) {
      return const SizedBox();
    }

    return RefreshIndicator(
      onRefresh: () async {
        context.read<CustomerWishlistBloc>().add(CustomerWishlistEventLoad());
      },
      child: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 0.7,
        ),
        itemCount: state.wishlists.length,
        itemBuilder: (context, index) {
          final wishlist = state.wishlists[index];
          return _buildWishlistItem(context, wishlist);
        },
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.favorite_border_rounded,
            size: 80,
            color: GlobalHelper.getColorSchema(context).primary.withValues(alpha: 0.3),
          ),
          const SizedBox(height: 16),
          Text(
            'Wishlist Kosong',
            style: GlobalHelper.getTextTheme(context, appTextStyle: AppTextStyle.TITLE_MEDIUM)?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Kamu belum menambahkan produk\nke daftar wishlist.',
            textAlign: TextAlign.center,
            style: GlobalHelper.getTextTheme(context, appTextStyle: AppTextStyle.BODY_SMALL)?.copyWith(
              color: GlobalHelper.getColorSchema(context).onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWishlistItem(BuildContext context, CustomerWishlistEntity wishlist) {
    final product = wishlist.product;
    if (product == null) return const SizedBox();

    final imgUrl = (product.images != null && product.images!.isNotEmpty)
        ? product.images!.first.url
        : null;

    return GestureDetector(
      onTap: () {
        navigatorKey.currentState?.push(
          MaterialPageRoute(
            builder: (_) => CustomerProductScreen(productId: product.id),
          ),
        ).then((_) {
          // Refresh after returning if wishlist was modified
          if (context.mounted) {
            context.read<CustomerWishlistBloc>().add(CustomerWishlistEventLoad());
          }
        });
      },
      child: ShadowCard(
        padding: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: GlobalHelper.getColorSchema(context).primaryContainer,
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                    ),
                    child: imgUrl != null
                        ? ClipRRect(
                            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                            child: Image.network(
                              imgUrl,
                              fit: BoxFit.cover,
                            ),
                          )
                        : Icon(
                            Icons.inventory_2_rounded,
                            size: 40,
                            color: GlobalHelper.getColorSchema(context).primary.withValues(alpha: 0.5),
                          ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: GestureDetector(
                      onTap: () {
                        context
                            .read<CustomerWishlistBloc>()
                            .add(CustomerWishlistEventRemove(product.id));
                      },
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.9),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.favorite_rounded,
                          color: Colors.red,
                          size: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: GlobalHelper.getTextTheme(context, appTextStyle: AppTextStyle.LABEL_MEDIUM)?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Rp${product.price}',
                    style: GlobalHelper.getTextTheme(context, appTextStyle: AppTextStyle.BODY_SMALL)?.copyWith(
                      fontWeight: FontWeight.w800,
                      color: GlobalHelper.getColorSchema(context).primary,
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
