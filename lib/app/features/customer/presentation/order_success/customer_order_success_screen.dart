import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/customer/presentation/order_success/bloc/customer_order_success_bloc.dart';
import 'package:warunk/app/features/customer/presentation/order_success/bloc/customer_order_success_event.dart';
import 'package:warunk/app/features/customer/presentation/order_success/bloc/customer_order_success_state.dart';
import 'package:warunk/core/dependency/dependency.dart';
import 'package:warunk/core/helper/dialog_helper.dart';
import 'package:warunk/core/helper/global_helper.dart';
import 'package:warunk/core/widgets/primary_button.dart';
import 'package:warunk/core/widgets/outline_button_custom.dart';

class CustomerOrderSuccessScreen extends StatelessWidget {
  final String orderId;

  const CustomerOrderSuccessScreen({super.key, required this.orderId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CustomerOrderSuccessBloc>()
        ..add(CustomerLoadOrderSuccessData(orderId)),
      child: BlocConsumer<CustomerOrderSuccessBloc, CustomerOrderSuccessState>(
        listener: (context, state) {
          if (state.errorMessage != null) {
            DialogHelper.showErrorSnackBar(
                context: context, text: state.errorMessage!);
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: GlobalHelper.getColorSchema(context).surface,
            body: SafeArea(
              child: _bodyBuild(context),
            ),
          );
        },
      ),
    );
  }

  Widget _bodyBuild(BuildContext context) {
    final state = context.watch<CustomerOrderSuccessBloc>().state;

    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return Stack(
      children: [
        _bodyLayout(context),
      ],
    );
  }

