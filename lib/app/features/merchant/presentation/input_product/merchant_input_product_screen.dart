import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/merchant/presentation/input_product/bloc/merchant_input_product_bloc.dart';
import 'package:warunk/core/dependency/dependency.dart';
import 'package:warunk/core/helper/dialog_helper.dart';
import 'package:warunk/core/widgets/loading_app_widget.dart';
import 'package:warunk/core/widgets/primary_button.dart';
import 'package:warunk/main.dart';
import 'package:warunk/theme/app_colors.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Entry point
// ─────────────────────────────────────────────────────────────────────────────
class MerchantInputProductScreen extends StatelessWidget {
  final String? id;

  const MerchantInputProductScreen({super.key, this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<MerchantInputProductBloc>()..add(MerchantInputProductGet(id)),
      child: BlocConsumer<MerchantInputProductBloc, MerchantInputProductState>(
        listener: (context, state) {
          if (state.errorMessage != null && state.errorMessage!.isNotEmpty) {
            DialogHelper.showErrorSnackBar(
              context: context,
              text: state.errorMessage!,
            );
          }
          if (state.isSuccess) {
            navigatorKey.currentState?.pop();
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.background,
            appBar: _buildAppBar(context),
            body: _bodyBuild(context),
          );
        },
      ),
    );
  }

  Widget _bodyBuild(BuildContext context) {
    final state = context.watch<MerchantInputProductBloc>().state;
    return SafeArea(
      child: Stack(
        children: [
          _bodyLayout(context),
          (state.isLoading) ? const LoadingAppWidget() : const SizedBox(),
        ],
      ),
    );
  }

