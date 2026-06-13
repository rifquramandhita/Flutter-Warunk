import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/core/dependency/dependency.dart';
import 'package:warunk/core/helper/dialog_helper.dart';
import 'package:warunk/core/helper/global_helper.dart';
import 'package:warunk/core/widgets/loading_app_widget.dart';
import 'package:warunk/app/features/customer/presentation/product/bloc/customer_detail_product_bloc.dart';
import 'package:warunk/app/features/customer/presentation/product/bloc/customer_detail_product_event.dart';
import 'package:warunk/app/features/customer/presentation/product/bloc/customer_detail_product_state.dart';
import 'package:warunk/main.dart';

class CustomerDetailProductScreen extends StatelessWidget {
  final String productId;

  const CustomerDetailProductScreen({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<CustomerDetailProductBloc>()
            ..add(CustomerDetailProductEventStarted(productId: productId)),
      child:
          BlocConsumer<CustomerDetailProductBloc, CustomerDetailProductState>(
            listener: (context, state) {
              if (state.errorMessage != null) {
                DialogHelper.showErrorSnackBar(
                  context: context,
                  text: state.errorMessage!,
                );
              } else if (state.isSuccess) {
                DialogHelper.showSnackBar(
                  context: context,
                  text: 'Berhasil menambahkan ke keranjang',
                );
                navigatorKey.currentState?.pop();
              } else if (state.isWishlistSuccess) {
                DialogHelper.showSnackBar(
                  context: context,
                  text: 'Berhasil menambahkan ke wishlist',
                );
              }
            },
            builder: (context, state) {
              return Scaffold(
                appBar: _appBarBuild(context),
                body: _bodyBuild(context),
              );
            },
          ),
    );
  }

  AppBar _appBarBuild(BuildContext context) {
    final state = context.read<CustomerDetailProductBloc>().state;
    return AppBar(
      title: Text('Detail Produk'),
      actions: [
        IconButton(
          padding: EdgeInsets.zero,
          icon: Icon(
            (state.product?.isWishlisted ?? false)
                ? Icons.favorite_rounded
                : Icons.favorite_border_rounded,
            size: 20,
          ),
          onPressed: () {
            context.read<CustomerDetailProductBloc>().add(
              const CustomerDetailProductEventAddToWishlist(),
            );
          },
        ),
      ],
    );
  }

