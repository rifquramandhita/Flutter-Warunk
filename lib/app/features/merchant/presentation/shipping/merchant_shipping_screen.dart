import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/merchant/presentation/shipping/bloc/merchant_shipping_bloc.dart';
import 'package:warunk/core/dependency/dependency.dart';
import 'package:warunk/core/helper/dialog_helper.dart';
import 'package:warunk/core/helper/global_helper.dart';
import 'package:warunk/core/widgets/loading_app_widget.dart';
import 'package:warunk/main.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Entry point
// ─────────────────────────────────────────────────────────────────────────────
class MerchantShippingScreen extends StatelessWidget {
  const MerchantShippingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<MerchantShippingBloc>()..add(MerchantShippingGet()),
      child: BlocConsumer<MerchantShippingBloc, MerchantShippingState>(
        listener: (context, state) {
          if (state.errorMessage != null) {
            DialogHelper.showErrorSnackBar(
              context: context,
              text: state.errorMessage!,
            );
          }
          if (state.isSaved) {
            DialogHelper.showBottomSheetDialog(
              context: context,
              title: 'Sukses',
              canDismiss: false,
              content: Column(
                children: [
                  Icon(
                    Icons.check_circle,
                    color: GlobalHelper.getColorSchema(context).primary,
                    size: 64,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Pengiriman berhasil disimpan.',
                    textAlign: TextAlign.center,
                    style: GlobalHelper.getTextTheme(
                      context,
                      appTextStyle: AppTextStyle.BODY_LARGE,
                    ),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {
                        navigatorKey.currentState?.pop();
                        navigatorKey.currentState?.pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: GlobalHelper.getColorSchema(
                          context,
                        ).primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        'Kembali',
                        style:
                            GlobalHelper.getTextTheme(
                              context,
                              appTextStyle: AppTextStyle.BODY_MEDIUM,
                            )?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: GlobalHelper.getColorSchema(
                                context,
                              ).onPrimary,
                            ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(title: const Text('Metode Pengiriman')),
            body: _bodyBuild(context),
          );
        },
      ),
    );
  }

  Widget _bodyBuild(BuildContext context) {
    final state = context.watch<MerchantShippingBloc>().state;
    return SafeArea(
      child: Stack(
        children: [
          _bodyLayout(context),
          if (state.isLoadingData) const LoadingAppWidget(),
        ],
      ),
    );
  }

  Widget _bodyLayout(BuildContext context) {
    final state = context.watch<MerchantShippingBloc>().state;
    final colorSchema = GlobalHelper.getColorSchema(context);
    final smallTextTheme = GlobalHelper.getTextTheme(
      context,
      appTextStyle: AppTextStyle.BODY_SMALL,
    );

    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: colorSchema.surface,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: colorSchema.outlineVariant.withValues(alpha: 0.5),
                    ),
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
                        onChanged: () =>
                            context.read<MerchantShippingBloc>().add(
                              MerchantShippingToggleMethod('pickup_at_store'),
                            ),
                      ),
                      const Divider(height: 1, color: Color(0xFFE5E7EB)),
                      _MethodItemRow(
                        title: 'Kurir Instan',
                        description: 'GoSend, GrabExpress, dll',
                        iconData: Icons.electric_moped,
                        iconColor: const Color(0xFFF59E0B),
                        iconBgColor: const Color(0xFFFFFBEB),
                        isActive: state.instantCourier,
                        onChanged: () =>
                            context.read<MerchantShippingBloc>().add(
                              MerchantShippingToggleMethod('instant_courier'),
                            ),
                      ),
                      const Divider(height: 1, color: Color(0xFFE5E7EB)),
                      _MethodItemRow(
                        title: 'Diantar Toko',
                        description: 'Diantar oleh kurir toko sendiri',
                        iconData: Icons.delivery_dining,
                        iconColor: const Color(0xFF0D9488),
                        iconBgColor: const Color(0xFFF0FDFA),
                        isActive: state.internalCourier,
                        onChanged: () =>
                            context.read<MerchantShippingBloc>().add(
                              MerchantShippingToggleMethod('internal_courier'),
                            ),
                      ),
                      if (state.internalCourier) ...[
                        Divider(height: 1, color: colorSchema.outlineVariant),
                        _MaxDistanceInput(
                          initialValue: state.maxDistanceInternalCourier,
                        ),
                        Divider(height: 1, color: colorSchema.outlineVariant),
                        _InternalCourierCostInput(
                          initialValue: state.internalCourierShippingCost,
                        ),
                      ],
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // Couriers Card
                if (state.availableCouriers.isNotEmpty)
                  _CouriersCard(state: state),
              ],
            ),
          ),
        ),

        // Bottom Button
        _BottomActionButtons(state: state),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Method item row
