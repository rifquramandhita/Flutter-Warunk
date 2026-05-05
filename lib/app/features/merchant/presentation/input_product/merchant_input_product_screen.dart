import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/merchant/presentation/input_product/bloc/merchant_input_product_bloc.dart';
import 'package:warunk/core/constants/app_colors.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Entry point
// ─────────────────────────────────────────────────────────────────────────────
class MerchantInputProductScreen extends StatelessWidget {
  const MerchantInputProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MerchantInputProductBloc(),
      child: const _MerchantInputProductView(),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Main view
// ─────────────────────────────────────────────────────────────────────────────
class _MerchantInputProductView extends StatelessWidget {
  const _MerchantInputProductView();

  @override
  Widget build(BuildContext context) {
    return BlocListener<MerchantInputProductBloc, MerchantInputProductState>(
      listenWhen: (prev, curr) => curr.isSaved && !prev.isSaved,
      listener: (context, _) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Produk berhasil ditambahkan!'),
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
        'Tambah Produk',
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
  late final TextEditingController _hargaCtrl;
  late final TextEditingController _stokCtrl;
  late final TextEditingController _deskripsiCtrl;

  @override
  void initState() {
    super.initState();
    _namaCtrl = TextEditingController();
    _hargaCtrl = TextEditingController();
    _stokCtrl = TextEditingController();
    _deskripsiCtrl = TextEditingController();
  }

  @override
  void dispose() {
    _namaCtrl.dispose();
    _hargaCtrl.dispose();
    _stokCtrl.dispose();
    _deskripsiCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MerchantInputProductBloc, MerchantInputProductState>(
      builder: (context, state) {
        return Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ── Foto Produk ────────────────────────────────────────
                    _SectionLabel('Foto Produk'),
                    const SizedBox(height: 8),
                    _FotoUploadArea(hasFoto: state.hasFoto),
                    const SizedBox(height: 20),

                    // ── Nama Produk ────────────────────────────────────────
                    _SectionLabel('Nama Produk'),
                    const SizedBox(height: 8),
                    _InputField(
                      controller: _namaCtrl,
                      hintText: 'Contoh: Nasi Pecel Warunk',
                      onChanged: (v) => context
                          .read<MerchantInputProductBloc>()
                          .add(MerchantInputProductNamaChanged(v)),
                    ),
                    const SizedBox(height: 20),

                    // ── Kategori Produk ────────────────────────────────────
                    _SectionLabel('Kategori Produk'),
                    const SizedBox(height: 8),
                    _DropdownField(
                      value: state.kategori.isEmpty ? null : state.kategori,
                      hintText: 'Pilih kategori produk',
                      items: MerchantInputProductState.kategoriOptions,
                      onChanged: (v) {
                        if (v != null) {
                          context.read<MerchantInputProductBloc>().add(
                                MerchantInputProductKategoriChanged(v),
                              );
                        }
                      },
                    ),
                    const SizedBox(height: 20),

                    // ── Harga & Stok ───────────────────────────────────────
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Harga
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _SectionLabel('Harga'),
                              const SizedBox(height: 8),
                              _InputField(
                                controller: _hargaCtrl,
                                hintText: 'Rp 0',
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                prefixText: 'Rp ',
                                onChanged: (v) => context
                                    .read<MerchantInputProductBloc>()
                                    .add(MerchantInputProductHargaChanged(v)),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        // Stok
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _SectionLabel('Stok'),
                              const SizedBox(height: 8),
                              _InputField(
                                controller: _stokCtrl,
                                hintText: '0',
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                onChanged: (v) => context
                                    .read<MerchantInputProductBloc>()
                                    .add(MerchantInputProductStokChanged(v)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // ── Satuan ─────────────────────────────────────────────
                    _SectionLabel('Satuan'),
                    const SizedBox(height: 8),
                    _DropdownField(
                      value: state.satuan.isEmpty ? null : state.satuan,
                      hintText: 'Contoh: porsi, gelas, bungkus',
                      items: MerchantInputProductState.satuanOptions,
                      onChanged: (v) {
                        if (v != null) {
                          context.read<MerchantInputProductBloc>().add(
                                MerchantInputProductSatuanChanged(v),
                              );
                        }
                      },
                    ),
                    const SizedBox(height: 20),

                    // ── Deskripsi ──────────────────────────────────────────
                    _SectionLabel('Deskripsi'),
                    const SizedBox(height: 8),
                    _DeskripsiField(
                      controller: _deskripsiCtrl,
                      charCount: state.deskripsiLength,
                      onChanged: (v) => context
                          .read<MerchantInputProductBloc>()
                          .add(MerchantInputProductDeskripsiChanged(v)),
                    ),
                    const SizedBox(height: 20),

                    // ── Tampilkan Produk ───────────────────────────────────
                    _TampilkanRow(isOn: state.tampilkan),
                    const SizedBox(height: 16),
                    const _Divider(),
                    const SizedBox(height: 16),

                    // ── Varian ─────────────────────────────────────────────
                    _OptionalRow(
                      iconBg: AppColors.primary.withValues(alpha: 0.12),
                      icon: Icons.local_offer_outlined,
                      iconColor: AppColors.primary,
                      title: 'Varian (Opsional)',
                      subtitle: 'Tambah varian seperti ukuran atau level',
                      onTap: () {},
                    ),
                    const SizedBox(height: 12),

                    // ── Add-on ─────────────────────────────────────────────
                    _OptionalRow(
                      iconBg: const Color(0xFFFFF3C4),
                      icon: Icons.add_circle_outline,
                      iconColor: const Color(0xFFF59E0B),
                      title: 'Add-on (Opsional)',
                      subtitle: 'Tambah opsi tambahan untuk produk',
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),

            // ── Simpan button (sticky bottom) ─────────────────────────────
            _SimpanButton(state: state),
          ],
        );
      },
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Foto upload area (dashed border)
// ─────────────────────────────────────────────────────────────────────────────
class _FotoUploadArea extends StatelessWidget {
  const _FotoUploadArea({required this.hasFoto});
  final bool hasFoto;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context
          .read<MerchantInputProductBloc>()
          .add(MerchantInputProductFotoTapped()),
      child: Container(
        width: double.infinity,
        height: 130,
        decoration: BoxDecoration(
          color: AppColors.primary.withValues(alpha: 0.04),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppColors.primary.withValues(alpha: 0.4),
            width: 1.5,
            strokeAlign: BorderSide.strokeAlignInside,
          ),
        ),
        child: hasFoto
            ? const Center(
                child: Icon(Icons.check_circle,
                    color: AppColors.primary, size: 40),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.upload_outlined,
                    size: 34,
                    color: AppColors.primary,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Upload Foto Produk',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'PNG, JPG maksimal 5MB',
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.greyText,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Section label
// ─────────────────────────────────────────────────────────────────────────────
class _SectionLabel extends StatelessWidget {
  const _SectionLabel(this.text);
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
// Standard input field
// ─────────────────────────────────────────────────────────────────────────────
class _InputField extends StatelessWidget {
  const _InputField({
    required this.controller,
    required this.hintText,
    required this.onChanged,
    this.keyboardType,
    this.inputFormatters,
    this.prefixText,
  });

  final TextEditingController controller;
  final String hintText;
  final ValueChanged<String> onChanged;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final String? prefixText;

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
          hintStyle:
              const TextStyle(fontSize: 14, color: AppColors.greyText),
          prefixText: prefixText,
          prefixStyle: const TextStyle(
              fontSize: 14, color: AppColors.textDark),
          border: InputBorder.none,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Dropdown field
// ─────────────────────────────────────────────────────────────────────────────
class _DropdownField extends StatelessWidget {
  const _DropdownField({
    required this.value,
    required this.hintText,
    required this.items,
    required this.onChanged,
  });

  final String? value;
  final String hintText;
  final List<String> items;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.greyBorder),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isExpanded: true,
          hint: Text(
            hintText,
            style:
                const TextStyle(fontSize: 14, color: AppColors.greyText),
          ),
          icon: const Icon(
            Icons.keyboard_arrow_down_rounded,
            color: AppColors.greyText,
          ),
          style:
              const TextStyle(fontSize: 14, color: AppColors.textDark),
          items: items
              .map((s) =>
                  DropdownMenuItem<String>(value: s, child: Text(s)))
              .toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Deskripsi multi-line + char count
// ─────────────────────────────────────────────────────────────────────────────
class _DeskripsiField extends StatelessWidget {
  const _DeskripsiField({
    required this.controller,
    required this.charCount,
    required this.onChanged,
  });

  final TextEditingController controller;
  final int charCount;
  final ValueChanged<String> onChanged;

  static const int _maxLength = 200;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.greyBorder),
      ),
      child: Column(
        children: [
          TextField(
            controller: controller,
            maxLines: 4,
            maxLength: _maxLength,
            buildCounter: (_,
                    {required currentLength,
                    required isFocused,
                    maxLength}) =>
                null,
            onChanged: onChanged,
            style:
                const TextStyle(fontSize: 14, color: AppColors.textDark),
            decoration: const InputDecoration(
              hintText: 'Tulis deskripsi produk (opsional)',
              hintStyle:
                  TextStyle(fontSize: 14, color: AppColors.greyText),
              border: InputBorder.none,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 14, vertical: 13),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12, bottom: 8),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                '$charCount/$_maxLength',
                style: const TextStyle(
                  fontSize: 11,
                  color: AppColors.greyText,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Tampilkan Produk toggle row
// ─────────────────────────────────────────────────────────────────────────────
class _TampilkanRow extends StatelessWidget {
  const _TampilkanRow({required this.isOn});
  final bool isOn;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Tampilkan Produk',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textDark,
                ),
              ),
              const SizedBox(height: 2),
              const Text(
                'Produk akan tampil di toko Anda',
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.greyText,
                ),
              ),
            ],
          ),
        ),
        // Animated toggle
        GestureDetector(
          onTap: () => context
              .read<MerchantInputProductBloc>()
              .add(MerchantInputProductTampilkanToggled()),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 220),
            width: 48,
            height: 28,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: isOn ? AppColors.primary : AppColors.greyBorder,
            ),
            child: Stack(
              children: [
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 220),
                  curve: Curves.easeInOut,
                  left: isOn ? 22 : 2,
                  top: 2,
                  child: Container(
                    width: 24,
                    height: 24,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Divider
// ─────────────────────────────────────────────────────────────────────────────
class _Divider extends StatelessWidget {
  const _Divider();

  @override
  Widget build(BuildContext context) {
    return const Divider(height: 1, color: AppColors.greyBorder);
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Optional section row (Varian / Add-on)
// ─────────────────────────────────────────────────────────────────────────────
class _OptionalRow extends StatelessWidget {
  const _OptionalRow({
    required this.iconBg,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final Color iconBg;
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: iconBg,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textDark,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.greyText,
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.chevron_right,
            color: AppColors.greyText,
            size: 20,
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Sticky bottom save button
// ─────────────────────────────────────────────────────────────────────────────
class _SimpanButton extends StatelessWidget {
  const _SimpanButton({required this.state});
  final MerchantInputProductState state;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
      decoration: BoxDecoration(
        color: AppColors.background,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 10,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: SizedBox(
        width: double.infinity,
        height: 52,
        child: ElevatedButton(
          onPressed: (state.isSaving || !state.isValid)
              ? null
              : () => context
                  .read<MerchantInputProductBloc>()
                  .add(MerchantInputProductSaved()),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            disabledBackgroundColor: AppColors.primary.withValues(alpha: 0.5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            elevation: 0,
          ),
          child: state.isSaving
              ? const SizedBox(
                  width: 22,
                  height: 22,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.5,
                    color: Colors.white,
                  ),
                )
              : const Text(
                  'Simpan Produk',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
        ),
      ),
    );
  }
}
