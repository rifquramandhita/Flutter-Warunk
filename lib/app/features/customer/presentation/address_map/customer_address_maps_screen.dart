import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:warunk/core/dependency/dependency.dart';
import 'package:warunk/core/helper/global_helper.dart';
import 'package:warunk/core/helper/dialog_helper.dart';
import 'package:warunk/app/features/customer/presentation/address_map/bloc/customer_address_maps_bloc.dart';
import 'package:warunk/main.dart';
import 'package:dio/dio.dart';

class CustomerAddressMapsScreen extends StatelessWidget {
  final double? initialLatitude;
  final double? initialLongitude;

  // We keep the Completer here to control the map camera
  final Completer<GoogleMapController> _controller = Completer();

  CustomerAddressMapsScreen({super.key, this.initialLatitude, this.initialLongitude});

  // Default coordinate (Monas, Jakarta)
  static const CameraPosition _kDefaultPosition = CameraPosition(
    target: LatLng(-6.1753924, 106.8271528),
    zoom: 15,
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CustomerAddressMapsBloc>()
        ..add(
          CustomerAddressMapsEventInit(
            initialLatitude: initialLatitude,
            initialLongitude: initialLongitude,
          ),
        ),
      child: BlocConsumer<CustomerAddressMapsBloc, CustomerAddressMapsState>(
        listener: (context, state) async {
          if (state.errorMessage != null) {
            DialogHelper.showErrorSnackBar(
              context: context,
              text: state.errorMessage!,
            );
          }

          if (state.moveCameraToCurrentLocation &&
              state.latitude != null &&
              state.longitude != null) {
            final GoogleMapController controller = await _controller.future;
            controller.animateCamera(
              CameraUpdate.newLatLngZoom(
                LatLng(state.latitude!, state.longitude!),
                16,
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(title: const Text('Pilih Lokasi')),
            body: _bodyBuild(context),
          );
        },
      ),
    );
  }

  Widget _bodyBuild(BuildContext context) {
    final state = context.watch<CustomerAddressMapsBloc>().state;

    if (state.isLoadingLocation) {
      return const Center(child: CircularProgressIndicator());
    }

    return Stack(
      children: [
        _mapLayout(context),
        _searchLayout(context),
        _centerMarkerLayout(context),
        _myLocationButtonLayout(context),
        _bottomPanelLayout(context),
      ],
    );
  }

  Widget _mapLayout(BuildContext context) {
    final state = context.read<CustomerAddressMapsBloc>().state;
    final initialCameraPosition =
        state.latitude != null && state.longitude != null
        ? CameraPosition(
            target: LatLng(state.latitude!, state.longitude!),
            zoom: 16,
          )
        : _kDefaultPosition;

    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: initialCameraPosition,
      myLocationEnabled: true,
      myLocationButtonEnabled: false,
      zoomControlsEnabled: false,
      onMapCreated: (GoogleMapController controller) {
        if (!_controller.isCompleted) {
          _controller.complete(controller);
        }
      },
      onCameraMove: (CameraPosition position) {
        // We can't dispatch event on every pixel move (performance issue),
        // we will only update on idle.
      },
      onCameraIdle: () async {
        final GoogleMapController controller = await _controller.future;
        // get bounds to find exact center if needed, or we can use visibleRegion
        LatLngBounds bounds = await controller.getVisibleRegion();
        double centerLat =
            (bounds.northeast.latitude + bounds.southwest.latitude) / 2;
        double centerLng =
            (bounds.northeast.longitude + bounds.southwest.longitude) / 2;

        if (context.mounted) {
          context.read<CustomerAddressMapsBloc>().add(
            CustomerAddressMapsEventLocationChanged(centerLat, centerLng),
          );
        }
      },
    );
  }

