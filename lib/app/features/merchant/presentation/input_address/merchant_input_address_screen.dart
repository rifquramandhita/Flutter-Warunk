import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_district.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_province.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_regency.dart';
import 'package:warunk/app/features/merchant/presentation/input_address/bloc/merchant_input_address_bloc.dart';
import 'package:warunk/app/features/merchant/presentation/maps/merchant_maps_screen.dart';
import 'package:warunk/core/dependency/dependency.dart';
import 'package:warunk/core/helper/dialog_helper.dart';
import 'package:warunk/core/helper/global_helper.dart';
import 'package:warunk/core/widgets/loading_app_widget.dart';
import 'package:warunk/main.dart';

class MerchantInputAddressScreen extends StatelessWidget {
  final TextEditingController _postalCodeCtrl = TextEditingController();
  final TextEditingController _addressCtrl = TextEditingController();

  MerchantInputAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<MerchantInputAddressBloc>()..add(MerchantInputAddressEventGet()),
      child: MultiBlocListener(
        listeners: [
          BlocListener<MerchantInputAddressBloc, MerchantInputAddressState>(
            listenWhen: (previous, current) =>
                !previous.isInitialLoaded &&
                current.isInitialLoaded &&
                current.latitude == 0.0 &&
                current.longitude == 0.0,
            listener: (context, state) {
              WidgetsBinding.instance.addPostFrameCallback((_) async {
                final result = await navigatorKey.currentState?.push(
                  MaterialPageRoute(
                    builder: (context) => MerchantMapsScreen(
                      initialLatitude: state.latitude,
                      initialLongitude: state.longitude,
                    ),
                  ),
                );

                if (result != null && result is LatLng && context.mounted) {
                  context.read<MerchantInputAddressBloc>().add(
                    MerchantInputAddressEventLocationChanged(
                      result.longitude,
                      result.latitude,
                    ),
                  );
                } else if (context.mounted) {
                  navigatorKey.currentState?.pop();
                }
              });
            },
          ),
          BlocListener<MerchantInputAddressBloc, MerchantInputAddressState>(
            listener: (context, state) {
              if (_postalCodeCtrl.text != state.postalCode) {
                _postalCodeCtrl.text = state.postalCode;
              }
              if (_addressCtrl.text != state.address) {
                _addressCtrl.text = state.address;
              }

              if (state.errorMessage != null) {
                DialogHelper.showErrorSnackBar(
                  context: context,
                  text: state.errorMessage!,
                );
              }
              if (state.isSuccess) {
                DialogHelper.showBottomSheetDialog(
                  context: context,
                  title: "Success",
                  content: Column(
                    children: [
                      const Text("Alamat toko berhasil disimpan"),
                      const SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        height: 52,
                        child: ElevatedButton(
                          onPressed: () {
                            navigatorKey.currentState?.pop(); // close bottom sheet
                            navigatorKey.currentState?.pop(); // close screen
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: GlobalHelper.getColorSchema(
                              context,
                            ).primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                            elevation: 0,
                          ),
                          child: Text(
                            "Kembali",
                            style: GlobalHelper.getTextTheme(
                              context,
                              appTextStyle: AppTextStyle.TITLE_SMALL,
                            )?.copyWith(
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        ],
        child: BlocBuilder<MerchantInputAddressBloc, MerchantInputAddressState>(
          builder: (context, state) {
            return Scaffold(
              appBar: _buildAppBar(context),
              body: _bodyBuild(context),
            );
          },
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(title: const Text('Alamat Toko'));
  }

  Widget _bodyBuild(BuildContext context) {
    final state = context.watch<MerchantInputAddressBloc>().state;
    return SafeArea(
      child: Stack(
        children: [
          if (state.isInitialLoaded)
            _bodyLayout(context, state)
          else
            const Center(child: CircularProgressIndicator()),
          if (state.isLoading) const LoadingAppWidget(),
        ],
      ),
    );
  }

  Widget _bodyLayout(BuildContext context, MerchantInputAddressState state) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          _fieldLabel(context, 'Titik Lokasi'),
          const SizedBox(height: 8),
          _MapLocationPicker(
            latitude: state.latitude,
            longitude: state.longitude,
            onTap: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MerchantMapsScreen(
                    initialLatitude: state.latitude,
                    initialLongitude: state.longitude,
                  ),
                ),
              );

              if (result != null && result is LatLng && context.mounted) {
                context.read<MerchantInputAddressBloc>().add(
                  MerchantInputAddressEventLocationChanged(
                    result.longitude,
                    result.latitude,
                  ),
                );
              }
            },
          ),
          const SizedBox(height: 20),
          _fieldLabel(context, 'Provinsi'),
          const SizedBox(height: 8),
          _dropdownField<MerchantProvinceEntity>(
            context: context,
            hintText: 'Pilih provinsi',
            searchHint: 'Cari provinsi...',
            selectedItem: state.selectedProvince,
            items: state.provinces,
            itemAsString: (item) => item?.name ?? '',
            compareFn: (item1, item2) => item1.id == item2.id,
            onSelected: (data) {
              context.read<MerchantInputAddressBloc>().add(
                MerchantInputAddressEventProvinceChanged(data),
              );
            },
          ),
          const SizedBox(height: 20),
          _fieldLabel(context, 'Kabupaten / Kota'),
          const SizedBox(height: 8),
          _dropdownField<MerchantRegencyEntity>(
            context: context,
            enabled: state.selectedProvince != null && !state.isLoadingRegencies,
            hintText: state.selectedProvince == null
                ? 'Pilih provinsi terlebih dahulu'
                : state.isLoadingRegencies
                    ? 'Memuat kabupaten/kota...'
                    : 'Pilih kabupaten/kota',
            searchHint: 'Cari kabupaten/kota...',
            selectedItem: state.selectedRegency,
            items: state.regencies,
            itemAsString: (item) => item?.name ?? '',
            compareFn: (item1, item2) => item1.id == item2.id,
            onSelected: (data) {
              context.read<MerchantInputAddressBloc>().add(
                MerchantInputAddressEventRegencyChanged(data),
              );
            },
          ),
          const SizedBox(height: 20),
          _fieldLabel(context, 'Kecamatan'),
          const SizedBox(height: 8),
          _dropdownField<MerchantDistrictEntity>(
            context: context,
            enabled: state.selectedRegency != null && !state.isLoadingDistricts,
            hintText: state.selectedRegency == null
                ? 'Pilih kabupaten/kota terlebih dahulu'
                : state.isLoadingDistricts
                    ? 'Memuat kecamatan...'
                    : 'Pilih kecamatan',
            searchHint: 'Cari kecamatan...',
            selectedItem: state.selectedDistrict,
            items: state.districts,
            itemAsString: (item) => item?.name ?? '',
            compareFn: (item1, item2) => item1.id == item2.id,
            onSelected: (data) {
              context.read<MerchantInputAddressBloc>().add(
                MerchantInputAddressEventDistrictChanged(data),
              );
            },
          ),
          const SizedBox(height: 20),
          _fieldLabel(context, 'Kode Pos'),
          const SizedBox(height: 8),
          _editField(
            context: context,
            controller: _postalCodeCtrl,
            hintText: 'Masukkan kode pos',
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            onChanged: (v) => context.read<MerchantInputAddressBloc>().add(
              MerchantInputAddressEventPostalCodeChanged(v),
            ),
          ),
          const SizedBox(height: 20),
          _fieldLabel(context, 'Alamat Detail'),
          const SizedBox(height: 8),
          _editField(
            context: context,
            controller: _addressCtrl,
            hintText: 'Masukkan alamat lengkap toko',
            keyboardType: TextInputType.text,
            maxLines: 3,
            onChanged: (v) => context.read<MerchantInputAddressBloc>().add(
              MerchantInputAddressEventAddressChanged(v),
            ),
          ),
          const SizedBox(height: 32),
          _saveButton(context, state),
        ],
      ),
    );
  }

  Widget _dropdownField<T>({
    required BuildContext context,
    required String hintText,
    required T? selectedItem,
    required List<T> items,
    required String Function(T?) itemAsString,
    required bool Function(T, T) compareFn,
    required ValueChanged<T?> onSelected,
    bool enabled = true,
    String? searchHint,
  }) {
    final colorSchema = GlobalHelper.getColorSchema(context);
    final bodyStyle = GlobalHelper.getTextTheme(
      context,
      appTextStyle: AppTextStyle.BODY_SMALL,
    );

    return DropdownSearch<T>(
      enabled: enabled,
      selectedItem: selectedItem,
      items: (filter, loadProps) => items,
      itemAsString: itemAsString,
      compareFn: compareFn,
      onSelected: onSelected,
      decoratorProps: DropDownDecoratorProps(
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: bodyStyle?.copyWith(color: colorSchema.onSurfaceVariant),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: colorSchema.outlineVariant),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: colorSchema.outlineVariant),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: colorSchema.outlineVariant.withValues(alpha: 0.5),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: colorSchema.primary),
          ),
          filled: true,
          fillColor: enabled
              ? colorSchema.surface
              : colorSchema.surfaceContainerHighest.withValues(alpha: 0.5),
        ),
      ),
      popupProps: PopupProps.menu(
        showSearchBox: true,
        searchFieldProps: TextFieldProps(
          decoration: InputDecoration(
            hintText: searchHint ?? 'Cari...',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
          ),
        ),
      ),
    );
  }

  Widget _fieldLabel(BuildContext context, String text) {
    final bodyStyle = GlobalHelper.getTextTheme(
      context,
      appTextStyle: AppTextStyle.BODY_SMALL,
    );
    final colorSchema = GlobalHelper.getColorSchema(context);

    return Text(
      text,
      style: bodyStyle?.copyWith(
        fontWeight: FontWeight.w600,
        color: colorSchema.onSurface,
      ),
    );
  }

  Widget _editField({
    required BuildContext context,
    required TextEditingController controller,
    required String hintText,
    required TextInputType keyboardType,
    required ValueChanged<String> onChanged,
    int maxLines = 1,
    List<TextInputFormatter>? inputFormatters,
  }) {
    final bodyStyle = GlobalHelper.getTextTheme(
      context,
      appTextStyle: AppTextStyle.BODY_SMALL,
    );
    final colorSchema = GlobalHelper.getColorSchema(context);

    return Container(
      decoration: BoxDecoration(
        color: colorSchema.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colorSchema.outlineVariant),
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        onChanged: onChanged,
        maxLines: maxLines,
        style: bodyStyle?.copyWith(color: colorSchema.onSurface),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: bodyStyle?.copyWith(color: colorSchema.onSurfaceVariant),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
        ),
      ),
    );
  }

  Widget _saveButton(BuildContext context, MerchantInputAddressState state) {
    final titleStyle = GlobalHelper.getTextTheme(
      context,
      appTextStyle: AppTextStyle.TITLE_SMALL,
    );
    final colorSchema = GlobalHelper.getColorSchema(context);

    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: (state.isLoading || !state.isValid)
            ? null
            : () => context.read<MerchantInputAddressBloc>().add(
                MerchantInputAddressEventSaved(),
              ),
        style: ElevatedButton.styleFrom(
          backgroundColor: colorSchema.primary,
          disabledBackgroundColor: colorSchema.primary.withValues(alpha: 0.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          elevation: 0,
        ),
        child: Text(
          'Simpan Perubahan',
          style: titleStyle?.copyWith(
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class _MapLocationPicker extends StatelessWidget {
  const _MapLocationPicker({
    required this.onTap,
    required this.latitude,
    required this.longitude,
  });

  final VoidCallback onTap;
  final double latitude;
  final double longitude;

  @override
  Widget build(BuildContext context) {
    final colorSchema = GlobalHelper.getColorSchema(context);
    final isLocationSet = latitude != 0.0 && longitude != 0.0;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          color: colorSchema.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: colorSchema.outlineVariant),
        ),
        clipBehavior: Clip.hardEdge,
        child: Stack(
          children: [
            Positioned.fill(
              child: IgnorePointer(
                child: GoogleMap(
                  key: ValueKey('map_${latitude}_$longitude'),
                  mapType: MapType.normal,
                  initialCameraPosition: CameraPosition(
                    target: isLocationSet
                        ? LatLng(latitude, longitude)
                        : const LatLng(-6.200000, 106.816666),
                    zoom: isLocationSet ? 15.0 : 4.0,
                  ),
                  zoomControlsEnabled: false,
                  scrollGesturesEnabled: false,
                  zoomGesturesEnabled: false,
                  tiltGesturesEnabled: false,
                  rotateGesturesEnabled: false,
                  myLocationButtonEnabled: false,
                  compassEnabled: false,
                  mapToolbarEnabled: false,
                  markers: isLocationSet
                      ? {
                          Marker(
                            markerId: const MarkerId('merchant_location'),
                            position: LatLng(latitude, longitude),
                          ),
                        }
                      : {},
                ),
              ),
            ),
            if (!isLocationSet)
              Center(
                child: Icon(
                  Icons.location_on,
                  color: colorSchema.primary,
                  size: 36,
                ),
              ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: colorSchema.surface.withValues(alpha: 0.9),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                  border: Border(
                    top: BorderSide(color: colorSchema.outlineVariant),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: 16,
                      color: colorSchema.primary,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      isLocationSet ? 'Ubah Lokasi' : 'Ambil Lokasi',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: colorSchema.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
