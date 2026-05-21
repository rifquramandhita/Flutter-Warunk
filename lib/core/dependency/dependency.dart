import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';
import 'package:warunk/app/features/auth/data/source/auth_api_service.dart';
import 'package:warunk/app/features/auth/domain/repository/auth_repository.dart';
import 'package:warunk/app/features/auth/domain/use_case/auth_login_use_case.dart';
import 'package:warunk/app/features/auth/domain/use_case/auth_logout_use_case.dart';
import 'package:warunk/app/features/auth/domain/use_case/auth_register_use_case.dart';
import 'package:warunk/app/features/auth/presentation/login/bloc/auth_login_bloc.dart';
import 'package:warunk/app/features/auth/presentation/register/bloc/auth_register_bloc.dart';
import 'package:warunk/app/features/auth/presentation/logout/bloc/auth_logout_bloc.dart';
import 'package:warunk/app/features/merchant/data/repository/merchant_product_repository_impl.dart';
import 'package:warunk/app/features/merchant/data/source/merchant_product_api_service.dart';
import 'package:warunk/app/features/merchant/domain/repository/merchant_product_repository.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_product_get_by_id_use_case.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_product_send_use_case.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_products_get_use_case.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_product_download_images_use_case.dart';
import 'package:warunk/app/features/merchant/presentation/input_product/bloc/merchant_input_product_bloc.dart';
import 'package:warunk/app/features/merchant/presentation/product/bloc/merchant_product_bloc.dart';
import 'package:warunk/core/bloc/auth/auth_bloc.dart';
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

  //repository
  sl.registerLazySingleton(() => AuthRepository(api: sl()));
  sl.registerLazySingleton<MerchantProductRepository>(
    () => MerchantProductRepositoryImpl(api: sl()),
  );

  //usecase
  sl.registerLazySingleton(() => AuthLoginUseCase(repository: sl()));
  sl.registerLazySingleton(() => AuthLogoutUseCase(repository: sl()));
  sl.registerLazySingleton(() => AuthRegisterUseCase(repository: sl()));
  sl.registerLazySingleton(() => MerchantProductsGetUseCase(repository: sl()));
  sl.registerLazySingleton(
      () => MerchantProductGetByIdUseCase(repository: sl()));
  sl.registerLazySingleton(() => MerchantProductSendUseCase(repository: sl()));
  sl.registerLazySingleton(
      () => MerchantProductDownloadImagesUseCase(repository: sl()));

  //bloc
  sl.registerLazySingleton(() => AuthBloc());
  sl.registerFactory(() => AuthLoginBloc(authBloc: sl(), useCase: sl()));
  sl.registerFactory(() => AuthRegisterBloc(useCase: sl()));
  sl.registerFactory(() => AuthLogoutBloc(authBloc: sl(), useCase: sl()));
  sl.registerFactory(() => MerchantProductBloc(useCase: sl()));
  sl.registerFactory(() => MerchantInputProductBloc(
      useCase: sl(), sendUseCase: sl(), downloadImagesUseCase: sl()));
}
