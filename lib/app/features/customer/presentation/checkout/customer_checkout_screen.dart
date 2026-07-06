// ignore_for_file: deprecated_member_use
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:image_picker/image_picker.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_address.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_checkout.dart';
import 'package:warunk/core/enum/delivery_method.dart';
import 'package:warunk/app/features/customer/presentation/address/customer_address_screen.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_cart.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_order.dart';
import 'package:warunk/app/features/customer/presentation/order_success/customer_order_success_screen.dart';
import 'package:warunk/app/features/customer/presentation/promotion/customer_promotion_screen.dart';
import 'package:warunk/core/dependency/dependency.dart';
import 'package:warunk/app/features/customer/presentation/checkout/bloc/customer_checkout_bloc.dart';
import 'package:warunk/core/helper/dialog_helper.dart';
import 'package:warunk/core/helper/global_helper.dart';
import 'package:warunk/core/helper/number_helper.dart';
import 'package:warunk/main.dart';
import 'package:warunk/core/widgets/loading_app_widget.dart';

class CustomerCheckoutScreen extends StatelessWidget {
  final List<CustomerCartEntity> selectedItems;

  const CustomerCheckoutScreen({super.key, required this.selectedItems});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          sl<CustomerCheckoutBloc>()
            ..add(CustomerCheckoutEventFetchStarted(selectedItems)),
      child: BlocConsumer<CustomerCheckoutBloc, CustomerCheckoutState>(
        listener: (context, state) {
          if (state.errorMessage != null) {
            DialogHelper.showErrorSnackBar(
              context: context,
              text: state.errorMessage!,
            );
          }
          if (state.isSuccess && state.createdOrderId != null) {
            navigatorKey.currentState?.pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (_) =>
                    CustomerOrderSuccessScreen(orderId: state.createdOrderId!),
              ),
              (route) => route.isFirst,
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: GlobalHelper.getColorSchema(context).surface,
            appBar: AppBar(title: const Text('Checkout')),
            body: _bodyBuild(context),
          );
        },
      ),
    );
  }

  Widget _bodyBuild(BuildContext context) {
    final state = context.watch<CustomerCheckoutBloc>().state;
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
    final state = context.watch<CustomerCheckoutBloc>().state;
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _addressSection(context, state),
                const SizedBox(height: 12),
                _orderSection(context, state),
                const SizedBox(height: 12),
                _deliverySection(context, state),
                const SizedBox(height: 12),
                _paymentMethodDropdownSection(context, state),
                const SizedBox(height: 12),
                _voucherSection(context, state),
                const SizedBox(height: 12),
                _notesSection(context, state),
                const SizedBox(height: 12),

                const SizedBox(height: 12),
                _paymentSummarySection(context, state),
              ],
            ),
          ),
        ),
        _bottomBar(context, state),
      ],
    );
  }

  Widget _addressSection(BuildContext context, CustomerCheckoutState state) {
    return _sectionCard(
      context: context,
      icon: Icons.location_on_rounded,
      title: 'Alamat Pengiriman',
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  state.address?.recipientName ?? '-',
                  style:
                      GlobalHelper.getTextTheme(
                        context,
                        appTextStyle: AppTextStyle.BODY_LARGE,
                      )?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: GlobalHelper.getColorSchema(context).onSurface,
                      ),
                ),
                const SizedBox(height: 3),
                Text(
                  state.address?.phone ?? '-',
                  style:
                      GlobalHelper.getTextTheme(
                        context,
                        appTextStyle: AppTextStyle.BODY_MEDIUM,
                      )?.copyWith(
                        color: GlobalHelper.getColorSchema(context).outline,
                      ),
                ),
                const SizedBox(height: 3),
                Text(
                  state.address?.fullAddress ?? '-',
                  style:
                      GlobalHelper.getTextTheme(
                        context,
                        appTextStyle: AppTextStyle.BODY_MEDIUM,
                      )?.copyWith(
                        color: GlobalHelper.getColorSchema(context).outline,
                      ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: () async {
              final newAddress = await navigatorKey.currentState?.push(
                MaterialPageRoute(
                  builder: (_) => CustomerAddressScreen(
                    isSelectionMode: true,
                    selectedAddressId: state.address?.id,
                  ),
                ),
              );
              if (newAddress != null && newAddress is CustomerAddressEntity) {
                if (context.mounted) {
                  context.read<CustomerCheckoutBloc>().add(
                    CustomerCheckoutEventAddressChanged(newAddress),
                  );
                }
              }
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: GlobalHelper.getColorSchema(
                  context,
                ).primary.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Ubah',
                    style:
                        GlobalHelper.getTextTheme(
                          context,
                          appTextStyle: AppTextStyle.LABEL_MEDIUM,
                        )?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: GlobalHelper.getColorSchema(context).primary,
                        ),
                  ),
                  Icon(
                    Icons.chevron_right_rounded,
                    size: 14,
                    color: GlobalHelper.getColorSchema(context).primary,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _orderSection(BuildContext context, CustomerCheckoutState state) {
    return _sectionCard(
      context: context,
      icon: Icons.storefront_rounded,
      title: 'Pesanan',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: GlobalHelper.getColorSchema(context).primary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    state.merchantInitial,
                    style:
                        GlobalHelper.getTextTheme(
                          context,
                          appTextStyle: AppTextStyle.BODY_MEDIUM,
                        )?.copyWith(
                          color: GlobalHelper.getColorSchema(context).onPrimary,
                          fontWeight: FontWeight.w900,
                        ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                state.merchantName,
                style:
                    GlobalHelper.getTextTheme(
                      context,
                      appTextStyle: AppTextStyle.BODY_LARGE,
                    )?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: GlobalHelper.getColorSchema(context).onSurface,
                    ),
              ),
              const SizedBox(width: 8),
              state.isMerchantOpen
                  ? _badge(
                      context,
                      'Buka',
                      color: GlobalHelper.getColorSchema(context).primary,
                    )
                  : _badge(
                      context,
                      'Tutup',
                      color: GlobalHelper.getColorSchema(context).error,
                    ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            '${state.items.fold(0, (sum, i) => sum + i.quantity)} item',
            style: GlobalHelper.getTextTheme(
              context,
              appTextStyle: AppTextStyle.BODY_SMALL,
            )?.copyWith(color: GlobalHelper.getColorSchema(context).outline),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Divider(
              height: 1,
              color: GlobalHelper.getColorSchema(context).outlineVariant,
            ),
          ),
          ...state.items.map((item) {
            final image = item.product?.images?.isNotEmpty == true
                ? item.product!.images!.first.url
                : null;
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: GlobalHelper.getColorSchema(
                        context,
                      ).outlineVariant,
                      borderRadius: BorderRadius.circular(10),
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
                              size: 20,
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
                                appTextStyle: AppTextStyle.BODY_LARGE,
                              )?.copyWith(
                                color: GlobalHelper.getColorSchema(
                                  context,
                                ).onSurface,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                        if (item.productVariant != null &&
                            item
                                .productVariant!
                                .variantCombination
                                .isNotEmpty) ...[
                          const SizedBox(height: 2),
                          Text(
                            item.productVariant!.variantCombination.values.join(
                              ', ',
                            ),
                            style:
                                GlobalHelper.getTextTheme(
                                  context,
                                  appTextStyle: AppTextStyle.LABEL_SMALL,
                                )?.copyWith(
                                  color: GlobalHelper.getColorSchema(
                                    context,
                                  ).outline,
                                ),
                          ),
                        ],
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        NumberHelper.formatIDR(item.unitPrice),
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
                      const SizedBox(height: 2),
                      Text(
                        '${item.quantity} x ${NumberHelper.formatIDR(item.unitPrice)}',
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
                ],
              ),
            );
          }),
          Padding(
            padding: const EdgeInsets.only(top: 2, bottom: 10),
            child: Divider(
              height: 1,
              color: GlobalHelper.getColorSchema(context).outlineVariant,
            ),
          ),
          Row(
            children: [
              Text(
                'Subtotal',
                style:
                    GlobalHelper.getTextTheme(
                      context,
                      appTextStyle: AppTextStyle.BODY_LARGE,
                    )?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: GlobalHelper.getColorSchema(context).onSurface,
                    ),
              ),
              const Spacer(),
              Text(
                NumberHelper.formatIDR(state.subtotal),
                style:
                    GlobalHelper.getTextTheme(
                      context,
                      appTextStyle: AppTextStyle.BODY_LARGE,
                    )?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: GlobalHelper.getColorSchema(context).onSurface,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _deliverySection(BuildContext context, CustomerCheckoutState state) {
    final availableOptions = state.checkoutOption?.shippingOptions ?? [];

    if (availableOptions.isEmpty) return const SizedBox.shrink();

    return _sectionCard(
      context: context,
      icon: Icons.delivery_dining_rounded,
      title: 'Metode Pengiriman',
      child: Column(
        children: availableOptions.map((opt) {
          final method = opt.key ?? '';
          final deliveryMethodEnum = DeliveryMethodEnum.fromString(method);
          if (deliveryMethodEnum == null) return const SizedBox.shrink();

          final selected = state.deliveryMethod == deliveryMethodEnum;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => context.read<CustomerCheckoutBloc>().add(
                  CustomerCheckoutEventDeliveryChanged(deliveryMethodEnum),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    children: [
                      Radio<DeliveryMethodEnum>(
                        value: deliveryMethodEnum,
                        groupValue: state.deliveryMethod,
                        onChanged: (v) => context
                            .read<CustomerCheckoutBloc>()
                            .add(CustomerCheckoutEventDeliveryChanged(v!)),
                        activeColor: GlobalHelper.getColorSchema(
                          context,
                        ).primary,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              opt.title ?? '-',
                              style:
                                  GlobalHelper.getTextTheme(
                                    context,
                                    appTextStyle: AppTextStyle.BODY_LARGE,
                                  )?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: GlobalHelper.getColorSchema(
                                      context,
                                    ).onSurface,
                                  ),
                            ),
                            if (opt.description != null &&
                                opt.description!.isNotEmpty)
                              Text(
                                opt.description!,
                                style:
                                    GlobalHelper.getTextTheme(
                                      context,
                                      appTextStyle: AppTextStyle.LABEL_SMALL,
                                    )?.copyWith(
                                      color: GlobalHelper.getColorSchema(
                                        context,
                                      ).outline,
                                    ),
                              ),
                          ],
                        ),
                      ),
                      if (method != 'biteship' ||
                          (method == 'biteship' &&
                              selected &&
                              (state.selectedExpedition != null &&
                                  state.selectedExpedition!.isNotEmpty)))
                        Text(
                          method == 'biteship'
                              ? NumberHelper.formatIDR(
                                  state.checkoutOption?.biteshipShippingOptions
                                          ?.where(
                                            (e) =>
                                                e.key ==
                                                state.selectedExpedition,
                                          )
                                          .firstOrNull
                                          ?.price ??
                                      opt.price ??
                                      0,
                                )
                              : NumberHelper.formatIDR(opt.price ?? 0),
                          style:
                              GlobalHelper.getTextTheme(
                                context,
                                appTextStyle: AppTextStyle.BODY_LARGE,
                              )?.copyWith(
                                fontWeight: FontWeight.w700,
                                color: selected
                                    ? GlobalHelper.getColorSchema(
                                        context,
                                      ).primary
                                    : GlobalHelper.getColorSchema(
                                        context,
                                      ).onSurface,
                              ),
                        ),
                    ],
                  ),
                ),
              ),
              if (selected && method == 'biteship')
                Padding(
                  padding: const EdgeInsets.only(
                    left: 48,
                    top: 8,
                    bottom: 8,
                    right: 16,
                  ),
                  child: DropdownSearch<CustomerCheckoutShippingOptionEntity>(
                    selectedItem: state.selectedExpedition?.isNotEmpty == true
                        ? state.checkoutOption?.biteshipShippingOptions
                              ?.where((e) => e.key == state.selectedExpedition)
                              .firstOrNull
                        : null,
                    items: (filter, loadProps) =>
                        state.checkoutOption?.biteshipShippingOptions ?? [],
                    itemAsString:
                        (CustomerCheckoutShippingOptionEntity? option) =>
                            option?.title ?? '',
                    compareFn: (item1, item2) => item1.key == item2.key,
                    onSelected: (value) {
                      if (value?.key != null) {
                        context.read<CustomerCheckoutBloc>().add(
                          CustomerCheckoutEventExpeditionChanged(value!.key!),
                        );
                      }
                    },
                    popupProps: PopupProps.menu(
                      showSearchBox: true,
                      searchFieldProps: TextFieldProps(
                        decoration: InputDecoration(
                          hintText: 'Cari kurir...',
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: GlobalHelper.getColorSchema(
                                context,
                              ).outlineVariant,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: GlobalHelper.getColorSchema(
                                context,
                              ).primary,
                            ),
                          ),
                        ),
                      ),
                    ),
                    decoratorProps: DropDownDecoratorProps(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: GlobalHelper.getColorSchema(
                              context,
                            ).outlineVariant,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: GlobalHelper.getColorSchema(
                              context,
                            ).outlineVariant,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _paymentMethodDropdownSection(
    BuildContext context,
    CustomerCheckoutState state,
  ) {
    final methods = state.checkoutOption?.paymentMethods ?? [];
    if (methods.isEmpty) return const SizedBox.shrink();

    return _sectionCard(
      context: context,
      icon: Icons.account_balance_wallet_rounded,
      title: 'Metode Pembayaran',
      child: DropdownSearch<CustomerCheckoutPaymentMethodEntity>(
        selectedItem: state.selectedPaymentMethodKey != null
            ? methods
                  .where((e) => e.key == state.selectedPaymentMethodKey)
                  .firstOrNull
            : null,
        items: (filter, loadProps) => methods,
        itemAsString: (CustomerCheckoutPaymentMethodEntity? option) {
          if (option == null) return '';
          final bank = (option.bankName ?? '').toUpperCase();
          final title = option.label ?? bank;
          final subtitle = option.description ?? '';
          return subtitle.isNotEmpty ? '$title - $subtitle' : title;
        },
        compareFn: (item1, item2) => item1.key == item2.key,
        onSelected: (value) {
          if (value?.key != null) {
            context.read<CustomerCheckoutBloc>().add(
              CustomerCheckoutEventPaymentMethodChanged(value!.key!),
            );
          }
        },
        decoratorProps: DropDownDecoratorProps(
          decoration: InputDecoration(
            hintText: 'Pilih Metode Pembayaran',
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: GlobalHelper.getColorSchema(context).outlineVariant,
              ),
            ),
          ),
        ),
        popupProps: PopupProps.menu(showSearchBox: false, fit: FlexFit.loose),
      ),
    );
  }

  Widget _voucherSection(BuildContext context, CustomerCheckoutState state) {
    return _sectionCard(
      context: context,
      icon: Icons.local_offer_rounded,
      title: 'Voucher & Promo',
      trailing: GestureDetector(
        onTap: () => _onPressPromotion(context),
        child: Icon(
          Icons.chevron_right_rounded,
          color: GlobalHelper.getColorSchema(context).outline,
        ),
      ),
      child: Row(
        children: [
          if (state.hasVoucher)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: GlobalHelper.getColorSchema(
                  context,
                ).primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: GlobalHelper.getColorSchema(
                    context,
                  ).primary.withValues(alpha: 0.3),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.local_offer_rounded,
                    size: 12,
                    color: GlobalHelper.getColorSchema(context).primary,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    state.appliedPromoCode ??
                        state.checkoutOption?.promotion?.code ??
                        state.checkoutOption?.promotion?.title ??
                        'Promo Terpakai',
                    style:
                        GlobalHelper.getTextTheme(
                          context,
                          appTextStyle: AppTextStyle.LABEL_MEDIUM,
                        )?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: GlobalHelper.getColorSchema(context).primary,
                        ),
                  ),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: () => context.read<CustomerCheckoutBloc>().add(
                      const CustomerCheckoutEventVoucherRemoved(),
                    ),
                    child: Icon(
                      Icons.close,
                      size: 12,
                      color: GlobalHelper.getColorSchema(context).primary,
                    ),
                  ),
                ],
              ),
            )
          else
            Text(
              'Pilih atau masukkan promo',
              style: GlobalHelper.getTextTheme(
                context,
                appTextStyle: AppTextStyle.BODY_MEDIUM,
              )?.copyWith(color: GlobalHelper.getColorSchema(context).outline),
            ),
        ],
      ),
    );
  }

  Widget _notesSection(BuildContext context, CustomerCheckoutState state) {
    return _sectionCard(
      context: context,
      icon: Icons.note_alt_outlined,
      title: 'Catatan Pesanan',
      child: TextField(
        onChanged: (value) => context.read<CustomerCheckoutBloc>().add(
          CustomerCheckoutEventNotesChanged(value),
        ),
        decoration: InputDecoration(
          hintText: 'Tambahkan catatan untuk penjual...',
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: GlobalHelper.getColorSchema(context).outlineVariant,
            ),
          ),
        ),
        maxLines: 2,
      ),
    );
  }

  Widget _paymentSummarySection(
    BuildContext context,
    CustomerCheckoutState state,
  ) {
    final summary = state.checkoutOption?.summary;
    final serviceFee = summary?.serviceFee ?? 2000;
    final discount = summary?.discount ?? (state.hasVoucher ? 8000 : 0);

    return _sectionCard(
      context: context,
      icon: Icons.receipt_long_rounded,
      title: 'Ringkasan Pembayaran',
      child: Column(
        children: [
          _priceRow(
            context,
            'Subtotal',
            NumberHelper.formatIDR(state.subtotal),
          ),
          const SizedBox(height: 10),
          _priceRow(context, 'Ongkir', NumberHelper.formatIDR(state.ongkir)),
          const SizedBox(height: 10),
          Row(
            children: [
              Text(
                'Biaya layanan',
                style:
                    GlobalHelper.getTextTheme(
                      context,
                      appTextStyle: AppTextStyle.BODY_LARGE,
                    )?.copyWith(
                      color: GlobalHelper.getColorSchema(context).outline,
                    ),
              ),
              const SizedBox(width: 4),
              Icon(
                Icons.info_outline,
                size: 13,
                color: GlobalHelper.getColorSchema(context).outline,
              ),
              const Spacer(),
              Text(
                NumberHelper.formatIDR(serviceFee),
                style:
                    GlobalHelper.getTextTheme(
                      context,
                      appTextStyle: AppTextStyle.BODY_LARGE,
                    )?.copyWith(
                      color: GlobalHelper.getColorSchema(context).onSurface,
                    ),
              ),
            ],
          ),
          if (discount > 0) ...[
            const SizedBox(height: 10),
            Row(
              children: [
                Text(
                  'Diskon',
                  style:
                      GlobalHelper.getTextTheme(
                        context,
                        appTextStyle: AppTextStyle.BODY_LARGE,
                      )?.copyWith(
                        color: GlobalHelper.getColorSchema(context).primary,
                      ),
                ),
                const Spacer(),
                Text(
                  '-${NumberHelper.formatIDR(discount)}',
                  style:
                      GlobalHelper.getTextTheme(
                        context,
                        appTextStyle: AppTextStyle.BODY_LARGE,
                      )?.copyWith(
                        color: GlobalHelper.getColorSchema(context).primary,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ],
            ),
          ],
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Divider(
              height: 1,
              color: GlobalHelper.getColorSchema(context).outlineVariant,
            ),
          ),
          Row(
            children: [
              Text(
                'Total',
                style:
                    GlobalHelper.getTextTheme(
                      context,
                      appTextStyle: AppTextStyle.TITLE_SMALL,
                    )?.copyWith(
                      fontWeight: FontWeight.w800,
                      color: GlobalHelper.getColorSchema(context).onSurface,
                    ),
              ),
              const Spacer(),
              Text(
                NumberHelper.formatIDR(state.total),
                style:
                    GlobalHelper.getTextTheme(
                      context,
                      appTextStyle: AppTextStyle.TITLE_SMALL,
                    )?.copyWith(
                      fontWeight: FontWeight.w900,
                      color: GlobalHelper.getColorSchema(context).onSurface,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _bottomBar(BuildContext context, CustomerCheckoutState state) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: GlobalHelper.getColorSchema(context).surface,
        boxShadow: [
          BoxShadow(
            color: GlobalHelper.getColorSchema(
              context,
            ).shadow.withValues(alpha: 0.12),
            blurRadius: 16,
            offset: const Offset(0, -4),
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
                      appTextStyle: AppTextStyle.LABEL_MEDIUM,
                    )?.copyWith(
                      color: GlobalHelper.getColorSchema(context).outline,
                    ),
              ),
              Text(
                NumberHelper.formatIDR(state.total),
                style:
                    GlobalHelper.getTextTheme(
                      context,
                      appTextStyle: AppTextStyle.TITLE_MEDIUM,
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
                context.read<CustomerCheckoutBloc>().add(
                  const CustomerCheckoutEventSubmit(),
                );
              },
              icon: const Icon(Icons.check_circle_outline_rounded, size: 18),
              label: const Text(
                'Buat Pesanan',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: GlobalHelper.getColorSchema(context).primary,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionCard({
    required BuildContext context,
    required IconData icon,
    required String title,
    required Widget child,
    Widget? trailing,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: GlobalHelper.getColorSchema(context).surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: GlobalHelper.getColorSchema(context).outlineVariant,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: GlobalHelper.getColorSchema(context).primary,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style:
                    GlobalHelper.getTextTheme(
                      context,
                      appTextStyle: AppTextStyle.BODY_LARGE,
                    )?.copyWith(
                      fontWeight: FontWeight.w800,
                      color: GlobalHelper.getColorSchema(context).onSurface,
                    ),
              ),
              if (trailing != null) ...[const Spacer(), trailing],
            ],
          ),
          const SizedBox(height: 14),
          child,
        ],
      ),
    );
  }

  Widget _badge(BuildContext context, String text, {Color? color}) {
    final bgColor = color ?? GlobalHelper.getColorSchema(context).primary;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: bgColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        text,
        style: GlobalHelper.getTextTheme(
          context,
          appTextStyle: AppTextStyle.LABEL_SMALL,
        )?.copyWith(fontWeight: FontWeight.w700, color: bgColor),
      ),
    );
  }

  Widget _priceRow(BuildContext context, String label, String value) {
    return Row(
      children: [
        Text(
          label,
          style: GlobalHelper.getTextTheme(
            context,
            appTextStyle: AppTextStyle.BODY_LARGE,
          )?.copyWith(color: GlobalHelper.getColorSchema(context).outline),
        ),
        const Spacer(),
        Text(
          value,
          style: GlobalHelper.getTextTheme(
            context,
            appTextStyle: AppTextStyle.BODY_LARGE,
          )?.copyWith(color: GlobalHelper.getColorSchema(context).onSurface),
        ),
      ],
    );
  }

  void _onPressPromotion(BuildContext context) async {
    final state = context.read<CustomerCheckoutBloc>().state;

    final param = CustomerOrderGetPromotionParam(
      cartIds: state.items.map((e) => e.id).toList(),
      addressId: state.address?.id,
      shippingKey: state.deliveryMethod?.value,
      biteshipRateKey: state.selectedExpedition,
    );
    final result = await navigatorKey.currentState?.push(
      MaterialPageRoute(
        builder: (context) => CustomerPromotionScreen(param: param),
      ),
    );

    if (result != null && context.mounted) {
      context.read<CustomerCheckoutBloc>().add(
        CustomerCheckoutEventPromoChanged(
          promo: result['promo'],
          code: result['code'],
        ),
      );
    }
  }
}
