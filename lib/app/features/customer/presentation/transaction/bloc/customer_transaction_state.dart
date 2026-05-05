part of 'customer_transaction_bloc.dart';

class CustomerTransactionState {
  final int selectedTab; // 0=Berlangsung, 1=Selesai, 2=Dibatalkan
  final String dateFilter;
  final String statusFilter;

  const CustomerTransactionState({
    this.selectedTab = 0,
    this.dateFilter  = 'Semua Tanggal',
    this.statusFilter = 'Semua Status',
  });

  List<CustomerTransactionEntity> get filteredTransactions {
    final tab = selectedTab;
    return _allTransactions.where((t) {
      if (tab == 0) return t.status == TxStatus.diproses || t.status == TxStatus.menungguBayar || t.status == TxStatus.dikirim;
      if (tab == 1) return t.status == TxStatus.selesai;
      if (tab == 2) return t.status == TxStatus.dibatalkan;
      return true;
    }).toList();
  }

  CustomerTransactionState copyWith({int? selectedTab, String? dateFilter, String? statusFilter}) =>
      CustomerTransactionState(
        selectedTab:   selectedTab   ?? this.selectedTab,
        dateFilter:    dateFilter    ?? this.dateFilter,
        statusFilter:  statusFilter  ?? this.statusFilter,
      );
}
