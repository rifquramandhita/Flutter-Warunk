import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/merchant/presentation/dashboard/merchant_dashboard_screen.dart';
import 'package:warunk/app/features/merchant/presentation/order/merchant_order_screen.dart';
import 'package:warunk/app/features/merchant/presentation/product/merchant_product_screen.dart';
import 'package:warunk/app/features/merchant/presentation/profil/merchant_profil_screen.dart';
import 'package:warunk/app/features/merchant/presentation/promotion/merchant_promotion_screen.dart';
import 'package:warunk/app/features/merchant/presentation/shell/bloc/merchant_shell_bloc.dart';
import 'package:warunk/theme/app_colors.dart';
import 'package:warunk/app/features/merchant/presentation/chat/merchant_chat_webview_screen.dart';
import 'package:warunk/app/features/merchant/presentation/notification/merchant_notification_screen.dart';
import 'package:warunk/core/helper/global_helper.dart';
import 'package:warunk/main.dart';

/// MerchantShell mengelola bottom navigation khusus merchant
/// dan menampilkan halaman yang sesuai berdasarkan tab yang dipilih.
class MerchantShellScreen extends StatelessWidget {
  const MerchantShellScreen({super.key});

  static final List<Widget> _pages = [
    const MerchantDashboardScreen(),
    const MerchantProductScreen(),
    const MerchantOrderScreen(),
    const MerchantPromotionScreen(),
    const MerchantProfilScreen(),
  ];

  static final List<String> _titles = [
    'Dashboard',
    'Produk',
    'Pesanan',
    'Promo',
    'Toko',
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MerchantShellBloc(),
      child: BlocBuilder<MerchantShellBloc, MerchantShellState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                _titles[state.currentIndex],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              actions: [
                GestureDetector(
                  onTap: () => navigatorKey.currentState?.push(
                    MaterialPageRoute(
                      builder: (_) => const MerchantChatWebViewScreen(),
                    ),
                  ),
                  child: Icon(
                    Icons.chat_bubble_outline_rounded,
                    color: GlobalHelper.getColorSchema(context).primary,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 16),
                GestureDetector(
                  onTap: () => navigatorKey.currentState?.push(
                    MaterialPageRoute(
                      builder: (_) => const MerchantNotificationScreen(),
                    ),
                  ),
                  child: Icon(
                    Icons.notifications_outlined,
                    color: GlobalHelper.getColorSchema(context).primary,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 20),
              ],
            ),
            body: _pages[state.currentIndex],
            bottomNavigationBar: NavigationBar(
              backgroundColor: AppColors.white,
              indicatorColor: AppColors.primary.withValues(alpha: 0.15),
              selectedIndex: state.currentIndex,
              onDestinationSelected: (index) => context
                  .read<MerchantShellBloc>()
                  .add(MerchantShellEventTabChanged(index)),
              destinations: const [
                NavigationDestination(
                  icon: Icon(Icons.home_outlined),
                  selectedIcon: Icon(
                    Icons.home_rounded,
                    color: AppColors.primary,
                  ),
                  label: 'Dashboard',
                ),
                NavigationDestination(
                  icon: Icon(Icons.inventory_2_outlined),
                  selectedIcon: Icon(
                    Icons.inventory_2_rounded,
                    color: AppColors.primary,
                  ),
                  label: 'Produk',
                ),
                NavigationDestination(
                  icon: Icon(Icons.receipt_long_outlined),
                  selectedIcon: Icon(
                    Icons.receipt_long_rounded,
                    color: AppColors.primary,
                  ),
                  label: 'Pesanan',
                ),
                NavigationDestination(
                  icon: Icon(Icons.campaign_outlined),
                  selectedIcon: Icon(
                    Icons.campaign_rounded,
                    color: AppColors.primary,
                  ),
                  label: 'Promo',
                ),
                NavigationDestination(
                  icon: Icon(Icons.store_outlined),
                  selectedIcon: Icon(
                    Icons.store_rounded,
                    color: AppColors.primary,
                  ),
                  label: 'Toko',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
