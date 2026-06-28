import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_merchant.dart';

import 'package:warunk/app/features/customer/domain/entity/customer_product.dart';

class CustomerDetailMerchantState extends Equatable {
  final bool isLoading;
  final String? errorMessage;
  final String storeId;
  final String storeName;
  final CustomerMerchantEntity? merchantDetail;
  final List<String> categories;
  final int selectedCategory;
  final List<CustomerProductEntity> products;
  final int cartCount;
  final int cartTotalAmount;

  const CustomerDetailMerchantState({
    this.isLoading = false,
    this.errorMessage,
    this.storeId = '',
    this.storeName = '',
    this.merchantDetail,
    this.categories = const [],
    this.selectedCategory = 0,
    this.products = const [],
    this.cartCount = 0,
    this.cartTotalAmount = 0,
  });

  String get formattedCartTotal {
    if (cartTotalAmount == 0) return 'Rp0';
    return 'Rp${(cartTotalAmount / 1000).toStringAsFixed(3).replaceAll('.', '.')}';
  }

  CustomerDetailMerchantState copyWith({
    bool? isLoading,
    String? errorMessage,
    String? storeId,
    String? storeName,
    CustomerMerchantEntity? merchantDetail,
    List<String>? categories,
    int? selectedCategory,
    List<CustomerProductEntity>? products,
    int? cartCount,
    int? cartTotalAmount,
  }) {
    return CustomerDetailMerchantState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      storeId: storeId ?? this.storeId,
      storeName: storeName ?? this.storeName,
      merchantDetail: merchantDetail ?? this.merchantDetail,
      categories: categories ?? this.categories,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      products: products ?? this.products,
      cartCount: cartCount ?? this.cartCount,
      cartTotalAmount: cartTotalAmount ?? this.cartTotalAmount,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    errorMessage,
    storeId,
    storeName,
    merchantDetail,
    categories,
    selectedCategory,
    products,
    cartCount,
    cartTotalAmount,
  ];
}
