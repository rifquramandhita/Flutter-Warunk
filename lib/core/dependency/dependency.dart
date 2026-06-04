import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:warunk/app/features/auth/data/source/auth_api_service.dart';
import 'package:warunk/app/features/auth/domain/repository/auth_repository.dart';
import 'package:warunk/app/features/auth/domain/use_case/auth_login_use_case.dart';
import 'package:warunk/app/features/auth/domain/use_case/auth_logout_use_case.dart';
import 'package:warunk/app/features/auth/domain/use_case/auth_register_use_case.dart';
import 'package:warunk/app/features/customer/presentation/profil/bloc/customer_profil_bloc.dart';
import 'package:warunk/app/features/customer/presentation/edit_profil/bloc/customer_edit_profil_bloc.dart';
import 'package:warunk/app/features/customer/data/repository/customer_product_repository_impl.dart';
import 'package:warunk/app/features/customer/data/source/customer_product_api_service.dart';
import 'package:warunk/app/features/customer/domain/repository/customer_product_repository.dart';
import 'package:warunk/app/features/customer/domain/use_case/customer_product_get_by_merchant_use_case.dart';
import 'package:warunk/app/features/customer/presentation/address/bloc/customer_address_bloc.dart';
import 'package:warunk/app/features/customer/presentation/input_address/bloc/customer_input_address_bloc.dart';
import 'package:warunk/app/features/customer/presentation/search/bloc/customer_search_bloc.dart';
import 'package:warunk/app/features/customer/presentation/store/bloc/customer_merchant_bloc.dart';
import 'package:warunk/app/features/customer/presentation/product/bloc/customer_detail_product_bloc.dart';
import 'package:warunk/app/features/customer/domain/use_case/customer_product_get_by_id_use_case.dart';
import 'package:warunk/app/features/auth/presentation/login/bloc/auth_login_bloc.dart';
import 'package:warunk/app/features/auth/presentation/register/bloc/auth_register_bloc.dart';
import 'package:warunk/app/features/auth/presentation/logout/bloc/auth_logout_bloc.dart';
import 'package:warunk/app/features/auth/domain/use_case/auth_forgot_password_use_case.dart';
import 'package:warunk/app/features/auth/domain/use_case/auth_reset_password_use_case.dart';
import 'package:warunk/app/features/auth/presentation/reset_password/bloc/auth_reset_password_bloc.dart';
import 'package:warunk/app/features/merchant/data/repository/merchant_product_repository_impl.dart';
import 'package:warunk/app/features/merchant/data/source/merchant_merchant_api_service.dart';
import 'package:warunk/app/features/merchant/data/source/merchant_product_api_service.dart';
import 'package:warunk/app/features/merchant/domain/repository/merchant_merchant_repository.dart';
import 'package:warunk/app/features/merchant/data/repository/merchant_merchant_repository_impl.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_merchant_get_use_case.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_merchant_update_use_case.dart';
import 'package:warunk/app/features/merchant/presentation/edit_profil/bloc/merchant_edit_profil_bloc.dart';
import 'package:warunk/app/features/merchant/domain/repository/merchant_product_repository.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_product_get_by_id_use_case.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_product_send_use_case.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_products_get_use_case.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_product_get_category_use_case.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_product_download_images_use_case.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_product_publish_usecase.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_product_unpublish_usecase.dart';
import 'package:warunk/app/features/merchant/presentation/input_product/bloc/merchant_input_product_bloc.dart';
import 'package:warunk/app/features/merchant/presentation/product/bloc/merchant_product_bloc.dart';
import 'package:warunk/app/features/merchant/presentation/ship_order/bloc/merchant_ship_order_bloc.dart';
import 'package:warunk/app/features/merchant/presentation/profil/bloc/merchant_profil_bloc.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_merchant_update_location_use_case.dart';
import 'package:warunk/app/features/merchant/presentation/input_address/bloc/merchant_input_address_bloc.dart';
import 'package:warunk/app/features/merchant/presentation/input_account/bloc/merchant_input_account_bloc.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_merchant_update_account_use_case.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_merchant_close_use_case.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_merchant_open_use_case.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_merchant_update_operational_hour_use_case.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_merchant_get_courier_use_case.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_merchant_update_shipping_use_case.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_promotion_add_use_case.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_promotion_send_use_case.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_promotion_get_by_id_use_case.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_promotion_delete_use_case.dart';
import 'package:warunk/core/bloc/auth/auth_bloc.dart';
import 'package:warunk/app/features/merchant/presentation/operational_hours/bloc/merchant_operational_hours_bloc.dart';
import 'package:warunk/app/features/merchant/presentation/shipping/bloc/merchant_shipping_bloc.dart';
import 'package:warunk/app/features/merchant/presentation/order/bloc/merchant_order_bloc.dart';
import 'package:warunk/app/features/merchant/presentation/detail_order/bloc/merchant_detail_order_bloc.dart';
import 'package:warunk/app/features/merchant/presentation/promotion/bloc/merchant_promotion_bloc.dart';
import 'package:warunk/app/features/merchant/presentation/input_promotion/bloc/merchant_input_promotion_bloc.dart';
import 'package:warunk/app/features/merchant/data/source/merchant_order_api_service.dart';
import 'package:warunk/app/features/merchant/domain/repository/merchant_order_repository.dart';
import 'package:warunk/app/features/merchant/data/repository/merchant_order_repository_impl.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_order_get_use_case.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_order_get_by_id_use_case.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_order_accept_use_case.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_order_ship_use_case.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_order_received_use_case.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_order_reject_use_case.dart';
import 'package:warunk/app/features/merchant/data/source/merchant_promotion_api_service.dart';
import 'package:warunk/app/features/merchant/domain/repository/merchant_promotion_repository.dart';
import 'package:warunk/app/features/merchant/data/repository/merchant_promotion_repository_impl.dart';
import 'package:warunk/app/features/customer/data/source/customer_profil_api_service.dart';
import 'package:warunk/app/features/customer/domain/repository/customer_profil_repository.dart';
import 'package:warunk/app/features/customer/data/repository/customer_profil_repository_impl.dart';
import 'package:warunk/app/features/customer/domain/use_case/customer_profil_update_use_case.dart';
import 'package:warunk/app/features/customer/data/source/customer_address_api_service.dart';
import 'package:warunk/app/features/customer/domain/repository/customer_address_repository.dart';
import 'package:warunk/app/features/customer/data/repository/customer_address_repository_impl.dart';
import 'package:warunk/app/features/customer/domain/use_case/customer_address_get_use_case.dart';
import 'package:warunk/app/features/customer/domain/use_case/customer_address_send_use_case.dart';
import 'package:warunk/app/features/customer/domain/use_case/customer_address_get_by_id_use_case.dart';
import 'package:warunk/app/features/customer/domain/use_case/customer_address_set_default_use_case.dart';
import 'package:warunk/app/features/customer/data/source/customer_merchant_api_service.dart';
import 'package:warunk/app/features/customer/domain/repository/customer_merchant_repository.dart';
import 'package:warunk/app/features/customer/data/repository/customer_merchant_repository_impl.dart';
import 'package:warunk/app/features/customer/domain/use_case/customer_merchant_get_use_case.dart';
import 'package:warunk/app/features/customer/domain/use_case/customer_merchant_get_by_id_use_case.dart';
import 'package:warunk/app/features/customer/data/source/customer_cart_api_service.dart';
import 'package:warunk/app/features/customer/domain/repository/customer_cart_repository.dart';
import 'package:warunk/app/features/customer/data/repository/customer_cart_repository_impl.dart';
import 'package:warunk/app/features/customer/domain/use_case/customer_cart_add_use_case.dart';
import 'package:warunk/app/features/customer/domain/use_case/customer_cart_get_use_case.dart';
import 'package:warunk/app/features/customer/presentation/cart/bloc/customer_cart_bloc.dart';
import 'package:dio/dio.dart';
import 'package:warunk/core/network/app_interceptor.dart';
import 'package:warunk/main.dart';

