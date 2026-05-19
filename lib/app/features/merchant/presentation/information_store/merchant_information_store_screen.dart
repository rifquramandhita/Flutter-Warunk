import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/merchant/presentation/information_store/bloc/merchant_information_store_bloc.dart';
import 'package:warunk/app/features/merchant/presentation/preview_store/merchant_preview_store_screen.dart';
import 'package:warunk/theme/app_colors.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Entry point
// ─────────────────────────────────────────────────────────────────────────────
class MerchantInformationStoreScreen extends StatelessWidget {
  const MerchantInformationStoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MerchantInformationStoreBloc(),
      child: const _MerchantInformationStoreView(),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Main view
// ─────────────────────────────────────────────────────────────────────────────
class _MerchantInformationStoreView extends StatelessWidget {
  const _MerchantInformationStoreView();

  @override
  Widget build(BuildContext context) {
    return BlocListener<
      MerchantInformationStoreBloc,
      MerchantInformationStoreState
    >(
      listenWhen: (prev, curr) => curr.isSaved && !prev.isSaved,
      listener: (context, _) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Informasi toko berhasil disimpan!'),
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
        body: const _FormBody(),
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
        'Informasi Toko',
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
// Scrollable form body
// ─────────────────────────────────────────────────────────────────────────────
class _FormBody extends StatefulWidget {
  const _FormBody();

  @override
  State<_FormBody> createState() => _FormBodyState();
}

class _FormBodyState extends State<_FormBody> {
  late final TextEditingController _namaCtrl;
  late final TextEditingController _picCtrl;
  late final TextEditingController _whatsappCtrl;
  late final TextEditingController _alamatCtrl;

  @override
  void initState() {
    super.initState();
    final state = context.read<MerchantInformationStoreBloc>().state;
    _namaCtrl = TextEditingController(text: state.namaToko);
    _picCtrl = TextEditingController(text: state.pic);
    _whatsappCtrl = TextEditingController(text: state.whatsapp);
    _alamatCtrl = TextEditingController(text: state.alamat);
  }

  @override
  void dispose() {
    _namaCtrl.dispose();
    _picCtrl.dispose();
    _whatsappCtrl.dispose();
    _alamatCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      MerchantInformationStoreBloc,
      MerchantInformationStoreState
    >(
      builder: (context, state) {
        return Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Kelola informasi toko Anda untuk ditampilkan ke pelanggan.',
                      style: TextStyle(fontSize: 13, color: AppColors.greyText),
                    ),
                    const SizedBox(height: 20),

                    // Card 1: Logo & Banner
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: AppColors.greyBorder.withValues(alpha: 0.5),
                        ),
                      ),
                      child: Column(
                        children: [
                          // Logo
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Logo Toko',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.textDark,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      'Format JPG/PNG, maks. 2MB',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: AppColors.greyText,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              _ImagePlaceholder(
                                isCircle: true,
                                icon: Icons.storefront,
                                onTap: () => context
                                    .read<MerchantInformationStoreBloc>()
                                    .add(MerchantInformationStoreLogoTapped()),
                              ),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            child: Divider(
                              height: 1,
                              color: AppColors.greyBorder,
                            ),
                          ),
                          // Banner
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Banner Toko',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.textDark,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      'Format JPG/PNG, maks. 5MB',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: AppColors.greyText,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              _ImagePlaceholder(
                                isCircle: false,
                                icon: Icons.image_outlined,
                                onTap: () => context
                                    .read<MerchantInformationStoreBloc>()
                                    .add(
                                      MerchantInformationStoreBannerTapped(),
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Card 2: Form Input
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: AppColors.greyBorder.withValues(alpha: 0.5),
                        ),
                      ),
                      child: Column(
                        children: [
                          _FormRow(
                            label: 'Nama Toko',
                            child: _InputField(
                              controller: _namaCtrl,
                              hintText: 'Nama Toko',
                              onChanged: (v) => context
                                  .read<MerchantInformationStoreBloc>()
                                  .add(MerchantInformationStoreNamaChanged(v)),
                            ),
                          ),
                          const SizedBox(height: 16),
                          _FormRow(
                            label: 'Kategori Toko',
                            child: _DropdownField(
                              value: state.kategoriToko,
                              hintText: 'Kategori Toko',
                              items:
                                  MerchantInformationStoreState.kategoriOptions,
                              isGreenBg: true,
                              prefixIcon: Icons.restaurant,
                              onChanged: (v) {
                                if (v != null)
                                  context
                                      .read<MerchantInformationStoreBloc>()
                                      .add(
                                        MerchantInformationStoreKategoriChanged(
                                          v,
                                        ),
                                      );
                              },
                            ),
                          ),
                          const SizedBox(height: 16),
                          _FormRow(
                            label: 'Nama PIC',
                            child: _InputField(
                              controller: _picCtrl,
                              hintText: 'Nama PIC',
                              onChanged: (v) => context
                                  .read<MerchantInformationStoreBloc>()
                                  .add(MerchantInformationStorePicChanged(v)),
                            ),
                          ),
                          const SizedBox(height: 16),
                          _FormRow(
                            label: 'No. WhatsApp',
                            child: _InputField(
                              controller: _whatsappCtrl,
                              hintText: 'No. WhatsApp',
                              keyboardType: TextInputType.phone,
                              onChanged: (v) => context
                                  .read<MerchantInformationStoreBloc>()
                                  .add(
                                    MerchantInformationStoreWhatsappChanged(v),
                                  ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          _FormRow(
                            label: 'Kota',
                            child: _DropdownField(
                              value: state.kota,
                              hintText: 'Kota',
                              items: MerchantInformationStoreState.kotaOptions,
                              onChanged: (v) {
                                if (v != null)
                                  context
                                      .read<MerchantInformationStoreBloc>()
                                      .add(
                                        MerchantInformationStoreKotaChanged(v),
                                      );
                              },
                            ),
                          ),
                          const SizedBox(height: 16),
                          _FormRow(
                            label: 'Alamat Toko',
                            alignTop: true,
                            child: _InputField(
                              controller: _alamatCtrl,
                              hintText: 'Alamat Toko',
                              maxLines: 3,
                              onChanged: (v) => context
                                  .read<MerchantInformationStoreBloc>()
                                  .add(
                                    MerchantInformationStoreAlamatChanged(v),
                                  ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          _FormRow(
                            label: 'Lokasi Toko',
                            alignTop: true,
                            child: _MapPlaceholder(
                              onTap: () => context
                                  .read<MerchantInformationStoreBloc>()
                                  .add(MerchantInformationStoreLokasiTapped()),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Bottom Buttons
            _BottomActionButtons(state: state),
          ],
        );
      },
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Components
// ─────────────────────────────────────────────────────────────────────────────

class _ImagePlaceholder extends StatelessWidget {
  const _ImagePlaceholder({
    required this.isCircle,
    required this.icon,
    required this.onTap,
  });

  final bool isCircle;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: isCircle ? 64 : 120,
            height: 64,
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
              borderRadius: isCircle ? null : BorderRadius.circular(8),
              border: Border.all(
                color: AppColors.primary.withValues(alpha: 0.3),
              ),
            ),
            child: Icon(icon, color: AppColors.primary, size: 28),
          ),
          Positioned(
            bottom: -6,
            right: -6,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.greyBorder),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: const Icon(Icons.edit, size: 14, color: AppColors.primary),
            ),
          ),
        ],
      ),
    );
  }
}

class _FormRow extends StatelessWidget {
  const _FormRow({
    required this.label,
    required this.child,
    this.alignTop = false,
  });

  final String label;
  final Widget child;
  final bool alignTop;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: alignTop
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 100,
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: AppColors.textDark,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(child: child),
      ],
    );
  }
}

