import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_transaction_entity.dart';
export 'package:warunk/app/features/customer/domain/entity/customer_transaction_entity.dart';

part 'customer_transaction_event.dart';
part 'customer_transaction_state.dart';

// ── Sample data ────────────────────────────────────────────────────────────
final _allTransactions = <CustomerTransactionEntity>[
  const CustomerTransactionEntity(
    id: '1', storeName: 'Warung Madura Cahaya',
    storeColor1: Color(0xFF1B5E20), storeColor2: Color(0xFF4CAF50),
    itemCount: 4, total: 20000, status: TxStatus.diproses,
    dateLabel: 'Hari ini, 09:10', orderId: '#WRK-240128-018',
  ),
  const CustomerTransactionEntity(
    id: '2', storeName: 'Toko Sumber Rezeki',
    storeColor1: Color(0xFF4A148C), storeColor2: Color(0xFF7B1FA2),
    itemCount: 2, total: 35000, status: TxStatus.menungguBayar,
    dateLabel: 'Hari ini, 08:20',
  ),
  const CustomerTransactionEntity(
    id: '3', storeName: 'Warung Barokah',
    storeColor1: Color(0xFF0D47A1), storeColor2: Color(0xFF1976D2),
    itemCount: 3, total: 28500, status: TxStatus.dikirim,
    dateLabel: 'Kemarin, 19:40',
  ),
  const CustomerTransactionEntity(
    id: '4', storeName: 'Kelontong Jaya',
    storeColor1: Color(0xFFBF360C), storeColor2: Color(0xFFE64A19),
    itemCount: 5, total: 42000, status: TxStatus.selesai,
    dateLabel: '24 Jan 2026', orderId: '#WRK-240124-005',
  ),
  const CustomerTransactionEntity(
    id: '5', storeName: 'Warung Pak Haji',
    storeColor1: Color(0xFF37474F), storeColor2: Color(0xFF546E7A),
    itemCount: 1, total: 8000, status: TxStatus.dibatalkan,
    dateLabel: '23 Jan 2026', orderId: '#WRK-240123-002',
  ),
  const CustomerTransactionEntity(
    id: '6', storeName: 'Toko Bu Minah',
    storeColor1: Color(0xFF1A237E), storeColor2: Color(0xFF283593),
    itemCount: 6, total: 55000, status: TxStatus.selesai,
    dateLabel: '22 Jan 2026', orderId: '#WRK-240122-011',
  ),
];

class CustomerTransactionBloc extends Bloc<CustomerTransactionEvent, CustomerTransactionState> {
  CustomerTransactionBloc() : super(const CustomerTransactionState()) {
    on<CustomerTransactionTabChanged>((e, emit) => emit(state.copyWith(selectedTab: e.tab)));
    on<CustomerTransactionDateFilterChanged>((e, emit) => emit(state.copyWith(dateFilter: e.filter)));
    on<CustomerTransactionStatusFilterChanged>((e, emit) => emit(state.copyWith(statusFilter: e.filter)));
  }
}