// ─────────────────────────────────────────────────────────────────────────────
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
    final textTheme = GlobalHelper.getTextTheme(
      context,
      appTextStyle: AppTextStyle.BODY_SMALL,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: iconBgColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(iconData, color: iconColor),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: textTheme?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: GlobalHelper.getTextTheme(
                    context,
                    appTextStyle: AppTextStyle.LABEL_SMALL,
                  )?.copyWith(color: colorSchema.onSurfaceVariant),
                ),
                const SizedBox(height: 4),
                Text(
                  isActive ? 'Aktif' : 'Nonaktif',
                  style:
                      GlobalHelper.getTextTheme(
                        context,
                        appTextStyle: AppTextStyle.LABEL_SMALL,
                      )?.copyWith(
                        color: isActive
                            ? colorSchema.primary
                            : colorSchema.onSurfaceVariant,
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

// ─────────────────────────────────────────────────────────────────────────────
// Max Distance Input
// ─────────────────────────────────────────────────────────────────────────────
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
    _controller = TextEditingController(
      text: widget.initialValue > 0 ? widget.initialValue.toString() : '',
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorSchema = GlobalHelper.getColorSchema(context);
    final textTheme = GlobalHelper.getTextTheme(
      context,
      appTextStyle: AppTextStyle.BODY_SMALL,
    );

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Jarak Maksimal Pengantaran (KM)',
            style: textTheme?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _controller,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            style: textTheme,
            decoration: InputDecoration(
              hintText: 'Misal: 10',
              hintStyle: textTheme?.copyWith(
                color: colorSchema.onSurfaceVariant,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: colorSchema.outlineVariant),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: colorSchema.outlineVariant),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: colorSchema.primary),
              ),
              suffixText: 'KM',
              suffixStyle: textTheme,
            ),
            onChanged: (value) {
              final distance = int.tryParse(value) ?? 0;
              context.read<MerchantShippingBloc>().add(
                MerchantShippingUpdateMaxDistance(distance),
              );
            },
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Internal Courier Cost Input
// ─────────────────────────────────────────────────────────────────────────────
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
    _controller = TextEditingController(
      text: widget.initialValue > 0 ? widget.initialValue.toString() : '',
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorSchema = GlobalHelper.getColorSchema(context);
    final textTheme = GlobalHelper.getTextTheme(
      context,
      appTextStyle: AppTextStyle.BODY_SMALL,
    );

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Biaya Ongkir Kurir Toko',
            style: textTheme?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _controller,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            style: textTheme,
            decoration: InputDecoration(
              hintText: 'Misal: 10000',
              hintStyle: textTheme?.copyWith(
                color: colorSchema.onSurfaceVariant,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: colorSchema.outlineVariant),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: colorSchema.outlineVariant),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: colorSchema.primary),
              ),
              prefixText: 'Rp ',
              prefixStyle: textTheme,
            ),
            onChanged: (value) {
              final cost = int.tryParse(value) ?? 0;
              context.read<MerchantShippingBloc>().add(
                MerchantShippingUpdateInternalCourierCost(cost),
              );
            },
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Couriers Card
// ─────────────────────────────────────────────────────────────────────────────
class _CouriersCard extends StatelessWidget {
  const _CouriersCard({required this.state});
  final MerchantShippingState state;

  @override
  Widget build(BuildContext context) {
    final colorSchema = GlobalHelper.getColorSchema(context);
    final textTheme = GlobalHelper.getTextTheme(
      context,
      appTextStyle: AppTextStyle.BODY_SMALL,
    );
    final labelTheme = GlobalHelper.getTextTheme(
      context,
      appTextStyle: AppTextStyle.LABEL_SMALL,
    );

    return Container(
      decoration: BoxDecoration(
        color: colorSchema.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: colorSchema.outlineVariant.withValues(alpha: 0.5),
        ),
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
                  decoration: BoxDecoration(
                    color: const Color(0xFFEFF6FF),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.local_shipping,
                    color: Color(0xFF3B82F6),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Kurir Ekspedisi',
                        style: textTheme?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Pilih kurir yang tersedia',
                        style: labelTheme?.copyWith(
                          color: colorSchema.onSurfaceVariant,
                        ),
                      ),
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
            separatorBuilder: (context, index) =>
                Divider(height: 1, color: colorSchema.outlineVariant),
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
                  context.read<MerchantShippingBloc>().add(
                    MerchantShippingToggleCourier(courierCode),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Animated Toggle Switch
// ─────────────────────────────────────────────────────────────────────────────
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

// ─────────────────────────────────────────────────────────────────────────────
// Bottom Actions
// ─────────────────────────────────────────────────────────────────────────────
class _BottomActionButtons extends StatelessWidget {
  const _BottomActionButtons({required this.state});
  final MerchantShippingState state;

  @override
  Widget build(BuildContext context) {
    final colorSchema = GlobalHelper.getColorSchema(context);
    final textTheme = GlobalHelper.getTextTheme(
      context,
      appTextStyle: AppTextStyle.BODY_MEDIUM,
    );

    return Container(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
      decoration: BoxDecoration(
        color: colorSchema.surface,
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
              : () => context.read<MerchantShippingBloc>().add(
                  MerchantShippingSaved(),
                ),
          style: ElevatedButton.styleFrom(
            backgroundColor: colorSchema.primary,
            disabledBackgroundColor: colorSchema.primary.withValues(alpha: 0.5),
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
                  style: textTheme?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorSchema.onPrimary,
                  ),
                ),
        ),
      ),
    );
  }
}
