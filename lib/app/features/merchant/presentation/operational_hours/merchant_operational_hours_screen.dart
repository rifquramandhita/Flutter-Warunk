import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/merchant/presentation/operational_hours/bloc/merchant_operational_hours_bloc.dart';
import 'package:warunk/core/constants/app_colors.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Entry point
// ─────────────────────────────────────────────────────────────────────────────
class MerchantOperationalHoursScreen extends StatelessWidget {
  const MerchantOperationalHoursScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MerchantOperationalHoursBloc(),
      child: const _MerchantOperationalHoursView(),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Main view
// ─────────────────────────────────────────────────────────────────────────────
class _MerchantOperationalHoursView extends StatelessWidget {
  const _MerchantOperationalHoursView();

  @override
  Widget build(BuildContext context) {
    return BlocListener<MerchantOperationalHoursBloc, MerchantOperationalHoursState>(
      listenWhen: (prev, curr) => curr.isSaved && !prev.isSaved,
      listener: (context, _) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Jam operasional berhasil disimpan!'),
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
        body: BlocBuilder<MerchantOperationalHoursBloc, MerchantOperationalHoursState>(
          builder: (context, state) {
            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Card 1: Toko Sedang Buka
                        _MainStatusCard(state: state),
                        const SizedBox(height: 16),
                        
                        // Card 2: Daily Hours List
                        _DailyHoursCard(state: state),
                        const SizedBox(height: 16),
                        
                        // Card 3: Additional Settings
                        _AdditionalSettingsCard(state: state),
                      ],
                    ),
                  ),
                ),
                
                // Bottom Button
                _BottomActionButtons(state: state),
              ],
            );
          },
        ),
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
        'Jam Operasional',
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
// Components
// ─────────────────────────────────────────────────────────────────────────────

class _MainStatusCard extends StatelessWidget {
  const _MainStatusCard({required this.state});
  final MerchantOperationalHoursState state;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.greyBorder.withValues(alpha: 0.5)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.storefront, color: AppColors.primary),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Toko Sedang Buka',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textDark,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Pelanggan dapat melakukan order',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.greyText,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              _CustomSwitch(
                isActive: state.isStoreOpen,
                onChanged: () => context.read<MerchantOperationalHoursBloc>().add(MerchantOperationalHoursStoreStatusToggled()),
              ),
              const SizedBox(height: 4),
              Text(
                state.isStoreOpen ? 'Buka' : 'Tutup',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: state.isStoreOpen ? AppColors.primary : AppColors.greyText,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _DailyHoursCard extends StatelessWidget {
  const _DailyHoursCard({required this.state});
  final MerchantOperationalHoursState state;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.greyBorder.withValues(alpha: 0.5)),
      ),
      child: Column(
        children: [
          for (var i = 0; i < state.dailyHours.length; i++) ...[
            _DailyRow(dayIndex: i, day: state.dailyHours[i]),
            if (i < state.dailyHours.length - 1)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Divider(height: 1, color: AppColors.greyBorder),
              ),
          ],
        ],
      ),
    );
  }
}

class _DailyRow extends StatelessWidget {
  const _DailyRow({required this.dayIndex, required this.day});
  final int dayIndex;
  final DailyHours day;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 65,
          child: Text(
            day.dayName,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AppColors.textDark,
            ),
          ),
        ),
        _CustomSwitch(
          isActive: day.isOpen,
          onChanged: () => context.read<MerchantOperationalHoursBloc>().add(MerchantOperationalHoursDayToggled(dayIndex)),
        ),
        const SizedBox(width: 12),
        if (day.isOpen) ...[
          const Text('Buka', style: TextStyle(fontSize: 12, color: AppColors.greyText)),
          const SizedBox(width: 8),
          _TimeDropdown(
            value: day.startTime,
            onChanged: (v) => context.read<MerchantOperationalHoursBloc>().add(MerchantOperationalHoursStartTimeChanged(dayIndex, v!)),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 6),
            child: Text('-', style: TextStyle(fontSize: 12, color: AppColors.greyText)),
          ),
          _TimeDropdown(
            value: day.endTime,
            onChanged: (v) => context.read<MerchantOperationalHoursBloc>().add(MerchantOperationalHoursEndTimeChanged(dayIndex, v!)),
          ),
        ] else ...[
          const Expanded(
            child: Text('Toko Tutup', style: TextStyle(fontSize: 13, color: AppColors.greyText)),
          ),
        ],
      ],
    );
  }
}

class _TimeDropdown extends StatelessWidget {
  const _TimeDropdown({required this.value, required this.onChanged});
  final String value;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: AppColors.greyBorder),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          icon: const Icon(Icons.keyboard_arrow_down, size: 16, color: AppColors.greyText),
          style: const TextStyle(fontSize: 12, color: AppColors.textDark),
          items: MerchantOperationalHoursState.timeOptions
              .map((t) => DropdownMenuItem(value: t, child: Text(t)))
              .toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}

class _AdditionalSettingsCard extends StatelessWidget {
  const _AdditionalSettingsCard({required this.state});
  final MerchantOperationalHoursState state;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.greyBorder.withValues(alpha: 0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Pengaturan Tambahan',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AppColors.textDark,
            ),
          ),
          const SizedBox(height: 16),
          // Pre-order
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.shopping_bag_outlined, color: AppColors.primary, size: 20),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Terima Pre-order',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textDark,
                      ),
                    ),
                    const SizedBox(height: 2),
                    const Text(
                      'Terima pesanan untuk waktu di luar\njam operasional',
                      style: TextStyle(
                        fontSize: 11,
                        color: AppColors.greyText,
                      ),
                    ),
                  ],
                ),
              ),
              _CustomSwitch(
                isActive: state.acceptPreorder,
                onChanged: () => context.read<MerchantOperationalHoursBloc>().add(MerchantOperationalHoursPreorderToggled()),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Divider(height: 1, color: AppColors.greyBorder),
          ),
          // Auto Close
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF7ED),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.access_time, color: Color(0xFFF97316), size: 20),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Tutup Otomatis saat di luar jam operasional',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textDark,
                      ),
                    ),
                    const SizedBox(height: 2),
                    const Text(
                      'Toko akan otomatis berubah menjadi tutup\ndi luar jam operasional',
                      style: TextStyle(
                        fontSize: 11,
                        color: AppColors.greyText,
                      ),
                    ),
                  ],
                ),
              ),
              _CustomSwitch(
                isActive: state.autoClose,
                onChanged: () => context.read<MerchantOperationalHoursBloc>().add(MerchantOperationalHoursAutoCloseToggled()),
              ),
            ],
          ),
        ],
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
    return GestureDetector(
      onTap: onChanged,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        width: 48,
        height: 28,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: isActive ? AppColors.primary : AppColors.greyBorder,
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

class _BottomActionButtons extends StatelessWidget {
  const _BottomActionButtons({required this.state});
  final MerchantOperationalHoursState state;

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
      child: SizedBox(
        width: double.infinity,
        height: 48,
        child: ElevatedButton(
          onPressed: state.isSaving
              ? null
              : () => context.read<MerchantOperationalHoursBloc>().add(MerchantOperationalHoursSaved()),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            disabledBackgroundColor: AppColors.primary.withValues(alpha: 0.5),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 0,
          ),
          child: state.isSaving
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2.5, color: Colors.white),
                )
              : const Text(
                  'Simpan Pengaturan',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
        ),
      ),
    );
  }
}
