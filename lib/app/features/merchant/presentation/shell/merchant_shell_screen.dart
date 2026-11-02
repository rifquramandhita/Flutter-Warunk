import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/merchant/presentation/dashboard/merchant_dashboard_screen.dart';
import 'package:warunk/app/features/merchant/presentation/order/merchant_order_screen.dart';
import 'package:warunk/app/features/merchant/presentation/product/merchant_product_screen.dart';
import 'package:warunk/app/features/merchant/presentation/profil/merchant_profil_screen.dart';
import 'package:warunk/app/features/merchant/presentation/promotion/merchant_promotion_screen.dart';
import 'package:warunk/app/features/merchant/presentation/shell/bloc/merchant_shell_bloc.dart';
import 'package:warunk/core/dependency/dependency.dart';
import 'package:warunk/theme/app_colors.dart';
import 'package:warunk/app/features/merchant/presentation/chat/merchant_chat_webview_screen.dart';
import 'package:warunk/app/features/merchant/presentation/notification/merchant_notification_screen.dart';
import 'package:warunk/core/helper/global_helper.dart';
import 'package:warunk/main.dart';

/// MerchantShell mengelola bottom navigation khusus merchant
/// dan menampilkan halaman yang sesuai berdasarkan tab yang dipilih.
class MerchantShellScreen extends StatefulWidget {
  const MerchantShellScreen({super.key});

  @override
  State<MerchantShellScreen> createState() => _MerchantShellScreenState();
}

class _MerchantShellScreenState extends State<MerchantShellScreen>
    with RouteAware {
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
  void initState() {
    super.initState();
    sl<MerchantShellBloc>().add(MerchantShellEventTabChanged(0));
    sl<MerchantShellBloc>().add(MerchantShellEventGetOrderCount());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final route = ModalRoute.of(context);
    if (route is PageRoute) {
      routeObserver.subscribe(this, route);
    }
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    sl<MerchantShellBloc>().add(MerchantShellEventReset());
    super.dispose();
  }

  @override
  void didPopNext() {
    sl<MerchantShellBloc>().add(MerchantShellEventGetOrderCount());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: sl<MerchantShellBloc>(),
      child: BlocBuilder<MerchantShellBloc, MerchantShellState>(
        builder: (context, state) {
          return PopScope(
            canPop: false,
            onPopInvokedWithResult: (didPop, dynamic result) async {
              if (didPop) {
                return;
              }
              if (state.currentIndex != 0) {
                context
                    .read<MerchantShellBloc>()
                    .add(MerchantShellEventTabChanged(0));
                return;
              } else {
                final shouldExit = await showDialog<bool>(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Konfirmasi'),
                    content: const Text(
                      'Apakah Anda yakin ingin keluar dari aplikasi?',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: const Text('Tidak'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(true),
                        child: const Text('Ya'),
                      ),
                    ],
                  ),
                );
                if (shouldExit == true && context.mounted) {
                  SystemNavigator.pop(); // Ini akan menutup aplikasi (Android)
                }
              }
              // Let WillPopScope handle exit confirmation for system back.
            },
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: state.currentIndex == 4
                    ? GlobalHelper.getColorSchema(context).primary
                    : null,
                title: Text(
                  _titles[state.currentIndex],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: state.currentIndex == 4
                        ? GlobalHelper.getColorSchema(context).onPrimary
                        : null,
                  ),
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
                      color: state.currentIndex == 4
                          ? GlobalHelper.getColorSchema(context).onPrimary
                          : GlobalHelper.getColorSchema(context).primary,
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
                      color: state.currentIndex == 4
                          ? GlobalHelper.getColorSchema(context).onPrimary
                          : GlobalHelper.getColorSchema(context).primary,
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
                destinations: [
                  const NavigationDestination(
                    icon: Icon(Icons.home_outlined),
                    selectedIcon: Icon(
                      Icons.home_rounded,
                      color: AppColors.primary,
                    ),
                    label: 'Dashboard',
                  ),
                  const NavigationDestination(
                    icon: Icon(Icons.inventory_2_outlined),
                    selectedIcon: Icon(
                      Icons.inventory_2_rounded,
                      color: AppColors.primary,
                    ),
                    label: 'Produk',
                  ),
                  NavigationDestination(
                    icon: Badge(
                      label: state.waitingOrderCount > 0
                          ? Text('${state.waitingOrderCount}')
                          : null,
                      isLabelVisible: state.waitingOrderCount > 0,
                      child: const Icon(Icons.receipt_long_outlined),
                    ),
                    selectedIcon: Badge(
                      label: state.waitingOrderCount > 0
                          ? Text('${state.waitingOrderCount}')
                          : null,
                      isLabelVisible: state.waitingOrderCount > 0,
                      child: const Icon(
                        Icons.receipt_long_rounded,
                        color: AppColors.primary,
                      ),
                    ),
                    label: 'Pesanan',
                  ),
                  const NavigationDestination(
                    icon: Icon(Icons.campaign_outlined),
                    selectedIcon: Icon(
                      Icons.campaign_rounded,
                      color: AppColors.primary,
                    ),
                    label: 'Promo',
                  ),
                  const NavigationDestination(
                    icon: Icon(Icons.store_outlined),
                    selectedIcon: Icon(
                      Icons.store_rounded,
                      color: AppColors.primary,
                    ),
                    label: 'Toko',
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}


