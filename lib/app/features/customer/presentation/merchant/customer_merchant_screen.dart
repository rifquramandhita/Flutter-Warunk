import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_merchant_quick_category.dart';
import 'package:warunk/app/features/customer/presentation/detail_merchant/customer_detail_merchant_screen.dart';
import 'package:warunk/core/dependency/dependency.dart';
import 'package:warunk/theme/app_colors.dart';
import 'package:warunk/main.dart';

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
                return GestureDetector(
                  onTap: () {
                    navigatorKey.currentState?.push(
                      MaterialPageRoute(
                        builder: (_) =>
                            CustomerDetailMerchantScreen(storeId: merchant.id),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        // Merchant thumbnail
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: AppColors.primary.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(8),
                            image:
                                merchant.photo != null &&
                                    merchant.photo!.isNotEmpty
                                ? DecorationImage(
                                    image: NetworkImage(merchant.photo!),
                                    fit: BoxFit.cover,
                                  )
                                : null,
                          ),
                          child:
                              merchant.photo == null || merchant.photo!.isEmpty
                              ? const Center(
                                  child: Icon(
                                    Icons.storefront,
                                    color: AppColors.primary,
                                  ),
                                )
                              : null,
                        ),
                        const SizedBox(width: 12),
                        // Merchant info
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                merchant.name,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textDark,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 6,
                                      vertical: 2,
                                    ),
                                    decoration: BoxDecoration(
                                      color: (merchant.isOpen)
                                          ? AppColors.primary.withValues(
                                              alpha: 0.1,
                                            )
                                          : Colors.red.withValues(alpha: 0.1),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Text(
                                      (merchant.isOpen) ? 'Buka' : 'Tutup',
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        color: (merchant.isOpen)
                                            ? AppColors.primary
                                            : Colors.red,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '${merchant.city ?? ''} ${merchant.district ?? ''}',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: AppColors.greyText,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                            ),
                          ),
                        ],
                      ),
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
