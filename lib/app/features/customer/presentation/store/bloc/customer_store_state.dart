import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class CustomerProductItem extends Equatable {
  final String name;
  final String subtitle;
  final String price;
  final Color color;
  final IconData icon;

  const CustomerProductItem(this.name, this.subtitle, this.price, this.color, this.icon);

  @override
  List<Object?> get props => [name, subtitle, price, color, icon];
}

class CustomerStoreState extends Equatable {
  final bool isLoading;
  final String? errorMessage;
  final String storeName;
  final List<String> categories;
  final int selectedCategory;
  final List<CustomerProductItem> products;
  final int cartCount;
  final int cartTotalAmount;

  const CustomerStoreState({
    this.isLoading = false,
    this.errorMessage,
    this.storeName = '',
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

  CustomerStoreState copyWith({
    bool? isLoading,
    String? errorMessage,
    String? storeName,
    List<String>? categories,
    int? selectedCategory,
    List<CustomerProductItem>? products,
    int? cartCount,
    int? cartTotalAmount,
  }) {
    return CustomerStoreState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      storeName: storeName ?? this.storeName,
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
    storeName,
    categories,
    selectedCategory,
    products,
    cartCount,
    cartTotalAmount,
  ];
}
