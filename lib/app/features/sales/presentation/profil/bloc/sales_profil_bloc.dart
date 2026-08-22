import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import 'sales_profil_event.dart';
import 'sales_profil_state.dart';

class SalesProfilBloc extends Bloc<SalesProfilEvent, SalesProfilState> {
  SalesProfilBloc() : super(const SalesProfilState()) {
    on<SalesLoadProfilData>(_onLoadProfilData);
    on<SalesLaunchUrlEvent>(_onLaunchUrl);
  }

  Future<void> _onLoadProfilData(
    SalesLoadProfilData event,
    Emitter<SalesProfilState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    await Future.delayed(const Duration(milliseconds: 500)); // Simulate loading if needed
    emit(state.copyWith(isLoading: false));
  }

  Future<void> _onLaunchUrl(
    SalesLaunchUrlEvent event,
    Emitter<SalesProfilState> emit,
  ) async {
    final uri = Uri.parse(event.url);
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        emit(state.copyWith(errorMessage: 'Tidak dapat membuka link: ${event.url}'));
        emit(state.copyWith(errorMessage: null));
      }
    } catch (e) {
      emit(state.copyWith(errorMessage: 'Terjadi kesalahan: ${e.toString()}'));
      emit(state.copyWith(errorMessage: null));
    }
  }
}
