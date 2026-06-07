import 'package:warunk/app/features/customer/domain/entity/customer_address.dart';
import 'package:warunk/app/features/customer/domain/repository/customer_address_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class CustomerAddressGetDefaultUseCase {
  final CustomerAddressRepository _repository;

  CustomerAddressGetDefaultUseCase(this._repository);

  Future<DataState<CustomerAddressEntity>> call() async {
    final result = await _repository.get();

    if (result.success && result.data != null) {
      try {
        final defaultAddress =
            result.data!.firstWhere((address) => address.isDefault);
        return SuccessState(data: defaultAddress);
      } catch (e) {
        return ErrorState(message: 'Alamat utama tidak ditemukan');
      }
    }

    return ErrorState(message: result.message);
  }
}