  Widget _bodyBuild(BuildContext context) {
    final state = context.watch<CustomerDetailProductBloc>().state;
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
    final state = context.watch<CustomerDetailProductBloc>().state;
    final product = state.product;
    final noteCtrl = TextEditingController();

    if (product == null && !state.isLoading) {
      return const Center(child: Text('Produk tidak ditemukan'));
    }

    if (product == null) {
      return const SizedBox();
    }

    final displayPrice = state.selectedVariant?.price ?? product.price;
    final price = 'Rp$displayPrice';
    final totalPrice = 'Rp${displayPrice * state.quantity}';

    final Map<String, Set<String>> dimensions = {};
    if (product.variants != null) {
      for (final v in product.variants!) {
        v.variantCombination.forEach((key, value) {
          dimensions.putIfAbsent(key, () => {}).add(value);
        });
      }
    }

    final imgUrl = (product.images != null && product.images!.isNotEmpty)
        ? product.images!.first.url
        : null;

    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: _imageLayout(context, imgUrl)),
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.only(top: 16),
                padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
                decoration: BoxDecoration(
                  color: GlobalHelper.getColorSchema(context).surface,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(24),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _infoLayout(context, product, price),
                    if (dimensions.isNotEmpty)
                      _variantsLayout(context, dimensions),
                    _quantityLayout(context),
                    _notesLayout(context, noteCtrl),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ],
        ),
        _bottomBarLayout(context, totalPrice, noteCtrl),
      ],
    );
  }

  Widget _imageLayout(BuildContext context, String? imgUrl) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
      child: Container(
        height: 230,
        width: double.infinity,
        decoration: BoxDecoration(
          color: GlobalHelper.getColorSchema(context).primaryContainer,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: imgUrl != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    imgUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                )
              : Icon(
                  Icons.inventory_2_rounded,
                  size: 110,
                  color: GlobalHelper.getColorSchema(
                    context,
                  ).primary.withValues(alpha: 0.5),
                ),
        ),
      ),
    );
  }

  Widget _infoLayout(BuildContext context, dynamic product, String price) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                product.name,
                style:
                    GlobalHelper.getTextTheme(
                      context,
                      appTextStyle: AppTextStyle.TITLE_LARGE,
                    )?.copyWith(
                      fontWeight: FontWeight.w800,
                      color: GlobalHelper.getColorSchema(context).onSurface,
                    ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        if (product.category.isNotEmpty)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: GlobalHelper.getColorSchema(
                context,
              ).primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              product.category,
              style:
                  GlobalHelper.getTextTheme(
                    context,
                    appTextStyle: AppTextStyle.LABEL_SMALL,
                  )?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: GlobalHelper.getColorSchema(context).primary,
                  ),
            ),
          ),
        const SizedBox(height: 10),
        Row(
          children: [
            const Icon(Icons.star_rounded, color: Color(0xFFFBBC05), size: 16),
            const SizedBox(width: 4),
            Text(
              '${product.rating ?? 0.0} (${product.reviewsCount ?? 0} ulasan)',
              style:
                  GlobalHelper.getTextTheme(
                    context,
                    appTextStyle: AppTextStyle.BODY_SMALL,
                  )?.copyWith(
                    color: GlobalHelper.getColorSchema(context).onSurface,
                  ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          price,
          style:
              GlobalHelper.getTextTheme(
                context,
                appTextStyle: AppTextStyle.HEADLINE_SMALL,
              )?.copyWith(
                fontWeight: FontWeight.w900,
                color: GlobalHelper.getColorSchema(context).primary,
              ),
        ),
        Divider(
          height: 28,
          color: GlobalHelper.getColorSchema(context).outlineVariant,
        ),
        Text(
          'Deskripsi',
          style:
              GlobalHelper.getTextTheme(
                context,
                appTextStyle: AppTextStyle.BODY_LARGE,
              )?.copyWith(
                fontWeight: FontWeight.w700,
                color: GlobalHelper.getColorSchema(context).onSurface,
              ),
        ),
        const SizedBox(height: 6),
        Text(
          product.description?.isNotEmpty == true
              ? product.description!
              : 'Tidak ada deskripsi',
          style:
              GlobalHelper.getTextTheme(
                context,
                appTextStyle: AppTextStyle.BODY_SMALL,
              )?.copyWith(
                color: GlobalHelper.getColorSchema(
                  context,
                ).onSurface.withValues(alpha: 0.6),
                height: 1.5,
              ),
        ),
        Divider(
          height: 28,
          color: GlobalHelper.getColorSchema(context).outlineVariant,
        ),
      ],
    );
  }

  Widget _variantsLayout(
    BuildContext context,
    Map<String, Set<String>> dimensions,
  ) {
    final state = context.watch<CustomerDetailProductBloc>().state;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...dimensions.entries.map((entry) {
          final dimensionName = entry.key;
          final values = entry.value.toList();
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                dimensionName,
                style:
                    GlobalHelper.getTextTheme(
                      context,
                      appTextStyle: AppTextStyle.BODY_LARGE,
                    )?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: GlobalHelper.getColorSchema(context).onSurface,
                    ),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: values.map((value) {
                  final isSelected =
                      state.selectedVariantCombination?[dimensionName] == value;
                  return GestureDetector(
                    onTap: () {
                      final currentCombo = Map<String, String>.from(
                        state.selectedVariantCombination ?? {},
                      );
                      currentCombo[dimensionName] = value;
                      context.read<CustomerDetailProductBloc>().add(
                        CustomerDetailProductEventVariantChanged(currentCombo),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? GlobalHelper.getColorSchema(context).primary
                            : GlobalHelper.getColorSchema(context).surface,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: isSelected
                              ? GlobalHelper.getColorSchema(context).primary
                              : GlobalHelper.getColorSchema(
                                  context,
                                ).outlineVariant,
                        ),
                      ),
                      child: Text(
                        value,
                        style:
                            GlobalHelper.getTextTheme(
                              context,
                              appTextStyle: AppTextStyle.BODY_SMALL,
                            )?.copyWith(
                              fontWeight: isSelected
                                  ? FontWeight.w700
                                  : FontWeight.w500,
                              color: isSelected
                                  ? GlobalHelper.getColorSchema(
                                      context,
                                    ).onPrimary
                                  : GlobalHelper.getColorSchema(
                                      context,
                                    ).onSurface,
                            ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 16),
            ],
          );
        }),
        Divider(
          height: 12,
          color: GlobalHelper.getColorSchema(context).outlineVariant,
        ),
      ],
    );
  }

  Widget _quantityLayout(BuildContext context) {
    final state = context.watch<CustomerDetailProductBloc>().state;
    final product = state.product;

    int maxStock = 0;
    if (product != null) {
      if (state.selectedVariant != null) {
        maxStock = state.selectedVariant!.stock;
      } else {
        maxStock = product.stock ?? 0;
      }
    }

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Jumlah',
              style:
                  GlobalHelper.getTextTheme(
                    context,
                    appTextStyle: AppTextStyle.BODY_LARGE,
                  )?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: GlobalHelper.getColorSchema(context).onSurface,
                  ),
            ),
            Row(
              children: [
                _qtyButton(
                  context,
                  Icons.remove,
                  state.quantity > 1
                      ? () {
                          context.read<CustomerDetailProductBloc>().add(
                            CustomerDetailProductEventQuantityChanged(
                              state.quantity - 1,
                            ),
                          );
                        }
                      : null,
                ),
                Container(
                  width: 42,
                  alignment: Alignment.center,
                  child: Text(
                    '${state.quantity}',
                    style:
                        GlobalHelper.getTextTheme(
                          context,
                          appTextStyle: AppTextStyle.BODY_LARGE,
                        )?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: GlobalHelper.getColorSchema(context).onSurface,
                        ),
                  ),
                ),
                _qtyButton(
                  context,
                  Icons.add,
                  state.quantity < maxStock
                      ? () {
                          context.read<CustomerDetailProductBloc>().add(
                            CustomerDetailProductEventQuantityChanged(
                              state.quantity + 1,
                            ),
                          );
                        }
                      : null,
                ),
              ],
            ),
          ],
        ),
        Divider(
          height: 28,
          color: GlobalHelper.getColorSchema(context).outlineVariant,
        ),
      ],
    );
  }

  Widget _notesLayout(BuildContext context, TextEditingController noteCtrl) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Catatan untuk penjual ',
                style:
                    GlobalHelper.getTextTheme(
                      context,
                      appTextStyle: AppTextStyle.BODY_MEDIUM,
                    )?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: GlobalHelper.getColorSchema(context).onSurface,
                    ),
              ),
              TextSpan(
                text: '(Opsional)',
                style:
                    GlobalHelper.getTextTheme(
                      context,
                      appTextStyle: AppTextStyle.BODY_MEDIUM,
                    )?.copyWith(
                      color: GlobalHelper.getColorSchema(
                        context,
                      ).onSurface.withValues(alpha: 0.6),
                    ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: noteCtrl,
          maxLength: 100,
          maxLines: 3,
          style: GlobalHelper.getTextTheme(
            context,
            appTextStyle: AppTextStyle.BODY_SMALL,
          )?.copyWith(color: GlobalHelper.getColorSchema(context).onSurface),
          decoration: InputDecoration(
            hintText:
                'Contoh: Tidak usah pakai sendok, tolong dipilihkan yang exp lama, dll.',
            hintStyle:
                GlobalHelper.getTextTheme(
                  context,
                  appTextStyle: AppTextStyle.BODY_SMALL,
                )?.copyWith(
                  color: GlobalHelper.getColorSchema(
                    context,
                  ).onSurface.withValues(alpha: 0.6),
                  height: 1.4,
                ),
            counterStyle:
                GlobalHelper.getTextTheme(
                  context,
                  appTextStyle: AppTextStyle.LABEL_SMALL,
                )?.copyWith(
                  color: GlobalHelper.getColorSchema(
                    context,
                  ).onSurface.withValues(alpha: 0.6),
                ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: GlobalHelper.getColorSchema(context).outlineVariant,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: GlobalHelper.getColorSchema(context).outlineVariant,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: GlobalHelper.getColorSchema(context).primary,
              ),
            ),
            contentPadding: const EdgeInsets.all(12),
            filled: true,
            fillColor: GlobalHelper.getColorSchema(context).surface,
          ),
        ),
      ],
    );
  }

  Widget _bottomBarLayout(
    BuildContext context,
    String totalPrice,
    TextEditingController noteCtrl,
  ) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
        decoration: BoxDecoration(
          color: GlobalHelper.getColorSchema(context).surface,
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 12,
              offset: Offset(0, -4),
            ),
          ],
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total Harga',
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
                  totalPrice,
                  style:
                      GlobalHelper.getTextTheme(
                        context,
                        appTextStyle: AppTextStyle.BODY_LARGE,
                      )?.copyWith(
                        fontWeight: FontWeight.w900,
                        color: GlobalHelper.getColorSchema(context).primary,
                      ),
                ),
              ],
            ),
            const Spacer(),
            SizedBox(
              height: 48,
              child: ElevatedButton.icon(
                onPressed: () {
                  final notes = noteCtrl.text.trim();
                  context.read<CustomerDetailProductBloc>().add(
                    CustomerDetailProductEventAddToCart(
                      notes: notes.isNotEmpty ? notes : null,
                    ),
                  );
                },
                icon: const Icon(Icons.shopping_cart_outlined, size: 18),
                label: const Text(
                  'Tambah ke Keranjang',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: GlobalHelper.getColorSchema(context).primary,
                  foregroundColor: GlobalHelper.getColorSchema(
                    context,
                  ).onPrimary,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _qtyButton(BuildContext context, IconData icon, VoidCallback? onTap) {
    final isDisabled = onTap == null;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: GlobalHelper.getColorSchema(
            context,
          ).primary.withValues(alpha: isDisabled ? 0.05 : 0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          icon,
          color: GlobalHelper.getColorSchema(
            context,
          ).primary.withValues(alpha: isDisabled ? 0.3 : 1.0),
          size: 18,
        ),
      ),
    );
  }
}
