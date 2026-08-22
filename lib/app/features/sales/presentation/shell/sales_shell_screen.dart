import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/sales/presentation/dashboard/sales_dashboard_screen.dart';
import 'package:warunk/app/features/sales/presentation/merchant/sales_merchant_screen.dart';
import 'package:warunk/app/features/sales/presentation/profil/sales_profil_screen.dart';
import 'package:warunk/app/features/sales/presentation/shell/bloc/sales_shell_bloc.dart';
import 'package:warunk/core/helper/global_helper.dart';
import 'package:warunk/theme/app_colors.dart';

class SalesShellScreen extends StatelessWidget {
  static bool ignoreNextPop = false;

  const SalesShellScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SalesShellBloc(),
      child: const _SalesShellContent(),
    );
  }
}

class _SalesShellContent extends StatefulWidget {
  const _SalesShellContent();

  @override
  State<_SalesShellContent> createState() => _SalesShellContentState();
}

class _SalesShellContentState extends State<_SalesShellContent> {
  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      const SalesDashboardScreen(),
      const SalesMerchantScreen(),
      const SalesProfilScreen(),
    ];
  }

  final List<String> _titles = ['Dashboard', 'Merchant', 'Profil'];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SalesShellBloc, SalesShellState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              _titles[state.currentIndex],
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          body: _pages[state.currentIndex],
          bottomNavigationBar: NavigationBar(
            backgroundColor: AppColors.white,
            indicatorColor: AppColors.primary.withValues(alpha: 0.15),
            selectedIndex: state.currentIndex,
            onDestinationSelected: (index) =>
                context.read<SalesShellBloc>().add(SalesShellTabChanged(index)),
            destinations: const [
              NavigationDestination(
                selectedIcon: Icon(Icons.dashboard, color: AppColors.primary),
                icon: Icon(Icons.dashboard_outlined),
                label: 'Dashboard',
              ),
              NavigationDestination(
                selectedIcon: Icon(Icons.storefront, color: AppColors.primary),
                icon: Icon(Icons.storefront_outlined),
                label: 'Merchant',
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
    );
  }
}
