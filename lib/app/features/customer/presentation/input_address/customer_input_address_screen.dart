import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/customer/presentation/input_address/bloc/customer_input_address_bloc.dart';
import 'package:warunk/core/dependency/dependency.dart';
import 'package:warunk/core/helper/global_helper.dart';
import 'package:warunk/core/helper/dialog_helper.dart';
import 'package:warunk/core/widgets/loading_app_widget.dart';
import 'package:warunk/main.dart';

class CustomerInputAddressScreen extends StatelessWidget {
  final String? addressId;

  const CustomerInputAddressScreen({super.key, this.addressId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<CustomerInputAddressBloc>()
            ..add(CustomerInputAddressEventInit(id: addressId)),
      child: BlocConsumer<CustomerInputAddressBloc, CustomerInputAddressState>(
        listener: (context, state) {
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
                        navigatorKey.currentState?.pop(); // close bottom sheet
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
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(addressId == null ? 'Tambah Alamat' : 'Ubah Alamat'),
            ),
            body: _bodyBuild(context),
          );
        },
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
          _fieldLabel(context, 'Label Alamat (Contoh: Rumah, Kantor)'),
          const SizedBox(height: 8),
          _editField(
            context: context,
            initialValue: state.label,
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
            initialValue: state.recipientName,
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
            initialValue: state.phone,
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
            initialValue: state.province,
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
            initialValue: state.city,
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
            initialValue: state.district,
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
            initialValue: state.postalCode,
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
            initialValue: state.address,
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
            initialValue: state.notes,
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

          const SizedBox(height: 20),
          _fieldLabel(context, 'Titik Lokasi'),
          const SizedBox(height: 8),
          _mapLocationPicker(
            context: context,
            latitude: state.latitude,
            longitude: state.longitude,
            onTap: () {
              // Simulate map picking
              context.read<CustomerInputAddressBloc>().add(
                const CustomerInputAddressEventLocationChanged(
                  106.8229,
                  -6.1944,
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text(
                    'Titik lokasi berhasil ditambahkan (Mock)',
                  ),
                  backgroundColor: GlobalHelper.getColorSchema(context).primary,
                ),
              );
            },
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
    required String initialValue,
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
        initialValue: initialValue,
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

  Widget _mapLocationPicker({
    required BuildContext context,
    required VoidCallback onTap,
    required double latitude,
    required double longitude,
  }) {
    final colorSchema = GlobalHelper.getColorSchema(context);
    final isLocationSet = latitude != 0.0 && longitude != 0.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: 120,
            decoration: BoxDecoration(
              color: colorSchema.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: colorSchema.outlineVariant),
            ),
            child: Stack(
              children: [
                Positioned.fill(
                  child: CustomPaint(painter: _MapLinesPainter()),
                ),
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
                          'Ambil Lokasi',
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
        ),
        if (isLocationSet) ...[
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: colorSchema.surface,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: colorSchema.outlineVariant),
            ),
            child: Row(
              children: [
                Icon(Icons.map_outlined, size: 20, color: colorSchema.primary),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Koordinat Tersimpan',
                        style: GlobalHelper.getTextTheme(
                          context,
                          appTextStyle: AppTextStyle.LABEL_SMALL,
                        )?.copyWith(color: colorSchema.onSurfaceVariant),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        '$latitude, $longitude',
                        style:
                            GlobalHelper.getTextTheme(
                              context,
                              appTextStyle: AppTextStyle.BODY_SMALL,
                            )?.copyWith(
                              color: colorSchema.onSurface,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }
}

class _MapLinesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 6
      ..style = PaintingStyle.stroke;

    canvas.drawLine(
      Offset(0, size.height * 0.3),
      Offset(size.width, size.height * 0.7),
      paint,
    );
    canvas.drawLine(
      Offset(size.width * 0.3, 0),
      Offset(size.width * 0.7, size.height),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
