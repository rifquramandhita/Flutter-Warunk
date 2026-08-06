import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/customer/presentation/category/bloc/customer_category_bloc.dart';
import 'package:warunk/core/dependency/dependency.dart';
import 'package:warunk/core/helper/global_helper.dart';
import 'package:warunk/core/helper/dialog_helper.dart';
import 'package:warunk/main.dart';
import 'package:warunk/app/features/customer/presentation/shell/customer_shell_screen.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_merchant_quick_category.dart';
import 'package:warunk/core/widgets/loading_app_widget.dart';
import 'package:warunk/app/features/customer/presentation/cart/customer_cart_screen.dart';
import 'package:warunk/app/features/customer/presentation/chat/customer_chat_webview_screen.dart';

class CustomerCategoryScreen extends StatefulWidget {
  const CustomerCategoryScreen({super.key});

  @override
  State<CustomerCategoryScreen> createState() => _CustomerCategoryScreenState();
}

class _CustomerCategoryScreenState extends State<CustomerCategoryScreen> {
  bool isGridView = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<CustomerCategoryBloc>()..add(CustomerCategoryStarted()),
      child: BlocConsumer<CustomerCategoryBloc, CustomerCategoryState>(
        listener: (context, state) {
          if (state.errorMessage != null) {
            DialogHelper.showErrorSnackBar(
              context: context,
              text: state.errorMessage!,
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: GlobalHelper.getColorSchema(context).surface,
            body: _bodyBuild(context),
          );
        },
      ),
    );
  }

  Widget _bodyBuild(BuildContext context) {
    final state = context.watch<CustomerCategoryBloc>().state;
    return Stack(
      children: [
        _bodyLayout(context),
        if (state.isLoading) const SafeArea(child: LoadingAppWidget()),
      ],
    );
  }

  Widget _bodyLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTopSection(context),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Menu Utama',
                style:
                    GlobalHelper.getTextTheme(
                      context,
                      appTextStyle: AppTextStyle.TITLE_MEDIUM,
                    )?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: GlobalHelper.getColorSchema(context).onSurface,
                    ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    isGridView = !isGridView;
                  });
                },
                icon: Icon(
                  isGridView
                      ? Icons.view_list_rounded
                      : Icons.grid_view_rounded,
                  color: GlobalHelper.getColorSchema(context).primary,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: RefreshIndicator(
            onRefresh: () async {
              context.read<CustomerCategoryBloc>().add(CustomerCategoryStarted());
            },
            child: ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              children: [
                _buildCategoryList(context),
                _buildFooter(context),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTopSection(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/header_bg.png'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 16,
            bottom: 24,
            left: 20,
            right: 20,
          ),
          child: Column(
            children: [
              _buildHeader(context),
              const SizedBox(height: 24),
              _buildSearchBar(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final state = context.watch<CustomerCategoryBloc>().state;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 48,
              height: 48,
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/images/app_icon.jpeg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'warunk',
                  style:
                      GlobalHelper.getTextTheme(
                        context,
                        appTextStyle: AppTextStyle.HEADLINE_MEDIUM,
                      )?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        height: 1.0,
                      ),
                ),
                Text(
                  'by Watuka',
                  style: GlobalHelper.getTextTheme(
                    context,
                    appTextStyle: AppTextStyle.BODY_SMALL,
                  )?.copyWith(color: Colors.white, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            _buildIconAction(
              Icons.chat_bubble_outline_rounded,
              hasBadge: false,
              onTap: () => navigatorKey.currentState?.push(
                MaterialPageRoute(
                  builder: (_) => const CustomerChatWebviewScreen(),
                ),
              ),
            ),
            const SizedBox(width: 12),
            _buildIconAction(
              Icons.shopping_cart_outlined,
              hasBadge: state.cartCount > 0,
              badgeText: state.cartCount.toString(),
              onTap: () => navigatorKey.currentState?.push(
                MaterialPageRoute(builder: (_) => const CustomerCartScreen()),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildIconAction(
    IconData icon, {
    bool hasBadge = false,
    String? badgeText,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Badge(
          isLabelVisible: hasBadge,
          label: badgeText != null ? Text(badgeText) : null,
          child: Icon(icon, color: Colors.black87),
        ),
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        onChanged: (value) {
          context.read<CustomerCategoryBloc>().add(
            CustomerCategorySearchChanged(value),
          );
        },
        style: GlobalHelper.getTextTheme(
          context,
          appTextStyle: AppTextStyle.BODY_LARGE,
        ),
        decoration: InputDecoration(
          hintText: 'Cari warung, makanan, atau produk...',
          hintStyle: GlobalHelper.getTextTheme(
            context,
            appTextStyle: AppTextStyle.BODY_LARGE,
          )?.copyWith(color: Colors.grey.shade500),
          prefixIcon: Icon(Icons.search, color: Colors.grey.shade600, size: 22),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 12),
        ),
      ),
    );
  }

  Widget _buildCategoryList(BuildContext context) {
    final state = context.watch<CustomerCategoryBloc>().state;

    if (!state.isLoading && state.categories.isEmpty) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.5,
        alignment: Alignment.center,
        child: Text(
          'Tidak ada kategori',
          style: GlobalHelper.getTextTheme(
            context,
            appTextStyle: AppTextStyle.BODY_LARGE,
          ),
        ),
      );
    }

    final filteredCategories = state.searchQuery.isEmpty
        ? state.categories
        : state.categories
              .where(
                (c) => c.name.toLowerCase().contains(
                  state.searchQuery.toLowerCase(),
                ),
              )
              .toList();

    if (!state.isLoading && filteredCategories.isEmpty) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.5,
        alignment: Alignment.center,
        child: Text(
          'Kategori tidak ditemukan',
          style: GlobalHelper.getTextTheme(
            context,
            appTextStyle: AppTextStyle.BODY_LARGE,
          ),
        ),
      );
    }

    return isGridView
        ? GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 8.0,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.9,
            ),
            itemCount: filteredCategories.length,
            itemBuilder: (context, index) {
              return _buildCategoryCard(context, filteredCategories[index]);
            },
          )
        : ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 8.0,
            ),
            itemCount: filteredCategories.length,
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemBuilder: (context, index) {
              return _buildCategoryCard(context, filteredCategories[index]);
            },
          );
  }

  Widget _buildCategoryCard(BuildContext context, dynamic category) {
    return GestureDetector(
      onTap: () async {
        await navigatorKey.currentState?.push(
          MaterialPageRoute(
            builder: (_) => CustomerShellScreen(
              selectedCategory: CustomerMerchantQuickCategoryEntity(
                key: category.slug,
                name: category.name,
                imageUrl: category.iconUrl ?? '',
              ),
            ),
          ),
        );
        if (context.mounted) {
          context.read<CustomerCategoryBloc>().add(CustomerCategoryStarted());
        }
      },
      child: Container(
        height: isGridView ? 160 : 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.grey[200],
          image: category.slug == 'all'
              ? const DecorationImage(
                  image: AssetImage('assets/images/semua_warung_bg.png'),
                  fit: BoxFit.cover,
                )
              : (category.backgroundCardUrl != null &&
                        category.backgroundCardUrl!.isNotEmpty
                    ? DecorationImage(
                        image: NetworkImage(category.backgroundCardUrl!),
                        fit: BoxFit.cover,
                      )
                    : null),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.green.shade800.withOpacity(0.9),
                  ],
                  stops: const [0.4, 1.0],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.green.shade300,
                        width: 3,
                      ),
                    ),
                    child: _buildIcon(context, category),
                  ),
                  Text(
                    category.name,
                    style:
                        GlobalHelper.getTextTheme(
                          context,
                          appTextStyle: isGridView
                              ? AppTextStyle.TITLE_MEDIUM
                              : AppTextStyle.HEADLINE_SMALL,
                        )?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon(BuildContext context, dynamic category) {
    if (category.slug == 'all') {
      return Image.asset(
        'assets/images/semua_warung_icon.png',
        width: 32,
        height: 32,
      );
    }

    final iconUrl = category.iconUrl;
    if (iconUrl != null && iconUrl.isNotEmpty) {
      return Image.network(
        iconUrl,
        width: 32,
        height: 32,
        errorBuilder: (context, error, stackTrace) =>
            Icon(Icons.storefront, size: 32, color: Colors.green.shade700),
      );
    }
    return Icon(Icons.storefront, size: 32, color: Colors.green.shade700);
  }

  Widget _buildFooter(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: _buildFooterItem(
                  context,
                  icon: Icons.location_on,
                  iconColor: Colors.blueGrey,
                  title: 'Dekat',
                  subtitle: 'dari Lokasi Anda',
                ),
              ),
              Expanded(
                child: _buildFooterItem(
                  context,
                  icon: Icons.percent,
                  iconColor: Colors.green,
                  title: 'Harga Terbaik',
                  subtitle: 'di Sekitar Anda',
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildFooterItem(
                  context,
                  icon: Icons.shield,
                  iconColor: Colors.amber,
                  title: 'Aman & Terpercaya',
                  subtitle: 'Warung Pilihan',
                ),
              ),
              Expanded(
                child: _buildFooterItem(
                  context,
                  icon: Icons.flash_on,
                  iconColor: Colors.purple,
                  title: 'Pesan Cepat',
                  subtitle: 'Praktis & Mudah',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFooterItem(
    BuildContext context, {
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(color: iconColor, shape: BoxShape.circle),
          child: Icon(icon, color: Colors.white, size: 16),
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            ),
            Text(
              subtitle,
              style: const TextStyle(color: Colors.black54, fontSize: 10),
            ),
          ],
        ),
      ],
    );
  }
}
