import 'dart:async';
import 'dart:ui' as ui;
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:warunk/app/features/customer/presentation/map/bloc/customer_map_bloc.dart';
import 'package:warunk/app/features/customer/presentation/map/bloc/customer_map_event.dart';
import 'package:warunk/app/features/customer/presentation/map/bloc/customer_map_state.dart';
import 'package:warunk/app/features/customer/presentation/detail_merchant/customer_detail_merchant_screen.dart';
import 'package:warunk/core/dependency/dependency.dart';
import 'package:warunk/core/helper/global_helper.dart';
import 'package:warunk/core/helper/dialog_helper.dart';
import 'package:warunk/core/widgets/loading_app_widget.dart';
import 'package:warunk/main.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_merchant.dart';
class CustomerMapScreen extends StatelessWidget {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  CustomerMapScreen({super.key});

  Future<void> _initCustomMarker(BuildContext context) async {
    final bloc = context.read<CustomerMapBloc>();
    if (bloc.state.storeMarker != null) return;

    final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    const Size size = Size(36.0, 50.0);

    final double width = size.width;
    final double height = size.height;
    final double radius = width / 2;

    final Path pinPath = Path();
    pinPath.moveTo(0, radius);
    pinPath.arcToPoint(
      Offset(width, radius),
      radius: Radius.circular(radius),
      clockwise: true,
    );
    // Draw the bottom pointer using bezier curves for a smooth map pin shape
    pinPath.quadraticBezierTo(width, radius + 11, radius, height);
    pinPath.quadraticBezierTo(0, radius + 11, 0, radius);
    pinPath.close();

    // Shadow
    final Paint shadowPaint = Paint()
      ..color = Colors.black.withValues(alpha: 0.25)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 2.0);
    canvas.drawPath(pinPath.shift(const Offset(0, 2)), shadowPaint);

    // Outer pin background (White)
    final Paint borderPaint = Paint()
      ..color = GlobalHelper.getColorSchema(context).onPrimary;
    canvas.drawPath(pinPath, borderPaint);

    // Inner circle (Primary Color)
    final Paint primaryPaint = Paint()
      ..color = GlobalHelper.getColorSchema(context).primary;
    canvas.drawCircle(Offset(radius, radius), radius - 3.5, primaryPaint);

    // Icon (storefront)
    TextPainter textPainter = TextPainter(textDirection: TextDirection.ltr);
    textPainter.text = TextSpan(
      text: String.fromCharCode(Icons.storefront_rounded.codePoint),
      style: TextStyle(
        fontSize: 18.0,
        fontFamily: Icons.storefront_rounded.fontFamily,
        package: Icons.storefront_rounded.fontPackage,
        color: GlobalHelper.getColorSchema(context).onPrimary,
      ),
    );
    textPainter.layout();
    textPainter.paint(
      canvas,
      Offset(
        (width - textPainter.width) / 2,
        (width - textPainter.height) / 2, // Centered inside the top circle
      ),
    );

    final ui.Image image = await pictureRecorder.endRecording().toImage(
      size.width.toInt(),
      size.height.toInt(),
    );
    final ByteData? byteData = await image.toByteData(
      format: ui.ImageByteFormat.png,
    );
    final Uint8List uint8List = byteData!.buffer.asUint8List();

