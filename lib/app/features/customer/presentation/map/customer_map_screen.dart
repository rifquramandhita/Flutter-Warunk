import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/customer/presentation/map/bloc/customer_map_bloc.dart';
import 'package:warunk/app/features/customer/presentation/map/bloc/customer_map_event.dart';
import 'package:warunk/app/features/customer/presentation/map/bloc/customer_map_state.dart';
import 'package:warunk/theme/app_colors.dart';

class CustomerMapScreen extends StatelessWidget {
  const CustomerMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CustomerMapBloc()..add(CustomerLoadMapData()),
      child: const _MapView(),
    );
  }
}

class _MapView extends StatefulWidget {
  const _MapView();

  @override
  State<_MapView> createState() => _MapViewState();
}

class _MapViewState extends State<_MapView> {
  final List<String> _filters = [
    'Semua',
    'Warung Madura',
    'Kelontong',
    'Kaki Lima',
    'Promo',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9F5EB), // Light green map background
      body: Stack(
        children: [
          // ── Map Background Layer ──────────────────────────────────────
          Positioned.fill(child: CustomPaint(painter: _DetailedMapPainter())),

          // ── Pins Layer ────────────────────────────────────────────────
          BlocBuilder<CustomerMapBloc, CustomerMapState>(
            builder: (context, state) {
              return Stack(
                children: state.stores.map((store) {
                  return Positioned(
                    left:
                        MediaQuery.of(context).size.width *
                        store.coordinates.dx,
                    top:
                        MediaQuery.of(context).size.height *
                        store.coordinates.dy,
                    child: const _MapPin(),
                  );
                }).toList(),
              );
            },
          ),

          // ── Top Bar (Search & Filters) ────────────────────────────────
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              bottom: false,
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  _buildSearchBar(),
                  const SizedBox(height: 12),
                  _buildFilters(),
                ],
              ),
            ),
          ),

          // ── Bottom Sheet (Stores List) ────────────────────────────────
          Align(alignment: Alignment.bottomCenter, child: _buildBottomSheet()),
        ],
      ),
    );
  }

  // ── Search Bar ────────────────────────────────────────────────────────────
  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          // Back Button
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: const Icon(
              Icons.arrow_back_rounded,
              color: AppColors.textDark,
            ),
          ),
          const SizedBox(width: 10),
          // Search Field
          Expanded(
            child: Container(
              height: 44,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: const Row(
                children: [
                  SizedBox(width: 14),
                  Icon(
                    Icons.search_rounded,
                    color: AppColors.greyText,
                    size: 20,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Cari warung atau area',
                    style: TextStyle(color: AppColors.greyText, fontSize: 13),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 10),
          // List/Menu Button
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: const Icon(
              Icons.format_list_bulleted_rounded,
              color: AppColors.textDark,
            ),
          ),
        ],
      ),
    );
  }

  // ── Filters ───────────────────────────────────────────────────────────────
  Widget _buildFilters() {
    return BlocBuilder<CustomerMapBloc, CustomerMapState>(
      builder: (context, state) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: _filters.map((filter) {
              final isActive = state.activeFilter == filter;
              return GestureDetector(
                onTap: () => context.read<CustomerMapBloc>().add(
                  CustomerMapFilterChanged(filter),
                ),
                child: Container(
                  margin: const EdgeInsets.only(right: 8),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: isActive ? const Color(0xFF3B8251) : AppColors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.05),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Text(
                    filter,
                    style: TextStyle(
                      color: isActive ? AppColors.white : AppColors.textDark,
                      fontSize: 12,
                      fontWeight: isActive ? FontWeight.w700 : FontWeight.w600,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }

  // ── Bottom Sheet ──────────────────────────────────────────────────────────
  Widget _buildBottomSheet() {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Drag Handle
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 12, bottom: 16),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.greyBorder,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),

          // Title
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Warung Terdekat',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: AppColors.textDark,
              ),
            ),
          ),
          const SizedBox(height: 12),

          // Stores List
          BlocBuilder<CustomerMapBloc, CustomerMapState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: CircularProgressIndicator(),
                  ),
                );
              }

              // Take first two for the UI mock
              final stores = state.stores.take(2).toList();

              return Column(
                children: stores.map((store) {
                  return _StoreCard(store: store);
                }).toList(),
              );
            },
          ),

          // Action Button
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3B8251),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: const Text(
                  'Lihat Detail',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Custom Map Pin ──────────────────────────────────────────────────────────
class _MapPin extends StatelessWidget {
  const _MapPin();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: const Color(0xFF3B8251),
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 2.5),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF3B8251).withValues(alpha: 0.4),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: const Center(
            child: Icon(
              Icons.storefront_rounded,
              color: Colors.white,
              size: 16,
            ),
          ),
        ),
        // Arrow down part of the pin
        CustomPaint(size: const Size(12, 10), painter: _PinArrowPainter()),
      ],
    );
  }
}