class _InputField extends StatelessWidget {
  const _InputField({
    required this.controller,
    required this.hintText,
    required this.onChanged,
    this.keyboardType,
    this.maxLines = 1,
  });

  final TextEditingController controller;
  final String hintText;
  final ValueChanged<String> onChanged;
  final TextInputType? keyboardType;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.greyBorder),
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        maxLines: maxLines,
        onChanged: onChanged,
        style: const TextStyle(fontSize: 13, color: AppColors.textDark),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 13, color: AppColors.greyText),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 10,
          ),
          isDense: true,
        ),
      ),
    );
  }
}

class _DropdownField extends StatelessWidget {
  const _DropdownField({
    required this.value,
    required this.hintText,
    required this.items,
    required this.onChanged,
    this.isGreenBg = false,
    this.prefixIcon,
  });

  final String? value;
  final String hintText;
  final List<String> items;
  final ValueChanged<String?> onChanged;
  final bool isGreenBg;
  final IconData? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isGreenBg ? const Color(0xFFE8F5E9) : AppColors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isGreenBg ? Colors.transparent : AppColors.greyBorder,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
      child: Row(
        children: [
          if (prefixIcon != null) ...[
            Icon(
              prefixIcon,
              size: 16,
              color: isGreenBg ? AppColors.primary : AppColors.greyText,
            ),
            const SizedBox(width: 8),
          ],
          Expanded(
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: value,
                isExpanded: true,
                hint: Text(
                  hintText,
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppColors.greyText,
                  ),
                ),
                icon: const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: AppColors.textDark,
                  size: 20,
                ),
                style: const TextStyle(fontSize: 13, color: AppColors.textDark),
                items: items
                    .map(
                      (s) => DropdownMenuItem<String>(value: s, child: Text(s)),
                    )
                    .toList(),
                onChanged: onChanged,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MapPlaceholder extends StatelessWidget {
  const _MapPlaceholder({required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: const Color(0xFFF3F4F6),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.greyBorder),
        ),
        child: Stack(
          children: [
            // Fake map lines
            Positioned.fill(child: CustomPaint(painter: _MapLinesPainter())),
            const Center(
              child: Icon(
                Icons.location_on,
                color: AppColors.primary,
                size: 32,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.9),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                  border: const Border(
                    top: BorderSide(color: AppColors.greyBorder),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.location_on_outlined,
                      size: 14,
                      color: AppColors.primary,
                    ),
                    SizedBox(width: 4),
                    Text(
                      'Ubah Lokasi',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
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

// ─────────────────────────────────────────────────────────────────────────────
// Bottom Actions (Preview & Simpan)
// ─────────────────────────────────────────────────────────────────────────────
class _BottomActionButtons extends StatelessWidget {
  const _BottomActionButtons({required this.state});
  final MerchantInformationStoreState state;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Preview button
          Expanded(
            child: SizedBox(
              height: 48,
              child: OutlinedButton.icon(
                onPressed: () {
                  context.read<MerchantInformationStoreBloc>().add(
                    MerchantInformationStorePreviewTapped(),
                  );
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const MerchantPreviewStoreScreen(),
                    ),
                  );
                },
                icon: const Icon(Icons.remove_red_eye_outlined, size: 18),
                label: const Text('Preview Toko'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.primary,
                  side: const BorderSide(color: AppColors.primary, width: 1.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  textStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          // Simpan button
          Expanded(
            child: SizedBox(
              height: 48,
              child: ElevatedButton(
                onPressed: (state.isSaving || !state.isValid)
                    ? null
                    : () => context.read<MerchantInformationStoreBloc>().add(
                        MerchantInformationStoreSaved(),
                      ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  disabledBackgroundColor: AppColors.primary.withValues(
                    alpha: 0.5,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 0,
                ),
                child: state.isSaving
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.5,
                          color: Colors.white,
                        ),
                      )
                    : const Text(
                        'Simpan Perubahan',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
