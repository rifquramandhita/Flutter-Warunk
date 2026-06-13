import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/customer/presentation/cart/bloc/customer_cart_bloc.dart';
import 'package:warunk/app/features/customer/presentation/checkout/customer_checkout_screen.dart';
import 'package:warunk/core/dependency/dependency.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_cart.dart';
import 'package:warunk/core/helper/global_helper.dart';
import 'package:warunk/core/helper/dialog_helper.dart';
import 'package:warunk/core/helper/number_helper.dart';
import 'package:warunk/core/widgets/loading_app_widget.dart';
import 'package:warunk/core/widgets/primary_button.dart';
import 'package:warunk/main.dart';
import 'package:warunk/app/features/customer/presentation/store/customer_merchant_screen.dart';
import 'package:warunk/app/features/customer/presentation/product/customer_product_screen.dart';

class CustomerCartScreen extends StatelessWidget {
  const CustomerCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CustomerCartBloc>()..add(CustomerCartEventGet()),
      child: BlocConsumer<CustomerCartBloc, CustomerCartState>(
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
            appBar: AppBar(title: Text('Keranjang')),
            body: _bodyBuild(context),
          );
        },
      ),
    );
  }

  Widget _bodyBuild(BuildContext context) {
    final state = context.watch<CustomerCartBloc>().state;
    return SafeArea(
      child: Stack(
        children: [
          _bodyLayout(context),
          (state.isLoading) ? const LoadingAppWidget() : const SizedBox(),
        ],
      ),
    );
  }

  Widget _bodyLayout(BuildContext context) {
    final state = context.watch<CustomerCartBloc>().state;

    if (!state.isLoading && state.items.isEmpty && state.errorMessage != null) {
      return Center(
        child: Text(
          state.errorMessage!,
          style: GlobalHelper.getTextTheme(
            context,
            appTextStyle: AppTextStyle.BODY_MEDIUM,
          )?.copyWith(color: GlobalHelper.getColorSchema(context).outline),
        ),
      );
    }

    if (!state.isLoading && state.items.isEmpty) {
      return Center(
        child: Text(
          'Keranjang kosong',
          style: GlobalHelper.getTextTheme(
            context,
            appTextStyle: AppTextStyle.BODY_MEDIUM,
          )?.copyWith(color: GlobalHelper.getColorSchema(context).outline),
        ),
      );
    }

    if (state.items.isEmpty) return const SizedBox();

    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 140),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...state.groupedItemsWithIndex.values.map((merchantItems) {
                  final firstItem = merchantItems.first.value;
                  final merchant = firstItem.product?.merchant;
                  final merchantName = merchant?.name ?? 'Toko Tidak Diketahui';
                  final merchantCity = merchant?.city ?? '';
                  final isOpen = merchant?.isOpen ?? false;

                  return Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: GlobalHelper.getColorSchema(context).surface,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: GlobalHelper.getColorSchema(
                          context,
                        ).outlineVariant,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(14),
                          child: Row(
                            children: [
                              Checkbox(
                                value:
                                    state.selectedMerchantId == merchant?.id &&
                                    merchantItems.every(
                                      (itemEntry) => state.selectedItemIds
                                          .contains(itemEntry.value.id),
                                    ),
                                onChanged: (val) {
                                  final mId = merchant?.id;
                                  if (val != null && mId != null) {
                                    context.read<CustomerCartBloc>().add(
                                      CustomerCartEventMerchantToggled(
                                        mId,
                                        val,
                                      ),
                                    );
                                  }
                                },
                                activeColor: GlobalHelper.getColorSchema(
                                  context,
                                ).primary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                side: BorderSide(
                                  color: GlobalHelper.getColorSchema(
                                    context,
                                  ).outline,
                                ),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () =>
                                      _onPressMerchant(context, merchant?.id),
                                  behavior: HitTestBehavior.opaque,
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 42,
                                        height: 42,
                                        decoration: BoxDecoration(
                                          color: GlobalHelper.getColorSchema(
                                            context,
                                          ).primary.withValues(alpha: 0.1),
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                        ),
                                        child: Icon(
                                          Icons.storefront_rounded,
                                          color: GlobalHelper.getColorSchema(
                                            context,
                                          ).primary,
                                          size: 24,
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
                                                Flexible(
                                                  child: Text(
                                                    merchantName,
                                                    style:
                                                        GlobalHelper.getTextTheme(
                                                          context,
                                                          appTextStyle:
                                                              AppTextStyle
                                                                  .TITLE_SMALL,
                                                        )?.copyWith(
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color:
                                                              GlobalHelper.getColorSchema(
                                                                context,
                                                              ).onSurface,
                                                        ),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                                const SizedBox(width: 8),
                                                if (isOpen)
                                                  _badge(
                                                    context,
                                                    'Buka',
                                                    GlobalHelper.getColorSchema(
                                                      context,
                                                    ).primary,
                                                  )
                                                else
                                                  _badge(
                                                    context,
                                                    'Tutup',
                                                    GlobalHelper.getColorSchema(
                                                      context,
                                                    ).error,
                                                  ),
                                              ],
                                            ),
                                            if (merchantCity.isNotEmpty) ...[
                                              const SizedBox(height: 4),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.location_on_rounded,
                                                    size: 13,
                                                    color:
                                                        GlobalHelper.getColorSchema(
                                                          context,
                                                        ).outline,
                                                  ),
                                                  const SizedBox(width: 3),
                                                  Text(
                                                    merchantCity,
                                                    style:
                                                        GlobalHelper.getTextTheme(
                                                          context,
                                                          appTextStyle:
                                                              AppTextStyle
                                                                  .BODY_SMALL,
                                                        )?.copyWith(
                                                          color:
                                                              GlobalHelper.getColorSchema(
                                                                context,
                                                              ).outline,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          height: 1,
                          color: GlobalHelper.getColorSchema(
                            context,
                          ).outlineVariant,
                        ),
                        ...merchantItems.asMap().entries.map((entry) {
                          final isLast = entry.key == merchantItems.length - 1;
                          return Column(
                            children: [
                              _cartItemCard(
                                context,
                                entry.value.key,
                                entry.value.value,
                              ),
                              if (!isLast)
                                Divider(
                                  height: 1,
                                  color: GlobalHelper.getColorSchema(
                                    context,
                                  ).outlineVariant,
                                  indent: 14,
                                  endIndent: 14,
                                ),
                            ],
                          );
                        }),
                      ],
                    ),
                  );
                }),
              ],
            ),
          ),
        ),

        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: GlobalHelper.getColorSchema(context).surface,
            boxShadow: [
              BoxShadow(
                color: GlobalHelper.getColorSchema(
                  context,
                ).shadow.withValues(alpha: 0.12),
                blurRadius: 16,
                offset: Offset(0, -4),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total',
                      style:
                          GlobalHelper.getTextTheme(
                            context,
                            appTextStyle: AppTextStyle.BODY_SMALL,
                          )?.copyWith(
                            color: GlobalHelper.getColorSchema(context).outline,
                          ),
                    ),
                    Text(
                      NumberHelper.formatIDR(state.subtotal),
                      style:
                          GlobalHelper.getTextTheme(
                            context,
                            appTextStyle: AppTextStyle.TITLE_LARGE,
                          )?.copyWith(
                            fontWeight: FontWeight.w900,
                            color: GlobalHelper.getColorSchema(context).primary,
                          ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: PrimaryButton(
                  label: 'Checkout',
                  onPressed: state.selectedItems.isEmpty
                      ? null
                      : () {
                          navigatorKey.currentState?.push(
                            MaterialPageRoute(
                              builder: (_) => CustomerCheckoutScreen(
                                selectedItems: state.selectedItems,
                              ),
                            ),
                          );
                        },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _cartItemCard(
    BuildContext context,
    int index,
    CustomerCartEntity item,
  ) {
    final state = context.watch<CustomerCartBloc>().state;
    final image = item.product?.images?.isNotEmpty == true
        ? item.product!.images!.first.url
        : null;

    return Padding(
      padding: const EdgeInsets.all(14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Checkbox(
                value: state.selectedItemIds.contains(item.id),
                onChanged: (val) {
                  final mId = item.product?.merchant?.id;
                  if (val != null && mId != null) {
                    context.read<CustomerCartBloc>().add(
                      CustomerCartEventItemToggled(item.id, mId, val),
                    );
                  }
                },
                activeColor: GlobalHelper.getColorSchema(context).primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                side: BorderSide(
                  color: GlobalHelper.getColorSchema(context).outline,
                ),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => _onPressProduct(context, item.product?.id),
              behavior: HitTestBehavior.opaque,
              child: Row(
                children: [
                  Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      color: GlobalHelper.getColorSchema(
                        context,
                      ).outlineVariant.withValues(alpha: 0.3),
                      borderRadius: BorderRadius.circular(12),
                      image: image != null
                          ? DecorationImage(
                              image: NetworkImage(image),
                              fit: BoxFit.cover,
                            )
                          : null,
                    ),
                    child: image == null
                        ? Center(
                            child: Icon(
                              Icons.image_not_supported_rounded,
                              color: GlobalHelper.getColorSchema(
                                context,
                              ).outline,
                            ),
                          )
                        : null,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.product?.name ?? '-',
                          style:
                              GlobalHelper.getTextTheme(
                                context,
                                appTextStyle: AppTextStyle.TITLE_SMALL,
                              )?.copyWith(
                                fontWeight: FontWeight.w700,
                                color: GlobalHelper.getColorSchema(
                                  context,
                                ).onSurface,
                              ),
                        ),
                        const SizedBox(height: 2),
                        if (item.productVariant != null &&
                            item.productVariant!.variantCombination.isNotEmpty)
                          Text(
                            item.productVariant!.variantCombination.values.join(
                              ', ',
                            ),
                            style:
                                GlobalHelper.getTextTheme(
                                  context,
                                  appTextStyle: AppTextStyle.BODY_SMALL,
                                )?.copyWith(
                                  color: GlobalHelper.getColorSchema(
                                    context,
                                  ).outline,
                                ),
                          ),
                        const SizedBox(height: 6),
                        Text(
                          NumberHelper.formatIDR(item.unitPrice),
                          style:
                              GlobalHelper.getTextTheme(
                                context,
                                appTextStyle: AppTextStyle.BODY_MEDIUM,
                              )?.copyWith(
                                fontWeight: FontWeight.w700,
                                color: GlobalHelper.getColorSchema(
                                  context,
                                ).primary,
                              ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 8),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _qtyBtn(
                    context,
                    Icons.remove,
                    () => context.read<CustomerCartBloc>().add(
                      CustomerCartEventQtyChanged(index, -1),
                    ),
                  ),
                  SizedBox(
                    width: 34,
                    child: Center(
                      child: Text(
                        '${item.quantity}',
                        style:
                            GlobalHelper.getTextTheme(
                              context,
                              appTextStyle: AppTextStyle.TITLE_SMALL,
                            )?.copyWith(
                              fontWeight: FontWeight.w700,
                              color: GlobalHelper.getColorSchema(
                                context,
                              ).onSurface,
                            ),
                      ),
                    ),
                  ),
                  _qtyBtn(
                    context,
                    Icons.add,
                    () => context.read<CustomerCartBloc>().add(
                      CustomerCartEventQtyChanged(index, 1),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              GestureDetector(
                onTap: () => context.read<CustomerCartBloc>().add(
                  CustomerCartEventItemRemoved(index),
                ),
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: GlobalHelper.getColorSchema(
                      context,
                    ).error.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.delete_outline_rounded,
                    color: GlobalHelper.getColorSchema(context).error,
                    size: 18,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _qtyBtn(BuildContext context, IconData icon, VoidCallback onTap) =>
      GestureDetector(
        onTap: onTap,
        child: Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(
            color: GlobalHelper.getColorSchema(
              context,
            ).primary.withValues(alpha: 0.10),
            borderRadius: BorderRadius.circular(7),
          ),
          child: Icon(
            icon,
            color: GlobalHelper.getColorSchema(context).primary,
            size: 16,
          ),
        ),
      );

  Widget _card(BuildContext context, {required Widget child}) => Container(
    padding: const EdgeInsets.all(14),
    decoration: BoxDecoration(
      color: GlobalHelper.getColorSchema(context).surface,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(
        color: GlobalHelper.getColorSchema(context).outlineVariant,
      ),
    ),
    child: child,
  );

  Widget _badge(BuildContext context, String text, Color color) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
    decoration: BoxDecoration(
      color: color.withValues(alpha: 0.1),
      borderRadius: BorderRadius.circular(6),
    ),
    child: Text(
      text,
      style: GlobalHelper.getTextTheme(
        context,
        appTextStyle: AppTextStyle.LABEL_SMALL,
      )?.copyWith(fontWeight: FontWeight.w700, color: color),
    ),
  );

  void _onPressMerchant(BuildContext context, String? merchantId) async {
    if (merchantId == null) {
      return;
    }

    await navigatorKey.currentState?.push(
      MaterialPageRoute(
        builder: (_) => CustomerMerchantScreen(storeId: merchantId),
      ),
    );
    context.read<CustomerCartBloc>().add(CustomerCartEventGet());
  }

  void _onPressProduct(BuildContext context, String? productId) async {
    if (productId == null) {
      return;
    }
    await navigatorKey.currentState?.push(
      MaterialPageRoute(
        builder: (_) => CustomerProductScreen(productId: productId),
      ),
    );
    context.read<CustomerCartBloc>().add(CustomerCartEventGet());
  }
}
