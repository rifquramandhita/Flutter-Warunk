enum RoleEnum {
  customer,
  merchant,
  sales;

  String get value {
    switch (this) {
      case RoleEnum.customer:
        return 'customer';
      case RoleEnum.merchant:
        return 'merchant';
      case RoleEnum.sales:
        return 'sales';
    }
  }

  static RoleEnum? fromString(String? value) {
    switch (value?.toLowerCase()) {
      case 'customer':
        return RoleEnum.customer;
      case 'merchant':
        return RoleEnum.merchant;
      case 'sales':
        return RoleEnum.sales;
      default:
        return null;
    }
  }
}
