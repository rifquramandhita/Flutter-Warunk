import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:warunk/core/enum/order_status.dart';
import 'package:warunk/main.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_order.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_order_next_action.dart';
import 'package:warunk/app/features/customer/presentation/detail_order/bloc/customer_detail_order_bloc.dart';
import 'package:warunk/app/features/customer/presentation/review_order/customer_review_order_screen.dart';
import 'package:warunk/app/features/customer/presentation/payment_proof/customer_payment_proof_screen.dart';
import 'package:warunk/app/features/customer/presentation/cancel_order/customer_cancel_order_screen.dart';
import 'package:warunk/app/features/customer/presentation/chat/customer_chat_webview_screen.dart';
import 'package:warunk/app/features/customer/presentation/cart/customer_cart_screen.dart';
import 'package:warunk/core/dependency/dependency.dart';
import 'package:warunk/core/helper/dialog_helper.dart';
import 'package:warunk/core/widgets/loading_app_widget.dart';
import 'package:warunk/core/helper/global_helper.dart';
import 'package:warunk/core/helper/number_helper.dart';
import 'package:warunk/core/widgets/primary_button.dart';
import 'package:warunk/core/enum/delivery_method.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Entry point
// ─────────────────────────────────────────────────────────────────────────────
class CustomerDetailOrderScreen extends StatelessWidget {
  const CustomerDetailOrderScreen({super.key, required this.orderId});

