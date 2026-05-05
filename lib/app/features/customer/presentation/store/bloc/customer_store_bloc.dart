import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'customer_store_event.dart';
import 'customer_store_state.dart';

class CustomerStoreBloc extends Bloc<CustomerStoreEvent, CustomerStoreState> {
  CustomerStoreBloc() : super(const CustomerStoreState()) {
    on<CustomerLoadStoreDetails>(_onLoadStoreDetails);
    on<CustomerSelectCategory>(_onSelectCategory);
    on<CustomerAddToCart>(_onAddToCart);
  }

  void _onLoadStoreDetails(CustomerLoadStoreDetails event, Emitter<CustomerStoreState> emit) {
    emit(state.copyWith(isLoading: true, storeName: event.storeName));
    
    // Simulate API load
    const dummyProducts = [
      CustomerProductItem('Beras 5kg',      '',                    'Rp64.000', Color(0xFFF0F7EE), Icons.grain_rounded),
      CustomerProductItem('Mie Instan',     'Indomie Goreng 85g',  'Rp3.000',  Color(0xFFFFF8E1), Icons.ramen_dining_rounded),
      CustomerProductItem('Minyak Goreng',  'SunCo 2L',            'Rp28.000', Color(0xFFFFF3C4), Icons.opacity_rounded),
      CustomerProductItem('Teh Botol',      'Teh Botol Sosro 450ml','Rp4.500', Color(0xFFFFE0E0), Icons.local_drink_rounded),
      CustomerProductItem('Telur 1 kg',     'Telur Ayam Negeri',   'Rp23.000', Color(0xFFFFF8E1), Icons.egg_rounded),
      CustomerProductItem('Kopi Sachet',    'Kapal Api Special Mix','Rp1.500',  Color(0xFFEFEBE9), Icons.coffee_rounded),
    ];
    const dummyCategories = ['Semua', 'Sembako', 'Minuman', 'Snack', 'Promo'];

    emit(state.copyWith(
      isLoading: false,
      products: dummyProducts,
      categories: dummyCategories,
      cartCount: 2, // Dummy existing cart items
      cartTotalAmount: 28500, // Rp28.500
    ));
  }

  void _onSelectCategory(CustomerSelectCategory event, Emitter<CustomerStoreState> emit) {
    emit(state.copyWith(selectedCategory: event.index));
  }

  void _onAddToCart(CustomerAddToCart event, Emitter<CustomerStoreState> emit) {
    // Basic logic for parsing dummy price strings like 'Rp64.000'
    final rawPriceString = event.product.price.replaceAll('Rp', '').replaceAll('.', '');
    final price = int.tryParse(rawPriceString) ?? 0;
    
    emit(state.copyWith(
      cartCount: state.cartCount + 1,
      cartTotalAmount: state.cartTotalAmount + price,
    ));
  }
}