  Widget _searchLayout(BuildContext context) {
    final state = context.watch<CustomerAddressMapsBloc>().state;
    final colorSchema = GlobalHelper.getColorSchema(context);

    return Positioned(
      top: 16,
      left: 16,
      right: 16,
      child: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: colorSchema.surface,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Autocomplete<Map<String, dynamic>>(
            optionsBuilder: (TextEditingValue textEditingValue) async {
              if (textEditingValue.text.length < 3) {
                return const Iterable<Map<String, dynamic>>.empty();
              }
              try {
                final dio = sl<Dio>();
                final response = await dio.get(
                  'https://nominatim.openstreetmap.org/search',
                  queryParameters: {
                    'q': textEditingValue.text,
                    'format': 'json',
                    'addressdetails': 1,
                    'limit': 5,
                    'countrycodes': 'id',
                  },
                  options: Options(
                    headers: {'User-Agent': 'warunk_app/1.0'},
                  ),
                );
                if (response.statusCode == 200) {
                  final List data = response.data;
                  return data.map((e) => e as Map<String, dynamic>);
                }
              } catch (e) {
                debugPrint(e.toString());
              }
              return const Iterable<Map<String, dynamic>>.empty();
            },
            displayStringForOption: (option) => option['display_name'] ?? '',
            onSelected: (option) {
              final latStr = option['lat'];
              final lonStr = option['lon'];
              if (latStr != null && lonStr != null) {
                final lat = double.tryParse(latStr.toString());
                final lon = double.tryParse(lonStr.toString());
                if (lat != null && lon != null) {
                  context.read<CustomerAddressMapsBloc>().add(
                    CustomerAddressMapsEventMoveCamera(lat, lon),
                  );
                }
              }
            },
            fieldViewBuilder: (context, controller, focusNode, onEditingComplete) {
              return TextField(
                controller: controller,
                focusNode: focusNode,
                textInputAction: TextInputAction.search,
                onSubmitted: (value) {
                  if (value.trim().isNotEmpty) {
                    context.read<CustomerAddressMapsBloc>().add(
                      CustomerAddressMapsEventSearchLocation(value),
                    );
                  }
                },
                decoration: InputDecoration(
                  hintText: 'Cari lokasi...',
                  border: InputBorder.none,
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: state.isSearchingLocation
                      ? const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          ),
                        )
                      : IconButton(
                          icon: const Icon(Icons.clear, size: 20),
                          onPressed: () {
                            controller.clear();
                          },
                        ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                ),
              );
            },
            optionsViewBuilder: (context, onSelected, options) {
              return Align(
                alignment: Alignment.topLeft,
                child: Material(
                  elevation: 4.0,
                  borderRadius: BorderRadius.circular(12),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 250,
                      maxWidth: MediaQuery.of(context).size.width - 32,
                    ),
                    child: ListView.separated(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: options.length,
                      separatorBuilder: (context, index) => const Divider(height: 1),
                      itemBuilder: (context, index) {
                        final option = options.elementAt(index);
                        return ListTile(
                          leading: const Icon(Icons.location_on_outlined),
                          title: Text(
                            option['display_name'] ?? '',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 14),
                          ),
                          onTap: () {
                            onSelected(option);
                          },
                        );
                      },
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _centerMarkerLayout(BuildContext context) {
    final colorSchema = GlobalHelper.getColorSchema(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 40.0),
        child: Icon(Icons.location_pin, size: 40, color: colorSchema.primary),
      ),
    );
  }

  Widget _myLocationButtonLayout(BuildContext context) {
    final colorSchema = GlobalHelper.getColorSchema(context);
    return Positioned(
      bottom: 240,
      right: 16,
      child: FloatingActionButton(
        heroTag: 'my_location_btn_custom',
        backgroundColor: colorSchema.surface,
        onPressed: () {
          context.read<CustomerAddressMapsBloc>().add(
            CustomerAddressMapsEventGetMyLocation(),
          );
        },
        child: Icon(Icons.my_location, color: colorSchema.primary),
      ),
    );
  }

  Widget _bottomPanelLayout(BuildContext context) {
    final state = context.watch<CustomerAddressMapsBloc>().state;
    final colorSchema = GlobalHelper.getColorSchema(context);

    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: colorSchema.surface,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (state.latitude != null && state.longitude != null) ...[
                Text(
                  'Koordinat terpilih:',
                  style: GlobalHelper.getTextTheme(
                    context,
                    appTextStyle: AppTextStyle.LABEL_SMALL,
                  )?.copyWith(color: colorSchema.onSurfaceVariant),
                ),
                const SizedBox(height: 4),
                Text(
                  '${state.latitude!.toStringAsFixed(6)}, '
                  '${state.longitude!.toStringAsFixed(6)}',
                  style:
                      GlobalHelper.getTextTheme(
                        context,
                        appTextStyle: AppTextStyle.BODY_MEDIUM,
                      )?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colorSchema.onSurface,
                      ),
                ),
                const SizedBox(height: 16),
              ],
              SizedBox(
                height: 52,
                child: ElevatedButton(
                  onPressed: () {
                    if (state.latitude != null && state.longitude != null) {
                      navigatorKey.currentState?.pop(
                        LatLng(state.latitude!, state.longitude!),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorSchema.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: Text(
                    'Pilih Lokasi Ini',
                    style:
                        GlobalHelper.getTextTheme(
                          context,
                          appTextStyle: AppTextStyle.TITLE_SMALL,
                        )?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