  final String orderId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<CustomerDetailOrderBloc>()
            ..add(CustomerDetailOrderFetchStarted(orderId)),
      child: BlocConsumer<CustomerDetailOrderBloc, CustomerDetailOrderState>(
        listener: (context, state) {
          if (state.errorMessage != null) {
            DialogHelper.showErrorSnackBar(
              context: context,
              text: state.errorMessage!,
            );
          }
          if (state.isReorderSuccess) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const CustomerCartScreen()),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: _buildAppBar(context, state),
            body: _bodyBuild(context),
          );
        },
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context, CustomerDetailOrderState state) {
    return AppBar(
      title: const Text('Detail Pesanan'),
      actions: [
        if (state.transaction?.chatUrl != null)
          IconButton(
            icon: const Icon(Icons.chat_bubble_outline_rounded),
            onPressed: () {
              final chatUrl = state.transaction!.chatUrl;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => CustomerChatWebviewScreen(chatUrl: chatUrl),
                ),
              );
            },
          ),
      ],
    );
  }

  Widget _bodyBuild(BuildContext context) {
    final state = context.watch<CustomerDetailOrderBloc>().state;
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
    final state = context.watch<CustomerDetailOrderBloc>().state;
    final order = state.transaction;

    if (order == null) return const SizedBox();

    final deliveryMethod = DeliveryMethodEnum.fromString(
      order.type ?? order.shipping?.type,
    );
    final isPickup = deliveryMethod == DeliveryMethodEnum.pickup;

    return Column(
      children: [
        Expanded(
          child: RefreshIndicator(
            onRefresh: () async {
              context.read<CustomerDetailOrderBloc>().add(
                    CustomerDetailOrderFetchStarted(orderId),
                  );
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
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
        ),
        _buildBottomActions(context, order),
      ],
    );
  }

  Widget _buildBottomActions(BuildContext context, CustomerOrderEntity order) {
    List<CustomerOrderNextActionEntity> nextActions = List.from(order.nextActions ?? []);

    if (order.status == OrderStatus.completed) {
      if (!nextActions.any((element) => element.key == 'download_invoice')) {
        nextActions.add(const CustomerOrderNextActionEntity(key: 'download_invoice', label: 'Unduh Invoice'));
      }
      if (!nextActions.any((element) => element.key == 'reorder')) {
        nextActions.add(const CustomerOrderNextActionEntity(key: 'reorder', label: 'Pesan Lagi'));
      }
    }

    if (nextActions.isEmpty) return const SizedBox();

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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: nextActions.asMap().entries.map((entry) {
              final index = entry.key;
              final action = entry.value;
              final isLast = index == nextActions.length - 1;

              return Padding(
                padding: EdgeInsets.only(bottom: isLast ? 0 : 16),
                child: _buildActionButton(context, order, action),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(
    BuildContext context,
    CustomerOrderEntity order,
    CustomerOrderNextActionEntity action,
  ) {
    final isNegativeAction = action.key?.contains('reject') == true || action.key?.contains('cancel') == true;

    if (isNegativeAction) {
      return OutlinedButton(
        onPressed: () => _handleAction(context, order, action.key),
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
          action.label ?? '-',
          textAlign: TextAlign.center,
          style: GlobalHelper.getTextTheme(
            context,
            appTextStyle: AppTextStyle.BODY_SMALL,
          )?.copyWith(
            fontWeight: FontWeight.bold,
            color: GlobalHelper.getColorSchema(context).error,
          ),
        ),
      );
    }

    return ElevatedButton(
      onPressed: () => _handleAction(context, order, action.key),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 14),
        backgroundColor: GlobalHelper.getColorSchema(context).primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        action.label ?? '-',
        textAlign: TextAlign.center,
        style: GlobalHelper.getTextTheme(
          context,
          appTextStyle: AppTextStyle.BODY_SMALL,
        )?.copyWith(
          fontWeight: FontWeight.bold,
          color: GlobalHelper.getColorSchema(context).onPrimary,
        ),
      ),
    );
  }

  void _handleAction(BuildContext context, CustomerOrderEntity order, String? key) async {
    switch (key) {
      case 'request_cancellation':
      case 'cancel_order':
        final result = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CustomerCancelOrderScreen(order: order),
          ),
        );
        if (result == true && context.mounted) {
          context.read<CustomerDetailOrderBloc>().add(
            CustomerDetailOrderFetchStarted(order.id!),
          );
        }
        break;
      case 'submit_payment_proof':
        final result = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CustomerPaymentProofScreen(order: order),
          ),
        );
        if (result == true && context.mounted) {
          context.read<CustomerDetailOrderBloc>().add(
            CustomerDetailOrderFetchStarted(order.id!),
          );
        }
        break;
      case 'mark_received':
        context.read<CustomerDetailOrderBloc>().add(
          CustomerDetailOrderMarkReceived(order.id!),
        );
        break;
      case 'complete_order':
      case 'receive_order':
      case 'review_order':
      case 'create_review':
      case 'submit_review':
      case 'add_review':
        final result = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CustomerReviewOrderScreen(order: order),
          ),
        );
        if (result == true && context.mounted) {
          context.read<CustomerDetailOrderBloc>().add(
            CustomerDetailOrderFetchStarted(order.id!),
          );
        }
        break;
      case 'track_order':
      case 'track_shipment':
      case 'track_delivery':
        context.read<CustomerDetailOrderBloc>().add(
          CustomerDetailOrderTrackOrder(),
        );
        break;
      case 'contact_merchant':
        context.read<CustomerDetailOrderBloc>().add(
          CustomerDetailOrderContactMerchant(),
        );
        break;
      case 'download_invoice':
        if (order.invoiceUrl != null && order.invoiceUrl!.isNotEmpty) {
          final url = Uri.parse(order.invoiceUrl!);
          launchUrl(url, mode: LaunchMode.externalApplication);
        } else {
          DialogHelper.showErrorSnackBar(
            context: context,
            text: 'URL Invoice tidak tersedia',
          );
        }
        break;
      case 'reorder':
        context.read<CustomerDetailOrderBloc>().add(
          CustomerDetailOrderReorder(),
        );
        break;
      default:
        break;
    }
  }

  Widget _headerCard(BuildContext context, CustomerOrderEntity order) {
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
            order.invoiceNumber ?? order.id ?? '-',
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
          _buildInfoRow(context, 'Toko', order.merchant?['name']?.toString() ?? '-'),
          const SizedBox(height: 8),
          _buildInfoRow(context, 'Nomor HP Toko', order.merchant?['phone']?.toString() ?? '-'),
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

  String _getDeliveryMethodLabel(CustomerOrderEntity order) {
    String? typeString = order.shipping?.type ?? order.type;
    if (typeString == DeliveryMethodEnum.biteship.value) {
      typeString = order.shipping?.courier;
    }
    final deliveryMethod = DeliveryMethodEnum.fromString(typeString);
    return deliveryMethod?.label ?? typeString ?? '-';
  }

  Widget _shippingCard(BuildContext context, CustomerOrderEntity order) {
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

  Widget _addressCard(BuildContext context, CustomerOrderEntity order) {
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
            address?['recipient_name']?.toString() ?? order.customer?['name']?.toString() ?? '-',
          ),
          const SizedBox(height: 12),
          _buildDetailColumn(context, 'Nomor HP', address?['phone']?.toString() ?? order.customer?['phone']?.toString() ?? '-'),
          const SizedBox(height: 12),
          _buildDetailColumn(context, 'Label Alamat', address?['label']?.toString() ?? '-'),
          const SizedBox(height: 12),
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
          const SizedBox(height: 4),
          Text(
            (address?['address']?.toString() ?? '-').isEmpty ? '-' : (address?['address']?.toString() ?? '-'),
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
          _buildDetailColumn(context, 'Catatan Alamat', address?['notes']?.toString() ?? '-'),
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

  Widget _productCard(BuildContext context, CustomerOrderEntity order) {
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
            ...(order.items ?? []).map((item) {
              final variantSnapshot = item.productVariantSnapshot;
              Map<String, dynamic>? variantCombination;
              if (variantSnapshot is Map<String, dynamic>) {
                variantCombination =
                    variantSnapshot['variant_combination']
                        as Map<String, dynamic>?;
              } else if (item.productVariantLabel != null) {
                variantCombination = {
                  'name': item.productVariantLabel,
                };
              }

              return Padding(
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
                            item.productName ?? item.product?.name ?? '-',
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
                          if (variantCombination != null &&
                              variantCombination.isNotEmpty)
                            Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: Text(
                                variantCombination.entries
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
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _paymentCard(BuildContext context, CustomerOrderEntity order) {
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
            'Metode Pembayaran',
            order.customerBank != null ? '${order.customerBank?.toUpperCase()} VA' : 'Transfer',
          ),
        ],
      ),
    );
  }

  Widget _catatanCard(BuildContext context, CustomerOrderEntity order) {
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
            'Catatan Anda',
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
