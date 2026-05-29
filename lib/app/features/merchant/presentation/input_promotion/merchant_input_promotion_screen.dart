import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:warunk/app/features/merchant/presentation/input_promotion/bloc/merchant_input_promotion_bloc.dart';
import 'package:warunk/core/dependency/dependency.dart';
import 'package:warunk/core/helper/dialog_helper.dart';
import 'package:warunk/core/helper/global_helper.dart';
import 'package:warunk/core/widgets/loading_app_widget.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_promotion_product_assignment.dart';
import 'package:warunk/main.dart';

class MerchantInputPromotionScreen extends StatelessWidget {
  final String? id;
  const MerchantInputPromotionScreen({super.key, this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final bloc = sl<MerchantInputPromotionBloc>();
        bloc.add(MerchantInputPromotionFetchProductsEvent());
        if (id != null) {
          bloc.add(MerchantInputPromotionFetchDetailEvent(id!));
        }
        return bloc;
      },
      child: BlocConsumer<MerchantInputPromotionBloc, MerchantInputPromotionState>(
        listener: (context, state) {
          if (state.errorMessage != null) {
            DialogHelper.showErrorSnackBar(
              context: context,
              text: state.errorMessage!,
            );
          }
          if (state.isSuccess) {
            DialogHelper.showSnackBar(
              context: context,
              text: id == null
                  ? 'Promo berhasil ditambahkan!'
                  : 'Promo berhasil diubah!',
              color: Colors.green,
            );
            navigatorKey.currentState?.pop();
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: GlobalHelper.getColorSchema(context).surface,
            appBar: AppBar(
              title: Text(id == null ? 'Buat Promo Baru' : 'Ubah Promo'),
            ),
            body: _bodyBuild(context),
          );
        },
      ),
    );
  }

  Widget _bodyBuild(BuildContext context) {
    final state = context.watch<MerchantInputPromotionBloc>().state;
    return SafeArea(
      child: Stack(
        children: [
          _bodyLayout(context),
          if (state.isLoading) const LoadingAppWidget(),
        ],
      ),
    );
  }

  Widget _bodyLayout(BuildContext context) {
    final state = context.watch<MerchantInputPromotionBloc>().state;
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSectionLabel(context, 'Tipe Promo'),
                const SizedBox(height: 10),
                _buildDropdownField(context, state),
                const SizedBox(height: 20),

                _buildSectionLabel(context, 'Tipe Diskon'),
                const SizedBox(height: 10),
                _buildDropdownTipeDiskonField(context, state),
                const SizedBox(height: 20),

                if (state.tipe == 'product') ...[
                  _buildSectionLabel(context, 'Pilih Produk Promo'),
                  const SizedBox(height: 10),
                  _buildProductSelectionField(context, state),
                  const SizedBox(height: 20),
                ],

                _buildSectionLabel(context, 'Nama Promo'),
                const SizedBox(height: 8),
                _buildTextField(
                  context: context,
                  fieldKey: 'nama',
                  isDetailLoaded: state.isDetailLoaded,
                  initialValue: state.nama,
                  hintText: '',
                  onChanged: (v) => context.read<MerchantInputPromotionBloc>().add(
                    MerchantInputPromotionNamaChangedEvent(v),
                  ),
                ),
                const SizedBox(height: 20),

                if (state.tipe.isNotEmpty) ...[
                  _buildSectionLabel(context, state.nilaiLabel),
                  const SizedBox(height: 8),
                  _buildTextField(
                    context: context,
                    fieldKey: 'nilai',
                    isDetailLoaded: state.isDetailLoaded,
                    initialValue: state.nilai,
                    hintText: state.tipe.contains('Persen') ? '0' : '0',
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    prefixText: state.nilaiPrefix.isNotEmpty
                        ? state.nilaiPrefix
                        : null,
                    suffixText: state.nilaiSuffix.isNotEmpty
                        ? state.nilaiSuffix
                        : null,
                    onChanged: (v) => context
                        .read<MerchantInputPromotionBloc>()
                        .add(MerchantInputPromotionNilaiChangedEvent(v)),
                  ),
                  const SizedBox(height: 20),
                ],

                _buildSectionLabel(context, 'Min. Pembelian (Opsional)'),
                const SizedBox(height: 8),
                _buildTextField(
                  context: context,
                  fieldKey: 'minBeli',
                  isDetailLoaded: state.isDetailLoaded,
                  initialValue: state.minBeli,
                  hintText: '',
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  prefixText: 'Rp ',
                  onChanged: (v) => context.read<MerchantInputPromotionBloc>().add(
                    MerchantInputPromotionMinBeliChangedEvent(v),
                  ),
                ),
                const SizedBox(height: 20),

                _buildSectionLabel(context, 'Periode Promo'),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: _buildDatePickerField(
                        context: context,
                        label: 'Mulai',
                        date: state.mulai,
                        firstDate: (state.mulai != null && state.mulai!.isBefore(DateTime.now()))
                            ? state.mulai!
                            : DateTime.now(),
                        lastDate: DateTime.now().add(const Duration(days: 3650)),
                        onPicked: (d) => context
                            .read<MerchantInputPromotionBloc>()
                            .add(MerchantInputPromotionMulaiChangedEvent(d)),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _buildDatePickerField(
                        context: context,
                        label: 'Selesai',
                        date: state.selesai,
                        firstDate: (state.selesai != null && state.selesai!.isBefore(state.mulai ?? DateTime.now()))
                            ? state.selesai!
                            : (state.mulai ?? DateTime.now()),
                        lastDate: DateTime.now().add(const Duration(days: 3650)),
                        onPicked: (d) => context
                            .read<MerchantInputPromotionBloc>()
                            .add(MerchantInputPromotionSelesaiChangedEvent(d)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                _buildSectionLabel(context, 'Kuota (Opsional)'),
                const SizedBox(height: 8),
                _buildTextField(
                  context: context,
                  fieldKey: 'kuota',
                  isDetailLoaded: state.isDetailLoaded,
                  initialValue: state.kuota,
                  hintText: '',
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  suffixText: 'kali',
                  onChanged: (v) => context.read<MerchantInputPromotionBloc>().add(
                    MerchantInputPromotionKuotaChangedEvent(v),
                  ),
                ),
              ],
            ),
          ),
        ),
        _buildSimpanButton(context),
      ],
    );
  }

  Widget _buildSectionLabel(BuildContext context, String text) {
    return Text(
      text,
      style:
          GlobalHelper.getTextTheme(
            context,
            appTextStyle: AppTextStyle.TITLE_SMALL,
          )?.copyWith(
            fontWeight: FontWeight.w600,
            color: GlobalHelper.getColorSchema(context).onSurface,
          ),
    );
  }

  Widget _buildDropdownField(
    BuildContext context,
    MerchantInputPromotionState state,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: GlobalHelper.getColorSchema(context).surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: GlobalHelper.getColorSchema(context).outline),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: state.tipe.isEmpty ? null : state.tipe,
          isExpanded: true,
          hint: Text(
            'Pilih tipe promo',
            style:
                GlobalHelper.getTextTheme(
                  context,
                  appTextStyle: AppTextStyle.BODY_MEDIUM,
                )?.copyWith(
                  color: GlobalHelper.getColorSchema(context).onSurfaceVariant,
                ),
          ),
          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
            color: GlobalHelper.getColorSchema(context).onSurfaceVariant,
          ),
          style: GlobalHelper.getTextTheme(
            context,
            appTextStyle: AppTextStyle.BODY_MEDIUM,
          )?.copyWith(color: GlobalHelper.getColorSchema(context).onSurface),
          items: MerchantInputPromotionState.tipeOptions
              .map((s) => DropdownMenuItem<String>(value: s, child: Text(s)))
              .toList(),
          onChanged: (v) {
            if (v != null) {
              context.read<MerchantInputPromotionBloc>().add(
                MerchantInputPromotionTipeChangedEvent(v),
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildDropdownTipeDiskonField(
    BuildContext context,
    MerchantInputPromotionState state,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: GlobalHelper.getColorSchema(context).surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: GlobalHelper.getColorSchema(context).outline),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: state.tipeDiskon.isEmpty ? null : state.tipeDiskon,
          isExpanded: true,
          hint: Text(
            'Pilih tipe diskon',
            style:
                GlobalHelper.getTextTheme(
                  context,
                  appTextStyle: AppTextStyle.BODY_MEDIUM,
                )?.copyWith(
                  color: GlobalHelper.getColorSchema(context).onSurfaceVariant,
                ),
          ),
          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
            color: GlobalHelper.getColorSchema(context).onSurfaceVariant,
          ),
          style: GlobalHelper.getTextTheme(
            context,
            appTextStyle: AppTextStyle.BODY_MEDIUM,
          )?.copyWith(color: GlobalHelper.getColorSchema(context).onSurface),
          items: MerchantInputPromotionState.tipeDiskonOptions
              .map((s) => DropdownMenuItem<String>(value: s, child: Text(s)))
              .toList(),
          onChanged: (v) {
            if (v != null) {
              context.read<MerchantInputPromotionBloc>().add(
                MerchantInputPromotionTipeDiskonChangedEvent(v),
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildProductSelectionField(
    BuildContext context,
    MerchantInputPromotionState state,
  ) {
    if (state.isProductsLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.products.isEmpty) {
      return Text(
        'Tidak ada produk tersedia',
        style: GlobalHelper.getTextTheme(
          context,
          appTextStyle: AppTextStyle.BODY_MEDIUM,
        )?.copyWith(color: GlobalHelper.getColorSchema(context).error),
      );
    }

    return Column(
      children: [
        ...List.generate(state.selectedProductIds.length, (index) {
          final selectedId = state.selectedProductIds[index];
          final hasValidId =
              selectedId != null &&
              state.products.any((p) => p.id == selectedId);
          final dropdownValue = hasValidId ? selectedId : null;

          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: GlobalHelper.getColorSchema(context).surface,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: GlobalHelper.getColorSchema(context).outline,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: dropdownValue,
                        isExpanded: true,
                        hint: Text(
                          'Pilih produk',
                          style:
                              GlobalHelper.getTextTheme(
                                context,
                                appTextStyle: AppTextStyle.BODY_MEDIUM,
                              )?.copyWith(
                                color: GlobalHelper.getColorSchema(
                                  context,
                                ).onSurfaceVariant,
                              ),
                        ),
                        items: state.products
                            .map(
                              (p) => DropdownMenuItem(
                                value: p.id,
                                child: Text(
                                  p.name,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: (val) {
                          if (val != null) {
                            context.read<MerchantInputPromotionBloc>().add(
                              MerchantInputPromotionProductSelectedEvent(
                                index,
                                val,
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.remove_circle_outline,
                    color: GlobalHelper.getColorSchema(context).error,
                  ),
                  onPressed: () {
                    context.read<MerchantInputPromotionBloc>().add(
                      MerchantInputPromotionRemoveProductRowEvent(index),
                    );
                  },
                ),
              ],
            ),
          );
        }),
        OutlinedButton.icon(
          onPressed: () {
            context.read<MerchantInputPromotionBloc>().add(
              MerchantInputPromotionAddProductRowEvent(),
            );
          },
          icon: const Icon(Icons.add),
          label: const Text('Tambah Produk'),
          style: OutlinedButton.styleFrom(
            minimumSize: const Size(double.infinity, 48),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTextField({
    required BuildContext context,
    required String hintText,
    required ValueChanged<String> onChanged,
    String? fieldKey,
    bool isDetailLoaded = false,
    String? initialValue,
    TextInputType? keyboardType,
    List<TextInputFormatter>? inputFormatters,
    String? prefixText,
    String? suffixText,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: GlobalHelper.getColorSchema(context).surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: GlobalHelper.getColorSchema(context).outline),
      ),
      child: TextFormField(
        key: fieldKey != null ? ValueKey('${fieldKey}_$isDetailLoaded') : null,
        initialValue: initialValue,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        onChanged: onChanged,
        style: GlobalHelper.getTextTheme(
          context,
          appTextStyle: AppTextStyle.BODY_MEDIUM,
        )?.copyWith(color: GlobalHelper.getColorSchema(context).onSurface),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle:
              GlobalHelper.getTextTheme(
                context,
                appTextStyle: AppTextStyle.BODY_MEDIUM,
              )?.copyWith(
                color: GlobalHelper.getColorSchema(context).onSurfaceVariant,
              ),
          prefixText: prefixText,
          prefixStyle: GlobalHelper.getTextTheme(
            context,
            appTextStyle: AppTextStyle.BODY_MEDIUM,
          )?.copyWith(color: GlobalHelper.getColorSchema(context).onSurface),
          suffix: suffixText != null
              ? Text(
                  suffixText,
                  style:
                      GlobalHelper.getTextTheme(
                        context,
                        appTextStyle: AppTextStyle.BODY_MEDIUM,
                      )?.copyWith(
                        color: GlobalHelper.getColorSchema(
                          context,
                        ).onSurfaceVariant,
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

  Widget _buildDatePickerField({
    required BuildContext context,
    required String label,
    required DateTime? date,
    required DateTime firstDate,
    required DateTime lastDate,
    required ValueChanged<DateTime> onPicked,
  }) {
    final fmt = DateFormat('d MMM yyyy', 'id');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style:
              GlobalHelper.getTextTheme(
                context,
                appTextStyle: AppTextStyle.BODY_SMALL,
              )?.copyWith(
                color: GlobalHelper.getColorSchema(context).onSurfaceVariant,
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
            );
            if (picked != null) onPicked(picked);
          },
          child: Container(
            height: 48,
            decoration: BoxDecoration(
              color: GlobalHelper.getColorSchema(context).surface,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: GlobalHelper.getColorSchema(context).outline,
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                Icon(
                  Icons.calendar_month_outlined,
                  size: 18,
                  color: date != null
                      ? GlobalHelper.getColorSchema(context).primary
                      : GlobalHelper.getColorSchema(context).onSurfaceVariant,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    date != null ? fmt.format(date) : '––',
                    style:
                        GlobalHelper.getTextTheme(
                          context,
                          appTextStyle: AppTextStyle.BODY_SMALL,
                        )?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: date != null
                              ? GlobalHelper.getColorSchema(context).onSurface
                              : GlobalHelper.getColorSchema(
                                  context,
                                ).onSurfaceVariant,
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

  Widget _buildSimpanButton(BuildContext context) {
    final state = context.watch<MerchantInputPromotionBloc>().state;
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
      decoration: BoxDecoration(
        color: GlobalHelper.getColorSchema(context).surface,
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
          onPressed: (state.isLoading || !state.isValid)
              ? null
              : () => context.read<MerchantInputPromotionBloc>().add(
                  MerchantInputPromotionSavedEvent(),
                ),
          style: ElevatedButton.styleFrom(
            backgroundColor: GlobalHelper.getColorSchema(context).primary,
            disabledBackgroundColor: GlobalHelper.getColorSchema(
              context,
            ).primary.withValues(alpha: 0.5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            elevation: 0,
          ),
          child: Text(
            'Simpan Promo',
            style:
                GlobalHelper.getTextTheme(
                  context,
                  appTextStyle: AppTextStyle.TITLE_SMALL,
                )?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: GlobalHelper.getColorSchema(context).onPrimary,
                ),
          ),
        ),
      ),
    );
  }
}