  Widget _bodyLayout(BuildContext context) {
    final state = context.watch<CustomerOrderSuccessBloc>().state;
    final order = state.order;

    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 40),
          _successIcon(context),
          const SizedBox(height: 32),
          Text(
            'Pesanan Berhasil!',
            style: GlobalHelper.getTextTheme(
              context,
              appTextStyle: AppTextStyle.HEADLINE_SMALL,
            )?.copyWith(
              fontWeight: FontWeight.w800,
              color: GlobalHelper.getColorSchema(context).primary,
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              'Pesananmu sudah diterima merchant dan sedang diproses.',
              textAlign: TextAlign.center,
              style: GlobalHelper.getTextTheme(
                context,
                appTextStyle: AppTextStyle.BODY_LARGE,
              )?.copyWith(
                color: GlobalHelper.getColorSchema(context).onSurface.withValues(alpha: 0.5),
              ),
            ),
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Container(
              decoration: BoxDecoration(
                color: GlobalHelper.getColorSchema(context).surface,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: GlobalHelper.getColorSchema(context).outline.withValues(alpha: 0.2)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.03),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                children: [
                  _detailRow(
                    context,
                    Icons.receipt_long_rounded,
                    'No. Pesanan',
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: Text(
                            order?.invoiceNumber ?? orderId,
                            style: GlobalHelper.getTextTheme(
                              context,
                              appTextStyle: AppTextStyle.BODY_MEDIUM,
                            )?.copyWith(
                              fontWeight: FontWeight.w700,
                              color: GlobalHelper.getColorSchema(context).onSurface,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 6),
                        GestureDetector(
                          onTap: () => Clipboard.setData(
                            ClipboardData(text: order?.invoiceNumber ?? orderId),
                          ),
                          child: Icon(
                            Icons.copy_rounded,
                            size: 16,
                            color: GlobalHelper.getColorSchema(context).onSurface.withValues(alpha: 0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  _divider(context),
                  _detailRow(
                    context,
                    Icons.storefront_rounded,
                    'Merchant',
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: Text(
                            order?.merchant?['name'] ?? '-',
                            style: GlobalHelper.getTextTheme(
                              context,
                              appTextStyle: AppTextStyle.BODY_MEDIUM,
                            )?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: GlobalHelper.getColorSchema(context).onSurface,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Icon(
                          Icons.chevron_right_rounded,
                          size: 16,
                          color: GlobalHelper.getColorSchema(context).onSurface.withValues(alpha: 0.5),
                        ),
                      ],
                    ),
                  ),
                  _divider(context),
                  _detailRow(
                    context,
                    Icons.local_shipping_rounded,
                    'Estimasi antar',
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '10–20 menit',
                          style: GlobalHelper.getTextTheme(
                            context,
                            appTextStyle: AppTextStyle.BODY_MEDIUM,
                          )?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: GlobalHelper.getColorSchema(context).onSurface,
                          ),
                        ),
                        Icon(
                          Icons.chevron_right_rounded,
                          size: 16,
                          color: GlobalHelper.getColorSchema(context).onSurface.withValues(alpha: 0.5),
                        ),
                      ],
                    ),
                  ),
                  _divider(context),
                  _detailRow(
                    context,
                    Icons.local_offer_rounded,
                    'Total bayar',
                    trailing: Text(
                      'Rp${order?.total ?? 0}',
                      style: GlobalHelper.getTextTheme(
                        context,
                        appTextStyle: AppTextStyle.BODY_MEDIUM,
                      )?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: GlobalHelper.getColorSchema(context).onSurface,
                      ),
                    ),
                  ),
                  _divider(context),
                  _detailRow(
                    context,
                    Icons.payment_rounded,
                    'Metode bayar',
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: Text(
                            order?.merchantAccount?['bank_name'] ?? '-',
                            style: GlobalHelper.getTextTheme(
                              context,
                              appTextStyle: AppTextStyle.BODY_MEDIUM,
                            )?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: GlobalHelper.getColorSchema(context).onSurface,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                          decoration: BoxDecoration(
                            color: GlobalHelper.getColorSchema(context).primary,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Center(
                            child: Text(
                              order?.merchantAccount?['bank_name'] ?? 'Bank',
                              style: GlobalHelper.getTextTheme(
                                context,
                                appTextStyle: AppTextStyle.BODY_SMALL,
                              )?.copyWith(
                                color: GlobalHelper.getColorSchema(context).onPrimary,
                                fontSize: 8,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  _divider(context),
                  _detailRow(
                    context,
                    Icons.access_time_rounded,
                    'Status',
                    trailing: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                        color: GlobalHelper.getColorSchema(context).primary.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        order?.statusLabel ?? 'Menunggu',
                        style: GlobalHelper.getTextTheme(
                          context,
                          appTextStyle: AppTextStyle.BODY_SMALL,
                        )?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: GlobalHelper.getColorSchema(context).primary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 32),
          _actionButtons(context),
          const SizedBox(height: 32),
          _relatedProductsList(context),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _successIcon(BuildContext context) {
    return Container(
      width: 96,
      height: 96,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: GlobalHelper.getColorSchema(context).primary,
        boxShadow: [
          BoxShadow(
            color: GlobalHelper.getColorSchema(context).primary.withValues(alpha: 0.4),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Center(
        child: Icon(
          Icons.check_rounded,
          size: 48,
          color: GlobalHelper.getColorSchema(context).onPrimary,
        ),
      ),
    );
  }

  Widget _detailRow(BuildContext context, IconData icon, String label, {required Widget trailing}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
      child: Row(
        children: [
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: GlobalHelper.getColorSchema(context).primary.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(9),
            ),
            child: Icon(icon, color: GlobalHelper.getColorSchema(context).primary, size: 18),
          ),
          const SizedBox(width: 12),
          Text(
            label,
            style: GlobalHelper.getTextTheme(
              context,
              appTextStyle: AppTextStyle.BODY_MEDIUM,
            )?.copyWith(
              color: GlobalHelper.getColorSchema(context).onSurface.withValues(alpha: 0.5),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: trailing,
            ),
          ),
        ],
      ),
    );
  }

  Widget _divider(BuildContext context) {
    return Divider(
      height: 1,
      thickness: 1,
      color: GlobalHelper.getColorSchema(context).outline.withValues(alpha: 0.1),
      indent: 16,
      endIndent: 16,
    );
  }

  Widget _actionButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          PrimaryButton(
            label: 'Lacak Pesanan',
            icon: Icons.location_on_outlined,
            onPressed: () {},
          ),
          const SizedBox(height: 12),
          OutlineButtonCustom(
            label: 'Kembali ke Home',
            icon: Icons.home_outlined,
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _relatedProductsList(BuildContext context) {
    final state = context.watch<CustomerOrderSuccessBloc>().state;
    final order = state.order;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'Beli lagi dari ${order?.merchant?['name'] ?? '-'}',
                  style: GlobalHelper.getTextTheme(
                    context,
                    appTextStyle: AppTextStyle.BODY_LARGE,
                  )?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: GlobalHelper.getColorSchema(context).onSurface,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: () {},
                child: Row(
                  children: [
                    Text(
                      'Lihat Toko',
                      style: GlobalHelper.getTextTheme(
                        context,
                        appTextStyle: AppTextStyle.BODY_MEDIUM,
                      )?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: GlobalHelper.getColorSchema(context).primary,
                      ),
                    ),
                    const SizedBox(width: 2),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 12,
                      color: GlobalHelper.getColorSchema(context).primary,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
