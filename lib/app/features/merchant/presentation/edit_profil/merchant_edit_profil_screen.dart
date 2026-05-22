import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/merchant/presentation/edit_profil/bloc/merchant_edit_profil_bloc.dart';
import 'package:warunk/core/dependency/dependency.dart';
import 'package:warunk/core/helper/dialog_helper.dart';
import 'package:warunk/core/helper/global_helper.dart';
import 'package:warunk/core/widgets/loading_app_widget.dart';
import 'package:warunk/core/widgets/primary_button.dart';
import 'package:warunk/main.dart';

class MerchantEditProfilScreen extends StatelessWidget {
  const MerchantEditProfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          sl<MerchantEditProfilBloc>()..add(MerchantEditProfilEventGet()),
      child: BlocConsumer<MerchantEditProfilBloc, MerchantEditProfilState>(
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
                  Text("Berhasil memperbarui data merchant"),
                  SizedBox(height: 24),
                  PrimaryButton(
                    label: "Tutup",
                    onPressed: () {
                      navigatorKey.currentState?.pop();
                    },
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
    return AppBar(title: Text('Edit Profil'));
  }

  Widget _bodyBuild(BuildContext context) {
    final state = context.watch<MerchantEditProfilBloc>().state;
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

  Widget _bodyLayout(BuildContext context, MerchantEditProfilState state) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          Center(child: _avatarPicker(context, state)),
          const SizedBox(height: 32),
          _fieldLabel(context, 'Nama Toko'),
          const SizedBox(height: 8),
          _editField(
            context: context,
            initialValue: state.name,
            hintText: 'Masukkan nama toko',
            keyboardType: TextInputType.text,
            onChanged: (v) => context.read<MerchantEditProfilBloc>().add(
              MerchantEditProfilEventNameChanged(v),
            ),
          ),
          const SizedBox(height: 20),
          _fieldLabel(context, 'Kategori Toko'),
          const SizedBox(height: 8),
          _editField(
            context: context,
            initialValue: state.merchantCategoryId,
            hintText: 'Masukkan kategori toko',
            keyboardType: TextInputType.text,
            onChanged: (v) => context.read<MerchantEditProfilBloc>().add(
              MerchantEditProfilEventCategoryChanged(v),
            ),
          ),
          const SizedBox(height: 20),
          _fieldLabel(context, 'No. WhatsApp'),
          const SizedBox(height: 8),
          _editField(
            context: context,
            initialValue: state.whatsappNumber,
            hintText: 'Masukkan nomor WhatsApp',
            keyboardType: TextInputType.phone,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            onChanged: (v) => context.read<MerchantEditProfilBloc>().add(
              MerchantEditProfilEventWhatsappChanged(v),
            ),
          ),
          const SizedBox(height: 32),
          _saveButton(context, state),
        ],
      ),
    );
  }

  Widget _avatarPicker(BuildContext context, MerchantEditProfilState state) {
    final colorSchema = GlobalHelper.getColorSchema(context);

    Widget imageWidget;
    if (state.photoFile != null) {
      imageWidget = Image.file(
        state.photoFile!,
        fit: BoxFit.cover,
        width: 90,
        height: 90,
      );
    } else if (state.photoUrl != null && state.photoUrl!.isNotEmpty) {
      imageWidget = Image.network(
        state.photoUrl!,
        fit: BoxFit.cover,
        width: 90,
        height: 90,
        errorBuilder: (context, error, stackTrace) =>
            _placeholderImage(colorSchema),
      );
    } else {
      imageWidget = _placeholderImage(colorSchema);
    }

    return GestureDetector(
      onTap: () => context.read<MerchantEditProfilBloc>().add(
        MerchantEditProfilEventPhotoPicked(),
      ),
      child: Stack(
        children: [
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colorSchema.primary.withValues(alpha: 0.15),
              border: Border.all(
                color: colorSchema.primary.withValues(alpha: 0.3),
                width: 2,
              ),
            ),
            child: ClipOval(child: imageWidget),
          ),
          Positioned(
            bottom: 2,
            right: 2,
            child: Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: colorSchema.surface,
                shape: BoxShape.circle,
                border: Border.all(color: colorSchema.primary, width: 1.5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Icon(
                Icons.camera_alt_outlined,
                size: 15,
                color: colorSchema.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _placeholderImage(ColorScheme colorSchema) {
    return Container(
      color: const Color(0xFF2D6A4F).withValues(alpha: 0.2),
      child: const Center(child: Text('🏪', style: TextStyle(fontSize: 40))),
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

  Widget _saveButton(BuildContext context, MerchantEditProfilState state) {
    final titleStyle = GlobalHelper.getTextTheme(
      context,
      appTextStyle: AppTextStyle.TITLE_SMALL,
    );
    final colorSchema = GlobalHelper.getColorSchema(context);

    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: () => context.read<MerchantEditProfilBloc>().add(
          MerchantEditProfilEventSubmit(),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: colorSchema.primary,
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
