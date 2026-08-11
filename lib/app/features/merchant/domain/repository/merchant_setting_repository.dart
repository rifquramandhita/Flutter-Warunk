import 'package:warunk/core/network/data_state.dart';

abstract class MerchantSettingRepository {
  Future<DataState<String>> getSetting(String key);
}
