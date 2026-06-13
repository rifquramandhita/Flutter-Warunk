import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'customer_wishlist_api_service.g.dart';

@RestApi()
abstract class CustomerWishlistApiService {
  factory CustomerWishlistApiService(Dio dio, {String baseUrl}) = _CustomerWishlistApiService;

  @POST('/api/wishlists')
  Future<HttpResponse<dynamic>> addWishlist(@Body() Map<String, dynamic> body);

  @DELETE('/api/wishlists')
  Future<HttpResponse<dynamic>> removeWishlist(@Query('product_id') String productId);
}
