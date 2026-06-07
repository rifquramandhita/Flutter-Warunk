import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/customer/presentation/input_address/bloc/customer_input_address_bloc.dart';
import 'package:warunk/core/dependency/dependency.dart';
import 'package:warunk/core/helper/global_helper.dart';
import 'package:warunk/core/helper/dialog_helper.dart';
import 'package:warunk/core/widgets/loading_app_widget.dart';
import 'package:warunk/main.dart';
import 'package:warunk/app/features/customer/presentation/address_map/customer_address_maps_screen.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomerInputAddressScreen extends StatelessWidget {
  final String? addressId;

  final TextEditingController _labelCtrl = TextEditingController();
  final TextEditingController _recipientNameCtrl = TextEditingController();
  final TextEditingController _phoneCtrl = TextEditingController();
  final TextEditingController _provinceCtrl = TextEditingController();
  final TextEditingController _cityCtrl = TextEditingController();
  final TextEditingController _districtCtrl = TextEditingController();
  final TextEditingController _postalCodeCtrl = TextEditingController();
  final TextEditingController _addressCtrl = TextEditingController();
  final TextEditingController _notesCtrl = TextEditingController();

  CustomerInputAddressScreen({super.key, this.addressId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<CustomerInputAddressBloc>()
            ..add(CustomerInputAddressEventInit(id: addressId)),
      child: MultiBlocListener(
        listeners: [
          BlocListener<CustomerInputAddressBloc, CustomerInputAddressState>(
            listenWhen: (previous, current) =>
                !previous.isInitialLoaded &&
                current.isInitialLoaded &&
                current.latitude == 0.0 &&
                current.longitude == 0.0,
            listener: (context, state) {
              WidgetsBinding.instance.addPostFrameCallback((_) async {
                final result = await navigatorKey.currentState?.push(
                  MaterialPageRoute(
                    builder: (context) => CustomerAddressMapsScreen(
                      initialLatitude: state.latitude,
                      initialLongitude: state.longitude,
                    ),
                  ),
                );

                if (result != null && result is LatLng && context.mounted) {
                  context.read<CustomerInputAddressBloc>().add(
                    CustomerInputAddressEventLocationChanged(
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
          BlocListener<CustomerInputAddressBloc, CustomerInputAddressState>(
            listener: (context, state) {
              if (_labelCtrl.text != state.label) _labelCtrl.text = state.label;
              if (_recipientNameCtrl.text != state.recipientName)
                _recipientNameCtrl.text = state.recipientName;
              if (_phoneCtrl.text != state.phone) _phoneCtrl.text = state.phone;
              if (_provinceCtrl.text != state.province)
                _provinceCtrl.text = state.province;
              if (_cityCtrl.text != state.city) _cityCtrl.text = state.city;
              if (_districtCtrl.text != state.district)
                _districtCtrl.text = state.district;
              if (_postalCodeCtrl.text != state.postalCode)
                _postalCodeCtrl.text = state.postalCode;
              if (_addressCtrl.text != state.address)
                _addressCtrl.text = state.address;
              if (_notesCtrl.text != state.notes) _notesCtrl.text = state.notes;

              if (state.errorMessage != null) {
                DialogHelper.showErrorSnackBar(
                  context: context,
                  text: state.errorMessage!,
                );
              }
              if (state.isSuccess) {
                DialogHelper.showBottomSheetDialog(
                  context: context,
                  title: "Berhasil",
                  content: Column(
                    children: [
                      const Text("Alamat berhasil disimpan"),
                      const SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        height: 52,
                        child: ElevatedButton(
                          onPressed: () {
                            navigatorKey.currentState
                                ?.pop(); // close bottom sheet
                            navigatorKey.currentState?.pop(
                              true,
                            ); // close screen and return true
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
                            "Tutup",
                            style:
                                GlobalHelper.getTextTheme(
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
        child: BlocBuilder<CustomerInputAddressBloc, CustomerInputAddressState>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  addressId == null ? 'Tambah Alamat' : 'Ubah Alamat',
                ),
              ),
              body: _bodyBuild(context),
            );
          },
        ),
      ),
    );
  }

  Widget _bodyBuild(BuildContext context) {
    final state = context.watch<CustomerInputAddressBloc>().state;
    return SafeArea(
      child: Stack(
        children: [
          if (state.isInitialLoaded)
            _bodyLayout(context)
          else
            const Center(child: CircularProgressIndicator()),
          if (state.isLoading) const LoadingAppWidget(),
        ],
      ),
    );
  }

  Widget _bodyLayout(BuildContext context) {
    final state = context.watch<CustomerInputAddressBloc>().state;
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
                  builder: (context) => CustomerAddressMapsScreen(
                    initialLatitude: state.latitude,
                    initialLongitude: state.longitude,
                  ),
                ),
              );

              if (result != null && result is LatLng && context.mounted) {
                context.read<CustomerInputAddressBloc>().add(
                  CustomerInputAddressEventLocationChanged(
                    result.longitude,
                    result.latitude,
                  ),
                );
              }
            },
          ),
          const SizedBox(height: 20),
          _fieldLabel(context, 'Label Alamat (Contoh: Rumah, Kantor)'),
          const SizedBox(height: 8),
          _editField(
            context: context,
            controller: _labelCtrl,
            hintText: 'Masukkan label alamat',
            keyboardType: TextInputType.text,
            onChanged: (v) => context.read<CustomerInputAddressBloc>().add(
              CustomerInputAddressEventLabelChanged(v),
            ),
          ),

          const SizedBox(height: 20),
          _fieldLabel(context, 'Nama Penerima'),
          const SizedBox(height: 8),
          _editField(
            context: context,
            controller: _recipientNameCtrl,
            hintText: 'Masukkan nama penerima',
            keyboardType: TextInputType.text,
            onChanged: (v) => context.read<CustomerInputAddressBloc>().add(
              CustomerInputAddressEventRecipientNameChanged(v),
            ),
          ),

          const SizedBox(height: 20),
          _fieldLabel(context, 'Nomor Telepon'),
          const SizedBox(height: 8),
          _editField(
            context: context,
            controller: _phoneCtrl,
            hintText: 'Masukkan nomor telepon',
            keyboardType: TextInputType.phone,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            onChanged: (v) => context.read<CustomerInputAddressBloc>().add(
              CustomerInputAddressEventPhoneChanged(v),
            ),
          ),

          const SizedBox(height: 20),
          _fieldLabel(context, 'Provinsi'),
          const SizedBox(height: 8),
          _editField(
            context: context,
            controller: _provinceCtrl,
            hintText: 'Masukkan provinsi',
            keyboardType: TextInputType.text,
            onChanged: (v) => context.read<CustomerInputAddressBloc>().add(
              CustomerInputAddressEventProvinceChanged(v),
            ),
          ),

          const SizedBox(height: 20),
          _fieldLabel(context, 'Kota / Kabupaten'),
          const SizedBox(height: 8),
          _editField(
            context: context,
            controller: _cityCtrl,
            hintText: 'Masukkan kota',
            keyboardType: TextInputType.text,
            onChanged: (v) => context.read<CustomerInputAddressBloc>().add(
              CustomerInputAddressEventCityChanged(v),
            ),
          ),

          const SizedBox(height: 20),
          _fieldLabel(context, 'Kecamatan'),
          const SizedBox(height: 8),
          _editField(
            context: context,
            controller: _districtCtrl,
            hintText: 'Masukkan kecamatan',
            keyboardType: TextInputType.text,
            onChanged: (v) => context.read<CustomerInputAddressBloc>().add(
              CustomerInputAddressEventDistrictChanged(v),
            ),
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
            onChanged: (v) => context.read<CustomerInputAddressBloc>().add(
              CustomerInputAddressEventPostalCodeChanged(v),
            ),
          ),

          const SizedBox(height: 20),
          _fieldLabel(context, 'Alamat Lengkap'),
          const SizedBox(height: 8),
          _editField(
            context: context,
            controller: _addressCtrl,
            hintText: 'Nama jalan, gedung, no rumah',
            keyboardType: TextInputType.streetAddress,
            maxLines: 3,
            onChanged: (v) => context.read<CustomerInputAddressBloc>().add(
              CustomerInputAddressEventAddressChanged(v),
            ),
          ),

          const SizedBox(height: 20),
          _fieldLabel(context, 'Catatan (Opsional)'),
          const SizedBox(height: 8),
          _editField(
            context: context,
            controller: _notesCtrl,
            hintText: 'Patokan lokasi, warna pagar, dsb.',
            keyboardType: TextInputType.text,
            onChanged: (v) => context.read<CustomerInputAddressBloc>().add(
              CustomerInputAddressEventNotesChanged(v),
            ),
          ),

          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _fieldLabel(context, 'Jadikan Alamat Utama'),
              Switch(
                value: state.isDefault,
                onChanged: (val) {
                  context.read<CustomerInputAddressBloc>().add(
                    CustomerInputAddressEventIsDefaultChanged(val),
                  );
                },
                activeThumbColor: GlobalHelper.getColorSchema(context).primary,
              ),
            ],
          ),

          const SizedBox(height: 32),
          _saveButton(context),
        ],
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

  Widget _saveButton(BuildContext context) {
    final state = context.watch<CustomerInputAddressBloc>().state;
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
            : () => context.read<CustomerInputAddressBloc>().add(
                CustomerInputAddressEventSaved(),
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
          'Simpan Alamat',
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
                            markerId: const MarkerId('customer_location'),
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
