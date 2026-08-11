import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:dropdown_search/dropdown_search.dart';

import 'package:warunk/app/features/merchant/domain/entity/merchant_category.dart';
import 'package:warunk/app/features/merchant/presentation/edit_profil/bloc/merchant_edit_profil_bloc.dart';
import 'package:warunk/app/features/merchant/presentation/input_address/bloc/merchant_input_address_bloc.dart';
import 'package:warunk/app/features/merchant/presentation/operational_hours/bloc/merchant_operational_hours_bloc.dart';
import 'package:warunk/app/features/merchant/presentation/shipping/bloc/merchant_shipping_bloc.dart';
import 'package:warunk/app/features/merchant/presentation/input_product/merchant_input_product_screen.dart';
import 'package:warunk/app/features/merchant/presentation/maps/merchant_maps_screen.dart';

import 'package:warunk/core/dependency/dependency.dart';
import 'package:warunk/core/helper/dialog_helper.dart';
import 'package:warunk/core/helper/global_helper.dart';
import 'package:warunk/core/widgets/loading_app_widget.dart';
import 'package:warunk/core/widgets/primary_button.dart';
import 'package:warunk/main.dart';

enum SetupSaveState { idle, savingProfile, savingAddress, savingOperational, savingShipping, done }

class MerchantSetupScreen extends StatefulWidget {
  const MerchantSetupScreen({super.key});

  @override
  State<MerchantSetupScreen> createState() => _MerchantSetupScreenState();
}

class _MerchantSetupScreenState extends State<MerchantSetupScreen> {
  int _currentStep = 0;
  SetupSaveState _saveState = SetupSaveState.idle;

  // Controllers for address
  final TextEditingController _provinceCtrl = TextEditingController();
  final TextEditingController _cityCtrl = TextEditingController();
  final TextEditingController _districtCtrl = TextEditingController();
  final TextEditingController _postalCodeCtrl = TextEditingController();
  final TextEditingController _addressCtrl = TextEditingController();

  @override
  void dispose() {
    _provinceCtrl.dispose();
    _cityCtrl.dispose();
    _districtCtrl.dispose();
    _postalCodeCtrl.dispose();
    _addressCtrl.dispose();
    super.dispose();
  }

  void _submitAll(BuildContext context) {
    setState(() => _saveState = SetupSaveState.savingProfile);
    context.read<MerchantEditProfilBloc>().add(MerchantEditProfilEventSubmit());
  }

