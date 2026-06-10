enum RoleEnum {
  customer,
  merchant;

  String get value {
    switch (this) {
      case RoleEnum.customer:
        return 'customer';
      case RoleEnum.merchant:
        return 'merchant';
    }
  }

  static RoleEnum? fromString(String? value) {
    switch (value?.toLowerCase()) {
      case 'customer':
        return RoleEnum.customer;
      case 'merchant':
        return RoleEnum.merchant;
      default:
        return null;
    }
  }
}