    bloc.add(CustomerMapMarkerInitialized(BitmapDescriptor.bytes(uint8List)));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CustomerMapBloc>()..add(CustomerLoadMapData()),
      child: BlocConsumer<CustomerMapBloc, CustomerMapState>(
        listener: (context, state) {
          if (state.errorMessage != null) {
            DialogHelper.showErrorSnackBar(
              context: context,
              text: state.errorMessage!,
            );
          }
          if (state.currentLocation != null) {
            if (_controller.isCompleted) {
              _controller.future.then((controller) {
                controller.animateCamera(
                  CameraUpdate.newCameraPosition(
                    CameraPosition(
                      target: state.currentLocation!,
                      zoom: 14.4746,
                    ),
                  ),
                );
              });
            }
          }
          if (state.selectedStore != null) {
            if (_controller.isCompleted) {
              _controller.future.then((controller) {
                controller.animateCamera(
                  CameraUpdate.newCameraPosition(
                    CameraPosition(
                      target: LatLng(
                        state.selectedStore!.latitude ?? 0.0,
                        state.selectedStore!.longitude ?? 0.0,
                      ),
                      zoom: 16.0,
                    ),
                  ),
                );
              });
            }
          }
        },
        builder: (context, state) {
          if (state.storeMarker == null && !state.isLoading) {
            _initCustomMarker(context);
          }
          return Scaffold(
            backgroundColor: GlobalHelper.getColorSchema(context).surface,
            body: _bodyBuild(context),
          );
        },
      ),
    );
  }

  Widget _bodyBuild(BuildContext context) {
    final state = context.watch<CustomerMapBloc>().state;
    return Stack(
      children: [
        _bodyLayout(context),
        if (state.isLoading) const LoadingAppWidget(),
      ],
    );
  }

  Widget _bodyLayout(BuildContext context) {
    final state = context.watch<CustomerMapBloc>().state;
    final initialPosition = CameraPosition(
      target: state.currentLocation ?? const LatLng(-6.200000, 106.816666),
      zoom: 14.4746,
    );

    final markers = state.stores.map((store) {
      final status = store.isOpen ? 'Buka' : 'Tutup';
      final distance = '${store.distance?.toStringAsFixed(1) ?? "0.0"} km';
      final coordinates = LatLng(store.latitude ?? 0.0, store.longitude ?? 0.0);
      return Marker(
        markerId: MarkerId(store.id),
        position: coordinates,
        icon: state.storeMarker ?? BitmapDescriptor.defaultMarker,
        onTap: () {
          context.read<CustomerMapBloc>().add(
            CustomerMapSelectedStoreChanged(store),
          );
        },
        infoWindow: InfoWindow(
          title: store.name,
          snippet: '$status - $distance',
        ),
      );
    }).toSet();

    return Stack(
      children: [
        Positioned.fill(
          child: GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: initialPosition,
            onMapCreated: (GoogleMapController controller) {
              if (!_controller.isCompleted) {
                _controller.complete(controller);
              }
            },
            onTap: (_) {
              context.read<CustomerMapBloc>().add(
                CustomerMapSelectedStoreChanged(null),
              );
            },
            markers: markers,
            compassEnabled: true,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            zoomControlsEnabled: true,
            padding: const EdgeInsets.only(top: 80, bottom: 200),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: SafeArea(
            bottom: false,
            child: Column(
              children: [
                const SizedBox(height: 16),
                _MapSearchBarWidget(mapController: _controller),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: _buildBottomSheet(context),
        ),
      ],
    );
  }

  Widget _buildBottomSheet(BuildContext context) {
    final state = context.watch<CustomerMapBloc>().state;
    final selectedStore = state.selectedStore;

    if (selectedStore == null) {
      return const SizedBox.shrink();
    }

    return Container(
      decoration: BoxDecoration(
        color: GlobalHelper.getColorSchema(context).surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
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
                color: GlobalHelper.getColorSchema(context).outlineVariant,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),

          // Title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Warung Yang Dipilih',
              style:
                  GlobalHelper.getTextTheme(
                    context,
                    appTextStyle: AppTextStyle.TITLE_LARGE,
                  )?.copyWith(
                    fontWeight: FontWeight.w800,
                    color: GlobalHelper.getColorSchema(context).onSurface,
                  ),
            ),
          ),
          const SizedBox(height: 12),

          // Selected Store Card
          GestureDetector(
            onTap: () {
              navigatorKey.currentState?.push(
                MaterialPageRoute(
                  builder: (context) =>
                      CustomerDetailMerchantScreen(storeId: selectedStore.id),
                ),
              );
            },
            child: _buildStoreCard(context, selectedStore),
          ),

          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildStoreCard(BuildContext context, CustomerMerchantEntity store) {
    final status = store.isOpen ? 'Buka' : 'Tutup';
    final statusColor = store.isOpen
        ? GlobalHelper.getColorSchema(context).primary
        : GlobalHelper.getColorSchema(context).onSurface.withValues(alpha: 0.5);
    final rating = store.rating ?? 0.0;
    final reviews = store.reviewsCount ?? 0;
    final distance = '${store.distance?.toStringAsFixed(1) ?? "0.0"} km';
    final location = store.district ?? '';
    final promo = store.promoBadges?.isNotEmpty == true
        ? store.promoBadges!.first
        : '';

    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 12),
      decoration: BoxDecoration(
        color: GlobalHelper.getColorSchema(context).surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: GlobalHelper.getColorSchema(context).outlineVariant,
        ),
      ),
      child: Row(
        children: [
          // Image placeholder
          Container(
            width: 86,
            height: 86,
            decoration: BoxDecoration(
              color: GlobalHelper.getColorSchema(
                context,
              ).primary.withValues(alpha: 0.1),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
            ),
            child: Center(
              child: Text(
                '🏪',
                style: GlobalHelper.getTextTheme(
                  context,
                  appTextStyle: AppTextStyle.DISPLAY_MEDIUM,
                ),
              ),
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
                          style:
                              GlobalHelper.getTextTheme(
                                context,
                                appTextStyle: AppTextStyle.BODY_MEDIUM,
                              )?.copyWith(
                                fontWeight: FontWeight.w800,
                                color: GlobalHelper.getColorSchema(
                                  context,
                                ).onSurface,
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
                          color: statusColor.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          status,
                          style:
                              GlobalHelper.getTextTheme(
                                context,
                                appTextStyle: AppTextStyle.BODY_SMALL,
                              )?.copyWith(
                                color: statusColor,
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
                      Icon(
                        Icons.star_rounded,
                        color: GlobalHelper.getColorSchema(context).primary,
                        size: 14,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '$rating ($reviews)',
                        style:
                            GlobalHelper.getTextTheme(
                              context,
                              appTextStyle: AppTextStyle.BODY_SMALL,
                            )?.copyWith(
                              color: GlobalHelper.getColorSchema(
                                context,
                              ).onSurface,
                            ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        '•',
                        style:
                            GlobalHelper.getTextTheme(
                              context,
                              appTextStyle: AppTextStyle.BODY_SMALL,
                            )?.copyWith(
                              color: GlobalHelper.getColorSchema(
                                context,
                              ).onSurface.withValues(alpha: 0.5),
                            ),
                      ),
                      const SizedBox(width: 6),
                      Icon(
                        Icons.radio_button_unchecked,
                        size: 10,
                        color: GlobalHelper.getColorSchema(
                          context,
                        ).onSurface.withValues(alpha: 0.5),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        distance,
                        style:
                            GlobalHelper.getTextTheme(
                              context,
                              appTextStyle: AppTextStyle.BODY_SMALL,
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
                    location,
                    style:
                        GlobalHelper.getTextTheme(
                          context,
                          appTextStyle: AppTextStyle.BODY_SMALL,
                        )?.copyWith(
                          color: GlobalHelper.getColorSchema(
                            context,
                          ).onSurface.withValues(alpha: 0.5),
                        ),
                  ),
                  const SizedBox(height: 6),
                  if (promo.isNotEmpty)
                    Row(
                      children: [
                        Text(
                          '🛵',
                          style: GlobalHelper.getTextTheme(
                            context,
                            appTextStyle: AppTextStyle.BODY_SMALL,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          promo,
                          style:
                              GlobalHelper.getTextTheme(
                                context,
                                appTextStyle: AppTextStyle.BODY_SMALL,
                              )?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: GlobalHelper.getColorSchema(
                                  context,
                                ).primary,
                              ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Icon(
              Icons.chevron_right_rounded,
              color: GlobalHelper.getColorSchema(
                context,
              ).onSurface.withValues(alpha: 0.5),
            ),
          ),
        ],
      ),
    );
  }
}

class _MapSearchBarWidget extends StatefulWidget {
  final Completer<GoogleMapController> mapController;

  const _MapSearchBarWidget({required this.mapController});

  @override
  State<_MapSearchBarWidget> createState() => _MapSearchBarWidgetState();
}

class _MapSearchBarWidgetState extends State<_MapSearchBarWidget> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _controller = TextEditingController();
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void _onSearchChanged(String query, BuildContext context) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      context.read<CustomerMapBloc>().add(CustomerMapSearchQueryChanged(query));
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<CustomerMapBloc>().state;

    if (state.searchQuery != _controller.text && !_focusNode.hasFocus) {
      _controller.text = state.searchQuery;
    }

    final bool showSuggestions =
        _focusNode.hasFocus &&
        state.stores.isNotEmpty &&
        _controller.text.isNotEmpty;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
              color: GlobalHelper.getColorSchema(context).surface,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: GlobalHelper.getColorSchema(
                  context,
                ).outline.withValues(alpha: 0.2),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: TextFormField(
              controller: _controller,
              focusNode: _focusNode,
              textInputAction: TextInputAction.search,
              onChanged: (v) => _onSearchChanged(v, context),
              onFieldSubmitted: (v) {
                _focusNode.unfocus();
                context.read<CustomerMapBloc>().add(
                  CustomerMapSearchQueryChanged(v),
                );
              },
              style:
                  GlobalHelper.getTextTheme(
                    context,
                    appTextStyle: AppTextStyle.BODY_MEDIUM,
                  )?.copyWith(
                    color: GlobalHelper.getColorSchema(context).onSurface,
                  ),
              decoration: InputDecoration(
                hintText: 'Cari warung atau area',
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
                suffixIcon:
                    state.searchQuery.isNotEmpty || _controller.text.isNotEmpty
                    ? IconButton(
                        icon: Icon(
                          Icons.close_rounded,
                          color: GlobalHelper.getColorSchema(
                            context,
                          ).onSurface.withValues(alpha: 0.5),
                        ),
                        onPressed: () {
                          _controller.clear();
                          context.read<CustomerMapBloc>().add(
                            CustomerMapSearchQueryChanged(''),
                          );
                        },
                      )
                    : null,
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 13,
                ),
              ),
            ),
          ),
              ),
              const SizedBox(width: 8),
              _categoryButtonWidget(context),
            ],
          ),
          if (showSuggestions) ...[
            const SizedBox(height: 8),
            Container(
              constraints: const BoxConstraints(maxHeight: 250),
              decoration: BoxDecoration(
                color: GlobalHelper.getColorSchema(context).surface,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: ListView.separated(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: state.stores.length,
                separatorBuilder: (context, index) => Divider(
                  height: 1,
                  color: GlobalHelper.getColorSchema(context).outlineVariant,
                ),
                itemBuilder: (context, index) {
                  final store = state.stores[index];
                  return ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 4,
                    ),
                    leading: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: GlobalHelper.getColorSchema(
                          context,
                        ).primary.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.storefront_rounded,
                        color: GlobalHelper.getColorSchema(context).primary,
                      ),
                    ),
                    title: Text(
                      store.name,
                      style: GlobalHelper.getTextTheme(
                        context,
                        appTextStyle: AppTextStyle.BODY_MEDIUM,
                      )?.copyWith(fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(
                      store.city ?? 'Tidak ada kota',
                      style:
                          GlobalHelper.getTextTheme(
                            context,
                            appTextStyle: AppTextStyle.BODY_SMALL,
                          )?.copyWith(
                            color: GlobalHelper.getColorSchema(
                              context,
                            ).onSurface.withValues(alpha: 0.5),
                          ),
                    ),
                    onTap: () async {
                      _focusNode.unfocus();
                      _controller.text = store.name;
                      context.read<CustomerMapBloc>().add(
                        CustomerMapSearchQueryChanged(store.name),
                      );
                      context.read<CustomerMapBloc>().add(
                        CustomerMapSelectedStoreChanged(store),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _categoryButtonWidget(BuildContext context) {
    final state = context.watch<CustomerMapBloc>().state;
    final bool hasActiveCategory = state.activeCategory != null;

    return GestureDetector(
      onTap: () {
        _showCategoryBottomSheet(context);
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: hasActiveCategory 
              ? GlobalHelper.getColorSchema(context).primary 
              : GlobalHelper.getColorSchema(context).surface,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: hasActiveCategory 
                ? GlobalHelper.getColorSchema(context).primary 
                : GlobalHelper.getColorSchema(context).outline.withValues(alpha: 0.2),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Icon(
          Icons.tune_rounded,
          color: hasActiveCategory 
              ? GlobalHelper.getColorSchema(context).onPrimary 
              : GlobalHelper.getColorSchema(context).onSurface.withValues(alpha: 0.7),
          size: 24,
        ),
      ),
    );
  }

  void _showCategoryBottomSheet(BuildContext context) {
    final bloc = context.read<CustomerMapBloc>();
    showModalBottomSheet(
      context: context,
      backgroundColor: GlobalHelper.getColorSchema(context).surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (bottomSheetContext) {
        return BlocProvider.value(
          value: bloc,
          child: Builder(
            builder: (ctx) => _categoryBottomSheetContent(ctx),
          ),
        );
      },
    );
  }

  Widget _categoryBottomSheetContent(BuildContext context) {
    final state = context.watch<CustomerMapBloc>().state;
    
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Container(
            margin: const EdgeInsets.only(top: 12, bottom: 16),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: GlobalHelper.getColorSchema(context).outlineVariant,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ),
        const _MapDistanceFilterWidget(),
        const SizedBox(height: 8),
        Divider(
          height: 1,
          color: GlobalHelper.getColorSchema(context).outlineVariant,
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Kategori Warung',
            style: GlobalHelper.getTextTheme(
              context,
              appTextStyle: AppTextStyle.TITLE_LARGE,
            )?.copyWith(
              fontWeight: FontWeight.w800,
              color: GlobalHelper.getColorSchema(context).onSurface,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Flexible(
          child: ListView.separated(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            itemCount: state.categories.length + 1,
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final isAll = index == 0;
              final category = isAll ? null : state.categories[index - 1];
              final isSelected = isAll 
                  ? state.activeCategory == null 
                  : state.activeCategory?.id == category!.id;

              return InkWell(
                onTap: () {
                  context.read<CustomerMapBloc>().add(CustomerMapCategorySelected(category));
                  navigatorKey.currentState?.pop();
                },
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: isSelected 
                        ? GlobalHelper.getColorSchema(context).primary.withValues(alpha: 0.1)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isSelected 
                          ? GlobalHelper.getColorSchema(context).primary 
                          : GlobalHelper.getColorSchema(context).outlineVariant,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        isAll ? 'Semua' : category!.name,
                        style: GlobalHelper.getTextTheme(
                          context,
                          appTextStyle: AppTextStyle.BODY_MEDIUM,
                        )?.copyWith(
                          color: isSelected 
                              ? GlobalHelper.getColorSchema(context).primary 
                              : GlobalHelper.getColorSchema(context).onSurface,
                          fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                        ),
                      ),
                      if (isSelected)
                        Icon(
                          Icons.check_circle_rounded,
                          color: GlobalHelper.getColorSchema(context).primary,
                          size: 20,
                        ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 24),
      ],
      ),
    );
  }
}

class _MapDistanceFilterWidget extends StatefulWidget {
  const _MapDistanceFilterWidget();

  @override
  State<_MapDistanceFilterWidget> createState() => _MapDistanceFilterWidgetState();
}

class _MapDistanceFilterWidgetState extends State<_MapDistanceFilterWidget> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _onInputSubmitted(String value, BuildContext context) {
    double? val = double.tryParse(value);
    if (val != null) {
      if (val < 0.5) val = 0.5;
      if (val > 5000.0) val = 5000.0;
      context.read<CustomerMapBloc>().add(CustomerMapDistanceSelected(val));
      _controller.text = val.toStringAsFixed(1);
    } else {
      final state = context.read<CustomerMapBloc>().state;
      _controller.text = state.maxDistance.toStringAsFixed(1);
    }
    _focusNode.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<CustomerMapBloc>().state;
    
    if (!_focusNode.hasFocus) {
      _controller.text = state.maxDistance.toStringAsFixed(1);
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Jarak Maksimal',
                style: GlobalHelper.getTextTheme(
                  context,
                  appTextStyle: AppTextStyle.TITLE_LARGE,
                )?.copyWith(
                  fontWeight: FontWeight.w800,
                  color: GlobalHelper.getColorSchema(context).onSurface,
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 70,
                    child: TextField(
                      controller: _controller,
                      focusNode: _focusNode,
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      textAlign: TextAlign.right,
                      style: GlobalHelper.getTextTheme(
                        context,
                        appTextStyle: AppTextStyle.BODY_LARGE,
                      )?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: GlobalHelper.getColorSchema(context).primary,
                      ),
                      decoration: const InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                        border: InputBorder.none,
                      ),
                      onSubmitted: (val) => _onInputSubmitted(val, context),
                      onTapOutside: (_) => _onInputSubmitted(_controller.text, context),
                    ),
                  ),
                  Text(
                    ' km',
                    style: GlobalHelper.getTextTheme(
                      context,
                      appTextStyle: AppTextStyle.BODY_LARGE,
                    )?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: GlobalHelper.getColorSchema(context).primary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Slider(
          value: state.maxDistance,
          min: 0.5,
          max: 5000.0,
          activeColor: GlobalHelper.getColorSchema(context).primary,
          onChanged: (value) {
            context.read<CustomerMapBloc>().add(CustomerMapDistanceSelected(value));
          },
        ),
      ],
    );
  }
}