  void _showSuccessDialog() {
    DialogHelper.showBottomSheetDialog(
      context: context,
      title: "Toko Berhasil Diatur!",
      canDismiss: false,
      content: Column(
        children: [
          const Text("Langkah selanjutnya, yuk tambahkan produk pertama Anda agar pelanggan bisa mulai berbelanja."),
          const SizedBox(height: 24),
          PrimaryButton(
            label: "Tambah Produk Sekarang",
            onPressed: () async {
              navigatorKey.currentState?.pop(); // close dialog
              final result = await navigatorKey.currentState?.push(
                MaterialPageRoute(
                  builder: (_) => const MerchantInputProductScreen(isSetupMode: true),
                ),
              );
              if (result == true) {
                navigatorKey.currentState?.pop(true);
              }
            },
          ),
          const SizedBox(height: 12),
          TextButton(
            onPressed: () {
              navigatorKey.currentState?.pop(); // close dialog
              navigatorKey.currentState?.pop(true); // go back to dashboard
            },
            child: const Text('Nanti saja', style: TextStyle(color: Colors.grey)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<MerchantEditProfilBloc>()..add(MerchantEditProfilEventGet())),
        BlocProvider(create: (_) => sl<MerchantInputAddressBloc>()..add(MerchantInputAddressEventGet())),
        BlocProvider(create: (_) => sl<MerchantOperationalHoursBloc>()..add(MerchantOperationalHoursEventGet())),
        BlocProvider(create: (_) => sl<MerchantShippingBloc>()..add(MerchantShippingGet())),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<MerchantEditProfilBloc, MerchantEditProfilState>(
            listener: (context, state) {
              if (state.errorMessage != null && _saveState == SetupSaveState.savingProfile) {
                setState(() => _saveState = SetupSaveState.idle);
                DialogHelper.showErrorSnackBar(context: context, text: state.errorMessage!);
              }
              if (state.isSuccess && _saveState == SetupSaveState.savingProfile) {
                setState(() => _saveState = SetupSaveState.savingAddress);
                context.read<MerchantInputAddressBloc>().add(MerchantInputAddressEventSaved());
              }
            },
          ),
          BlocListener<MerchantInputAddressBloc, MerchantInputAddressState>(
            listener: (context, state) {
              if (_provinceCtrl.text != state.province) _provinceCtrl.text = state.province;
              if (_cityCtrl.text != state.city) _cityCtrl.text = state.city;
              if (_districtCtrl.text != state.district) _districtCtrl.text = state.district;
              if (_postalCodeCtrl.text != state.postalCode) _postalCodeCtrl.text = state.postalCode;
              if (_addressCtrl.text != state.address) _addressCtrl.text = state.address;

              if (state.errorMessage != null && _saveState == SetupSaveState.savingAddress) {
                setState(() => _saveState = SetupSaveState.idle);
                DialogHelper.showErrorSnackBar(context: context, text: state.errorMessage!);
              }
              if (state.isSuccess && _saveState == SetupSaveState.savingAddress) {
                setState(() => _saveState = SetupSaveState.savingOperational);
                context.read<MerchantOperationalHoursBloc>().add(MerchantOperationalHoursEventSaved());
              }
            },
          ),
          BlocListener<MerchantOperationalHoursBloc, MerchantOperationalHoursState>(
            listener: (context, state) {
              if (state.errorMessage != null && _saveState == SetupSaveState.savingOperational) {
                setState(() => _saveState = SetupSaveState.idle);
                DialogHelper.showErrorSnackBar(context: context, text: state.errorMessage!);
              }
              if (state.isSaved && _saveState == SetupSaveState.savingOperational) {
                setState(() => _saveState = SetupSaveState.savingShipping);
                context.read<MerchantShippingBloc>().add(MerchantShippingSaved());
              }
            },
          ),
          BlocListener<MerchantShippingBloc, MerchantShippingState>(
            listener: (context, state) {
              if (state.errorMessage != null && _saveState == SetupSaveState.savingShipping) {
                setState(() => _saveState = SetupSaveState.idle);
                DialogHelper.showErrorSnackBar(context: context, text: state.errorMessage!);
              }
              if (state.isSaved && _saveState == SetupSaveState.savingShipping) {
                setState(() => _saveState = SetupSaveState.done);
                _showSuccessDialog();
              }
            },
          ),
        ],
        child: Scaffold(
          appBar: AppBar(title: const Text('Setup Toko')),
          body: _bodyBuild(),
        ),
      ),
    );
  }

  Widget _bodyBuild() {
    return Builder(
      builder: (context) {
        final profileState = context.watch<MerchantEditProfilBloc>().state;
        final addressState = context.watch<MerchantInputAddressBloc>().state;
        final hoursState = context.watch<MerchantOperationalHoursBloc>().state;
        final shippingState = context.watch<MerchantShippingBloc>().state;

        final isInitialLoaded = profileState.isInitialLoaded && addressState.isInitialLoaded;
        final isLoadingData = profileState.isLoading || addressState.isLoading || hoursState.isLoading || shippingState.isLoadingData;
        final isSaving = _saveState != SetupSaveState.idle;

        return SafeArea(
          child: Stack(
            children: [
              if (isInitialLoaded)
                _buildWizardForm(context, profileState, addressState, hoursState, shippingState)
              else
                const Center(child: CircularProgressIndicator()),
              if (isLoadingData || isSaving) const LoadingAppWidget(),
            ],
          ),
        );
      }
    );
  }

  Widget _buildWizardForm(
    BuildContext context, 
    MerchantEditProfilState profileState,
    MerchantInputAddressState addressState,
    MerchantOperationalHoursState hoursState,
    MerchantShippingState shippingState,
  ) {
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
          if (_currentStep < 7) {
            setState(() => _currentStep += 1);
          } else {
            _submitAll(context);
          }
        },
        onStepCancel: () {
          if (_currentStep > 0) {
            setState(() => _currentStep -= 1);
          }
        },
        controlsBuilder: (context, details) {
          final isLocationSet = addressState.latitude != 0.0 && addressState.longitude != 0.0;
          final isAddressStepValid = _currentStep != 5 || isLocationSet;

          return Container(
            margin: const EdgeInsets.only(top: 24, bottom: 24),
            child: Row(
              children: [
                if (_currentStep < 7)
                  Expanded(
                    child: ElevatedButton(
                      onPressed: isAddressStepValid ? details.onStepContinue : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isAddressStepValid ? GlobalHelper.getColorSchema(context).primary : Colors.grey.shade400,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      child: const Text('Selanjutnya', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    ),
                  )
                else
                  Expanded(
                    child: ElevatedButton(
                      onPressed: details.onStepContinue,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: GlobalHelper.getColorSchema(context).primary,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      child: const Text('Simpan Pengaturan', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
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
                        side: BorderSide(color: GlobalHelper.getColorSchema(context).outline),
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
          // Step 0: Profile Foto
          Step(
            title: _fieldLabel(context, 'Foto Toko'),
            content: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: _avatarPicker(context, profileState),
              ),
            ),
            isActive: _currentStep >= 0,
            state: _currentStep > 0 ? StepState.complete : StepState.indexed,
          ),
          // Step 1: Profile Nama
          Step(
            title: _fieldLabel(context, 'Nama Toko'),
            content: _editField(
              context: context,
              initialValue: profileState.name,
              hintText: 'Masukkan nama toko',
              keyboardType: TextInputType.text,
              onChanged: (v) => context.read<MerchantEditProfilBloc>().add(MerchantEditProfilEventNameChanged(v)),
            ),
            isActive: _currentStep >= 1,
            state: _currentStep > 1 ? StepState.complete : StepState.indexed,
          ),
          // Step 2: Profile Kategori
          Step(
            title: _fieldLabel(context, 'Kategori Toko'),
            content: _categoryDropdown(context, profileState),
            isActive: _currentStep >= 2,
            state: _currentStep > 2 ? StepState.complete : StepState.indexed,
          ),
          // Step 3: Profile WA
          Step(
            title: _fieldLabel(context, 'No. WhatsApp'),
            content: _editField(
              context: context,
              initialValue: profileState.whatsappNumber,
              hintText: 'Masukkan nomor WhatsApp',
              keyboardType: TextInputType.phone,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              onChanged: (v) => context.read<MerchantEditProfilBloc>().add(MerchantEditProfilEventWhatsappChanged(v)),
            ),
            isActive: _currentStep >= 3,
            state: _currentStep > 3 ? StepState.complete : StepState.indexed,
          ),
          // Step 4: Profile Tentang
          Step(
            title: _fieldLabel(context, 'Tentang Toko'),
            content: _editField(
              context: context,
              initialValue: profileState.about,
              hintText: 'Tuliskan deskripsi singkat tentang toko',
              keyboardType: TextInputType.multiline,
              maxLines: 4,
              onChanged: (v) => context.read<MerchantEditProfilBloc>().add(MerchantEditProfilEventAboutChanged(v)),
            ),
            isActive: _currentStep >= 4,
            state: _currentStep > 4 ? StepState.complete : StepState.indexed,
          ),
          // Step 5: Address
          Step(
            title: _fieldLabel(context, 'Alamat Toko'),
            content: _addressForm(context, addressState),
            isActive: _currentStep >= 5,
            state: _currentStep > 5 ? StepState.complete : StepState.indexed,
          ),
          // Step 6: Operational Hours
          Step(
            title: _fieldLabel(context, 'Jam Operasional'),
            content: _hoursForm(context, hoursState),
            isActive: _currentStep >= 6,
            state: _currentStep > 6 ? StepState.complete : StepState.indexed,
          ),
          // Step 7: Shipping
          Step(
            title: _fieldLabel(context, 'Metode Pengiriman'),
            content: _shippingForm(context, shippingState),
            isActive: _currentStep >= 7,
            state: _currentStep > 7 ? StepState.complete : StepState.indexed,
          ),
        ],
      ),
    );
  }

  // --- Profile UI Helpers ---
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
        errorBuilder: (context, error, stackTrace) => _placeholderImage(colorSchema),
      );
    } else {
      imageWidget = _placeholderImage(colorSchema);
    }

    return GestureDetector(
      onTap: () => context.read<MerchantEditProfilBloc>().add(MerchantEditProfilEventPhotoPicked()),
      child: Stack(
        children: [
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colorSchema.primary.withValues(alpha: 0.15),
              border: Border.all(color: colorSchema.primary.withValues(alpha: 0.3), width: 2),
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
                boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.1), blurRadius: 4)],
              ),
              child: Icon(Icons.camera_alt_outlined, size: 15, color: colorSchema.primary),
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
    final bodyStyle = GlobalHelper.getTextTheme(context, appTextStyle: AppTextStyle.BODY_SMALL);
    final colorSchema = GlobalHelper.getColorSchema(context);

