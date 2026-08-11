import 'package:dio/dio.dart';
import 'package:warunk/app/features/merchant/data/source/merchant_setting_api_service.dart';
import 'package:warunk/app/features/merchant/domain/repository/merchant_setting_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class MerchantSettingRepositoryImpl implements MerchantSettingRepository {
  final MerchantSettingApiService apiService;

  MerchantSettingRepositoryImpl({required this.apiService});

  @override
  Future<DataState<String>> getSetting(String key) async {
    try {
      final response = await apiService.getSetting({'key': key});
      if (response.response.statusCode == 200) {
        final data = response.data['data'];
        if (data != null && data['value'] != null) {
          return SuccessState(data: data['value'].toString());
        }
        return ErrorState(message: 'Data not found');
      } else {
        return ErrorState(
          message: response.data['message'] ?? 'Gagal mengambil pengaturan',
        );
      }
    } on DioException catch (e) {
      return ErrorState(
        message: e.response?.data?['message'] ?? 'Terjadi kesalahan pada server',
      );
    } catch (e) {
      return ErrorState(message: e.toString());
    }
  }
}
