import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/customer/presentation/shell/bloc/customer_shell_bloc.dart';
import 'package:warunk/app/features/customer/presentation/home/customer_home_screen.dart';
import 'package:warunk/app/features/customer/presentation/map/customer_map_screen.dart';
import 'package:warunk/app/features/customer/presentation/notification/customer_notification_screen.dart';
import 'package:warunk/app/features/customer/presentation/profil/customer_profile_screen.dart';
import 'package:warunk/app/features/customer/presentation/order/customer_order_screen.dart';
import 'package:warunk/theme/app_colors.dart';
import 'package:warunk/main.dart';
import 'package:warunk/app/features/customer/presentation/cart/customer_cart_screen.dart';
import 'package:warunk/app/features/customer/presentation/chat/customer_chat_webview_screen.dart';
import 'package:warunk/core/helper/global_helper.dart';
import 'package:warunk/core/dependency/dependency.dart';

import 'package:warunk/app/features/customer/domain/entity/customer_merchant_quick_category.dart';

/// CustomerShellScreen mengelola bottom navigation dan menampilkan
/// halaman yang sesuai berdasarkan tab yang dipilih.
class CustomerShellScreen extends StatelessWidget {
  final CustomerMerchantQuickCategoryEntity? selectedCategory;
  const CustomerShellScreen({super.key, this.selectedCategory});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CustomerShellBloc(cartGetUseCase: sl())..add(CustomerShellLoadCartCount()),
      child: _CustomerShellContent(selectedCategory: selectedCategory),
    );
  }
}

class _CustomerShellContent extends StatefulWidget {
  final CustomerMerchantQuickCategoryEntity? selectedCategory;
  const _CustomerShellContent({this.selectedCategory});

  @override
  State<_CustomerShellContent> createState() => _CustomerShellContentState();
}

class _CustomerShellContentState extends State<_CustomerShellContent> with RouteAware {
  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      CustomerHomeScreen(selectedCategory: widget.selectedCategory),
      CustomerMapScreen(),
      const CustomerOrderScreen(),
      const CustomerNotificationScreen(),
      const CustomerProfileScreen(),
    ];
  }

  static final List<String> _titles = [
    'Warunk',
    'Peta',
    'Transaksi',
    'Notifikasi',
    'Profil',
  ];

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
    super.dispose();
  }

  @override
  void didPopNext() {
    context.read<CustomerShellBloc>().add(CustomerShellLoadCartCount());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomerShellBloc, CustomerShellState>(
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
                    builder: (_) => const CustomerChatWebviewScreen(),
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
                    builder: (_) => const CustomerCartScreen(),
                  ),
                ),
                child: Badge(
                  isLabelVisible: state.cartCount > 0,
                  label: Text('${state.cartCount}'),
                  child: Icon(
                    Icons.shopping_cart_outlined,
                    color: GlobalHelper.getColorSchema(context).primary,
                    size: 24,
                  ),
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
                .read<CustomerShellBloc>()
                .add(CustomerShellTabChanged(index)),
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
                selectedIcon: Icon(
                  Icons.notifications,
                  color: AppColors.primary,
                ),
                icon: Icon(Icons.notifications_outlined),
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
    );
  }
}