    return Text(
      text,
      style: bodyStyle?.copyWith(fontWeight: FontWeight.w600, color: colorSchema.onSurface),
    );
  }

  Widget _editField({
    required BuildContext context,
    String? initialValue,
    TextEditingController? controller,
    required String hintText,
    required TextInputType keyboardType,
    required ValueChanged<String> onChanged,
    List<TextInputFormatter>? inputFormatters,
    int maxLines = 1,
    bool enabled = true,
  }) {
    final bodyStyle = GlobalHelper.getTextTheme(context, appTextStyle: AppTextStyle.BODY_SMALL);
    final colorSchema = GlobalHelper.getColorSchema(context);

    return Container(
      decoration: BoxDecoration(
        color: enabled ? colorSchema.surface : colorSchema.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colorSchema.outlineVariant),
      ),
      child: TextFormField(
        initialValue: initialValue,
        controller: controller,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        onChanged: onChanged,
        maxLines: maxLines,
        enabled: enabled,
        style: bodyStyle?.copyWith(color: colorSchema.onSurface),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: bodyStyle?.copyWith(color: colorSchema.onSurfaceVariant),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
      ),
    );
  }

  Widget _categoryDropdown(BuildContext context, MerchantEditProfilState state) {
    return DropdownSearch<MerchantCategoryEntity>(
      selectedItem: state.selectedCategory,
      items: (filter, loadProps) => state.categories,
      itemAsString: (MerchantCategoryEntity? u) => u?.name ?? '',
      compareFn: (item1, item2) => item1.id == item2.id,
      onSelected: (MerchantCategoryEntity? data) {
        context.read<MerchantEditProfilBloc>().add(MerchantEditProfilEventCategoryChanged(data));
      },
      decoratorProps: DropDownDecoratorProps(
        decoration: InputDecoration(
          hintText: "Pilih kategori toko",
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: GlobalHelper.getColorSchema(context).outlineVariant),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: GlobalHelper.getColorSchema(context).outlineVariant),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: GlobalHelper.getColorSchema(context).primary),
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
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          ),
        ),
      ),
    );
  }

  // --- Address UI Helpers ---
  Widget _addressForm(BuildContext context, MerchantInputAddressState state) {
    final isLocationSet = state.latitude != 0.0 && state.longitude != 0.0;
    return Column(
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
              context.read<MerchantInputAddressBloc>().add(MerchantInputAddressEventLocationChanged(result.longitude, result.latitude));
            }
          },
        ),
        if (isLocationSet) ...[
          const SizedBox(height: 20),
          _fieldLabel(context, 'Provinsi'),
          const SizedBox(height: 8),
          _editField(
            context: context,
            controller: _provinceCtrl,
            hintText: '',
            keyboardType: TextInputType.text,
            enabled: isLocationSet,
            onChanged: (v) => context.read<MerchantInputAddressBloc>().add(MerchantInputAddressEventProvinceChanged(v)),
          ),
          const SizedBox(height: 20),
          _fieldLabel(context, 'Kota'),
          const SizedBox(height: 8),
          _editField(
            context: context,
            controller: _cityCtrl,
            hintText: '',
            keyboardType: TextInputType.text,
            enabled: isLocationSet,
            onChanged: (v) => context.read<MerchantInputAddressBloc>().add(MerchantInputAddressEventCityChanged(v)),
          ),
          const SizedBox(height: 20),
          _fieldLabel(context, 'Kecamatan'),
          const SizedBox(height: 8),
          _editField(
            context: context,
            controller: _districtCtrl,
            hintText: '',
            keyboardType: TextInputType.text,
            enabled: isLocationSet,
            onChanged: (v) => context.read<MerchantInputAddressBloc>().add(MerchantInputAddressEventDistrictChanged(v)),
          ),
          const SizedBox(height: 20),
          _fieldLabel(context, 'Kode Pos'),
          const SizedBox(height: 8),
          _editField(
            context: context,
            controller: _postalCodeCtrl,
            hintText: '',
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            enabled: isLocationSet,
            onChanged: (v) => context.read<MerchantInputAddressBloc>().add(MerchantInputAddressEventPostalCodeChanged(v)),
          ),
          const SizedBox(height: 20),
          _fieldLabel(context, 'Alamat Detail'),
          const SizedBox(height: 8),
          _editField(
            context: context,
            controller: _addressCtrl,
            hintText: '',
            keyboardType: TextInputType.text,
            maxLines: 3,
            enabled: isLocationSet,
            onChanged: (v) => context.read<MerchantInputAddressBloc>().add(MerchantInputAddressEventAddressChanged(v)),
          ),
        ],
      ],
    );
  }

  // --- Operational Hours UI Helpers ---
  Widget _hoursForm(BuildContext context, MerchantOperationalHoursState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _mainStatusCard(context, state),
        const SizedBox(height: 16),
        _generalHoursCard(context, state),
        const SizedBox(height: 16),
        if (!state.isOpenAllDay) ...[
          _dailyHoursCard(context, state),
          const SizedBox(height: 16),
        ],
      ],
    );
  }

  Widget _mainStatusCard(BuildContext context, MerchantOperationalHoursState state) {
    final colorScheme = GlobalHelper.getColorSchema(context);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: colorScheme.outline.withValues(alpha: 0.5)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: colorScheme.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(Icons.storefront, color: colorScheme.primary),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Toko Sedang Buka', style: GlobalHelper.getTextTheme(context, appTextStyle: AppTextStyle.BODY_MEDIUM)?.copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text('Pelanggan dapat melakukan order', style: GlobalHelper.getTextTheme(context, appTextStyle: AppTextStyle.BODY_SMALL)?.copyWith(color: colorScheme.onSurfaceVariant)),
              ],
            ),
          ),
          Column(
            children: [
              _CustomSwitch(
                isActive: state.isStoreOpen,
                onChanged: () => context.read<MerchantOperationalHoursBloc>().add(MerchantOperationalHoursEventStoreStatusToggled()),
              ),
              const SizedBox(height: 4),
              Text(
                state.isStoreOpen ? 'Buka' : 'Tutup',
                style: GlobalHelper.getTextTheme(context, appTextStyle: AppTextStyle.LABEL_SMALL)?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: state.isStoreOpen ? colorScheme.primary : colorScheme.onSurfaceVariant,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _generalHoursCard(BuildContext context, MerchantOperationalHoursState state) {
    final colorScheme = GlobalHelper.getColorSchema(context);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: colorScheme.outline.withValues(alpha: 0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Buka Setiap Hari', style: GlobalHelper.getTextTheme(context, appTextStyle: AppTextStyle.BODY_MEDIUM)?.copyWith(fontWeight: FontWeight.bold)),
              _CustomSwitch(
                isActive: state.isOpenAllDay,
                onChanged: () => context.read<MerchantOperationalHoursBloc>().add(MerchantOperationalHoursEventIsOpenAllDayToggled()),
              ),
            ],
          ),
          if (state.isOpenAllDay) ...[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Divider(height: 1, color: colorScheme.outlineVariant),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Buka 24 Jam', style: GlobalHelper.getTextTheme(context, appTextStyle: AppTextStyle.BODY_MEDIUM)?.copyWith(fontWeight: FontWeight.bold)),
                _CustomSwitch(
                  isActive: state.isOpen24Hours,
                  onChanged: () => context.read<MerchantOperationalHoursBloc>().add(MerchantOperationalHoursEventIsOpen24HoursToggled()),
                ),
              ],
            ),
            if (!state.isOpen24Hours) ...[
              const SizedBox(height: 12),
              Row(
                children: [
                  Text('Jam Operasional', style: GlobalHelper.getTextTheme(context, appTextStyle: AppTextStyle.BODY_SMALL)?.copyWith(color: colorScheme.onSurfaceVariant)),
                  const Spacer(),
                  _timeDropdown(
                    context,
                    state.timeOpen,
                    (v) => context.read<MerchantOperationalHoursBloc>().add(MerchantOperationalHoursEventTimeOpenChanged(v!)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: Text('-', style: GlobalHelper.getTextTheme(context, appTextStyle: AppTextStyle.BODY_SMALL)?.copyWith(color: colorScheme.onSurfaceVariant)),
                  ),
                  _timeDropdown(
                    context,
                    state.timeClose,
                    (v) => context.read<MerchantOperationalHoursBloc>().add(MerchantOperationalHoursEventTimeCloseChanged(v!)),
                  ),
                ],
              ),
            ],
          ],
        ],
      ),
    );
  }

  Widget _dailyHoursCard(BuildContext context, MerchantOperationalHoursState state) {
    final colorScheme = GlobalHelper.getColorSchema(context);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: colorScheme.outline.withValues(alpha: 0.5)),
      ),
      child: Column(
        children: [
          for (var i = 0; i < state.dailyHours.length; i++) ...[
            _dailyRow(context, i, state.dailyHours[i]),
            if (i < state.dailyHours.length - 1)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Divider(height: 1, color: colorScheme.outlineVariant),
              ),
          ],
        ],
      ),
    );
  }

  Widget _dailyRow(BuildContext context, int dayIndex, DailyHours day) {
    final colorScheme = GlobalHelper.getColorSchema(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(
              width: 65,
              child: Text(day.dayName, style: GlobalHelper.getTextTheme(context, appTextStyle: AppTextStyle.BODY_MEDIUM)?.copyWith(fontWeight: FontWeight.bold)),
            ),
            _CustomSwitch(
              isActive: day.isOpen,
              onChanged: () => context.read<MerchantOperationalHoursBloc>().add(MerchantOperationalHoursEventDayToggled(dayIndex)),
            ),
            const SizedBox(width: 12),
            Text(
              day.isOpen ? 'Buka' : 'Toko Tutup',
              style: GlobalHelper.getTextTheme(context, appTextStyle: AppTextStyle.BODY_SMALL)?.copyWith(color: colorScheme.onSurfaceVariant),
            ),
            if (day.isOpen) ...[
              const Spacer(),
              _CustomSwitch(
                isActive: day.isOpen24Hours,
                onChanged: () => context.read<MerchantOperationalHoursBloc>().add(MerchantOperationalHoursEventDay24HoursToggled(dayIndex)),
              ),
              const SizedBox(width: 8),
              Text('24 Jam', style: GlobalHelper.getTextTheme(context, appTextStyle: AppTextStyle.BODY_SMALL)?.copyWith(color: colorScheme.onSurfaceVariant)),
            ],
          ],
        ),
        if (day.isOpen && !day.isOpen24Hours) ...[
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(width: 77),
              _timeDropdown(
                context,
                day.startTime,
                (v) => context.read<MerchantOperationalHoursBloc>().add(MerchantOperationalHoursEventStartTimeChanged(dayIndex, v!)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Text('-', style: GlobalHelper.getTextTheme(context, appTextStyle: AppTextStyle.BODY_SMALL)?.copyWith(color: colorScheme.onSurfaceVariant)),
              ),
              _timeDropdown(
                context,
                day.endTime,
                (v) => context.read<MerchantOperationalHoursBloc>().add(MerchantOperationalHoursEventEndTimeChanged(dayIndex, v!)),
              ),
            ],
          ),
        ],
      ],
    );
  }

  Widget _timeDropdown(BuildContext context, String value, ValueChanged<String?> onChanged) {
    final colorScheme = GlobalHelper.getColorSchema(context);
    return Container(
      height: 32,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: colorScheme.outlineVariant),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          icon: Icon(Icons.keyboard_arrow_down, size: 16, color: colorScheme.onSurfaceVariant),
          style: GlobalHelper.getTextTheme(context, appTextStyle: AppTextStyle.BODY_SMALL),
          items: MerchantOperationalHoursState.timeOptions.map((t) => DropdownMenuItem(value: t, child: Text(t))).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }

  // --- Shipping UI Helpers ---
  Widget _shippingForm(BuildContext context, MerchantShippingState state) {
    final colorSchema = GlobalHelper.getColorSchema(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colorSchema.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: colorSchema.outlineVariant.withValues(alpha: 0.5)),
          ),
          child: Column(
            children: [
              _MethodItemRow(
                title: 'Ambil Sendiri',
                description: 'Customer ambil langsung di toko',
                iconData: Icons.storefront,
                iconColor: const Color(0xFF14B8A6),
                iconBgColor: const Color(0xFFF0FDF4),
                isActive: state.pickupAtStore,
                onChanged: () => context.read<MerchantShippingBloc>().add(MerchantShippingToggleMethod('pickup_at_store')),
              ),
              const Divider(height: 1, color: Color(0xFFE5E7EB)),
              _MethodItemRow(
                title: 'Kurir Instan',
                description: 'GoSend, GrabExpress, dll',
                iconData: Icons.electric_moped,
                iconColor: const Color(0xFFF59E0B),
                iconBgColor: const Color(0xFFFFFBEB),
                isActive: state.instantCourier,
                onChanged: () => context.read<MerchantShippingBloc>().add(MerchantShippingToggleMethod('instant_courier')),
              ),
              const Divider(height: 1, color: Color(0xFFE5E7EB)),
              _MethodItemRow(
                title: 'Diantar Toko',
                description: 'Diantar oleh kurir toko sendiri',
                iconData: Icons.delivery_dining,
                iconColor: const Color(0xFF0D9488),
                iconBgColor: const Color(0xFFF0FDFA),
                isActive: state.internalCourier,
                onChanged: () => context.read<MerchantShippingBloc>().add(MerchantShippingToggleMethod('internal_courier')),
              ),
              if (state.internalCourier) ...[
                Divider(height: 1, color: colorSchema.outlineVariant),
                _MaxDistanceInput(initialValue: state.maxDistanceInternalCourier),
                Divider(height: 1, color: colorSchema.outlineVariant),
                _InternalCourierCostInput(initialValue: state.internalCourierShippingCost),
              ],
            ],
          ),
        ),
        const SizedBox(height: 24),
        if (state.availableCouriers.isNotEmpty) _CouriersCard(state: state),
      ],
    );
  }
}

