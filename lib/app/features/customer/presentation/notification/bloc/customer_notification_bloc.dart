import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_notif_item_entity.dart';
export 'package:warunk/app/features/customer/domain/entity/customer_notif_item_entity.dart';

part 'customer_notification_event.dart';
part 'customer_notification_state.dart';

// ── Sample data ────────────────────────────────────────────────────────────
final _sampleNotifs = <CustomerNotifItemEntity>[
  const CustomerNotifItemEntity(
    id: '1', type: NotifType.transaction,
    title: 'Pesanan #WRK-240128-018 sedang dikirim',
    body: 'Warung Madura Cahaya', isRead: false, timeLabel: '5 menit lalu',
    hasStoreThumbnail: true,
    storeColor1: 0xFF1B5E20, storeColor2: 0xFF4CAF50, storeInitial: 'WMC',
    badgeIconCode: 0xe1b1, // electric_moped → use delivery_dining
    badgeBgColor: 0xFF2D6A4F, badgeIconColor: 0xFFFFFFFF,
    orderId: '#WRK-240128-018',
  ),
  const CustomerNotifItemEntity(
    id: '2', type: NotifType.transaction,
    title: 'Pesananmu sudah dikonfirmasi merchant',
    body: 'Warung Madura Cahaya', isRead: false, timeLabel: '15 menit lalu',
    hasStoreThumbnail: true,
    storeColor1: 0xFF1B5E20, storeColor2: 0xFF4CAF50, storeInitial: 'WMC',
    badgeIconCode: 0xe86c, // check_box → check_circle
    badgeBgColor: 0xFF2D6A4F, badgeIconColor: 0xFFFFFFFF,
  ),
  const CustomerNotifItemEntity(
    id: '3', type: NotifType.promo,
    title: 'Promo ongkir min. belanja 30RB',
    body: 'Yuk, belanja lebih hemat dengan promo ongkir spesial hari ini!',
    isRead: false, timeLabel: '1 jam lalu',
    hasStoreThumbnail: false,
    storeColor1: 0xFFFFF9C4, storeColor2: 0xFFFFF176, storeInitial: '%',
    badgeIconCode: 0xe54e, // local_offer → discount
    badgeBgColor: 0xFFF59E0B, badgeIconColor: 0xFFFFFFFF,
    hasPromoLabel: true,
  ),
  const CustomerNotifItemEntity(
    id: '4', type: NotifType.promo,
    title: 'Kelontong Jaya punya promo baru',
    body: 'Cek sekarang dan nikmati penawaran spesialnya!',
    isRead: true, timeLabel: '3 jam lalu',
    hasStoreThumbnail: true,
    storeColor1: 0xFFBF360C, storeColor2: 0xFFE64A19, storeInitial: 'KJ',
    badgeIconCode: 0xe0b7, // campaign/megaphone
    badgeBgColor: 0xFFF59E0B, badgeIconColor: 0xFFFFFFFF,
  ),
  const CustomerNotifItemEntity(
    id: '5', type: NotifType.transaction,
    title: 'Pembayaran berhasil diverifikasi',
    body: 'Pembayaran sebesar Rp20.000 berhasil diverifikasi.',
    isRead: true, timeLabel: 'Kemarin',
    hasStoreThumbnail: false,
    storeColor1: 0xFFE8F5E9, storeColor2: 0xFFA5D6A7, storeInitial: '✓',
    badgeIconCode: 0xe8e5, // verified → check_circle
    badgeBgColor: 0xFF2D6A4F, badgeIconColor: 0xFFFFFFFF,
  ),
  const CustomerNotifItemEntity(
    id: '6', type: NotifType.info,
    title: 'Warung Barokah sedang tutup sementara',
    body: 'Merchant akan buka kembali besok pukul 08:00.',
    isRead: true, timeLabel: 'Kemarin',
    hasStoreThumbnail: false,
    storeColor1: 0xFFE3F2FD, storeColor2: 0xFF90CAF9, storeInitial: 'B',
    badgeIconCode: 0xe59f, // storefront with X → store
    badgeBgColor: 0xFF1976D2, badgeIconColor: 0xFFFFFFFF,
  ),
];

class CustomerNotificationBloc extends Bloc<CustomerNotificationEvent, CustomerNotificationState> {
  CustomerNotificationBloc() : super(CustomerNotificationState(items: List.from(_sampleNotifs))) {
    on<CustomerNotificationTabChanged>((e, emit) =>
        emit(state.copyWith(selectedTab: e.tab)));

    on<CustomerNotificationRead>((e, emit) {
      final updated = state.items.map((n) => n.id == e.id ? n.copyWith(isRead: true) : n).toList();
      emit(state.copyWith(items: updated));
    });

    on<CustomerNotificationMarkAllRead>((e, emit) {
      final updated = state.items.map((n) => n.copyWith(isRead: true)).toList();
      emit(state.copyWith(items: updated));
    });
  }
}
