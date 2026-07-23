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

class CustomerCategoryScreen extends StatelessWidget {
  const CustomerCategoryScreen({super.key});

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
    return SafeArea(
      child: Stack(
        children: [
          _bodyLayout(context),
          if (state.isLoading) const LoadingAppWidget(),
        ],
      ),
    );
  }

  Widget _bodyLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        _buildHeader(context),
        const SizedBox(height: 24),
        _buildSearchBar(context),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
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
        ),
        const SizedBox(height: 16),
        Expanded(child: _buildCategoryList(context)),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: GlobalHelper.getColorSchema(context).primary,
                width: 2,
              ),
              image: const DecorationImage(
                image: AssetImage('assets/images/app_icon.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Text(
            'WARUNK',
            style:
                GlobalHelper.getTextTheme(
                  context,
                  appTextStyle: AppTextStyle.HEADLINE_MEDIUM,
                )?.copyWith(
                  color: GlobalHelper.getColorSchema(context).primary,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.2,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          color: GlobalHelper.getColorSchema(context).surfaceContainerHighest,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: GlobalHelper.getColorSchema(context).outlineVariant,
          ),
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
            hintText: 'Cari kategori...',
            hintStyle:
                GlobalHelper.getTextTheme(
                  context,
                  appTextStyle: AppTextStyle.BODY_LARGE,
                )?.copyWith(
                  color: GlobalHelper.getColorSchema(context).onSurfaceVariant,
                ),
            prefixIcon: Icon(
              Icons.search,
              color: GlobalHelper.getColorSchema(context).onSurfaceVariant,
              size: 22,
            ),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(vertical: 12),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryList(BuildContext context) {
    final state = context.watch<CustomerCategoryBloc>().state;

    if (!state.isLoading && state.categories.isEmpty) {
      return RefreshIndicator(
        onRefresh: () async {
          context.read<CustomerCategoryBloc>().add(CustomerCategoryStarted());
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.5,
            alignment: Alignment.center,
            child: Text(
              'Tidak ada kategori',
              style: GlobalHelper.getTextTheme(
                context,
                appTextStyle: AppTextStyle.BODY_LARGE,
              ),
            ),
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
      return RefreshIndicator(
        onRefresh: () async {
          context.read<CustomerCategoryBloc>().add(CustomerCategoryStarted());
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.5,
            alignment: Alignment.center,
            child: Text(
              'Kategori tidak ditemukan',
              style: GlobalHelper.getTextTheme(
                context,
                appTextStyle: AppTextStyle.BODY_LARGE,
              ),
            ),
          ),
        ),
      );
    }

    final categoryColors = const [
      Color(0xFFC8E6C9), // Light Green
      Color(0xFFFFF9C4), // Light Yellow
      Color(0xFFFFE0B2), // Light Orange
      Color(0xFFDCEDC8), // Lighter Green
      Color(0xFFFFCCBC), // Light Deep Orange/Pinkish
      Color(0xFFBBDEFB), // Light Blue
    ];

    return RefreshIndicator(
      onRefresh: () async {
        context.read<CustomerCategoryBloc>().add(CustomerCategoryStarted());
      },
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: filteredCategories.length,
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
        final category = filteredCategories[index];
        final color = categoryColors[index % categoryColors.length];

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
            height: 72,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                const SizedBox(width: 24),
                _buildIcon(context, category.iconUrl),
                const SizedBox(width: 24),
                Expanded(
                  child: Text(
                    category.name,
                    style:
                        GlobalHelper.getTextTheme(
                          context,
                          appTextStyle: AppTextStyle.TITLE_MEDIUM,
                        )?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF2C3E50),
                        ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
  }

  Widget _buildIcon(BuildContext context, String? iconUrl) {
    if (iconUrl != null && iconUrl.isNotEmpty) {
      return Image.network(
        iconUrl,
        width: 32,
        height: 32,
        errorBuilder: (context, error, stackTrace) =>
            const Icon(Icons.storefront, size: 32, color: Color(0xFF2C3E50)),
      );
    }
    return const Icon(Icons.storefront, size: 32, color: Color(0xFF2C3E50));
  }
}