final sl = GetIt.instance;

Future<void> initDependency() async {
  final dio = Dio();

  dio.interceptors.add(AppInterceptor());
  if (!isProduction) {
    dio.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
      ),
    );
    dio.interceptors.add(CurlLoggerDioInterceptor());
  }

  sl.registerLazySingleton(() => dio);
  //api
  sl.registerLazySingleton(() => AuthApiService(dio));
  sl.registerLazySingleton(() => MerchantProductApiService(dio));
  sl.registerLazySingleton(() => MerchantMerchantApiService(dio));
  sl.registerLazySingleton(() => MerchantOrderApiService(dio));
  sl.registerLazySingleton(() => MerchantPromotionApiService(dio));
  sl.registerLazySingleton(() => CustomerProfilApiService(dio));
  sl.registerLazySingleton(() => CustomerAddressApiService(dio));
  sl.registerLazySingleton(() => CustomerMerchantApiService(dio));
  sl.registerLazySingleton(() => CustomerProductApiService(dio));
  sl.registerLazySingleton(() => CustomerCartApiService(dio));

  //repository
  sl.registerLazySingleton(() => AuthRepository(api: sl()));
  sl.registerLazySingleton<MerchantProductRepository>(
    () => MerchantProductRepositoryImpl(api: sl()),
  );
  sl.registerLazySingleton<MerchantMerchantRepository>(
    () => MerchantMerchantRepositoryImpl(api: sl()),
  );
  sl.registerLazySingleton<MerchantOrderRepository>(
    () => MerchantOrderRepositoryImpl(apiService: sl()),
  );
  sl.registerLazySingleton<MerchantPromotionRepository>(
    () => MerchantPromotionRepositoryImpl(apiService: sl()),
  );
  sl.registerLazySingleton<CustomerProfilRepository>(
    () => CustomerProfilRepositoryImpl(apiService: sl()),
  );
  sl.registerLazySingleton<CustomerAddressRepository>(
    () => CustomerAddressRepositoryImpl(apiService: sl()),
  );
  sl.registerLazySingleton<CustomerMerchantRepository>(
    () => CustomerMerchantRepositoryImpl(apiService: sl()),
  );
  sl.registerLazySingleton<CustomerProductRepository>(
    () => CustomerProductRepositoryImpl(apiService: sl()),
  );
  sl.registerLazySingleton<CustomerCartRepository>(
    () => CustomerCartRepositoryImpl(apiService: sl()),
  );

  //usecase
  sl.registerLazySingleton(() => AuthLoginUseCase(repository: sl()));
  sl.registerLazySingleton(() => AuthLogoutUseCase(repository: sl()));
  sl.registerLazySingleton(() => AuthRegisterUseCase(repository: sl()));
  sl.registerLazySingleton(() => AuthForgotPasswordUseCase(repository: sl()));
  sl.registerLazySingleton(() => AuthResetPasswordUseCase(repository: sl()));
  sl.registerLazySingleton(() => MerchantProductsGetUseCase(repository: sl()));
  sl.registerLazySingleton(
    () => MerchantProductGetCategoryUseCase(repository: sl()),
  );
  sl.registerLazySingleton(() => MerchantMerchantGetUseCase(repository: sl()));
  sl.registerLazySingleton(
    () => MerchantMerchantUpdateUseCase(repository: sl()),
  );
  sl.registerLazySingleton(
    () => MerchantProductGetByIdUseCase(repository: sl()),
  );
  sl.registerLazySingleton(() => MerchantProductSendUseCase(repository: sl()));
  sl.registerLazySingleton(
    () => MerchantProductDownloadImagesUseCase(repository: sl()),
  );
  sl.registerLazySingleton(
    () => MerchantProductPublishUseCase(repository: sl()),
  );
  sl.registerLazySingleton(
    () => MerchantProductUnpublishUseCase(repository: sl()),
  );
  sl.registerLazySingleton(() => MerchantMerchantUpdateLocationUseCase(sl()));
  sl.registerLazySingleton(() => MerchantMerchantUpdateAccountUseCase(sl()));
  sl.registerLazySingleton(() => MerchantMerchantOpenUseCase(sl()));
  sl.registerLazySingleton(() => MerchantMerchantCloseUseCase(sl()));
  sl.registerLazySingleton(
    () => MerchantMerchantUpdateOperationalHourUseCase(sl()),
  );
  sl.registerLazySingleton(
    () => MerchantMerchantGetCourierUseCase(repository: sl()),
  );
  sl.registerLazySingleton(
    () => MerchantMerchantUpdateShippingUseCase(repository: sl()),
  );
  sl.registerLazySingleton(() => MerchantOrderGetUseCase(sl()));
  sl.registerLazySingleton(() => MerchantOrderGetByIdUseCase(sl()));
  sl.registerLazySingleton(() => MerchantOrderAcceptUseCase(sl()));
  sl.registerLazySingleton(() => MerchantOrderShipUseCase(sl()));
  sl.registerLazySingleton(() => MerchantOrderReceivedUseCase(sl()));
  sl.registerLazySingleton(() => MerchantOrderRejectUseCase(sl()));
  sl.registerLazySingleton(() => MerchantPromotionAddUseCase(repository: sl()));
  sl.registerLazySingleton(() => MerchantPromotionSendUseCase(sl()));
  sl.registerLazySingleton(() => MerchantPromotionGetByIdUseCase(sl()));
  sl.registerLazySingleton(() => MerchantPromotionDeleteUseCase(sl()));
  sl.registerLazySingleton(() => CustomerProfilUpdateUseCase(repository: sl()));
  sl.registerLazySingleton(() => CustomerAddressGetUseCase(repository: sl()));
  sl.registerLazySingleton(() => CustomerAddressSendUseCase(repository: sl()));
  sl.registerLazySingleton(
    () => CustomerAddressGetByIdUseCase(repository: sl()),
  );
  sl.registerLazySingleton(
    () => CustomerAddressSetDefaultUseCase(repository: sl()),
  );
  sl.registerLazySingleton(() => CustomerMerchantGetUseCase(repository: sl()));
  sl.registerLazySingleton(
    () => CustomerMerchantGetByIdUseCase(repository: sl()),
  );
  sl.registerLazySingleton(
    () => CustomerProductGetByMerchantUseCase(repository: sl()),
  );
  sl.registerLazySingleton(
    () => CustomerProductGetByIdUseCase(repository: sl()),
  );
  sl.registerLazySingleton(() => CustomerCartAddUseCase(repository: sl()));
  sl.registerLazySingleton(() => CustomerCartGetUseCase(repository: sl()));

  //bloc
  sl.registerLazySingleton(() => AuthBloc());
  sl.registerFactory(() => AuthLoginBloc(authBloc: sl(), useCase: sl()));
  sl.registerFactory(() => AuthRegisterBloc(useCase: sl()));
  sl.registerFactory(() => AuthResetPasswordBloc(useCase: sl()));
  sl.registerFactory(() => AuthLogoutBloc(authBloc: sl(), useCase: sl()));
  sl.registerFactory(
    () => MerchantProductBloc(
      useCase: sl(),
      publishUseCase: sl(),
      unpublishUseCase: sl(),
    ),
  );
  sl.registerFactory(
    () => MerchantInputProductBloc(
      useCase: sl(),
      sendUseCase: sl(),
      downloadImagesUseCase: sl(),
      getCategoryUseCase: sl(),
    ),
  );
  sl.registerFactory(() => CustomerCartBloc(getUseCase: sl()));
  sl.registerFactory(() => CustomerProfilBloc());
  sl.registerFactory(() => CustomerEditProfilBloc(updateUseCase: sl()));
  sl.registerFactory(
    () => CustomerAddressBloc(getUseCase: sl(), setDefaultUseCase: sl()),
  );
  sl.registerFactory(() => CustomerInputAddressBloc(sl(), sl()));
  sl.registerFactory(() => CustomerSearchBloc(getMerchantUseCase: sl()));
  sl.registerFactory(
    () => CustomerMerchantBloc(
      getByIdUseCase: sl(),
      productGetByMerchantUseCase: sl(),
      cartGetUseCase: sl(),
    ),
  );
  sl.registerFactory(
    () => CustomerDetailProductBloc(useCase: sl(), addCartUseCase: sl()),
  );
  sl.registerFactory(() => MerchantProfilBloc(useCase: sl()));
  sl.registerFactory(
    () => MerchantEditProfilBloc(getUseCase: sl(), updateUseCase: sl()),
  );
  sl.registerFactory(() => MerchantInputAddressBloc(sl(), sl()));
  sl.registerFactory(() => MerchantInputAccountBloc(sl(), sl()));
  sl.registerFactory(
    () => MerchantOperationalHoursBloc(
      getUseCase: sl(),
      openUseCase: sl(),
      closeUseCase: sl(),
      updateOperationalHourUseCase: sl(),
    ),
  );
  sl.registerFactory(
    () => MerchantShippingBloc(
      getCourierUseCase: sl(),
      updateShippingUseCase: sl(),
      getMerchantUseCase: sl(),
    ),
  );
  sl.registerFactory(() => MerchantOrderBloc(getUseCase: sl()));
  sl.registerFactory(
    () => MerchantDetailOrderBloc(
      getByIdUseCase: sl(),
      acceptUseCase: sl(),
      rejectUseCase: sl(),
      receivedUseCase: sl(),
    ),
  );
  sl.registerFactory(
    () => MerchantPromotionBloc(useCase: sl(), deleteUseCase: sl()),
  );
  sl.registerFactory(() => MerchantInputPromotionBloc(sl(), sl(), sl()));
  sl.registerFactoryParam<MerchantShipOrderBloc, String, void>(
    (orderId, _) => MerchantShipOrderBloc(shipUseCase: sl(), orderId: orderId),
  );
}
