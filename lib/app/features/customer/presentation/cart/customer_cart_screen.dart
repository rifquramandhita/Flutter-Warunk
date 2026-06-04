import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/customer/presentation/cart/bloc/customer_cart_bloc.dart';
import 'package:warunk/app/features/customer/presentation/checkout/customer_checkout_screen.dart';
import 'package:warunk/core/dependency/dependency.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_cart.dart';
import 'package:warunk/core/helper/global_helper.dart';
import 'package:warunk/core/helper/dialog_helper.dart';
import 'package:warunk/core/widgets/loading_app_widget.dart';
import 'package:warunk/main.dart';

class CustomerCartScreen extends StatelessWidget {
  const CustomerCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<CustomerCartBloc>()..add(CustomerCartEventFetch()),
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
          if (state.isLoading) const LoadingAppWidget(),
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

    return Stack(
      children: [
        SingleChildScrollView(
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
                    color: Colors.white,
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
                            Container(
                              width: 42,
                              height: 42,
                              decoration: BoxDecoration(
                                color: GlobalHelper.getColorSchema(
                                  context,
                                ).primary.withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(10),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                                    AppTextStyle.TITLE_SMALL,
                                              )?.copyWith(
                                                fontWeight: FontWeight.w700,
                                                color:
                                                    GlobalHelper.getColorSchema(
                                                      context,
                                                    ).onSurface,
                                              ),
                                          overflow: TextOverflow.ellipsis,
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
                                        _badge(context, 'Tutup', Colors.red),
                                    ],
                                  ),
                                  if (merchantCity.isNotEmpty) ...[
                                    const SizedBox(height: 4),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.location_on_rounded,
                                          size: 13,
                                          color: GlobalHelper.getColorSchema(
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
                                                    AppTextStyle.BODY_SMALL,
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

              Text(
                'Catatan untuk toko',
                style:
                    GlobalHelper.getTextTheme(
                      context,
                      appTextStyle: AppTextStyle.TITLE_SMALL,
                    )?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: GlobalHelper.getColorSchema(context).onSurface,
                    ),
              ),
              const SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: GlobalHelper.getColorSchema(context).outlineVariant,
                  ),
                ),
                child: TextField(
                  onChanged: (v) => context.read<CustomerCartBloc>().add(
                    CustomerCartEventNoteChanged(v),
                  ),
                  maxLength: 100,
                  maxLines: 3,
                  style:
                      GlobalHelper.getTextTheme(
                        context,
                        appTextStyle: AppTextStyle.BODY_MEDIUM,
                      )?.copyWith(
                        color: GlobalHelper.getColorSchema(context).onSurface,
                      ),
                  decoration: InputDecoration(
                    hintText: 'Contoh: Tolong pilihkan yang exp lama, dll.',
                    hintStyle:
                        GlobalHelper.getTextTheme(
                          context,
                          appTextStyle: AppTextStyle.BODY_MEDIUM,
                        )?.copyWith(
                          color: GlobalHelper.getColorSchema(context).outline,
                        ),
                    counterStyle:
                        GlobalHelper.getTextTheme(
                          context,
                          appTextStyle: AppTextStyle.LABEL_SMALL,
                        )?.copyWith(
                          color: GlobalHelper.getColorSchema(context).outline,
                        ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.all(14),
                  ),
                ),
              ),
              const SizedBox(height: 14),

              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF8E1),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: const Color(0xFFF59E0B).withValues(alpha: 0.3),
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
                        size: 22,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Gratis ongkir min. belanja 30RB',
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
                          Text(
                            'Berlaku untuk pengiriman ke area kamu.',
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
                        ],
                      ),
                    ),
                    Icon(
                      Icons.chevron_right_rounded,
                      color: GlobalHelper.getColorSchema(context).outline,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              _card(
                context,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _priceRow(
                      context,
                      'Subtotal (${state.itemCount} item)',
                      _fmt(state.subtotal),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Text(
                          'Biaya layanan',
                          style:
                              GlobalHelper.getTextTheme(
                                context,
                                appTextStyle: AppTextStyle.BODY_MEDIUM,
                              )?.copyWith(
                                color: GlobalHelper.getColorSchema(
                                  context,
                                ).outline,
                              ),
                        ),
                        const SizedBox(width: 4),
                        Icon(
                          Icons.info_outline,
                          size: 14,
                          color: GlobalHelper.getColorSchema(context).outline,
                        ),
                        const Spacer(),
                        Text(
                          _fmt(CustomerCartState.serviceFee),
                          style:
                              GlobalHelper.getTextTheme(
                                context,
                                appTextStyle: AppTextStyle.BODY_MEDIUM,
                              )?.copyWith(
                                color: GlobalHelper.getColorSchema(
                                  context,
                                ).onSurface,
                              ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    _priceRow(
                      context,
                      'Ongkir',
                      _fmt(CustomerCartState.ongkir),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Text(
                          'Diskon ongkir',
                          style:
                              GlobalHelper.getTextTheme(
                                context,
                                appTextStyle: AppTextStyle.BODY_MEDIUM,
                              )?.copyWith(
                                color: GlobalHelper.getColorSchema(
                                  context,
                                ).primary,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                        const Spacer(),
                        Text(
                          _fmt(CustomerCartState.diskon, negative: true),
                          style:
                              GlobalHelper.getTextTheme(
                                context,
                                appTextStyle: AppTextStyle.BODY_MEDIUM,
                              )?.copyWith(
                                color: GlobalHelper.getColorSchema(
                                  context,
                                ).primary,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      child: Divider(
                        height: 1,
                        color: GlobalHelper.getColorSchema(
                          context,
                        ).outlineVariant,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          'Total',
                          style:
                              GlobalHelper.getTextTheme(
                                context,
                                appTextStyle: AppTextStyle.TITLE_MEDIUM,
                              )?.copyWith(
                                fontWeight: FontWeight.w800,
                                color: GlobalHelper.getColorSchema(
                                  context,
                                ).onSurface,
                              ),
                        ),
                        const Spacer(),
                        Text(
                          _fmt(state.total),
                          style:
                              GlobalHelper.getTextTheme(
                                context,
                                appTextStyle: AppTextStyle.TITLE_LARGE,
                              )?.copyWith(
                                fontWeight: FontWeight.w900,
                                color: GlobalHelper.getColorSchema(
                                  context,
                                ).primary,
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

        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.fromLTRB(
              16,
              14,
              16,
              MediaQuery.of(context).padding.bottom + 14,
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 16,
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
                      _fmt(state.total),
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
                const Spacer(),
                SizedBox(
                  height: 50,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      navigatorKey.currentState?.push(
                        MaterialPageRoute(
                          builder: (_) => const CustomerCheckoutScreen(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.arrow_forward_rounded, size: 18),
                    label: Text(
                      'Lanjut Checkout',
                      style: GlobalHelper.getTextTheme(
                        context,
                        appTextStyle: AppTextStyle.LABEL_LARGE,
                      )?.copyWith(fontWeight: FontWeight.w700),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: GlobalHelper.getColorSchema(
                        context,
                      ).primary,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 22),
                    ),
                  ),
                ),
              ],
            ),
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
    final image = item.product?.images?.isNotEmpty == true
        ? item.product!.images!.first.url
        : null;

    return Padding(
      padding: const EdgeInsets.all(14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                      color: GlobalHelper.getColorSchema(context).outline,
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
                        color: GlobalHelper.getColorSchema(context).onSurface,
                      ),
                ),
                const SizedBox(height: 2),
                if (item.productVariant != null &&
                    item.productVariant!.variantCombination.isNotEmpty)
                  Text(
                    item.productVariant!.variantCombination.values.join(', '),
                    style:
                        GlobalHelper.getTextTheme(
                          context,
                          appTextStyle: AppTextStyle.BODY_SMALL,
                        )?.copyWith(
                          color: GlobalHelper.getColorSchema(context).outline,
                        ),
                  ),
                const SizedBox(height: 6),
                Text(
                  _fmtStatic(item.unitPrice * item.quantity),
                  style:
                      GlobalHelper.getTextTheme(
                        context,
                        appTextStyle: AppTextStyle.BODY_MEDIUM,
                      )?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: GlobalHelper.getColorSchema(context).primary,
                      ),
                ),
              ],
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
                    color: Colors.red.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.delete_outline_rounded,
                    color: Colors.red,
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

  String _fmt(int v, {bool negative = false}) {
    return _fmtStatic(v, negative: negative);
  }

  static String _fmtStatic(int v, {bool negative = false}) {
    final abs = v.abs();
    final s = abs.toString();
    final buf = StringBuffer(negative ? '-Rp' : 'Rp');
    for (var i = 0; i < s.length; i++) {
      if (i > 0 && (s.length - i) % 3 == 0) buf.write('.');
      buf.write(s[i]);
    }
    return buf.toString();
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
      color: Colors.white,
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

  Widget _priceRow(BuildContext context, String label, String value) => Row(
    children: [
      Text(
        label,
        style: GlobalHelper.getTextTheme(
          context,
          appTextStyle: AppTextStyle.BODY_MEDIUM,
        )?.copyWith(color: GlobalHelper.getColorSchema(context).outline),
      ),
      const Spacer(),
      Text(
        value,
        style: GlobalHelper.getTextTheme(
          context,
          appTextStyle: AppTextStyle.BODY_MEDIUM,
        )?.copyWith(color: GlobalHelper.getColorSchema(context).onSurface),
      ),
    ],
  );
}
