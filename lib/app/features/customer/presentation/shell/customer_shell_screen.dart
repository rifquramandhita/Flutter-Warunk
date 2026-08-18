import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
import 'package:warunk/app/features/customer/presentation/category/customer_category_screen.dart';
import 'package:warunk/core/bloc/auth/auth_bloc.dart';

/// CustomerShellScreen mengelola bottom navigation dan menampilkan
/// halaman yang sesuai berdasarkan tab yang dipilih.
class CustomerShellScreen extends StatelessWidget {
  static bool ignoreNextPop = false;
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
  CustomerMerchantQuickCategoryEntity? _selectedCategory;
  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _selectedCategory = widget.selectedCategory;
    _initPages();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_selectedCategory == null) {
        _navigateToCategory();
      }
    });
  }

  void _initPages() {
    _pages = [
      CustomerHomeScreen(
        key: ValueKey(_selectedCategory?.key ?? 'all'),
        selectedCategory: _selectedCategory,
      ),
      CustomerMapScreen(),
      const CustomerOrderScreen(),
      const CustomerNotificationScreen(),
      const CustomerProfileScreen(),
    ];
  }

  Future<void> _navigateToCategory() async {
    final result = await navigatorKey.currentState?.push(
      MaterialPageRoute(builder: (_) => const CustomerCategoryScreen()),
    );
    if (result != null && result is CustomerMerchantQuickCategoryEntity) {
      setState(() {
        _selectedCategory = result;
        _initPages();
      });
    } else {
      if (_selectedCategory == null) {
        SystemNavigator.pop();
      }
    }
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
    if (CustomerShellScreen.ignoreNextPop) {
      CustomerShellScreen.ignoreNextPop = false;
      return;
    }
    
    // Beri sedikit jeda agar AuthBloc selesai memproses event logout (jika ada) sebelum mengecek statusnya.
    Future.delayed(const Duration(milliseconds: 50), () {
      if (context.mounted && context.read<AuthBloc>().state.isAuthenticated) {
        context.read<CustomerShellBloc>().add(CustomerShellLoadCartCount());
      }
    });
  }

  Widget _buildCategoryDropdown(BuildContext context) {
    return GestureDetector(
      onTap: _navigateToCategory,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: GlobalHelper.getColorSchema(context).primary.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (_selectedCategory != null && _selectedCategory!.imageUrl.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(right: 6),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Image.network(
                    _selectedCategory!.imageUrl,
                    width: 20,
                    height: 20,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Icon(
                      Icons.category,
                      size: 16,
                      color: GlobalHelper.getColorSchema(context).primary,
                    ),
                  ),
                ),
              )
            else
              Padding(
                padding: const EdgeInsets.only(right: 6),
                child: Icon(
                  Icons.category,
                  size: 16,
                  color: GlobalHelper.getColorSchema(context).primary,
                ),
              ),
            Flexible(
              child: Text(
                _selectedCategory?.name ?? 'Kategori',
                style: GlobalHelper.getTextTheme(
                  context,
                  appTextStyle: AppTextStyle.LABEL_MEDIUM,
                )?.copyWith(
                  color: GlobalHelper.getColorSchema(context).primary,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: 4),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              color: GlobalHelper.getColorSchema(context).primary,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomerShellBloc, CustomerShellState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leadingWidth: state.currentIndex == 0 ? 140 : 56,
            leading: state.currentIndex == 0
                ? Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Center(
                      child: _buildCategoryDropdown(context),
                    ),
                  )
                : null,
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
