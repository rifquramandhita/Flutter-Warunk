import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/merchant/presentation/dashboard/merchant_dashboard_screen.dart';
import 'package:warunk/app/features/merchant/presentation/order/merchant_order_screen.dart';
import 'package:warunk/app/features/merchant/presentation/product/merchant_product_screen.dart';
import 'package:warunk/app/features/merchant/presentation/profil/merchant_profil_screen.dart';
import 'package:warunk/app/features/merchant/presentation/promotion/merchant_promo_screen.dart';
import 'package:warunk/app/features/merchant/presentation/shell/bloc/merchant_navigation_bloc.dart';
import 'package:warunk/theme/app_colors.dart';

/// MerchantShell mengelola bottom navigation khusus merchant
/// dan menampilkan halaman yang sesuai berdasarkan tab yang dipilih.
class MerchantShell extends StatelessWidget {
  const MerchantShell({super.key});

  static final List<Widget> _pages = [
    const MerchantDashboardScreen(),
    const MerchantProductScreen(),
    const MerchantOrderScreen(),
    const MerchantPromoScreen(),
    const MerchantProfilScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MerchantNavigationBloc(),
      child: BlocBuilder<MerchantNavigationBloc, MerchantNavigationState>(
        builder: (context, state) {
          return Scaffold(
            body: IndexedStack(index: state.currentIndex, children: _pages),
            bottomNavigationBar: _MerchantBottomNav(
              currentIndex: state.currentIndex,
              onTap: (index) => context.read<MerchantNavigationBloc>().add(
                MerchantNavigationTabChanged(index),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _MerchantBottomNav extends StatelessWidget {
  const _MerchantBottomNav({required this.currentIndex, required this.onTap});

  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    const items = [
      _NavItem(
        icon: Icons.home_outlined,
        activeIcon: Icons.home_rounded,
        label: 'Dashboard',
      ),
      _NavItem(
        icon: Icons.inventory_2_outlined,
        activeIcon: Icons.inventory_2_rounded,
        label: 'Produk',
      ),
      _NavItem(
        icon: Icons.receipt_long_outlined,
        activeIcon: Icons.receipt_long_rounded,
        label: 'Order',
      ),
      _NavItem(
        icon: Icons.campaign_outlined,
        activeIcon: Icons.campaign_rounded,
        label: 'Promo',
      ),
      _NavItem(
        icon: Icons.store_outlined,
        activeIcon: Icons.store_rounded,
        label: 'Toko',
      ),
    ];

    return Container(
      decoration: const BoxDecoration(
        color: AppColors.white,
        border: Border(top: BorderSide(color: AppColors.greyBorder, width: 1)),
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 64,
          child: Row(
            children: List.generate(items.length, (index) {
              final item = items[index];
              final isActive = index == currentIndex;
              return Expanded(
                child: GestureDetector(
                  onTap: () => onTap(index),
                  behavior: HitTestBehavior.opaque,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        isActive ? item.activeIcon : item.icon,
                        color: isActive
                            ? AppColors.primary
                            : AppColors.greyText,
                        size: 24,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item.label,
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: isActive
                              ? FontWeight.w600
                              : FontWeight.normal,
                          color: isActive
                              ? AppColors.primary
                              : AppColors.greyText,
                        ),
                      ),
                      const SizedBox(height: 2),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        width: isActive ? 4 : 0,
                        height: isActive ? 4 : 0,
                        decoration: const BoxDecoration(
                          color: AppColors.primary,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

class _NavItem {
  final IconData icon;
  final IconData activeIcon;
  final String label;
  const _NavItem({
    required this.icon,
    required this.activeIcon,
    required this.label,
  });
}
