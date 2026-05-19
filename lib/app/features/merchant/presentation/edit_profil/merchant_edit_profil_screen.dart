import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/merchant/presentation/edit_profil/bloc/merchant_edit_profil_bloc.dart';
import 'package:warunk/theme/app_colors.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Entry point — provides BLoC
// ─────────────────────────────────────────────────────────────────────────────
class MerchantEditProfilScreen extends StatelessWidget {
  const MerchantEditProfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MerchantEditProfilBloc(),
      child: const _MerchantEditProfilView(),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Main view
// ─────────────────────────────────────────────────────────────────────────────
class _MerchantEditProfilView extends StatelessWidget {
  const _MerchantEditProfilView();

  @override
  Widget build(BuildContext context) {
    return BlocListener<MerchantEditProfilBloc, MerchantEditProfilState>(
      listenWhen: (prev, curr) => curr.isSaved && !prev.isSaved,
      listener: (context, state) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Profil berhasil disimpan!'),
            backgroundColor: AppColors.primary,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        );
        Navigator.of(context).pop();
      },
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: _buildAppBar(context),
        body: const _EditProfilBody(),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.background,
      elevation: 0,
      centerTitle: true,
      leading: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.white,
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.greyBorder),
          ),
          child: const Icon(
            Icons.arrow_back,
            color: AppColors.textDark,
            size: 18,
          ),
        ),
      ),
      title: const Text(
        'Edit Profil',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: AppColors.textDark,
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Body — scrollable form
// ─────────────────────────────────────────────────────────────────────────────
class _EditProfilBody extends StatefulWidget {
  const _EditProfilBody();

  @override
  State<_EditProfilBody> createState() => _EditProfilBodyState();
}

class _EditProfilBodyState extends State<_EditProfilBody> {
  late final TextEditingController _namaTokoCtrl;
  late final TextEditingController _whatsappCtrl;
  late final TextEditingController _emailCtrl;

  @override
  void initState() {
    super.initState();
    final s = context.read<MerchantEditProfilBloc>().state;
    _namaTokoCtrl = TextEditingController(text: s.namaToko);
    _whatsappCtrl = TextEditingController(text: s.whatsapp);
    _emailCtrl = TextEditingController(text: s.email);
  }

  @override
  void dispose() {
    _namaTokoCtrl.dispose();
    _whatsappCtrl.dispose();
    _emailCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MerchantEditProfilBloc, MerchantEditProfilState>(
      builder: (context, state) {
        return SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Avatar ─────────────────────────────────────────────────
              const SizedBox(height: 8),
              Center(child: _AvatarPicker()),
              const SizedBox(height: 32),

              // ── Nama Toko ──────────────────────────────────────────────
              _FieldLabel('Nama Toko'),
              const SizedBox(height: 8),
              _EditField(
                controller: _namaTokoCtrl,
                hintText: 'Masukkan nama toko',
                keyboardType: TextInputType.text,
                onChanged: (v) => context.read<MerchantEditProfilBloc>().add(
                  MerchantEditNamaToko(v),
                ),
              ),
              const SizedBox(height: 20),

              // ── Kategori Toko ──────────────────────────────────────────
              _FieldLabel('Kategori Toko'),
              const SizedBox(height: 8),
              _KategoriDropdown(selected: state.kategoriToko),
              const SizedBox(height: 20),

              // ── No. WhatsApp ───────────────────────────────────────────
              _FieldLabel('No. WhatsApp'),
              const SizedBox(height: 8),
              _EditField(
                controller: _whatsappCtrl,
                hintText: 'Masukkan nomor WhatsApp',
                keyboardType: TextInputType.phone,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                onChanged: (v) => context.read<MerchantEditProfilBloc>().add(
                  MerchantEditWhatsApp(v),
                ),
              ),
              const SizedBox(height: 20),

              // ── Email ──────────────────────────────────────────────────
              _FieldLabel('Email'),
              const SizedBox(height: 8),
              _EditField(
                controller: _emailCtrl,
                hintText: 'Masukkan email',
                keyboardType: TextInputType.emailAddress,
                onChanged: (v) => context.read<MerchantEditProfilBloc>().add(
                  MerchantEditEmail(v),
                ),
              ),
              const SizedBox(height: 32),

              // ── Save button ─────────────────────────────────────────────
              _SaveButton(isSaving: state.isSaving),
            ],
          ),
        );
      },
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Avatar picker
// ─────────────────────────────────────────────────────────────────────────────
class _AvatarPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          context.read<MerchantEditProfilBloc>().add(MerchantEditFotoTapped()),
      child: Stack(
        children: [
          // Avatar circle
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primary.withValues(alpha: 0.15),
              border: Border.all(
                color: AppColors.primary.withValues(alpha: 0.3),
                width: 2,
              ),
            ),
            child: ClipOval(
              child: Container(
                color: const Color(0xFF2D6A4F).withValues(alpha: 0.2),
                child: const Center(
                  child: Text('🏪', style: TextStyle(fontSize: 40)),
                ),
              ),
            ),
          ),
          // Camera badge
          Positioned(
            bottom: 2,
            right: 2,
            child: Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: AppColors.white,
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.primary, width: 1.5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: const Icon(
                Icons.camera_alt_outlined,
                size: 15,
                color: AppColors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Field label
// ─────────────────────────────────────────────────────────────────────────────
class _FieldLabel extends StatelessWidget {
  const _FieldLabel(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: AppColors.textDark,
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Text field
// ─────────────────────────────────────────────────────────────────────────────
class _EditField extends StatelessWidget {
  const _EditField({
    required this.controller,
    required this.hintText,
    required this.keyboardType,
    required this.onChanged,
    this.inputFormatters,
  });

  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final ValueChanged<String> onChanged;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.greyBorder),
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        onChanged: onChanged,
        style: const TextStyle(fontSize: 14, color: AppColors.textDark),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: AppColors.greyText, fontSize: 14),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Kategori dropdown
// ─────────────────────────────────────────────────────────────────────────────
class _KategoriDropdown extends StatelessWidget {
  const _KategoriDropdown({required this.selected});
  final String selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.greyBorder),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selected,
          isExpanded: true,
          icon: const Icon(
            Icons.keyboard_arrow_down_rounded,
            color: AppColors.greyText,
          ),
          style: const TextStyle(fontSize: 14, color: AppColors.textDark),
          items: MerchantEditProfilState.kategoriOptions.map((k) {
            return DropdownMenuItem<String>(value: k, child: Text(k));
          }).toList(),
          onChanged: (v) {
            if (v != null) {
              context.read<MerchantEditProfilBloc>().add(
                MerchantEditKategoriToko(v),
              );
            }
          },
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Save button
// ─────────────────────────────────────────────────────────────────────────────
class _SaveButton extends StatelessWidget {
  const _SaveButton({required this.isSaving});
  final bool isSaving;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: isSaving
            ? null
            : () => context.read<MerchantEditProfilBloc>().add(
                MerchantEditProfilSaved(),
              ),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          disabledBackgroundColor: AppColors.primary.withValues(alpha: 0.6),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          elevation: 0,
        ),
        child: isSaving
            ? const SizedBox(
                width: 22,
                height: 22,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  color: Colors.white,
                ),
              )
            : const Text(
                'Simpan Perubahan',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
      ),
    );
  }
}
