import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:warunk/main.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_order.dart';
import 'package:warunk/app/features/merchant/presentation/detail_order/bloc/merchant_detail_order_bloc.dart';
import 'package:warunk/app/features/merchant/presentation/ship_order/merchant_ship_order_screen.dart';
import 'package:warunk/core/dependency/dependency.dart';
import 'package:warunk/core/helper/dialog_helper.dart';
import 'package:warunk/core/widgets/loading_app_widget.dart';
import 'package:warunk/core/helper/global_helper.dart';
import 'package:warunk/core/widgets/custom_dotted_divider.dart';
import 'package:warunk/core/helper/number_helper.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Entry point
// ─────────────────────────────────────────────────────────────────────────────
class MerchantDetailOrderScreen extends StatelessWidget {
  const MerchantDetailOrderScreen({super.key, required this.orderId});

  final String orderId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          sl<MerchantDetailOrderBloc>()
            ..add(MerchantDetailOrderEventFetchStarted(orderId)),
      child: BlocConsumer<MerchantDetailOrderBloc, MerchantDetailOrderState>(
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
            appBar: _buildAppBar(context),
            body: _bodyBuild(context),
          );
        },
      ),
    );
  }

  Widget _bodyBuild(BuildContext context) {
    final state = context.watch<MerchantDetailOrderBloc>().state;
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
    final state = context.watch<MerchantDetailOrderBloc>().state;
    final order = state.order;

    if (order == null) return const SizedBox();

    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _headerCard(context, order),
                const SizedBox(height: 16),
                _mainCard(context, order),
                const SizedBox(height: 16),
                _paymentCard(context, order),
                const SizedBox(height: 16),
                _catatanCard(context, order),
              ],
            ),
          ),
        ),
        _buildBottomActions(context, state.order!),
      ],
    );
  }

  Widget _buildBottomActions(BuildContext context, MerchantOrderEntity order) {
    if (order.status == 'waiting_payment_confirmation') {
      return _buildAcceptRejectButtons(context);
    } else if (order.status == 'processing') {
      return _buildShipButton(context, order);
    } else if (order.status == 'shipped') {
      return _buildReceiveButton(context);
    }
    return SizedBox();
  }

  Widget _buildAcceptRejectButtons(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: GlobalHelper.getColorSchema(context).surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: () => _showRejectDialog(context),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
                side: BorderSide(
                  color: GlobalHelper.getColorSchema(context).error,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Tolak',
                style:
                    GlobalHelper.getTextTheme(
                      context,
                      appTextStyle: AppTextStyle.BODY_SMALL,
                    )?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: GlobalHelper.getColorSchema(context).error,
                    ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                context.read<MerchantDetailOrderBloc>().add(
                  MerchantDetailOrderEventAccept(),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
                backgroundColor: GlobalHelper.getColorSchema(context).primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Terima',
                style:
                    GlobalHelper.getTextTheme(
                      context,
                      appTextStyle: AppTextStyle.BODY_SMALL,
                    )?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: GlobalHelper.getColorSchema(context).onPrimary,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShipButton(BuildContext context, MerchantOrderEntity order) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: GlobalHelper.getColorSchema(context).surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: () async {
          final result = await navigatorKey.currentState?.push(
            MaterialPageRoute(
              builder: (context) => MerchantShipOrderScreen(orderId: order.id),
            ),
          );
          if (result == true && context.mounted) {
            context.read<MerchantDetailOrderBloc>().add(
              MerchantDetailOrderEventFetchStarted(order.id),
            );
          }
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 14),
          backgroundColor: GlobalHelper.getColorSchema(context).primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          'Kirim Pesanan',
          style:
              GlobalHelper.getTextTheme(
                context,
                appTextStyle: AppTextStyle.BODY_SMALL,
              )?.copyWith(
                fontWeight: FontWeight.bold,
                color: GlobalHelper.getColorSchema(context).onPrimary,
              ),
        ),
      ),
    );
  }

  Widget _buildReceiveButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: GlobalHelper.getColorSchema(context).surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: () {
          context.read<MerchantDetailOrderBloc>().add(
            MerchantDetailOrderEventReceived(),
          );
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 14),
          backgroundColor: GlobalHelper.getColorSchema(context).primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          'Pesanan Diterima',
          style:
              GlobalHelper.getTextTheme(
                context,
                appTextStyle: AppTextStyle.BODY_SMALL,
              )?.copyWith(
                fontWeight: FontWeight.bold,
                color: GlobalHelper.getColorSchema(context).onPrimary,
              ),
        ),
      ),
    );
  }

  void _showRejectDialog(BuildContext context) {
    final reasonController = TextEditingController();
    DialogHelper.showBottomSheetDialog(
      context: context,
      title: 'Tolak Pesanan',
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: reasonController,
            decoration: const InputDecoration(
              hintText: 'Alasan penolakan',
              border: OutlineInputBorder(),
            ),
            maxLines: 3,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () => navigatorKey.currentState?.pop(),
                child: const Text('Batal'),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                onPressed: () {
                  final reason = reasonController.text.trim();
                  if (reason.isNotEmpty) {
                    navigatorKey.currentState?.pop();
                    context.read<MerchantDetailOrderBloc>().add(
                      MerchantDetailOrderEventReject(reason),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: GlobalHelper.getColorSchema(context).error,
                ),
                child: Text(
                  'Tolak',
                  style: TextStyle(
                    color: GlobalHelper.getColorSchema(context).onError,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(title: const Text('Detail Order'));
  }

  Widget _headerCard(BuildContext context, MerchantOrderEntity order) {
    String formattedDate = '';
    if (order.createdAt != null) {
      try {
        final date = DateTime.parse(order.createdAt!).toLocal();
        formattedDate = DateFormat('dd MMM yyyy • HH:mm', 'id_ID').format(date);
      } catch (_) {
        formattedDate = order.createdAt!;
      }
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: GlobalHelper.getColorSchema(context).surface,
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
          Text(
            'Order ID',
            style:
                GlobalHelper.getTextTheme(
                  context,
                  appTextStyle: AppTextStyle.BODY_SMALL,
                )?.copyWith(
                  color: GlobalHelper.getColorSchema(context).onSurfaceVariant,
                ),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Expanded(
                child: Text(
                  order.invoiceNumber ?? order.id,
                  style:
                      GlobalHelper.getTextTheme(
                        context,
                        appTextStyle: AppTextStyle.TITLE_MEDIUM,
                      )?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: GlobalHelper.getColorSchema(context).onSurface,
                      ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF3C4), // yellow bg
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  order.statusLabel ?? order.status ?? 'Baru',
                  style:
                      GlobalHelper.getTextTheme(
                        context,
                        appTextStyle: AppTextStyle.LABEL_SMALL,
                      )?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFFF59E0B), // yellow text
                      ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            formattedDate,
            style:
                GlobalHelper.getTextTheme(
                  context,
                  appTextStyle: AppTextStyle.BODY_SMALL,
                )?.copyWith(
                  color: GlobalHelper.getColorSchema(context).onSurfaceVariant,
                ),
          ),
        ],
      ),
    );
  }

  Widget _mainCard(BuildContext context, MerchantOrderEntity order) {
    return Container(
      decoration: BoxDecoration(
        color: GlobalHelper.getColorSchema(context).surface,
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
          // Customer Section
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Customer',
                  style:
                      GlobalHelper.getTextTheme(
                        context,
                        appTextStyle: AppTextStyle.BODY_MEDIUM,
                      )?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: GlobalHelper.getColorSchema(context).onSurface,
                      ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: GlobalHelper.getColorSchema(
                          context,
                        ).primary.withValues(alpha: 0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.person_outline,
                        color: GlobalHelper.getColorSchema(context).primary,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            order.customer?.name ??
                                order.customerAddress?.recipientName ??
                                'Pelanggan',
                            style:
                                GlobalHelper.getTextTheme(
                                  context,
                                  appTextStyle: AppTextStyle.BODY_MEDIUM,
                                )?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: GlobalHelper.getColorSchema(
                                    context,
                                  ).onSurface,
                                ),
                          ),
                          Text(
                            order.customer?.phone ??
                                order.customerAddress?.phone ??
                                '-',
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
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(
            height: 1,
            color: GlobalHelper.getColorSchema(context).outlineVariant,
          ),

          // Alamat Pengiriman Section
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Alamat Pengiriman',
                  style:
                      GlobalHelper.getTextTheme(
                        context,
                        appTextStyle: AppTextStyle.BODY_MEDIUM,
                      )?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: GlobalHelper.getColorSchema(context).onSurface,
                      ),
                ),
                const SizedBox(height: 12),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: GlobalHelper.getColorSchema(
                          context,
                        ).primary.withValues(alpha: 0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.location_on_outlined,
                        color: GlobalHelper.getColorSchema(context).primary,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        order.customerAddress?.address ?? '-',
                        style:
                            GlobalHelper.getTextTheme(
                              context,
                              appTextStyle: AppTextStyle.BODY_SMALL,
                            )?.copyWith(
                              color: GlobalHelper.getColorSchema(
                                context,
                              ).onSurfaceVariant,
                              height: 1.4,
                            ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => context.read<MerchantDetailOrderBloc>().add(
                        MerchantDetailOrderEventMapsTapped(),
                      ),
                      child: Text(
                        'Lihat di Maps',
                        style:
                            GlobalHelper.getTextTheme(
                              context,
                              appTextStyle: AppTextStyle.BODY_SMALL,
                            )?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: GlobalHelper.getColorSchema(
                                context,
                              ).primary,
                            ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(
            height: 1,
            color: GlobalHelper.getColorSchema(context).outlineVariant,
          ),

          // Produk Section
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Produk',
                  style:
                      GlobalHelper.getTextTheme(
                        context,
                        appTextStyle: AppTextStyle.BODY_MEDIUM,
                      )?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: GlobalHelper.getColorSchema(context).onSurface,
                      ),
                ),
                const SizedBox(height: 12),
                ...order.items.map(
                  (item) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Row(
                      children: [
                        Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                            color: GlobalHelper.getColorSchema(
                              context,
                            ).primary.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Center(
                            child: Text('📦', style: TextStyle(fontSize: 24)),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.productName ?? '-',
                                style:
                                    GlobalHelper.getTextTheme(
                                      context,
                                      appTextStyle: AppTextStyle.BODY_SMALL,
                                    )?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: GlobalHelper.getColorSchema(
                                        context,
                                      ).onSurface,
                                    ),
                              ),
                              if (item
                                          .productVariantSnapshot
                                          ?.variantCombination !=
                                      null &&
                                  item
                                      .productVariantSnapshot!
                                      .variantCombination!
                                      .isNotEmpty)
                                Padding(
                                  padding: const EdgeInsets.only(top: 4),
                                  child: Text(
                                    item
                                        .productVariantSnapshot!
                                        .variantCombination!
                                        .entries
                                        .map((e) => '${e.key}: ${e.value}')
                                        .join(', '),
                                    style:
                                        GlobalHelper.getTextTheme(
                                          context,
                                          appTextStyle:
                                              AppTextStyle.LABEL_SMALL,
                                        )?.copyWith(
                                          color: GlobalHelper.getColorSchema(
                                            context,
                                          ).onSurfaceVariant,
                                        ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        Text(
                          '${item.quantity ?? 1}x',
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
                        const SizedBox(width: 16),
                        SizedBox(
                          width: 70,
                          child: Text(
                            NumberHelper.formatIDR((item.total ?? 0).toInt()),
                            textAlign: TextAlign.right,
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
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: CustomDottedDivider(
                    color: GlobalHelper.getColorSchema(context).outlineVariant,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Subtotal',
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
                    Text(
                      NumberHelper.formatIDR((order.subtotal ?? 0).toInt()),
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
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Ongkir (${order.shipping?.courier ?? order.shipping?.type ?? 'Toko'})',
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
                    Text(
                      NumberHelper.formatIDR((order.shippingCost ?? 0).toInt()),
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
                  ],
                ),
                if (order.serviceFee != null && order.serviceFee! > 0) ...[
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Biaya Layanan',
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
                      Text(
                        NumberHelper.formatIDR((order.serviceFee ?? 0).toInt()),
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
                    ],
                  ),
                ],
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: CustomDottedDivider(
                    color: GlobalHelper.getColorSchema(context).outlineVariant,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style:
                          GlobalHelper.getTextTheme(
                            context,
                            appTextStyle: AppTextStyle.BODY_MEDIUM,
                          )?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: GlobalHelper.getColorSchema(
                              context,
                            ).onSurface,
                          ),
                    ),
                    Text(
                      NumberHelper.formatIDR((order.total ?? 0).toInt()),
                      style:
                          GlobalHelper.getTextTheme(
                            context,
                            appTextStyle: AppTextStyle.TITLE_MEDIUM,
                          )?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: GlobalHelper.getColorSchema(context).primary,
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _paymentCard(BuildContext context, MerchantOrderEntity order) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: GlobalHelper.getColorSchema(context).surface,
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
          Text(
            'Pembayaran',
            style:
                GlobalHelper.getTextTheme(
                  context,
                  appTextStyle: AppTextStyle.BODY_MEDIUM,
                )?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: GlobalHelper.getColorSchema(context).onSurface,
                ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: GlobalHelper.getColorSchema(
                    context,
                  ).primary.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.account_balance_outlined,
                  color: GlobalHelper.getColorSchema(context).primary,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Metode',
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
                    Text(
                      order.merchantAccount?.bankName ?? 'Transfer Bank',
                      style:
                          GlobalHelper.getTextTheme(
                            context,
                            appTextStyle: AppTextStyle.BODY_SMALL,
                          )?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: GlobalHelper.getColorSchema(
                              context,
                            ).onSurface,
                          ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color:
                      order.paidAt != null ||
                          (order.paidAmount != null && order.paidAmount! > 0)
                      ? const Color(0xFFD1FAE5) // light green bg
                      : const Color(0xFFFEF2F2), // light red bg
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  order.paidAt != null ||
                          (order.paidAmount != null && order.paidAmount! > 0)
                      ? 'Sudah Dibayar'
                      : 'Belum Dibayar',
                  style:
                      GlobalHelper.getTextTheme(
                        context,
                        appTextStyle: AppTextStyle.LABEL_SMALL,
                      )?.copyWith(
                        fontWeight: FontWeight.w600,
                        color:
                            order.paidAt != null ||
                                (order.paidAmount != null &&
                                    order.paidAmount! > 0)
                            ? GlobalHelper.getColorSchema(context).primary
                            : GlobalHelper.getColorSchema(context).error,
                      ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _catatanCard(BuildContext context, MerchantOrderEntity order) {
    if (order.notes == null || order.notes!.isEmpty) {
      return const SizedBox.shrink();
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: GlobalHelper.getColorSchema(context).surface,
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
          Text(
            'Catatan Customer',
            style:
                GlobalHelper.getTextTheme(
                  context,
                  appTextStyle: AppTextStyle.BODY_MEDIUM,
                )?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: GlobalHelper.getColorSchema(context).onSurface,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            order.notes!,
            style:
                GlobalHelper.getTextTheme(
                  context,
                  appTextStyle: AppTextStyle.BODY_SMALL,
                )?.copyWith(
                  color: GlobalHelper.getColorSchema(context).onSurfaceVariant,
                ),
          ),
        ],
      ),
    );
  }
}
