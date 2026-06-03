import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_product_category.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_product_variant.dart';
import 'package:warunk/app/features/merchant/presentation/input_product/bloc/merchant_input_product_bloc.dart';
import 'package:warunk/core/dependency/dependency.dart';
import 'package:warunk/core/helper/dialog_helper.dart';
import 'package:warunk/core/widgets/loading_app_widget.dart';
import 'package:warunk/core/widgets/primary_button.dart';
import 'package:warunk/main.dart';
import 'package:warunk/theme/app_colors.dart';
import 'package:warunk/core/helper/number_helper.dart';

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
                    _CategoryDropdown(
                      categories: state.categories,
                      selectedCategory: state.category,
                      isLoading: state.isCategoriesLoading,
                      onChanged: (v) => context
                          .read<MerchantInputProductBloc>()
                          .add(MerchantInputProductCategoryChanged(v)),
                    ),
                    const SizedBox(height: 20),

                    // ── Harga (hanya tampil jika tidak ada varian) ─────────
                    if (!state.hasVariants) ...
                      [
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
                      ],

                    // ── Minimal Pembelian & Stok (hanya jika tidak ada varian)
                    if (!state.hasVariants) ...
                      [
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
                      ],

                    // ── Berat & Dimensi (tampil jika: tidak ada varian, atau isSameDimension)
                    if (!state.hasVariants || state.isSameDimension) ...[
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
                    ],

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

                    // ── Switch dimensi (hanya tampil jika ada varian) ──────
                    if (state.hasVariants) ...
                      [
                        const SizedBox(height: 4),
                        _SameDimensionRow(
                          isSameDimension: state.isSameDimension,
                        ),
                        const SizedBox(height: 16),
                      ],

                    // ── Varian ─────────────────────────────────────────────
                    _VariantSection(
                      variants: state.variants,
                      combinations: state.combinations,
                      isSameDimension: state.isSameDimension,
                      canAddVariant: state.canAddVariant,
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
// Category Dropdown
// ─────────────────────────────────────────────────────────────────────────────
class _CategoryDropdown extends StatelessWidget {
  const _CategoryDropdown({
    required this.categories,
    required this.selectedCategory,
    required this.isLoading,
    required this.onChanged,
  });

  final List<MerchantProductCategoryEntity> categories;
  final String selectedCategory;
  final bool isLoading;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    // Find currently selected item (match by slug, fallback null)
    final selected = categories.isEmpty
        ? null
        : categories.cast<MerchantProductCategoryEntity?>().firstWhere(
              (c) => c!.slug == selectedCategory || c.name == selectedCategory,
              orElse: () => null,
            );

    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.greyBorder),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: isLoading
          ? const SizedBox(
              height: 48,
              child: Center(
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              ),
            )
          : DropdownButtonHideUnderline(
              child: DropdownButton<MerchantProductCategoryEntity>(
                isExpanded: true,
                value: selected,
                hint: const Text(
                  'Pilih kategori produk',
                  style: TextStyle(fontSize: 14, color: AppColors.greyText),
                ),
                icon: const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: AppColors.greyText,
                ),
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.textDark,
                ),
                dropdownColor: AppColors.white,
                borderRadius: BorderRadius.circular(12),
                items: categories
                    .map(
                      (c) => DropdownMenuItem<MerchantProductCategoryEntity>(
                        value: c,
                        child: Text(c.name),
                      ),
                    )
                    .toList(),
                onChanged: (c) {
                  if (c != null) onChanged(c.slug);
                },
              ),
            ),
    );
  }
}

