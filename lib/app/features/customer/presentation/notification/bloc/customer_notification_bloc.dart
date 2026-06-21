import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_notif_item_entity.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_notification.dart';
import 'package:warunk/app/features/customer/domain/use_case/customer_notification_get_use_case.dart';
import 'package:warunk/core/network/data_state.dart';
export 'package:warunk/app/features/customer/domain/entity/customer_notif_item_entity.dart';

part 'customer_notification_event.dart';
part 'customer_notification_state.dart';

class CustomerNotificationBloc
    extends Bloc<CustomerNotificationEvent, CustomerNotificationState> {
  final CustomerNotificationGetUseCase _getUseCase;

  CustomerNotificationBloc({required CustomerNotificationGetUseCase getUseCase})
    : _getUseCase = getUseCase,
      super(const CustomerNotificationState(items: [])) {
    on<CustomerNotificationEventLoad>(_onLoad);
  }

  Future<void> _onLoad(
    CustomerNotificationEventLoad event,
    Emitter<CustomerNotificationState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final result = await _getUseCase();

    if (result is SuccessState) {
      final notifications = result.data?.notifications ?? [];
      final items = notifications.map(_mapToUI).toList();
      emit(state.copyWith(isLoading: false, items: items));
    } else {
      emit(state.copyWith(isLoading: false, errorMessage: result.message));
    }
  }

  CustomerNotifItemEntity _mapToUI(CustomerNotificationEntity entity) {
    NotifType type = NotifType.info;
    bool hasPromoLabel = false;
    int badgeIconCode = 0xe88e; // info
    int badgeBgColor = 0xFF1976D2;
    int badgeIconColor = 0xFFFFFFFF;
    int storeColor1 = 0xFFE3F2FD;
    int storeColor2 = 0xFF90CAF9;
    String storeInitial = 'N';

    if (entity.indicator == 'user_order_status') {
      type = NotifType.transaction;
      badgeIconCode = 0xe86c; // check_circle
      badgeBgColor = 0xFF2D6A4F;
      storeColor1 = 0xFF1B5E20;
      storeColor2 = 0xFF4CAF50;
      storeInitial = 'W';
    } else if (entity.indicator == 'user_product_promotion') {
      type = NotifType.promo;
      badgeIconCode = 0xe54e; // local_offer
      badgeBgColor = 0xFFF59E0B;
      storeColor1 = 0xFFFFF9C4;
      storeColor2 = 0xFFFFF176;
      storeInitial = '%';
      hasPromoLabel = true;
    }

    return CustomerNotifItemEntity(
      id: entity.id,
      type: type,
      title: entity.title ?? '',
      body: entity.description ?? '',
      isRead: entity.isRead,
      timeLabel: _formatDate(entity.createdAt),
      hasStoreThumbnail: false,
      storeColor1: storeColor1,
      storeColor2: storeColor2,
      storeInitial: storeInitial,
      badgeIconCode: badgeIconCode,
      badgeBgColor: badgeBgColor,
      badgeIconColor: badgeIconColor,
      hasPromoLabel: hasPromoLabel,
      orderId: entity.data?['invoice_number']?.toString(),
    );
  }

  String _formatDate(String? dateStr) {
    if (dateStr == null) return '';
    try {
      final date = DateTime.parse(dateStr).toLocal();
      final now = DateTime.now();
      final diff = now.difference(date);
      if (diff.inMinutes < 1) return 'Baru saja';
      if (diff.inMinutes < 60) return '${diff.inMinutes} menit lalu';
      if (diff.inHours < 24) return '${diff.inHours} jam lalu';
      if (diff.inDays == 1) return 'Kemarin';
      return '${date.day}/${date.month}/${date.year}';
    } catch (_) {
      return '';
    }
  }
}
