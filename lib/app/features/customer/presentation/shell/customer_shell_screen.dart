import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/customer/presentation/shell/bloc/customer_shell_bloc.dart';
import 'package:warunk/app/features/customer/presentation/home/customer_home_screen.dart';
import 'package:warunk/app/features/customer/presentation/map/customer_map_screen.dart';
import 'package:warunk/app/features/customer/presentation/notification/customer_notification_screen.dart';
import 'package:warunk/app/features/customer/presentation/profil/customer_profile_screen.dart';
import 'package:warunk/app/features/customer/presentation/order/customer_order_screen.dart';
import 'package:warunk/theme/app_colors.dart';

/// CustomerShellScreen mengelola bottom navigation dan menampilkan
/// halaman yang sesuai berdasarkan tab yang dipilih.
class CustomerShellScreen extends StatelessWidget {
  const CustomerShellScreen({super.key});

  static const List<Widget> _pages = [
    CustomerHomeScreen(),
    CustomerMapScreen(),
    CustomerOrderScreen(),
    CustomerNotificationScreen(),
    CustomerProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CustomerShellBloc(),
      child: BlocBuilder<CustomerShellBloc, CustomerShellState>(
        builder: (context, state) {
          return Scaffold(
            body: IndexedStack(index: state.currentIndex, children: _pages),
            bottomNavigationBar: NavigationBar(
              selectedIndex: state.currentIndex,
              backgroundColor: AppColors.white,
              indicatorColor: AppColors.primary.withValues(alpha: 0.15),
              labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
              onDestinationSelected: (index) {
                context.read<CustomerShellBloc>().add(
                  CustomerShellTabChanged(index),
                );
              },
              destinations: const [
                NavigationDestination(
                  selectedIcon: Icon(
                    Icons.home_rounded,
                    color: AppColors.primary,
                  ),
                  icon: Icon(Icons.home_outlined),
                  label: 'Home',
                ),
                NavigationDestination(
                  selectedIcon: Icon(Icons.map, color: AppColors.primary),
                  icon: Icon(Icons.map_outlined),
                  label: 'Map',
                ),
                NavigationDestination(
                  selectedIcon: Icon(
                    Icons.receipt_long,
                    color: AppColors.primary,
                  ),
                  icon: Icon(Icons.receipt_long_outlined),
                  label: 'Transaksi',
                ),
                NavigationDestination(
                  selectedIcon: Badge(
                    label: Text('3'),
                    child: Icon(Icons.notifications, color: AppColors.primary),
                  ),
                  icon: Badge(
                    label: Text('3'),
                    child: Icon(Icons.notifications_outlined),
                  ),
                  label: 'Notifikasi',
                ),
                NavigationDestination(
                  selectedIcon: Icon(Icons.person, color: AppColors.primary),
                  icon: Icon(Icons.person_outline),
                  label: 'Profil',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
