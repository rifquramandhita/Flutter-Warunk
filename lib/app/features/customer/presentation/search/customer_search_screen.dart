import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/customer/presentation/search/bloc/customer_search_bloc.dart';
import 'package:warunk/app/features/customer/presentation/search/bloc/customer_search_event.dart';
import 'package:warunk/app/features/customer/presentation/search/bloc/customer_search_state.dart';
import 'package:warunk/app/features/customer/presentation/store/customer_detail_store_screen.dart';
import 'package:warunk/core/constants/app_colors.dart';

class CustomerSearchScreen extends StatelessWidget {
  const CustomerSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CustomerSearchBloc(),
      child: const _SearchView(),
    );
  }
}

class _SearchView extends StatefulWidget {
  const _SearchView();
  @override
  State<_SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<_SearchView> {
  final _ctrl = TextEditingController();

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  void _openResults(String city) {
    _ctrl.text = 'Warung $city';
    context.read<CustomerSearchBloc>().add(CustomerSearchQuerySubmitted('Warung $city'));
  }

  void _clearSearch() {
    _ctrl.clear();
    context.read<CustomerSearchBloc>().add(CustomerSearchQueryCleared());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: BlocBuilder<CustomerSearchBloc, CustomerSearchState>(
          builder: (context, state) {
            return state.showResults ? _results(state) : _initial(state);
          },
        ),
      ),
    );
  }

  // ── INITIAL ──────────────────────────────────────────────────────────────
  Widget _initial(CustomerSearchState state) => CustomScrollView(
    slivers: [
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Row(
            children: [
              _circle(
                Icons.arrow_back_rounded,
                onTap: () => Navigator.of(context).maybePop(),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Cari Warung',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: AppColors.primary,
                      ),
                    ),
                    Text(
                      'Temukan warung terdekat di kotamu',
                      style: TextStyle(fontSize: 12, color: AppColors.greyText),
                    ),
                  ],
                ),
              ),
              _circle(Icons.tune_rounded),
            ],
          ),
        ),
      ),
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 14, 16, 0),
          child: _searchBar('Cari produk, warung, atau kota'),
        ),
      ),
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 14, 16, 0),
          child: Wrap(
            spacing: 8,
            children: state.activeFilters.map(_activeChip).toList(),
          ),
        ),
      ),
      const SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, 22, 16, 12),
          child: Text(
            'Pencarian Populer',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w800,
              color: AppColors.textDark,
            ),
          ),
        ),
      ),
      SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        sliver: SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 2.4,
          ),
          delegate: SliverChildBuilderDelegate((_, i) {
            const items = [
              ('Warung Madura', Icons.storefront_outlined),
              ('Kelontong', Icons.shopping_basket_outlined),
              ('Air Mineral', Icons.water_drop_outlined),
              ('Gas LPG', Icons.local_fire_department_outlined),
              ('Telur', Icons.egg_outlined),
              ('Kopi', Icons.coffee_outlined),
            ];
            final (label, icon) = items[i];
            return GestureDetector(
              onTap: () => _openResults(label),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFD6E8FF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(icon, size: 15, color: const Color(0xFF4A90D9)),
                    const SizedBox(width: 5),
                    Flexible(
                      child: Text(
                        label,
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF4A90D9),
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }, childCount: 6),
        ),
      ),
      const SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, 24, 16, 12),
          child: Text(
            'Pilih Kota',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w800,
              color: AppColors.textDark,
            ),
          ),
        ),
      ),
      SliverPadding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
        sliver: SliverList(
          delegate: SliverChildBuilderDelegate((_, i) {
            const cities = [
              'Jakarta Timur',
              'Jakarta Selatan',
              'Bekasi',
              'Depok',
              'Tangerang',
              'Bogor',
            ];
            return GestureDetector(
              onTap: () => _openResults(cities[i]),
              child: Container(
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: AppColors.greyBorder),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.location_on_rounded,
                      color: AppColors.primary,
                      size: 20,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        cities[i],
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textDark,
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.chevron_right_rounded,
                      color: AppColors.greyText,
                    ),
                  ],
                ),
              ),
            );
          }, childCount: 6),
        ),
      ),
    ],
  );

  // ── RESULTS ──────────────────────────────────────────────────────────────
  Widget _results(CustomerSearchState state) {
    const stores = [
      (
        'Warung Madura Cahaya',
        'Jakarta Timur',
        4.7,
        128,
        0.6,
        ['Buka', 'Promo Ongkir'],
        Color(0xFF4A7C59),
      ),
      (
        'Toko Sumber Rezeki',
        'Jakarta Timur',
        4.5,
        95,
        1.2,
        ['Promo'],
        Color(0xFF8B6914),
      ),
      (
        'Warung Barokah',
        'Jakarta Timur',
        4.8,
        203,
        0.9,
        ['Buka'],
        Color(0xFF1A5276),
      ),
      (
        'Kelontong Jaya',
        'Jakarta Timur',
        4.6,
        77,
        1.5,
        ['Terdekat'],
        Color(0xFF6C3483),
      ),
    ];
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Row(
              children: [
                _circle(Icons.arrow_back_rounded, onTap: _clearSearch),
                const SizedBox(width: 10),
                Expanded(child: _searchBar(null, filled: true)),
                const SizedBox(width: 10),
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.tune_rounded,
                    color: AppColors.primary,
                    size: 22,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16, 14, 16, 10),
            child: Text(
              '24 warung ditemukan',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.textDark,
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 14),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (final (label, icon) in [
                    ('Rating 4+', Icons.star_rounded),
                    ('Buka', Icons.storefront_rounded),
                    ('Promo Ongkir', Icons.delivery_dining_rounded),
                    ('Terdekat', Icons.location_on_rounded),
                  ])
                    Container(
                      margin: const EdgeInsets.only(right: 8),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 7,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: AppColors.greyBorder),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(icon, size: 14, color: AppColors.greyText),
                          const SizedBox(width: 5),
                          Text(
                            label,
                            style: const TextStyle(
                              fontSize: 12,
                              color: AppColors.textDark,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate((_, i) {
              final (name, city, rating, reviews, dist, badges, color) =
                  stores[i];
              return GestureDetector(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => CustomerDetailStoreScreen(storeName: name),
                  ),
                ),
                child: Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.greyBorder),
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
                          color: color,
                          child: Center(
                            child: Text(
                              name.substring(0, 2),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 26,
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
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w800,
                                  color: AppColors.primary,
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
                                          : AppColors.primary.withValues(
                                              alpha: 0.1,
                                            ),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Text(
                                      b,
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w600,
                                        color: isPromo
                                            ? const Color(0xFFF59E0B)
                                            : AppColors.primary,
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
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: AppColors.textDark,
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  Container(
                                    width: 3,
                                    height: 3,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.greyText,
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  const Icon(
                                    Icons.location_on_rounded,
                                    size: 13,
                                    color: AppColors.greyText,
                                  ),
                                  Text(
                                    '$dist km',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: AppColors.greyText,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 2),
                              Text(
                                city,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: AppColors.greyText,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Icon(
                          Icons.chevron_right_rounded,
                          color: AppColors.greyText,
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

  // ── Shared ────────────────────────────────────────────────────────────────
  Widget _searchBar(String? hint, {bool filled = false}) => Container(
    decoration: BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(14),
      border: Border.all(color: AppColors.greyBorder),
    ),
    child: TextField(
      controller: filled ? _ctrl : null,
      onSubmitted: (v) {
        if (v.isNotEmpty) {
          context.read<CustomerSearchBloc>().add(CustomerSearchQuerySubmitted(v));
        }
      },
      style: const TextStyle(fontSize: 14, color: AppColors.textDark),
      decoration: InputDecoration(
        hintText: hint ?? 'Cari warung...',
        hintStyle: const TextStyle(color: AppColors.greyText, fontSize: 14),
        prefixIcon: const Icon(
          Icons.search_rounded,
          color: AppColors.greyText,
          size: 22,
        ),
        border: InputBorder.none,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 13,
        ),
      ),
    ),
  );

  Widget _activeChip(String label) {
    final isPromo = label == 'Promo';
    IconData icon = label == 'Jakarta'
        ? Icons.location_on_rounded
        : label == 'Terdekat'
        ? Icons.my_location_rounded
        : label == 'Buka'
        ? Icons.storefront_rounded
        : Icons.local_offer_rounded;
    return Chip(
      avatar: Icon(
        icon,
        size: 13,
        color: isPromo ? const Color(0xFFF59E0B) : AppColors.primary,
      ),
      label: Text(
        label,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: isPromo ? const Color(0xFFF59E0B) : AppColors.primary,
        ),
      ),
      deleteIcon: Icon(
        Icons.close,
        size: 13,
        color: isPromo ? const Color(0xFFF59E0B) : AppColors.primary,
      ),
      onDeleted: () =>
          context.read<CustomerSearchBloc>().add(CustomerSearchFilterRemoved(label)),
      backgroundColor: isPromo
          ? const Color(0xFFFFF3C4)
          : AppColors.primary.withValues(alpha: 0.1),
      side: BorderSide(
        color: isPromo
            ? const Color(0xFFF59E0B)
            : AppColors.primary.withValues(alpha: 0.3),
      ),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      padding: const EdgeInsets.symmetric(horizontal: 2),
      visualDensity: VisualDensity.compact,
    );
  }

  Widget _circle(IconData icon, {VoidCallback? onTap}) => GestureDetector(
    onTap: onTap,
    child: Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: AppColors.white,
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.greyBorder),
      ),
      child: Icon(icon, color: AppColors.textDark, size: 20),
    ),
  );
}