class _PinArrowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF3B8251)
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width / 2, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// ── Store Card ──────────────────────────────────────────────────────────────
class _StoreCard extends StatelessWidget {
  final CustomerMapStore store;

  const _StoreCard({required this.store});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.greyBorder),
      ),
      child: Row(
        children: [
          // Image placeholder
          Container(
            width: 86,
            height: 86,
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
            ),
            child: const Center(
              child: Text('🏪', style: TextStyle(fontSize: 40)),
            ),
          ),
          const SizedBox(width: 12),
          // Info
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          store.name,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                            color: AppColors.textDark,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: store.statusColor.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          store.status,
                          style: TextStyle(
                            color: store.statusColor,
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(
                        Icons.star_rounded,
                        color: Color(0xFFF59E0B),
                        size: 14,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${store.rating} (${store.reviews})',
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.textDark,
                        ),
                      ),
                      const SizedBox(width: 6),
                      const Text(
                        '•',
                        style: TextStyle(color: AppColors.greyText),
                      ),
                      const SizedBox(width: 6),
                      const Icon(
                        Icons.radio_button_unchecked,
                        size: 10,
                        color: AppColors.greyText,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        store.distance,
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.greyText,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text(
                    store.location,
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.greyText,
                    ),
                  ),
                  const SizedBox(height: 6),
                  if (store.promo.isNotEmpty)
                    Row(
                      children: [
                        const Text('🛵', style: TextStyle(fontSize: 12)),
                        const SizedBox(width: 4),
                        Text(
                          store.promo,
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF3B8251),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(Icons.chevron_right_rounded, color: AppColors.greyText),
          ),
        ],
      ),
    );
  }
}

// ── Detailed Map Background Painter ─────────────────────────────────────────
class _DetailedMapPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Street lines
    final streetPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 6
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final thinStreetPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    // River
    final riverPaint = Paint()
      ..color =
          const Color(0xFFBCE3F9) // Light blue river
      ..strokeWidth = 12
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    // Draw some thick streets
    canvas.drawLine(
      Offset(0, size.height * 0.3),
      Offset(size.width, size.height * 0.4),
      streetPaint,
    );
    canvas.drawLine(
      Offset(size.width * 0.2, 0),
      Offset(size.width * 0.4, size.height),
      streetPaint,
    );
    canvas.drawLine(
      Offset(size.width * 0.7, 0),
      Offset(size.width * 0.6, size.height),
      streetPaint,
    );
    canvas.drawLine(
      Offset(0, size.height * 0.7),
      Offset(size.width, size.height * 0.6),
      streetPaint,
    );

    // Draw some thin streets
    canvas.drawLine(
      Offset(0, size.height * 0.1),
      Offset(size.width * 0.4, size.height * 0.2),
      thinStreetPaint,
    );
    canvas.drawLine(
      Offset(size.width * 0.5, size.height * 0.4),
      Offset(size.width * 0.9, size.height * 0.2),
      thinStreetPaint,
    );
    canvas.drawLine(
      Offset(size.width * 0.1, size.height * 0.5),
      Offset(size.width * 0.3, size.height * 0.8),
      thinStreetPaint,
    );
    canvas.drawLine(
      Offset(size.width * 0.6, size.height * 0.7),
      Offset(size.width * 0.9, size.height * 0.9),
      thinStreetPaint,
    );
    canvas.drawLine(
      Offset(size.width * 0.4, 0),
      Offset(size.width * 0.8, size.height * 0.4),
      thinStreetPaint,
    );

    // Draw river
    final riverPath = Path()
      ..moveTo(size.width * 0.8, 0)
      ..quadraticBezierTo(
        size.width * 0.6,
        size.height * 0.3,
        size.width * 0.4,
        size.height * 0.5,
      )
      ..quadraticBezierTo(
        size.width * 0.2,
        size.height * 0.7,
        size.width * 0.1,
        size.height,
      );

    canvas.drawPath(riverPath, riverPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
