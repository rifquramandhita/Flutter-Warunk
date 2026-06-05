import 'package:warunk/app/features/customer/domain/repository/customer_cart_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class CustomerCartDeleteUseCase {
  final CustomerCartRepository _repository;

  CustomerCartDeleteUseCase(this._repository);

  @override
  Future<DataState<dynamic>> call({required String params}) {
    return _repository.deleteCart(params);
  }
}
