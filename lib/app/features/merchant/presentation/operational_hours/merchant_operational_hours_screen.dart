import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/merchant/presentation/operational_hours/bloc/merchant_operational_hours_bloc.dart';
import 'package:warunk/core/dependency/dependency.dart';
import 'package:warunk/core/helper/dialog_helper.dart';
import 'package:warunk/core/helper/global_helper.dart';
import 'package:warunk/core/widgets/loading_app_widget.dart';
import 'package:warunk/main.dart';

class MerchantOperationalHoursScreen extends StatelessWidget {
  const MerchantOperationalHoursScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<MerchantOperationalHoursBloc>()
        ..add(MerchantOperationalHoursEventGet()),
      child: BlocConsumer<MerchantOperationalHoursBloc,
          MerchantOperationalHoursState>(
        listener: (context, state) {
          if (state.errorMessage != null) {
            DialogHelper.showErrorSnackBar(
                context: context, text: state.errorMessage!);
          }
          if (state.isSaved) {
            DialogHelper.showSnackBar(
              context: context,
              text: 'Jam operasional berhasil disimpan!',
              color: GlobalHelper.getColorSchema(context).primary,
            );
            navigatorKey.currentState?.pop();
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(title: const Text('Jam Operasional')),
            body: _bodyBuild(context),
          );
        },
      ),
    );
  }

  Widget _bodyBuild(BuildContext context) {
    final state = context.watch<MerchantOperationalHoursBloc>().state;
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
    final state = context.watch<MerchantOperationalHoursBloc>().state;
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _mainStatusCard(context, state),
                const SizedBox(height: 16),
                _dailyHoursCard(context, state),
                const SizedBox(height: 16),
                _additionalSettingsCard(context, state),
              ],
            ),
          ),
        ),
        _bottomActionButtons(context, state),
      ],
    );
  }

  Widget _mainStatusCard(
      BuildContext context, MerchantOperationalHoursState state) {
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
                Text(
                  'Toko Sedang Buka',
                  style: GlobalHelper.getTextTheme(
                    context,
                    appTextStyle: AppTextStyle.BODY_MEDIUM,
                  )?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  'Pelanggan dapat melakukan order',
                  style: GlobalHelper.getTextTheme(
                    context,
                    appTextStyle: AppTextStyle.BODY_SMALL,
                  )?.copyWith(color: colorScheme.onSurfaceVariant),
                ),
              ],
            ),
          ),
          Column(
            children: [
              _CustomSwitch(
                isActive: state.isStoreOpen,
                onChanged: () => context
                    .read<MerchantOperationalHoursBloc>()
                    .add(MerchantOperationalHoursEventStoreStatusToggled()),
              ),
              const SizedBox(height: 4),
              Text(
                state.isStoreOpen ? 'Buka' : 'Tutup',
                style: GlobalHelper.getTextTheme(
                  context,
                  appTextStyle: AppTextStyle.LABEL_SMALL,
                )?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: state.isStoreOpen
                      ? colorScheme.primary
                      : colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _dailyHoursCard(
      BuildContext context, MerchantOperationalHoursState state) {
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
    return Row(
      children: [
        SizedBox(
          width: 65,
          child: Text(
            day.dayName,
            style: GlobalHelper.getTextTheme(
              context,
              appTextStyle: AppTextStyle.BODY_MEDIUM,
            )?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        _CustomSwitch(
          isActive: day.isOpen,
          onChanged: () => context.read<MerchantOperationalHoursBloc>().add(
                MerchantOperationalHoursEventDayToggled(dayIndex),
              ),
        ),
        const SizedBox(width: 12),
        if (day.isOpen) ...[
          Text(
            'Buka',
            style: GlobalHelper.getTextTheme(
              context,
              appTextStyle: AppTextStyle.BODY_SMALL,
            )?.copyWith(color: colorScheme.onSurfaceVariant),
          ),
          const SizedBox(width: 8),
          _timeDropdown(
            context,
            day.startTime,
            (v) => context.read<MerchantOperationalHoursBloc>().add(
                  MerchantOperationalHoursEventStartTimeChanged(dayIndex, v!),
                ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Text(
              '-',
              style: GlobalHelper.getTextTheme(
                context,
                appTextStyle: AppTextStyle.BODY_SMALL,
              )?.copyWith(color: colorScheme.onSurfaceVariant),
            ),
          ),
          _timeDropdown(
            context,
            day.endTime,
            (v) => context.read<MerchantOperationalHoursBloc>().add(
                  MerchantOperationalHoursEventEndTimeChanged(dayIndex, v!),
                ),
          ),
        ] else ...[
          Expanded(
            child: Text(
              'Toko Tutup',
              style: GlobalHelper.getTextTheme(
                context,
                appTextStyle: AppTextStyle.BODY_SMALL,
              )?.copyWith(color: colorScheme.onSurfaceVariant),
            ),
          ),
        ],
      ],
    );
  }

  Widget _timeDropdown(
      BuildContext context, String value, ValueChanged<String?> onChanged) {
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
          icon: Icon(
            Icons.keyboard_arrow_down,
            size: 16,
            color: colorScheme.onSurfaceVariant,
          ),
          style: GlobalHelper.getTextTheme(
            context,
            appTextStyle: AppTextStyle.BODY_SMALL,
          ),
          items: MerchantOperationalHoursState.timeOptions
              .map((t) => DropdownMenuItem(value: t, child: Text(t)))
              .toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }

  Widget _additionalSettingsCard(
      BuildContext context, MerchantOperationalHoursState state) {
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
          Text(
            'Pengaturan Tambahan',
            style: GlobalHelper.getTextTheme(
              context,
              appTextStyle: AppTextStyle.BODY_MEDIUM,
            )?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: colorScheme.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  Icons.shopping_bag_outlined,
                  color: colorScheme.primary,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Terima Pre-order',
                      style: GlobalHelper.getTextTheme(
                        context,
                        appTextStyle: AppTextStyle.BODY_SMALL,
                      )?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Terima pesanan untuk waktu di luar\njam operasional',
                      style: GlobalHelper.getTextTheme(
                        context,
                        appTextStyle: AppTextStyle.LABEL_SMALL,
                      )?.copyWith(color: colorScheme.onSurfaceVariant),
                    ),
                  ],
                ),
              ),
              _CustomSwitch(
                isActive: state.acceptPreorder,
                onChanged: () => context
                    .read<MerchantOperationalHoursBloc>()
                    .add(MerchantOperationalHoursEventPreorderToggled()),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Divider(height: 1, color: colorScheme.outlineVariant),
          ),
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF7ED),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.access_time,
                  color: Color(0xFFF97316),
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tutup Otomatis saat di luar jam operasional',
                      style: GlobalHelper.getTextTheme(
                        context,
                        appTextStyle: AppTextStyle.BODY_SMALL,
                      )?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Toko akan otomatis berubah menjadi tutup\ndi luar jam operasional',
                      style: GlobalHelper.getTextTheme(
                        context,
                        appTextStyle: AppTextStyle.LABEL_SMALL,
                      )?.copyWith(color: colorScheme.onSurfaceVariant),
                    ),
                  ],
                ),
              ),
              _CustomSwitch(
                isActive: state.autoClose,
                onChanged: () => context
                    .read<MerchantOperationalHoursBloc>()
                    .add(MerchantOperationalHoursEventAutoCloseToggled()),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _bottomActionButtons(
      BuildContext context, MerchantOperationalHoursState state) {
    final colorScheme = GlobalHelper.getColorSchema(context);
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SizedBox(
        width: double.infinity,
        height: 48,
        child: ElevatedButton(
          onPressed: state.isSaving
              ? null
              : () => context.read<MerchantOperationalHoursBloc>().add(
                    MerchantOperationalHoursEventSaved(),
                  ),
          style: ElevatedButton.styleFrom(
            backgroundColor: colorScheme.primary,
            disabledBackgroundColor: colorScheme.primary.withValues(alpha: 0.5),
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
              : Text(
                  'Simpan Pengaturan',
                  style: GlobalHelper.getTextTheme(
                    context,
                    appTextStyle: AppTextStyle.BODY_MEDIUM,
                  )?.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
                ),
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
    final colorScheme = GlobalHelper.getColorSchema(context);
    return GestureDetector(
      onTap: onChanged,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        width: 48,
        height: 28,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: isActive ? colorScheme.primary : colorScheme.outlineVariant,
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
    );
  }
}
