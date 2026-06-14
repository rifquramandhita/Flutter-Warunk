import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:warunk/core/enum/order_status.dart';
import 'package:warunk/main.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_order.dart';
import 'package:warunk/app/features/merchant/presentation/detail_order/bloc/merchant_detail_order_bloc.dart';
import 'package:warunk/app/features/merchant/presentation/ship_order/merchant_ship_order_screen.dart';
import 'package:warunk/app/features/merchant/presentation/reject_order/merchant_order_reject_screen.dart';
import 'package:warunk/app/features/merchant/presentation/reject_cancel_order/merchant_reject_cancel_order_screen.dart';
import 'package:warunk/app/features/merchant/presentation/accept_cancel_order/merchant_accept_cancel_order_screen.dart';
import 'package:warunk/core/dependency/dependency.dart';
import 'package:warunk/core/helper/dialog_helper.dart';
import 'package:warunk/core/widgets/loading_app_widget.dart';
import 'package:warunk/core/helper/global_helper.dart';
import 'package:warunk/core/widgets/custom_dotted_divider.dart';
import 'package:warunk/core/helper/number_helper.dart';
import 'package:warunk/core/widgets/primary_button.dart';
import 'package:warunk/core/enum/delivery_method.dart';

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

    final deliveryMethod = DeliveryMethodEnum.fromString(
      order.type ?? order.shipping?.type,
    );
    final isPickup = deliveryMethod == DeliveryMethodEnum.pickup;

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
                _productCard(context, order),
                const SizedBox(height: 16),
                _paymentCard(context, order),
                if (!isPickup) ...[
                  const SizedBox(height: 16),
                  _shippingCard(context, order),
                  const SizedBox(height: 16),
                  _addressCard(context, order),
                ],
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
    if (order.status == OrderStatus.waitingPaymentConfirmation) {
      return _buildAcceptRejectButtons(context, order);
    } else if (order.status == OrderStatus.processing) {
      return _buildShipButton(context, order);
    } else if (order.status == OrderStatus.shipped) {
      return _buildReceiveButton(context);
    } else if (order.status == OrderStatus.waitingCancel) {
      return _buildApproveRejectCancelButtons(context, order);
    }
    return SizedBox();
  }

  Widget _buildAcceptRejectButtons(
    BuildContext context,
    MerchantOrderEntity order,
  ) {
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
              onPressed: () async {
                final result = await navigatorKey.currentState?.push(
                  MaterialPageRoute(
                    builder: (context) =>
                        MerchantOrderRejectScreen(orderId: order.id!),
                  ),
                );
                if (result == true && context.mounted) {
                  context.read<MerchantDetailOrderBloc>().add(
                    MerchantDetailOrderEventFetchStarted(order.id!),
                  );
                }
              },
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
      width: double.maxFinite,
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

  Widget _buildApproveRejectCancelButtons(
    BuildContext context,
    MerchantOrderEntity order,
  ) {
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
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        MerchantRejectCancelOrderScreen(orderId: order.id!),
                  ),
                );
                if (result == true && context.mounted) {
                  context.read<MerchantDetailOrderBloc>().add(
                    MerchantDetailOrderEventFetchStarted(order.id!),
                  );
                }
              },
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
                'Tolak Pembatalan',
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
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        MerchantAcceptCancelOrderScreen(orderId: order.id!),
                  ),
                );
                if (result == true && context.mounted) {
                  context.read<MerchantDetailOrderBloc>().add(
                    MerchantDetailOrderEventFetchStarted(order.id!),
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
                'Setujui Pembatalan',
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

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(title: const Text('Detail Order'));
  }

  Widget _headerCard(BuildContext context, MerchantOrderEntity order) {
    String formattedCreatedAt = _formatDate(order.createdAt);
    String formattedPaidAt = _formatDate(order.paidAt);

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
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
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
                  order.statusLabel ?? order.status?.label ?? 'Baru',
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
            'Order ID',
            style:
                GlobalHelper.getTextTheme(
                  context,
                  appTextStyle: AppTextStyle.LABEL_SMALL,
                )?.copyWith(
                  color: GlobalHelper.getColorSchema(context).onSurfaceVariant,
                ),
          ),

          Text(
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
          const SizedBox(height: 4),
          Text(
            formattedCreatedAt,
            style:
                GlobalHelper.getTextTheme(
                  context,
                  appTextStyle: AppTextStyle.BODY_SMALL,
                )?.copyWith(
                  color: GlobalHelper.getColorSchema(context).onSurfaceVariant,
                ),
          ),
          const SizedBox(height: 16),
          Divider(
            height: 1,
            color: GlobalHelper.getColorSchema(
              context,
            ).outlineVariant.withValues(alpha: 0.5),
          ),
          const SizedBox(height: 16),
          _buildInfoRow(
            context,
            'Metode Pengiriman',
            _getDeliveryMethodLabel(order),
          ),
          const SizedBox(height: 8),
          _buildInfoRow(context, 'Customer', order.customer?.name ?? ''),
          const SizedBox(height: 8),
          _buildInfoRow(context, 'Nomor HP', order.customer?.phone ?? ''),
          const SizedBox(height: 8),
          _buildInfoRow(context, 'Dibayar', formattedPaidAt),
        ],
      ),
    );
  }

  Widget _buildInfoRow(
    BuildContext context,
    String label,
    String value, {
    bool isRed = false,
    bool isBold = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style:
              GlobalHelper.getTextTheme(
                context,
                appTextStyle: AppTextStyle.BODY_SMALL,
              )?.copyWith(
                color: GlobalHelper.getColorSchema(context).onSurfaceVariant,
              ),
        ),
        Text(
          value,
          style:
              GlobalHelper.getTextTheme(
                context,
                appTextStyle: AppTextStyle.BODY_SMALL,
              )?.copyWith(
                fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
                color: isRed
                    ? const Color(0xFFDC2626) // Red color for promo/discount
                    : GlobalHelper.getColorSchema(context).onSurface,
              ),
        ),
      ],
    );
  }

  String _formatDate(String? dateString) {
    if (dateString == null || dateString.isEmpty) return '-';
    try {
      final date = DateTime.parse(dateString).toLocal();
      return DateFormat('dd MMM yyyy • HH:mm', 'id_ID').format(date);
    } catch (_) {
      return dateString;
    }
  }

  String _getDeliveryMethodLabel(MerchantOrderEntity order) {
    final deliveryMethod = DeliveryMethodEnum.fromString(
      order.type ?? order.shipping?.type,
    );
    return deliveryMethod?.label ?? order.type ?? order.shipping?.type ?? '-';
  }

  Widget _shippingCard(BuildContext context, MerchantOrderEntity order) {
    final shipping = order.shipping;
    if (shipping == null) return const SizedBox.shrink();

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
            'Pengiriman',
            style:
                GlobalHelper.getTextTheme(
                  context,
                  appTextStyle: AppTextStyle.BODY_MEDIUM,
                )?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: GlobalHelper.getColorSchema(context).onSurface,
                ),
          ),
          const SizedBox(height: 16),
          Divider(
            height: 1,
            color: GlobalHelper.getColorSchema(
              context,
            ).outlineVariant.withValues(alpha: 0.5),
          ),
          const SizedBox(height: 16),
          _buildInfoRow(context, 'Kurir', shipping.courier ?? '-'),
          const SizedBox(height: 8),
          _buildInfoRow(context, 'Layanan', shipping.service ?? '-'),
          const SizedBox(height: 8),
          _buildInfoRow(context, 'Resi', shipping.trackingNumber ?? '-'),
          const SizedBox(height: 8),
          _buildInfoRow(
            context,
            'Order ID Biteship',
            shipping.biteshipOrderId ?? '-',
          ),
          const SizedBox(height: 8),
          _buildInfoRow(context, 'No HP Kurir', shipping.driverPhone ?? '-'),
          const SizedBox(height: 8),
          _buildInfoRow(
            context,
            'No Kendaraan',
            shipping.driverVehicleNumber ?? '-',
          ),
          const SizedBox(height: 8),
          _buildInfoRow(
            context,
            'Status Pengiriman',
            _capitalizeFirst(shipping.status ?? '-'),
          ),
          const SizedBox(height: 8),
          _buildInfoRow(context, 'Dikirim', _formatDate(shipping.shippedAt)),
          const SizedBox(height: 8),
          _buildInfoRow(context, 'Terkirim', _formatDate(shipping.deliveredAt)),
        ],
      ),
    );
  }

  String _capitalizeFirst(String text) {
    if (text.isEmpty || text == '-') return text;
    return text[0].toUpperCase() + text.substring(1);
  }

  Widget _addressCard(BuildContext context, MerchantOrderEntity order) {
    final address = order.customerAddress;

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
            'Penerima',
            style:
                GlobalHelper.getTextTheme(
                  context,
                  appTextStyle: AppTextStyle.BODY_MEDIUM,
                )?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: GlobalHelper.getColorSchema(context).onSurface,
                ),
          ),
          const SizedBox(height: 16),
          Divider(
            height: 1,
            color: GlobalHelper.getColorSchema(
              context,
            ).outlineVariant.withValues(alpha: 0.5),
          ),
          const SizedBox(height: 16),
          _buildDetailColumn(
            context,
            'Nama penerima',
            address?.recipientName ?? '-',
          ),
          const SizedBox(height: 12),
          _buildDetailColumn(context, 'Nomor HP', address?.phone ?? '-'),
          const SizedBox(height: 12),
          _buildDetailColumn(context, 'Label Alamat', address?.label ?? '-'),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Alamat',
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
              GestureDetector(
                onTap: () => context.read<MerchantDetailOrderBloc>().add(
                  MerchantDetailOrderEventMapsTapped(),
                ),
                child: Text(
                  'Lihat di Maps',
                  style:
                      GlobalHelper.getTextTheme(
                        context,
                        appTextStyle: AppTextStyle.LABEL_SMALL,
                      )?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: GlobalHelper.getColorSchema(context).primary,
                      ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            (address?.address ?? '-').isEmpty ? '-' : (address?.address ?? '-'),
            style:
                GlobalHelper.getTextTheme(
                  context,
                  appTextStyle: AppTextStyle.BODY_SMALL,
                )?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: GlobalHelper.getColorSchema(context).onSurface,
                  height: 1.4,
                ),
          ),
          const SizedBox(height: 12),
          _buildDetailColumn(context, 'Catatan Alamat', address?.notes ?? '-'),
        ],
      ),
    );
  }

  Widget _buildDetailColumn(BuildContext context, String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style:
              GlobalHelper.getTextTheme(
                context,
                appTextStyle: AppTextStyle.LABEL_SMALL,
              )?.copyWith(
                color: GlobalHelper.getColorSchema(context).onSurfaceVariant,
              ),
        ),
        const SizedBox(height: 4),
        Text(
          value.isEmpty ? '-' : value,
          style:
              GlobalHelper.getTextTheme(
                context,
                appTextStyle: AppTextStyle.BODY_SMALL,
              )?.copyWith(
                fontWeight: FontWeight.w500,
                color: GlobalHelper.getColorSchema(context).onSurface,
                height: 1.4,
              ),
        ),
      ],
    );
  }

  Widget _productCard(BuildContext context, MerchantOrderEntity order) {
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
      child: Padding(
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
                          if (item.productVariantSnapshot?.variantCombination !=
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
                                      appTextStyle: AppTextStyle.LABEL_SMALL,
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
                        NumberHelper.formatIDR(item.price ?? 0),
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
          ],
        ),
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
          const SizedBox(height: 16),
          Divider(
            height: 1,
            color: GlobalHelper.getColorSchema(
              context,
            ).outlineVariant.withValues(alpha: 0.5),
          ),
          const SizedBox(height: 16),
          _buildInfoRow(
            context,
            'Subtotal',
            NumberHelper.formatIDR(order.subtotal ?? 0),
          ),
          const SizedBox(height: 8),
          _buildInfoRow(
            context,
            'Ongkir',
            NumberHelper.formatIDR(order.shippingCost ?? 0),
          ),
          const SizedBox(height: 8),
          _buildInfoRow(
            context,
            'Biaya Layanan',
            NumberHelper.formatIDR(order.serviceFee ?? 0),
          ),
          if ((order.promotionDiscount ?? 0) > 0) ...[
            const SizedBox(height: 12),
            _buildInfoRow(
              context,
              'Diskon',
              '-${NumberHelper.formatIDR(order.promotionDiscount ?? 0)}',
              isRed: true,
            ),
          ],
          const SizedBox(height: 8),
          _buildInfoRow(
            context,
            'Total',
            NumberHelper.formatIDR(order.total ?? 0),
            isBold: true,
          ),
          const SizedBox(height: 8),
          _buildInfoRow(
            context,
            'Bank',
            order.merchantAccount?.bankName ?? '-',
          ),
          const SizedBox(height: 8),
          _buildInfoRow(
            context,
            'Nomor Rekening',
            order.merchantAccount?.accountNumber ?? '-',
          ),

          if (order.paymentProof != null && order.paymentProof!.isNotEmpty) ...[
            const SizedBox(height: 16),
            PrimaryButton(
              label: 'Unduh bukti transfer',
              onPressed: () {
                context.read<MerchantDetailOrderBloc>().add(
                  MerchantDetailOrderEventPaymentProofTapped(),
                );
              },
              height: 40,
            ),
          ],
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
