abstract class CustomerMerchantEvent {}

class CustomerMerchantEventGet extends CustomerMerchantEvent {
  final String? categorySlug;
  final String? key;
  CustomerMerchantEventGet({this.categorySlug, this.key});
}
