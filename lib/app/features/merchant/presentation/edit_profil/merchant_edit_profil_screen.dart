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
import 'package:dropdown_search/dropdown_search.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_category.dart';

class MerchantEditProfilScreen extends StatefulWidget {
  final bool isSetupMode;
  const MerchantEditProfilScreen({super.key, this.isSetupMode = false});

  @override
  State<MerchantEditProfilScreen> createState() =>
      _MerchantEditProfilScreenState();
}

class _MerchantEditProfilScreenState extends State<MerchantEditProfilScreen> {
  int _currentStep = 0;

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
                      navigatorKey.currentState?.pop(); // close dialog
                      if (widget.isSetupMode) {
                        navigatorKey.currentState?.pop(); // go back to previous screen
                      }
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
    return AppBar(title: Text('Edit Informasi Toko'));
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
    if (widget.isSetupMode) {
      return _buildWizardForm(context, state);
    }
    return _buildRegularForm(context, state);
  }

  Widget _buildWizardForm(BuildContext context, MerchantEditProfilState state) {
    return Theme(
      data: Theme.of(context).copyWith(
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: GlobalHelper.getColorSchema(context).primary,
            ),
      ),
      child: Stepper(
        currentStep: _currentStep,
        type: StepperType.vertical,
        physics: const ClampingScrollPhysics(),
        onStepTapped: (step) => setState(() => _currentStep = step),
        onStepContinue: () {
          if (_currentStep < 4) {
            setState(() => _currentStep += 1);
          } else {
            context
                .read<MerchantEditProfilBloc>()
                .add(MerchantEditProfilEventSubmit());
          }
        },
        onStepCancel: () {
          if (_currentStep > 0) {
            setState(() => _currentStep -= 1);
          }
        },
        controlsBuilder: (context, details) {
          return Container(
            margin: const EdgeInsets.only(top: 24),
            child: Row(
              children: [
                if (_currentStep < 4)
                  Expanded(
                    child: ElevatedButton(
                      onPressed: details.onStepContinue,
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            GlobalHelper.getColorSchema(context).primary,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      child: const Text('Selanjutnya',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                  )
                else
                  Expanded(
                    child: ElevatedButton(
                      onPressed: details.onStepContinue,
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            GlobalHelper.getColorSchema(context).primary,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      child: const Text('Simpan Perubahan',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                if (_currentStep > 0) ...[
                  const SizedBox(width: 12),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: details.onStepCancel,
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        side: BorderSide(
                            color: GlobalHelper.getColorSchema(context).outline),
                      ),
                      child: Text('Kembali',
                          style: TextStyle(
                              color: GlobalHelper.getColorSchema(context).primary,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ],
            ),
          );
        },
        steps: [
          Step(
            title: _fieldLabel(context, 'Foto Toko'),
            content: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: _avatarPicker(context, state),
              ),
            ),
            isActive: _currentStep >= 0,
            state: _currentStep > 0 ? StepState.complete : StepState.indexed,
          ),
          Step(
            title: _fieldLabel(context, 'Nama Toko'),
            content: _editField(
              context: context,
              initialValue: state.name,
              hintText: 'Masukkan nama toko',
              keyboardType: TextInputType.text,
              onChanged: (v) => context.read<MerchantEditProfilBloc>().add(
                    MerchantEditProfilEventNameChanged(v),
                  ),
            ),
            isActive: _currentStep >= 1,
            state: _currentStep > 1 ? StepState.complete : StepState.indexed,
          ),
          Step(
            title: _fieldLabel(context, 'Kategori Toko'),
            content: DropdownSearch<MerchantCategoryEntity>(
              selectedItem: state.selectedCategory,
              items: (filter, loadProps) => state.categories,
              itemAsString: (MerchantCategoryEntity? u) => u?.name ?? '',
              compareFn: (item1, item2) => item1.id == item2.id,
              onSelected: (MerchantCategoryEntity? data) {
                context.read<MerchantEditProfilBloc>().add(
                      MerchantEditProfilEventCategoryChanged(data),
                    );
              },
              decoratorProps: DropDownDecoratorProps(
                decoration: InputDecoration(
                  hintText: "Pilih kategori toko",
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color:
                          GlobalHelper.getColorSchema(context).outlineVariant,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color:
                          GlobalHelper.getColorSchema(context).outlineVariant,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: GlobalHelper.getColorSchema(context).primary,
                    ),
                  ),
                  filled: true,
                  fillColor: GlobalHelper.getColorSchema(context).surface,
                ),
              ),
              popupProps: PopupProps.menu(
                showSearchBox: true,
                searchFieldProps: TextFieldProps(
                  decoration: InputDecoration(
                    hintText: "Cari kategori...",
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
            ),
            isActive: _currentStep >= 2,
            state: _currentStep > 2 ? StepState.complete : StepState.indexed,
          ),
          Step(
            title: _fieldLabel(context, 'No. WhatsApp'),
            content: _editField(
              context: context,
              initialValue: state.whatsappNumber,
              hintText: 'Masukkan nomor WhatsApp',
              keyboardType: TextInputType.phone,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              onChanged: (v) => context.read<MerchantEditProfilBloc>().add(
                    MerchantEditProfilEventWhatsappChanged(v),
                  ),
            ),
            isActive: _currentStep >= 3,
            state: _currentStep > 3 ? StepState.complete : StepState.indexed,
          ),
          Step(
            title: _fieldLabel(context, 'Tentang Toko'),
            content: _editField(
              context: context,
              initialValue: state.about,
              hintText: 'Tuliskan deskripsi singkat tentang toko',
              keyboardType: TextInputType.multiline,
              maxLines: 4,
              onChanged: (v) => context.read<MerchantEditProfilBloc>().add(
                    MerchantEditProfilEventAboutChanged(v),
                  ),
            ),
            isActive: _currentStep >= 4,
            state: _currentStep > 4 ? StepState.complete : StepState.indexed,
          ),
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
    int maxLines = 1,
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
  Widget _buildRegularForm(BuildContext context, MerchantEditProfilState state) {
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
          DropdownSearch<MerchantCategoryEntity>(
            selectedItem: state.selectedCategory,
            items: (filter, loadProps) => state.categories,
            itemAsString: (MerchantCategoryEntity? u) => u?.name ?? '',
            compareFn: (item1, item2) => item1.id == item2.id,
            onSelected: (MerchantCategoryEntity? data) {
              context.read<MerchantEditProfilBloc>().add(
                MerchantEditProfilEventCategoryChanged(data),
              );
            },
            decoratorProps: DropDownDecoratorProps(
              decoration: InputDecoration(
                hintText: "Pilih kategori toko",
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: GlobalHelper.getColorSchema(context).outlineVariant,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: GlobalHelper.getColorSchema(context).outlineVariant,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: GlobalHelper.getColorSchema(context).primary,
                  ),
                ),
                filled: true,
                fillColor: GlobalHelper.getColorSchema(context).surface,
              ),
            ),
            popupProps: PopupProps.menu(
              showSearchBox: true,
              searchFieldProps: TextFieldProps(
                decoration: InputDecoration(
                  hintText: "Cari kategori...",
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
          const SizedBox(height: 20),
          _fieldLabel(context, 'Tentang Toko'),
          const SizedBox(height: 8),
          _editField(
            context: context,
            initialValue: state.about,
            hintText: 'Tuliskan deskripsi singkat tentang toko',
            keyboardType: TextInputType.multiline,
            maxLines: 4,
            onChanged: (v) => context.read<MerchantEditProfilBloc>().add(
              MerchantEditProfilEventAboutChanged(v),
            ),
          ),
          const SizedBox(height: 32),
          _saveButton(context, state),
        ],
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
