import 'package:flutter_bloc/flutter_bloc.dart';

part 'merchant_shell_event.dart';
part 'merchant_shell_state.dart';

class MerchantShellBloc extends Bloc<MerchantShellEvent, MerchantShellState> {
  MerchantShellBloc() : super(const MerchantShellState()) {
    on<MerchantShellEventTabChanged>((event, emit) {
      emit(state.copyWith(currentIndex: event.index));
    });
  }
}
