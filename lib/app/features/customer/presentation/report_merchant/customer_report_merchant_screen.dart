import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/customer/presentation/report_merchant/bloc/customer_report_merchant_bloc.dart';
import 'package:warunk/app/features/customer/presentation/report_merchant/bloc/customer_report_merchant_event.dart';
import 'package:warunk/app/features/customer/presentation/report_merchant/bloc/customer_report_merchant_state.dart';
import 'package:warunk/core/dependency/dependency.dart';
import 'package:warunk/core/helper/dialog_helper.dart';
import 'package:warunk/core/helper/global_helper.dart';
import 'package:warunk/core/widgets/primary_button.dart';
import 'package:warunk/core/widgets/loading_app_widget.dart';
import 'package:warunk/main.dart';

class CustomerReportMerchantScreen extends StatelessWidget {
  final String storeId;

  const CustomerReportMerchantScreen({super.key, required this.storeId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CustomerReportMerchantBloc>()
        ..add(CustomerReportMerchantEventGetCategories()),
      child: BlocConsumer<CustomerReportMerchantBloc, CustomerReportMerchantState>(
        listener: (context, state) {
          if (state.errorMessage != null && state.errorMessage!.isNotEmpty) {
            DialogHelper.showErrorSnackBar(
              context: context,
              text: state.errorMessage!,
            );
          }
          if (state.successMessage != null && state.successMessage!.isNotEmpty) {
            DialogHelper.showSnackBar(
              context: context,
              text: state.successMessage!,
              color: Colors.green,
            );
            // Wait for snackbar to show, then pop
            Future.delayed(const Duration(milliseconds: 1500), () {
              if (context.mounted) {
                navigatorKey.currentState?.pop();
              }
            });
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Laporkan Toko',
                style: GlobalHelper.getTextTheme(
                  context,
                  appTextStyle: AppTextStyle.TITLE_MEDIUM,
                )?.copyWith(fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
              elevation: 0,
            ),
            body: Stack(
              children: [
                _buildBody(context, state),
                if (state.isLoading) const LoadingAppWidget(),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildBody(BuildContext context, CustomerReportMerchantState state) {
    if (state.categories.isEmpty && state.isLoading) {
      return const SizedBox.shrink(); // Handled by Stack Loading
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Kategori Laporan',
            style: GlobalHelper.getTextTheme(context, appTextStyle: AppTextStyle.LABEL_MEDIUM)
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          DropdownButtonFormField<String>(
            initialValue: state.selectedCategory,
            items: state.categories.map((category) {
              return DropdownMenuItem(
                value: category,
                child: Text(
                  category,
                  style: GlobalHelper.getTextTheme(
                    context,
                    appTextStyle: AppTextStyle.BODY_MEDIUM,
                  ),
                ),
              );
            }).toList(),
            onChanged: (value) {
              if (value != null) {
                context
                    .read<CustomerReportMerchantBloc>()
                    .add(CustomerReportMerchantEventSelectCategory(value));
              }
            },
            decoration: InputDecoration(
              hintText: 'Pilih kategori',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            ),
          ),
          if (state.selectedCategory?.toLowerCase() == 'lainnya') ...[
            const SizedBox(height: 24),
            Text(
              'Alasan',
              style: GlobalHelper.getTextTheme(context, appTextStyle: AppTextStyle.LABEL_MEDIUM)
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextFormField(
              maxLines: 5,
              onChanged: (value) {
                context
                    .read<CustomerReportMerchantBloc>()
                    .add(CustomerReportMerchantEventInputReason(value));
              },
              decoration: InputDecoration(
                hintText: 'Ceritakan masalah yang Anda alami secara detail...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                contentPadding: const EdgeInsets.all(16),
              ),
            ),
          ],
          const SizedBox(height: 48),
          PrimaryButton(
            onPressed: () {
              context
                  .read<CustomerReportMerchantBloc>()
                  .add(CustomerReportMerchantEventSubmit(merchantId: storeId));
            },
            label: 'Kirim Laporan',
          ),
        ],
      ),
    );
  }
}
