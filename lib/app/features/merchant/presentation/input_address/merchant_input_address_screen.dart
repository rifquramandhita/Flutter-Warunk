import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/merchant/presentation/input_address/bloc/merchant_input_address_bloc.dart';
import 'package:warunk/core/dependency/dependency.dart';
import 'package:warunk/core/helper/global_helper.dart';
import 'package:warunk/core/helper/dialog_helper.dart';
import 'package:warunk/core/widgets/loading_app_widget.dart';
import 'package:warunk/main.dart';

class MerchantInputAddressScreen extends StatelessWidget {
  const MerchantInputAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<MerchantInputAddressBloc>()..add(MerchantInputAddressEventGet()),
      child: BlocConsumer<MerchantInputAddressBloc, MerchantInputAddressState>(
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
            appBar: _buildAppBar(context),
            body: _bodyBuild(context),
          );
        },
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
          _fieldLabel(context, 'Provinsi'),
          const SizedBox(height: 8),
          _editField(
            context: context,
            initialValue: state.province,
            hintText: '',
            keyboardType: TextInputType.text,
            onChanged: (v) => context.read<MerchantInputAddressBloc>().add(
              MerchantInputAddressEventProvinceChanged(v),
            ),
          ),

          const SizedBox(height: 20),
          _fieldLabel(context, 'Kota'),
          const SizedBox(height: 8),
          _editField(
            context: context,
            initialValue: state.city,
            hintText: '',
            keyboardType: TextInputType.text,
            onChanged: (v) => context.read<MerchantInputAddressBloc>().add(
              MerchantInputAddressEventCityChanged(v),
            ),
          ),

          const SizedBox(height: 20),
          _fieldLabel(context, 'Kecamatan'),
          const SizedBox(height: 8),
          _editField(
            context: context,
            initialValue: state.district,
            hintText: '',
            keyboardType: TextInputType.text,
            onChanged: (v) => context.read<MerchantInputAddressBloc>().add(
              MerchantInputAddressEventDistrictChanged(v),
            ),
          ),

          const SizedBox(height: 20),
          _fieldLabel(context, 'Kode Pos'),
          const SizedBox(height: 8),
          _editField(
            context: context,
            initialValue: state.postalCode,
            hintText: '',
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
            initialValue: state.address,
            hintText: '',
            keyboardType: TextInputType.text,
            maxLines: 3,
            onChanged: (v) => context.read<MerchantInputAddressBloc>().add(
              MerchantInputAddressEventAddressChanged(v),
            ),
          ),

          const SizedBox(height: 20),
          _fieldLabel(context, 'Titik Lokasi'),
          const SizedBox(height: 8),
          _MapLocationPicker(
            latitude: state.latitude,
            longitude: state.longitude,
            onTap: () {
              // Simulate map picking for now based on user cURL
              context.read<MerchantInputAddressBloc>().add(
                MerchantInputAddressEventLocationChanged(106.799286, -6.244669),
              );
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('Lokasi terpilih (Mock)'),
                  backgroundColor: GlobalHelper.getColorSchema(context).primary,
                ),
              );
            },
          ),

          const SizedBox(height: 32),
          _saveButton(context, state),
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