// --- Common UI Components Extracted from Other Screens ---

class _MapLocationPicker extends StatelessWidget {
  const _MapLocationPicker({required this.onTap, required this.latitude, required this.longitude});
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
                    target: isLocationSet ? LatLng(latitude, longitude) : const LatLng(-6.200000, 106.816666),
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
                  markers: isLocationSet ? {Marker(markerId: const MarkerId('merchant_location'), position: LatLng(latitude, longitude))} : {},
                ),
              ),
            ),
            if (!isLocationSet) Center(child: Icon(Icons.location_on, color: colorSchema.primary, size: 36)),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: colorSchema.surface.withValues(alpha: 0.9),
                  borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(12), bottomRight: Radius.circular(12)),
                  border: Border(top: BorderSide(color: colorSchema.outlineVariant)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.location_on_outlined, size: 16, color: colorSchema.primary),
                    const SizedBox(width: 4),
                    Text(
                      isLocationSet ? 'Ubah Lokasi' : 'Ambil Lokasi',
                      style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: colorSchema.primary),
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

class _CustomSwitch extends StatelessWidget {
  const _CustomSwitch({required this.isActive, required this.onChanged});
  final bool isActive;
  final VoidCallback onChanged;

  @override
  Widget build(BuildContext context) {
    final colorSchema = GlobalHelper.getColorSchema(context);

    return GestureDetector(
      onTap: onChanged,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        width: 48,
        height: 28,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: isActive ? colorSchema.primary : colorSchema.outlineVariant,
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 220),
              curve: Curves.easeInOut,
              left: isActive ? 22 : 2,
              top: 2,
              child: Container(
                width: 24,
                height: 24,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 4, offset: Offset(0, 1))],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MethodItemRow extends StatelessWidget {
  const _MethodItemRow({
    required this.title,
    required this.description,
    required this.iconData,
    required this.iconColor,
    required this.iconBgColor,
    required this.isActive,
    required this.onChanged,
  });

  final String title;
  final String description;
  final IconData iconData;
  final Color iconColor;
  final Color iconBgColor;
  final bool isActive;
  final VoidCallback onChanged;

  @override
  Widget build(BuildContext context) {
    final colorSchema = GlobalHelper.getColorSchema(context);
    final textTheme = GlobalHelper.getTextTheme(context, appTextStyle: AppTextStyle.BODY_SMALL);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(color: iconBgColor, borderRadius: BorderRadius.circular(12)),
            child: Icon(iconData, color: iconColor),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: textTheme?.copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: GlobalHelper.getTextTheme(context, appTextStyle: AppTextStyle.LABEL_SMALL)?.copyWith(color: colorSchema.onSurfaceVariant),
                ),
                const SizedBox(height: 4),
                Text(
                  isActive ? 'Aktif' : 'Nonaktif',
                  style: GlobalHelper.getTextTheme(context, appTextStyle: AppTextStyle.LABEL_SMALL)?.copyWith(
                    color: isActive ? colorSchema.primary : colorSchema.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: _CustomSwitch(isActive: isActive, onChanged: onChanged),
          ),
        ],
      ),
    );
  }
}