class _VariantSection extends StatelessWidget {
  const _VariantSection({
    required this.variants,
    required this.combinations,
    required this.isSameDimension,
    required this.canAddVariant,
  });
  final List<VariantInput> variants;
  final List<MerchantProductVariantSendParam> combinations;
  final bool isSameDimension;
  final bool canAddVariant;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Header ──────────────────────────────────────────────────
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Varian Produk',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textDark,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    canAddVariant
                        ? 'Maks. 2 varian – misal warna, ukuran'
                        : 'Batas maksimal 2 varian sudah tercapai',
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.greyText,
                    ),
                  ),
                ],
              ),
            ),
            TextButton.icon(
              onPressed: canAddVariant
                  ? () => context
                      .read<MerchantInputProductBloc>()
                      .add(MerchantInputProductVariantAdded())
                  : null,
              icon: const Icon(Icons.add, size: 16),
              label: const Text('Tambah'),
              style: TextButton.styleFrom(
                foregroundColor:
                    canAddVariant ? AppColors.primary : AppColors.greyText,
                textStyle: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
              ),
            ),
          ],
        ),

        // ── Variant definition cards ─────────────────────────────────
        if (variants.isNotEmpty) ...[
          const SizedBox(height: 12),
          ...variants.asMap().entries.map(
            (e) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _VariantCard(
                variantIndex: e.key,
                variant: e.value,
              ),
            ),
          ),
        ],

        // ── Combinations section ─────────────────────────────────────
        if (combinations.isNotEmpty) ...[
          const SizedBox(height: 20),
          _CombinationsSection(
            combinations: combinations,
            isSameDimension: isSameDimension,
          ),
        ],
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Single Variant Card — shows variant name + list of option name inputs
// ─────────────────────────────────────────────────────────────────────────────
class _VariantCard extends StatelessWidget {
  const _VariantCard({
    required this.variantIndex,
    required this.variant,
  });
  final int variantIndex;
  final VariantInput variant;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.greyBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Variant name + delete ──────────────────────────────────
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 12, 8, 8),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    initialValue: variant.name,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textDark,
                    ),
                    decoration: const InputDecoration(
                      hintText: 'Nama varian (contoh: Warna)',
                      hintStyle: TextStyle(
                        fontSize: 14,
                        color: AppColors.greyText,
                      ),
                      border: InputBorder.none,
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                    ),
                    onChanged: (v) => context
                        .read<MerchantInputProductBloc>()
                        .add(MerchantInputProductVariantNameChanged(
                          variantIndex,
                          v,
                        )),
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.delete_outline,
                    size: 18,
                    color: Colors.red,
                  ),
                  tooltip: 'Hapus varian',
                  onPressed: () => context
                      .read<MerchantInputProductBloc>()
                      .add(MerchantInputProductVariantRemoved(variantIndex)),
                ),
              ],
            ),
          ),

          if (variant.name.isNotEmpty) ...[
            const Divider(height: 1, color: AppColors.greyBorder),

            // ── Option name rows ──────────────────────────────────
            ...variant.options.asMap().entries.map(
              (e) => _VariantOptionNameRow(
                variantIndex: variantIndex,
                optionIndex: e.key,
                optionName: e.value,
              ),
            ),

            // ── Add option button ─────────────────────────────────
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 8, 14, 12),
              child: GestureDetector(
                onTap: () => context
                    .read<MerchantInputProductBloc>()
                    .add(MerchantInputProductVariantOptionAdded(variantIndex)),
                child: Row(
                  children: [
                    Icon(
                      Icons.add_circle_outline,
                      size: 16,
                      color: AppColors.primary,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      '+ Tambah Pilihan',
                      style: TextStyle(
                        fontSize: 13,
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ] else
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 4, 14, 12),
              child: Text(
                'Masukkan nama varian terlebih dahulu',
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.greyText.withValues(alpha: 0.7),
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Option name input row (plain string, no price/stock here)
// ─────────────────────────────────────────────────────────────────────────────
class _VariantOptionNameRow extends StatelessWidget {
  const _VariantOptionNameRow({
    required this.variantIndex,
    required this.optionIndex,
    required this.optionName,
  });
  final int variantIndex;
  final int optionIndex;
  final String optionName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(14, 0, 8, 0),
      child: Row(
        children: [
          const Icon(Icons.drag_handle, size: 16, color: AppColors.greyText),
          const SizedBox(width: 8),
          Expanded(
            child: TextFormField(
              initialValue: optionName,
              style: const TextStyle(fontSize: 13, color: AppColors.textDark),
              decoration: const InputDecoration(
                hintText: 'Nama pilihan (contoh: Merah)',
                hintStyle: TextStyle(fontSize: 13, color: AppColors.greyText),
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.symmetric(vertical: 10),
              ),
              onChanged: (v) => context
                  .read<MerchantInputProductBloc>()
                  .add(MerchantInputProductVariantOptionNameChanged(
                    variantIndex,
                    optionIndex,
                    v,
                  )),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.close, size: 16, color: AppColors.greyText),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
            onPressed: () => context
                .read<MerchantInputProductBloc>()
                .add(MerchantInputProductVariantOptionRemoved(
                  variantIndex,
                  optionIndex,
                )),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Combinations Section — shows Cartesian product results
// ─────────────────────────────────────────────────────────────────────────────
class _CombinationsSection extends StatelessWidget {
  const _CombinationsSection({
    required this.combinations,
    required this.isSameDimension,
  });
  final List<MerchantProductVariantSendParam> combinations;
  final bool isSameDimension;

  String _label(Map<String, dynamic> combo) {
    final sorted = combo.entries.toList()
      ..sort((a, b) => a.key.compareTo(b.key));
    return sorted.map((e) => '${e.value}').join(' / ');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 4,
              height: 16,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              'Kombinasi Varian (${combinations.length})',
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: AppColors.textDark,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        const Text(
          'Isi harga, stok, dan data lainnya untuk setiap kombinasi',
          style: TextStyle(fontSize: 12, color: AppColors.greyText),
        ),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.greyBorder),
          ),
          child: Column(
            children: combinations.asMap().entries.map((e) {
              return _CombinationCard(
                index: e.key,
                combination: e.value,
                label: _label(e.value.variantCombination),
                isSameDimension: isSameDimension,
                showDivider: e.key < combinations.length - 1,
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Single Combination Card (expandable)
// ─────────────────────────────────────────────────────────────────────────────
class _CombinationCard extends StatefulWidget {
  const _CombinationCard({
    required this.index,
    required this.combination,
    required this.label,
    required this.isSameDimension,
    required this.showDivider,
  });
  final int index;
  final MerchantProductVariantSendParam combination;
  final String label;
  final bool isSameDimension;
  final bool showDivider;

  @override
  State<_CombinationCard> createState() => _CombinationCardState();
}

class _CombinationCardState extends State<_CombinationCard> {
  bool _expanded = false;

  String get _priceSummary => widget.combination.price > 0
      ? NumberHelper.formatIDR(widget.combination.price)
      : 'Belum diisi';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () => setState(() => _expanded = !_expanded),
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(14, 10, 12, 10),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    widget.label,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    _priceSummary,
                    style: TextStyle(
                      fontSize: 12,
                      color: widget.combination.price > 0
                          ? AppColors.textDark
                          : AppColors.greyText,
                    ),
                  ),
                ),
                AnimatedRotation(
                  turns: _expanded ? 0.5 : 0,
                  duration: const Duration(milliseconds: 180),
                  child: const Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 20,
                    color: AppColors.greyText,
                  ),
                ),
              ],
            ),
          ),
        ),
        if (_expanded) ...[
          const Divider(height: 1, color: AppColors.greyBorder),
          _CombinationFields(
            index: widget.index,
            combination: widget.combination,
            isSameDimension: widget.isSameDimension,
          ),
        ],
        if (widget.showDivider)
          const Divider(height: 1, color: AppColors.greyBorder),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Combination Fields (price / stock / minPurchase + optional dimensions)
// ─────────────────────────────────────────────────────────────────────────────
class _CombinationFields extends StatelessWidget {
  const _CombinationFields({
    required this.index,
    required this.combination,
    required this.isSameDimension,
  });
  final int index;
  final MerchantProductVariantSendParam combination;
  final bool isSameDimension;

  void _update(BuildContext context, MerchantProductVariantSendParam updated) {
    context.read<MerchantInputProductBloc>().add(
      MerchantInputProductCombinationChanged(index, updated),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(14, 12, 14, 14),
      child: Column(
        children: [
          _OptionFieldRow(
            label: 'Harga',
            hintText: '0',
            prefixText: 'Rp ',
            initialValue:
                combination.price > 0 ? combination.price.toString() : '',
            isNumber: true,
            onChanged: (v) => _update(
              context,
              combination.copyWith(price: int.tryParse(v) ?? 0),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: _OptionFieldRow(
                  label: 'Stok',
                  hintText: '0',
                  initialValue:
                      combination.stock > 0
                          ? combination.stock.toString()
                          : '',
                  isNumber: true,
                  onChanged: (v) => _update(
                    context,
                    combination.copyWith(stock: int.tryParse(v) ?? 0),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _OptionFieldRow(
                  label: 'Min. Beli',
                  hintText: '1',
                  initialValue:
                      combination.minPurchase > 0
                          ? combination.minPurchase.toString()
                          : '',
                  isNumber: true,
                  onChanged: (v) => _update(
                    context,
                    combination.copyWith(minPurchase: int.tryParse(v) ?? 1),
                  ),
                ),
              ),
            ],
          ),
          if (!isSameDimension) ...[
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: _OptionFieldRow(
                    label: 'Berat (g)',
                    hintText: '0',
                    initialValue:
                        (combination.weight ?? 0) > 0
                            ? combination.weight.toString()
                            : '',
                    isNumber: true,
                    onChanged: (v) => _update(
                      context,
                      combination.copyWith(weight: int.tryParse(v)),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _OptionFieldRow(
                    label: 'Panjang (cm)',
                    hintText: '0',
                    initialValue:
                        (combination.length ?? 0) > 0
                            ? combination.length.toString()
                            : '',
                    isNumber: true,
                    onChanged: (v) => _update(
                      context,
                      combination.copyWith(length: int.tryParse(v)),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: _OptionFieldRow(
                    label: 'Lebar (cm)',
                    hintText: '0',
                    initialValue:
                        (combination.width ?? 0) > 0
                            ? combination.width.toString()
                            : '',
                    isNumber: true,
                    onChanged: (v) => _update(
                      context,
                      combination.copyWith(width: int.tryParse(v)),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _OptionFieldRow(
                    label: 'Tinggi (cm)',
                    hintText: '0',
                    initialValue:
                        (combination.height ?? 0) > 0
                            ? combination.height.toString()
                            : '',
                    isNumber: true,
                    onChanged: (v) => _update(
                      context,
                      combination.copyWith(height: int.tryParse(v)),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Reusable compact field row
// ─────────────────────────────────────────────────────────────────────────────
class _OptionFieldRow extends StatelessWidget {
  const _OptionFieldRow({
    required this.label,
    required this.hintText,
    required this.initialValue,
    required this.onChanged,
    this.prefixText,
    this.isNumber = false,
  });
  final String label;
  final String hintText;
  final String initialValue;
  final ValueChanged<String> onChanged;
  final String? prefixText;
  final bool isNumber;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: AppColors.greyText,
          ),
        ),
        const SizedBox(height: 4),
        Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.greyBorder),
          ),
          child: TextFormField(
            initialValue: initialValue,
            keyboardType: isNumber ? TextInputType.number : TextInputType.text,
            inputFormatters:
                isNumber ? [FilteringTextInputFormatter.digitsOnly] : null,
            onChanged: onChanged,
            style: const TextStyle(fontSize: 13, color: AppColors.textDark),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(
                fontSize: 13,
                color: AppColors.greyText,
              ),
              prefixText: prefixText,
              prefixStyle: const TextStyle(
                fontSize: 13,
                color: AppColors.textDark,
              ),
              border: InputBorder.none,
              isDense: true,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 8,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Same Dimension Switch Row
// ─────────────────────────────────────────────────────────────────────────────
class _SameDimensionRow extends StatelessWidget {
  const _SameDimensionRow({required this.isSameDimension});
  final bool isSameDimension;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Semua varian punya dimensi yang sama?',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textDark,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                isSameDimension
                    ? 'Dimensi diisi sekali untuk semua varian'
                    : 'Setiap kombinasi punya dimensi masing-masing',
                style: const TextStyle(fontSize: 12, color: AppColors.greyText),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () => context.read<MerchantInputProductBloc>().add(
            MerchantInputProductSameDimensionToggled(),
          ),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 220),
            width: 48,
            height: 28,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color:
                  isSameDimension ? AppColors.primary : AppColors.greyBorder,
            ),
            child: Stack(
              children: [
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 220),
                  curve: Curves.easeInOut,
                  left: isSameDimension ? 22 : 2,
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
