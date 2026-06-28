abstract class CustomerMerchantEvent {}

class CustomerMerchantEventGet extends CustomerMerchantEvent {
  final String? categorySlug;
  CustomerMerchantEventGet({this.categorySlug});
}
