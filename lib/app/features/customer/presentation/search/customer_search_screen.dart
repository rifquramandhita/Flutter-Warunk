import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/customer/presentation/search/bloc/customer_search_bloc.dart';
import 'package:warunk/app/features/customer/presentation/search/bloc/customer_search_event.dart';
import 'package:warunk/app/features/customer/presentation/search/bloc/customer_search_state.dart';
import 'package:warunk/app/features/customer/presentation/store/customer_merchant_screen.dart';
import 'package:warunk/core/dependency/dependency.dart';
import 'package:warunk/core/helper/global_helper.dart';
import 'package:warunk/core/helper/dialog_helper.dart';
import 'package:warunk/main.dart';
import 'package:warunk/core/widgets/loading_app_widget.dart';

class CustomerSearchScreen extends StatelessWidget {
  const CustomerSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<CustomerSearchBloc>()..add(CustomerSearchMerchantsFetched()),
      child: BlocConsumer<CustomerSearchBloc, CustomerSearchState>(
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
            appBar: AppBar(
              title: Text(
                'Cari Warung',
                style:
                    GlobalHelper.getTextTheme(
                      context,
                      appTextStyle: AppTextStyle.TITLE_LARGE,
                    )?.copyWith(
                      fontWeight: FontWeight.w800,
                      color: GlobalHelper.getColorSchema(context).primary,
                    ),
              ),
            ),
            backgroundColor: GlobalHelper.getColorSchema(context).surface,
            body: _bodyBuild(context),
          );
        },
      ),
    );
  }

  Widget _bodyBuild(BuildContext context) {
    final state = context.watch<CustomerSearchBloc>().state;
    return SafeArea(
      child: Stack(
        children: [
          _bodyLayout(context),
          (state.isLoading) ? const LoadingAppWidget() : const SizedBox(),
        ],
      ),
    );
  }

  Widget _bodyLayout(BuildContext context) {
    final state = context.watch<CustomerSearchBloc>().state;
    return state.showResults
        ? _results(context, state)
        : _initial(context, state);
  }

  // ── INITIAL ──────────────────────────────────────────────────────────────
  Widget _initial(BuildContext context, CustomerSearchState state) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 0),
            child: _searchBar(context, 'Cari produk, warung, atau kota'),
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.storefront_rounded,
                  size: 64,
                  color: GlobalHelper.getColorSchema(
                    context,
                  ).onSurface.withValues(alpha: 0.2),
                ),
                const SizedBox(height: 16),
                Text(
                  'Silahkan tuliskan toko yang dicari',
                  style:
                      GlobalHelper.getTextTheme(
                        context,
                        appTextStyle: AppTextStyle.BODY_LARGE,
                      )?.copyWith(
                        color: GlobalHelper.getColorSchema(
                          context,
                        ).onSurface.withValues(alpha: 0.5),
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // ── RESULTS ──────────────────────────────────────────────────────────────
  Widget _results(BuildContext context, CustomerSearchState state) {
    final stores = state.filteredMerchants;
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Row(
              children: [
                Expanded(
                  child: _searchBar(
                    context,
                    null,
                    filled: true,
                    query: state.searchQuery,
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: GlobalHelper.getColorSchema(
                      context,
                    ).primary.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.tune_rounded,
                    color: GlobalHelper.getColorSchema(context).primary,
                    size: 22,
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 10),
            child: Text(
              '${stores.length} warung ditemukan',
              style:
                  GlobalHelper.getTextTheme(
                    context,
                    appTextStyle: AppTextStyle.BODY_MEDIUM,
                  )?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: GlobalHelper.getColorSchema(context).onSurface,
                  ),
            ),
          ),
        ),

        if (!state.isLoading)
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate((_, i) {
                final merchant = stores[i];
                final name = merchant.name;
                final city = 'Unknown City';
                final rating = 4.5;
                final reviews = 100;
                final dist = 1.0;
                final badges = merchant.isOpen ? ['Buka'] : ['Tutup'];
                final photoUrl = merchant.photo;
                return GestureDetector(
                  onTap: () => navigatorKey.currentState?.push(
                    MaterialPageRoute(
                      builder: (_) =>
                          CustomerMerchantScreen(storeId: merchant.id),
                    ),
                  ),
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      color: GlobalHelper.getColorSchema(context).surface,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: GlobalHelper.getColorSchema(
                          context,
                        ).outline.withValues(alpha: 0.2),
                      ),
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.horizontal(
                            left: Radius.circular(16),
                          ),
                          child: Container(
                            width: 108,
                            height: 108,
                            color: GlobalHelper.getColorSchema(
                              context,
                            ).outline.withValues(alpha: 0.2),
                            child: photoUrl != null
                                ? Image.network(
                                    photoUrl,
                                    fit: BoxFit.cover,
                                    errorBuilder:
                                        (context, error, stackTrace) => Center(
                                          child: Text(
                                            name.isNotEmpty
                                                ? name.substring(0, 1)
                                                : '',
                                            style:
                                                GlobalHelper.getTextTheme(
                                                  context,
                                                  appTextStyle: AppTextStyle
                                                      .HEADLINE_SMALL,
                                                )?.copyWith(
                                                  color:
                                                      GlobalHelper.getColorSchema(
                                                        context,
                                                      ).onSurface,
                                                  fontWeight: FontWeight.w900,
                                                ),
                                          ),
                                        ),
                                  )
                                : Center(
                                    child: Text(
                                      name.isNotEmpty
                                          ? name.substring(0, 1)
                                          : '',
                                      style:
                                          GlobalHelper.getTextTheme(
                                            context,
                                            appTextStyle:
                                                AppTextStyle.HEADLINE_SMALL,
                                          )?.copyWith(
                                            color: GlobalHelper.getColorSchema(
                                              context,
                                            ).onSurface,
                                            fontWeight: FontWeight.w900,
                                          ),
                                    ),
                                  ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  name,
                                  style:
                                      GlobalHelper.getTextTheme(
                                        context,
                                        appTextStyle: AppTextStyle.TITLE_SMALL,
                                      )?.copyWith(
                                        fontWeight: FontWeight.w800,
                                        color: GlobalHelper.getColorSchema(
                                          context,
                                        ).primary,
                                      ),
                                ),
                                const SizedBox(height: 5),
                                Wrap(
                                  spacing: 6,
                                  children: (badges).map((b) {
                                    final isPromo = b.contains('Promo');
                                    return Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 3,
                                      ),
                                      decoration: BoxDecoration(
                                        color: isPromo
                                            ? const Color(0xFFFFF3C4)
                                            : GlobalHelper.getColorSchema(
                                                context,
                                              ).primary.withValues(alpha: 0.1),
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: Text(
                                        b,
                                        style:
                                            GlobalHelper.getTextTheme(
                                              context,
                                              appTextStyle:
                                                  AppTextStyle.LABEL_SMALL,
                                            )?.copyWith(
                                              fontWeight: FontWeight.w600,
                                              color: isPromo
                                                  ? const Color(0xFFF59E0B)
                                                  : GlobalHelper.getColorSchema(
                                                      context,
                                                    ).primary,
                                            ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                                const SizedBox(height: 6),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star_rounded,
                                      color: Color(0xFFFBBC05),
                                      size: 14,
                                    ),
                                    const SizedBox(width: 3),
                                    Text(
                                      '$rating ($reviews)',
                                      style:
                                          GlobalHelper.getTextTheme(
                                            context,
                                            appTextStyle:
                                                AppTextStyle.LABEL_SMALL,
                                          )?.copyWith(
                                            color: GlobalHelper.getColorSchema(
                                              context,
                                            ).onSurface,
                                          ),
                                    ),
                                    const SizedBox(width: 6),
                                    Container(
                                      width: 3,
                                      height: 3,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: GlobalHelper.getColorSchema(
                                          context,
                                        ).onSurface.withValues(alpha: 0.5),
                                      ),
                                    ),
                                    const SizedBox(width: 6),
                                    Icon(
                                      Icons.location_on_rounded,
                                      size: 13,
                                      color: GlobalHelper.getColorSchema(
                                        context,
                                      ).onSurface.withValues(alpha: 0.5),
                                    ),
                                    Text(
                                      '$dist km',
                                      style:
                                          GlobalHelper.getTextTheme(
                                            context,
                                            appTextStyle:
                                                AppTextStyle.LABEL_SMALL,
                                          )?.copyWith(
                                            color: GlobalHelper.getColorSchema(
                                              context,
                                            ).onSurface.withValues(alpha: 0.5),
                                          ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  city,
                                  style:
                                      GlobalHelper.getTextTheme(
                                        context,
                                        appTextStyle: AppTextStyle.LABEL_SMALL,
                                      )?.copyWith(
                                        color: GlobalHelper.getColorSchema(
                                          context,
                                        ).onSurface.withValues(alpha: 0.5),
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Icon(
                            Icons.chevron_right_rounded,
                            color: GlobalHelper.getColorSchema(
                              context,
                            ).onSurface.withValues(alpha: 0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }, childCount: stores.length),
            ),
          ),
      ],
    );
  }

  void _clearSearch(BuildContext context) {
    context.read<CustomerSearchBloc>().add(CustomerSearchQueryCleared());
  }

  // ── Shared ────────────────────────────────────────────────────────────────
  Widget _searchBar(
    BuildContext context,
    String? hint, {
    bool filled = false,
    String? query,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: GlobalHelper.getColorSchema(context).surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: GlobalHelper.getColorSchema(
            context,
          ).outline.withValues(alpha: 0.2),
        ),
      ),
      child: TextFormField(
        key: ValueKey(query ?? ''),
        initialValue: filled ? query : null,
        onFieldSubmitted: (v) {
          if (v.isNotEmpty) {
            context.read<CustomerSearchBloc>().add(
              CustomerSearchQuerySubmitted(v),
            );
          } else if (v.isEmpty && filled) {
            _clearSearch(context);
          }
        },
        style: GlobalHelper.getTextTheme(
          context,
          appTextStyle: AppTextStyle.BODY_MEDIUM,
        )?.copyWith(color: GlobalHelper.getColorSchema(context).onSurface),
        decoration: InputDecoration(
          hintText: hint ?? 'Cari warung...',
          hintStyle:
              GlobalHelper.getTextTheme(
                context,
                appTextStyle: AppTextStyle.BODY_MEDIUM,
              )?.copyWith(
                color: GlobalHelper.getColorSchema(
                  context,
                ).onSurface.withValues(alpha: 0.5),
              ),
          prefixIcon: Icon(
            Icons.search_rounded,
            color: GlobalHelper.getColorSchema(
              context,
            ).onSurface.withValues(alpha: 0.5),
            size: 22,
          ),
          suffixIcon: filled
              ? IconButton(
                  icon: Icon(
                    Icons.close_rounded,
                    color: GlobalHelper.getColorSchema(
                      context,
                    ).onSurface.withValues(alpha: 0.5),
                  ),
                  onPressed: () => _clearSearch(context),
                )
              : null,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 13,
          ),
        ),
      ),
    );
  }
}
