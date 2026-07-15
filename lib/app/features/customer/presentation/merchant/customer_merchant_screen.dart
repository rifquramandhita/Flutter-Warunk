import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_merchant_quick_category.dart';
import 'package:warunk/app/features/customer/presentation/detail_merchant/customer_detail_merchant_screen.dart';
import 'package:warunk/core/dependency/dependency.dart';
import 'package:warunk/theme/app_colors.dart';
import 'package:warunk/main.dart';
import 'package:warunk/core/widgets/customer_merchant_item_widget.dart';

import 'bloc/customer_merchant_bloc.dart';
import 'bloc/customer_merchant_event.dart';
import 'bloc/customer_merchant_state.dart';

class CustomerMerchantScreen extends StatelessWidget {
  final CustomerMerchantQuickCategoryEntity category;

  const CustomerMerchantScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<CustomerMerchantBloc>()
            ..add(CustomerMerchantEventGet(key: category.key)),
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(title: Text('Merchant')),
        body: BlocBuilder<CustomerMerchantBloc, CustomerMerchantState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            Widget content;
            if (state.errorMessage != null) {
              content = ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: Center(
                      child: Text(
                        state.errorMessage!,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                  ),
                ],
              );
            } else if (state.merchants.isEmpty) {
              content = ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.storefront,
                            size: 64,
                            color: AppColors.greyBorder,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Belum ada warung di kategori ${category.name}',
                            style: const TextStyle(color: AppColors.greyText),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            } else {
              content = ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(20),
                itemCount: state.merchants.length,
                itemBuilder: (context, index) {
                  final merchant = state.merchants[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: CustomerMerchantItemWidget(
                      store: merchant,
                      onTap: () {
                        navigatorKey.currentState?.push(
                          MaterialPageRoute(
                            builder: (_) => CustomerDetailMerchantScreen(
                              storeId: merchant.id,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              );
            }

            return RefreshIndicator(
              onRefresh: () async {
                context.read<CustomerMerchantBloc>().add(
                  CustomerMerchantEventGet(key: category.key),
                );
              },
              child: content,
            );
          },
        ),
      ),
    );
  }
}