class _MaxDistanceInput extends StatefulWidget {
  final int initialValue;
  const _MaxDistanceInput({required this.initialValue});

  @override
  State<_MaxDistanceInput> createState() => _MaxDistanceInputState();
}

class _MaxDistanceInputState extends State<_MaxDistanceInput> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue > 0 ? widget.initialValue.toString() : '');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorSchema = GlobalHelper.getColorSchema(context);
    final textTheme = GlobalHelper.getTextTheme(context, appTextStyle: AppTextStyle.BODY_SMALL);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Jarak Maksimal Pengantaran (KM)', style: textTheme?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          TextField(
            controller: _controller,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            style: textTheme,
            decoration: InputDecoration(
              hintText: 'Misal: 10',
              hintStyle: textTheme?.copyWith(color: colorSchema.onSurfaceVariant),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: colorSchema.outlineVariant)),
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: colorSchema.outlineVariant)),
              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: colorSchema.primary)),
              suffixText: 'KM',
              suffixStyle: textTheme,
            ),
            onChanged: (value) {
              final distance = int.tryParse(value) ?? 0;
              context.read<MerchantShippingBloc>().add(MerchantShippingUpdateMaxDistance(distance));
            },
          ),
        ],
      ),
    );
  }
}

class _InternalCourierCostInput extends StatefulWidget {
  final int initialValue;
  const _InternalCourierCostInput({required this.initialValue});