  Widget _bodyLayout(BuildContext context) {
    return BlocBuilder<MerchantInputProductBloc, MerchantInputProductState>(
      builder: (context, state) {
        return Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
                child: Column(
                  key: ValueKey(
                    state.isLoading,
                  ), // Rebuilds the form with fetched data once loading finishes
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ── Foto Produk ────────────────────────────────────────
                    const _SectionLabel('Foto Produk'),
                    const SizedBox(height: 8),
                    _FotoUploadArea(imageUrls: state.imageUrls),
                    const SizedBox(height: 20),

                    // ── Nama Produk ────────────────────────────────────────
                    const _SectionLabel('Nama Produk'),
                    const SizedBox(height: 8),
                    _InputField(
                      initialValue: state.name,
                      hintText: 'Contoh: Nasi Pecel Warunk',
                      onChanged: (v) => context
                          .read<MerchantInputProductBloc>()
                          .add(MerchantInputProductNameChanged(v)),
                    ),
                    const SizedBox(height: 20),

                    // ── Kategori Produk ────────────────────────────────────
                    const _SectionLabel('Kategori Produk'),
                    const SizedBox(height: 8),
                    _DropdownField(
                      value: state.category.isEmpty ? null : state.category,
                      hintText: 'Pilih kategori produk',
                      items: MerchantInputProductState.categoryOptions,
                      onChanged: (v) {
                        if (v != null) {
                          context.read<MerchantInputProductBloc>().add(
                            MerchantInputProductCategoryChanged(v),
                          );
                        }
                      },
                    ),
                    const SizedBox(height: 20),

                    // ── Harga ──────────────────────────
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const _SectionLabel('Harga'),
                        const SizedBox(height: 8),
                        _InputField(
                          initialValue: state.price,
                          hintText: '0',
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          prefixText: 'Rp ',
                          onChanged: (v) => context
                              .read<MerchantInputProductBloc>()
                              .add(MerchantInputProductPriceChanged(v)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // ── Minimal Pembelian & Stok ───────────────────────────────────────
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const _SectionLabel('Minimal Pembelian'),
                              const SizedBox(height: 8),
                              _InputField(
                                initialValue: state.minPurchase,
                                hintText: '1',
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                onChanged: (v) => context
                                    .read<MerchantInputProductBloc>()
                                    .add(
                                      MerchantInputProductMinPurchaseChanged(v),
                                    ),
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
                              const _SectionLabel('Stok'),
                              const SizedBox(height: 8),
                              _InputField(
                                initialValue: state.stock,
                                hintText: '0',
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                onChanged: (v) => context
                                    .read<MerchantInputProductBloc>()
                                    .add(MerchantInputProductStockChanged(v)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // ── Berat & Dimensi ──────────────────────────────────
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const _SectionLabel('Berat (gram)'),
                              const SizedBox(height: 8),
                              _InputField(
                                initialValue: state.weight,
                                hintText: '0',
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                onChanged: (v) => context
                                    .read<MerchantInputProductBloc>()
                                    .add(MerchantInputProductWeightChanged(v)),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const _SectionLabel('Panjang (cm)'),
                              const SizedBox(height: 8),
                              _InputField(
                                initialValue: state.length,
                                hintText: '0',
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                onChanged: (v) => context
                                    .read<MerchantInputProductBloc>()
                                    .add(MerchantInputProductLengthChanged(v)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const _SectionLabel('Lebar (cm)'),
                              const SizedBox(height: 8),
                              _InputField(
                                initialValue: state.width,
                                hintText: '0',
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                onChanged: (v) => context
                                    .read<MerchantInputProductBloc>()
                                    .add(MerchantInputProductWidthChanged(v)),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const _SectionLabel('Tinggi (cm)'),
                              const SizedBox(height: 8),
                              _InputField(
                                initialValue: state.height,
                                hintText: '0',
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                onChanged: (v) => context
                                    .read<MerchantInputProductBloc>()
                                    .add(MerchantInputProductHeightChanged(v)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // ── Deskripsi ──────────────────────────────────────────
                    const _SectionLabel('Deskripsi'),
                    const SizedBox(height: 8),
                    _DeskripsiField(
                      initialValue: state.description,
                      charCount: state.descriptionLength,
                      onChanged: (v) => context
                          .read<MerchantInputProductBloc>()
                          .add(MerchantInputProductDescriptionChanged(v)),
                    ),
                    const SizedBox(height: 20),

                    // ── Tampilkan Produk ───────────────────────────────────
                    _TampilkanRow(isOn: state.isPublished),
                    const SizedBox(height: 16),
                    const _Divider(),
                    const SizedBox(height: 16),

                    // ── Varian ─────────────────────────────────────────────
                    _OptionalRow(
                      iconBg: AppColors.primary.withValues(alpha: 0.1),
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

  AppBar _buildAppBar(BuildContext context) {
    final state = context.watch<MerchantInputProductBloc>().state;
    final isEdit = state.name.isNotEmpty;
    return AppBar(title: Text(isEdit ? 'Edit Produk' : 'Tambah Produk'));
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Foto upload area (dashed border)
// ─────────────────────────────────────────────────────────────────────────────
class _FotoUploadArea extends StatelessWidget {
  const _FotoUploadArea({required this.imageUrls});
  final List<String> imageUrls;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: imageUrls.length + 1,
        separatorBuilder: (context, index) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          if (index == imageUrls.length) {
            return GestureDetector(
              onTap: () => context.read<MerchantInputProductBloc>().add(
                MerchantInputProductPhotoTapped(),
              ),
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.04),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: AppColors.primary.withValues(alpha: 0.4),
                    width: 1.5,
                    strokeAlign: BorderSide.strokeAlignInside,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.add_photo_alternate_outlined,
                      size: 28,
                      color: AppColors.primary,
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Tambah\nFoto',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          return SizedBox(
            width: 100,
            height: 100,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.greyBorder),
                  ),
                  child: Image.file(File(imageUrls[index]), fit: BoxFit.cover),
                ),
                Positioned(
                  top: 4,
                  right: 4,
                  child: GestureDetector(
                    onTap: () => context.read<MerchantInputProductBloc>().add(
                      MerchantInputProductPhotoRemoved(index),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.1),
                            blurRadius: 2,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.close,
                        size: 14,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
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
    required this.initialValue,
    required this.hintText,
    required this.onChanged,
    this.keyboardType,
    this.inputFormatters,
    this.prefixText,
  });

  final String initialValue;
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
      child: TextFormField(
        initialValue: initialValue,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        onChanged: onChanged,
        style: const TextStyle(fontSize: 14, color: AppColors.textDark),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 14, color: AppColors.greyText),
          prefixText: prefixText,
          prefixStyle: const TextStyle(fontSize: 14, color: AppColors.textDark),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 13,
          ),
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
    final List<String> effectiveItems = items.toList();
    if (value != null && !effectiveItems.contains(value)) {
      effectiveItems.add(value!);
    }

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
            style: const TextStyle(fontSize: 14, color: AppColors.greyText),
          ),
          icon: const Icon(
            Icons.keyboard_arrow_down_rounded,
            color: AppColors.greyText,
          ),
          style: const TextStyle(fontSize: 14, color: AppColors.textDark),
          items: effectiveItems
              .map((s) => DropdownMenuItem<String>(value: s, child: Text(s)))
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
    required this.initialValue,
    required this.charCount,
    required this.onChanged,
  });

  final String initialValue;
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
          TextFormField(
            initialValue: initialValue,
            maxLines: 4,
            maxLength: _maxLength,
            buildCounter:
                (_, {required currentLength, required isFocused, maxLength}) =>
                    null,
            onChanged: onChanged,
            style: const TextStyle(fontSize: 14, color: AppColors.textDark),
            decoration: const InputDecoration(
              hintText: 'Tulis deskripsi produk (opsional)',
              hintStyle: TextStyle(fontSize: 14, color: AppColors.greyText),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 13,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12, bottom: 8),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                '$charCount/$_maxLength',
                style: const TextStyle(fontSize: 11, color: AppColors.greyText),
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
                style: TextStyle(fontSize: 12, color: AppColors.greyText),
              ),
            ],
          ),
        ),
        // Animated toggle
        GestureDetector(
          onTap: () => context.read<MerchantInputProductBloc>().add(
            MerchantInputProductIsPublishedToggled(),
          ),
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
            decoration: BoxDecoration(color: iconBg, shape: BoxShape.circle),
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
          const Icon(Icons.chevron_right, color: AppColors.greyText, size: 20),
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
      child: PrimaryButton(
        label: 'Simpan Produk',
        height: 52,
        isLoading: state.isLoading,
        onPressed: !state.isValid
            ? null
            : () => context.read<MerchantInputProductBloc>().add(
                MerchantInputProductSaved(),
              ),
      ),
    );
  }
}
