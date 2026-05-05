import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class CustomerAddressItem extends Equatable {
  final String id;
  final String name;
  final String phone;
  final String address;
  final bool isPrimary;
  final IconData icon;

  const CustomerAddressItem({
    required this.id,
    required this.name,
    required this.phone,
    required this.address,
    this.isPrimary = false,
    required this.icon,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    phone,
    address,
    isPrimary,
    icon,
  ];
}

class CustomerAddressState extends Equatable {
  final bool isLoading;
  final String? errorMessage;
  final List<CustomerAddressItem> addresses;
  final String? selectedAddressId;

  const CustomerAddressState({
    this.isLoading = false,
    this.errorMessage,
    this.addresses = const [],
    this.selectedAddressId,
  });

  CustomerAddressState copyWith({
    bool? isLoading,
    String? errorMessage,
    List<CustomerAddressItem>? addresses,
    String? selectedAddressId,
  }) {
    return CustomerAddressState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      addresses: addresses ?? this.addresses,
      selectedAddressId: selectedAddressId ?? this.selectedAddressId,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    errorMessage,
    addresses,
    selectedAddressId,
  ];
}
