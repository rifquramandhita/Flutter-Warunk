import 'package:warunk/core/network/data_state.dart';
import 'package:warunk/app/features/customer/domain/repository/customer_location_repository.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_location_position.dart';

class CustomerLocationGetCurrentUseCase {
  final CustomerLocationRepository _repository;

  CustomerLocationGetCurrentUseCase(this._repository);

  Future<DataState<CustomerLocationPositionEntity>> call() {
    return _repository.getCurrentPosition();
  }
}