  @override
  State<_InternalCourierCostInput> createState() => _InternalCourierCostInputState();
}

class _InternalCourierCostInputState extends State<_InternalCourierCostInput> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue > 0 ? widget.initialValue.toString() : '');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorSchema = GlobalHelper.getColorSchema(context);
    final textTheme = GlobalHelper.getTextTheme(context, appTextStyle: AppTextStyle.BODY_SMALL);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Biaya Ongkir Kurir Toko', style: textTheme?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          TextField(
            controller: _controller,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            style: textTheme,
            decoration: InputDecoration(
              hintText: 'Misal: 10000',
              hintStyle: textTheme?.copyWith(color: colorSchema.onSurfaceVariant),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: colorSchema.outlineVariant)),
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: colorSchema.outlineVariant)),
              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: colorSchema.primary)),
              prefixText: 'Rp ',
              prefixStyle: textTheme,
            ),
            onChanged: (value) {
              final cost = int.tryParse(value) ?? 0;
              context.read<MerchantShippingBloc>().add(MerchantShippingUpdateInternalCourierCost(cost));
            },
          ),
        ],
      ),
    );
  }
}

class _CouriersCard extends StatelessWidget {
  const _CouriersCard({required this.state});
  final MerchantShippingState state;

  @override
  Widget build(BuildContext context) {
    final colorSchema = GlobalHelper.getColorSchema(context);
    final textTheme = GlobalHelper.getTextTheme(context, appTextStyle: AppTextStyle.BODY_SMALL);
    final labelTheme = GlobalHelper.getTextTheme(context, appTextStyle: AppTextStyle.LABEL_SMALL);

    return Container(
      decoration: BoxDecoration(
        color: colorSchema.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: colorSchema.outlineVariant.withValues(alpha: 0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(color: const Color(0xFFEFF6FF), borderRadius: BorderRadius.circular(12)),
                  child: const Icon(Icons.local_shipping, color: Color(0xFF3B82F6)),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Kurir Ekspedisi', style: textTheme?.copyWith(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 4),
                      Text('Pilih kurir yang tersedia', style: labelTheme?.copyWith(color: colorSchema.onSurfaceVariant)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(height: 1, color: colorSchema.outlineVariant),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.availableCouriers.length,
            separatorBuilder: (context, index) => Divider(height: 1, color: colorSchema.outlineVariant),
            itemBuilder: (context, index) {
              final courierCode = state.availableCouriers[index];
              final isSelected = state.selectedCouriers.contains(courierCode);
              return CheckboxListTile(
                title: Text(courierCode.toUpperCase(), style: textTheme),
                value: isSelected,
                activeColor: colorSchema.primary,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                controlAffinity: ListTileControlAffinity.trailing,
                onChanged: (bool? value) {
                  context.read<MerchantShippingBloc>().add(MerchantShippingToggleCourier(courierCode));
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
