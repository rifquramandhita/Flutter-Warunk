import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:warunk/app/features/merchant/presentation/input_promo/bloc/merchant_input_promo_bloc.dart';
import 'package:warunk/theme/app_colors.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Entry point
// ─────────────────────────────────────────────────────────────────────────────
class MerchantInputPromoScreen extends StatelessWidget {
  final String? id;
  const MerchantInputPromoScreen({super.key, this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MerchantInputPromoBloc(),
      child: const _MerchantInputPromoView(),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Main view
// ─────────────────────────────────────────────────────────────────────────────
class _MerchantInputPromoView extends StatelessWidget {
  const _MerchantInputPromoView();

  @override
  Widget build(BuildContext context) {
    return BlocListener<MerchantInputPromoBloc, MerchantInputPromoState>(
      listener: (context, state) {
        if (state.isSaved) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('Promo berhasil ditambahkan!'),
              backgroundColor: AppColors.primary,
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          );
          Navigator.of(context).pop();
        }
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
        'Tambah Promo',
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
// Form body (scrollable)
// ─────────────────────────────────────────────────────────────────────────────
class _FormBody extends StatefulWidget {
  const _FormBody();

  @override
  State<_FormBody> createState() => _FormBodyState();
}

class _FormBodyState extends State<_FormBody> {
  late final TextEditingController _namaCtrl;
  late final TextEditingController _nilaiCtrl;
  late final TextEditingController _minBeliCtrl;
  late final TextEditingController _kuotaCtrl;

  @override
  void initState() {
    super.initState();
    _namaCtrl = TextEditingController();
    _nilaiCtrl = TextEditingController();
    _minBeliCtrl = TextEditingController();
    _kuotaCtrl = TextEditingController();
  }

  @override
  void dispose() {
    _namaCtrl.dispose();
    _nilaiCtrl.dispose();
    _minBeliCtrl.dispose();
    _kuotaCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MerchantInputPromoBloc, MerchantInputPromoState>(
      builder: (context, state) {
        return Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ── Tipe Promo ─────────────────────────────────────────
                    _SectionLabel('Tipe Promo'),
                    const SizedBox(height: 8),
                    _DropdownField(
                      value: state.tipe.isEmpty ? null : state.tipe,
                      hintText: 'Pilih tipe promo',
                      items: MerchantInputPromoState.tipeOptions,
                      onChanged: (v) {
                        if (v != null) {
                          context.read<MerchantInputPromoBloc>().add(
                            MerchantInputPromoTipeChanged(v),
                          );
                        }
                      },
                    ),
                    const SizedBox(height: 20),

                    // ── Nama Promo ─────────────────────────────────────────
                    _SectionLabel('Nama Promo'),
                    const SizedBox(height: 8),
                    _TextField(
                      controller: _namaCtrl,
                      hintText: 'Contoh: Diskon 15% Semua Menu',
                      onChanged: (v) => context
                          .read<MerchantInputPromoBloc>()
                          .add(MerchantInputPromoNamaChanged(v)),
                    ),
                    const SizedBox(height: 20),

                    // ── Nilai diskon / potongan ────────────────────────────
                    if (state.tipe.isNotEmpty) ...[
                      _SectionLabel(state.nilaiLabel),
                      const SizedBox(height: 8),
                      _TextField(
                        controller: _nilaiCtrl,
                        hintText: state.tipe.contains('Persen') ? '0' : '0',
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        prefixText: state.nilaiPrefix.isNotEmpty
                            ? state.nilaiPrefix
                            : null,
                        suffixText: state.nilaiSuffix.isNotEmpty
                            ? state.nilaiSuffix
                            : null,
                        onChanged: (v) => context
                            .read<MerchantInputPromoBloc>()
                            .add(MerchantInputPromoNilaiChanged(v)),
                      ),
                      const SizedBox(height: 20),
                    ],

                    // ── Min. Pembelian ─────────────────────────────────────
                    _SectionLabel('Min. Pembelian (Opsional)'),
                    const SizedBox(height: 8),
                    _TextField(
                      controller: _minBeliCtrl,
                      hintText: 'Rp 20.000',
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      prefixText: 'Rp ',
                      onChanged: (v) => context
                          .read<MerchantInputPromoBloc>()
                          .add(MerchantInputPromoMinBeliChanged(v)),
                    ),
                    const SizedBox(height: 20),

                    // ── Periode Promo ──────────────────────────────────────
                    _SectionLabel('Periode Promo'),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: _DatePickerField(
                            label: 'Mulai',
                            date: state.mulai,
                            firstDate: DateTime.now(),
                            lastDate: DateTime.now().add(
                              const Duration(days: 365),
                            ),
                            onPicked: (d) => context
                                .read<MerchantInputPromoBloc>()
                                .add(MerchantInputPromoMulaiChanged(d)),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _DatePickerField(
                            label: 'Selesai',
                            date: state.selesai,
                            firstDate: state.mulai ?? DateTime.now(),
                            lastDate: DateTime.now().add(
                              const Duration(days: 365),
                            ),
                            onPicked: (d) => context
                                .read<MerchantInputPromoBloc>()
                                .add(MerchantInputPromoSelesaiChanged(d)),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // ── Kuota ──────────────────────────────────────────────
                    _SectionLabel('Kuota (Opsional)'),
                    const SizedBox(height: 8),
                    _TextField(
                      controller: _kuotaCtrl,
                      hintText: '100',
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      suffixText: 'kali',
                      onChanged: (v) => context
                          .read<MerchantInputPromoBloc>()
                          .add(MerchantInputPromoKuotaChanged(v)),
                    ),
                  ],
                ),
              ),
            ),

            // ── Sticky save button ─────────────────────────────────────────
            _SimpanButton(state: state),
          ],
        );
      },
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
// Dropdown
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
            style: const TextStyle(fontSize: 14, color: AppColors.greyText),
          ),
          icon: const Icon(
            Icons.keyboard_arrow_down_rounded,
            color: AppColors.greyText,
          ),
          style: const TextStyle(fontSize: 14, color: AppColors.textDark),
          items: items
              .map((s) => DropdownMenuItem<String>(value: s, child: Text(s)))
              .toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Text field with optional prefix / suffix
// ─────────────────────────────────────────────────────────────────────────────
class _TextField extends StatelessWidget {
  const _TextField({
    required this.controller,
    required this.hintText,
    required this.onChanged,
    this.keyboardType,
    this.inputFormatters,
    this.prefixText,
    this.suffixText,
  });

  final TextEditingController controller;
  final String hintText;
  final ValueChanged<String> onChanged;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final String? prefixText;
  final String? suffixText;

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
          hintStyle: const TextStyle(fontSize: 14, color: AppColors.greyText),
          prefixText: prefixText,
          prefixStyle: const TextStyle(fontSize: 14, color: AppColors.textDark),
          suffix: suffixText != null
              ? Text(
                  suffixText!,
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.greyText,
                  ),
                )
              : null,
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
// Date picker field
// ─────────────────────────────────────────────────────────────────────────────
class _DatePickerField extends StatelessWidget {
  const _DatePickerField({
    required this.label,
    required this.date,
    required this.firstDate,
    required this.lastDate,
    required this.onPicked,
  });

  final String label;
  final DateTime? date;
  final DateTime firstDate;
  final DateTime lastDate;
  final ValueChanged<DateTime> onPicked;

  static final _fmt = DateFormat('d MMM yyyy', 'id');

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: AppColors.greyText,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 6),
        GestureDetector(
          onTap: () async {
            final picked = await showDatePicker(
              context: context,
              initialDate: date ?? DateTime.now(),
              firstDate: firstDate,
              lastDate: lastDate,
              builder: (ctx, child) => Theme(
                data: Theme.of(ctx).copyWith(
                  colorScheme: const ColorScheme.light(
                    primary: AppColors.primary,
                  ),
                ),
                child: child!,
              ),
            );
            if (picked != null) onPicked(picked);
          },
          child: Container(
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.greyBorder),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                Icon(
                  Icons.calendar_month_outlined,
                  size: 18,
                  color: date != null ? AppColors.primary : AppColors.greyText,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    date != null ? _fmt.format(date!) : '––',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: date != null
                          ? AppColors.textDark
                          : AppColors.greyText,
                    ),
                    overflow: TextOverflow.ellipsis,
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
// Sticky save button
// ─────────────────────────────────────────────────────────────────────────────
class _SimpanButton extends StatelessWidget {
  const _SimpanButton({required this.state});
  final MerchantInputPromoState state;

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
              : () => context.read<MerchantInputPromoBloc>().add(
                  MerchantInputPromoSaved(),
                ),
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
                  'Simpan Promo',
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
