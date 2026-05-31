import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_address.dart';
import 'package:warunk/app/features/customer/presentation/address/bloc/customer_address_bloc.dart';
import 'package:warunk/app/features/customer/presentation/address/bloc/customer_address_event.dart';
import 'package:warunk/app/features/customer/presentation/address/bloc/customer_address_state.dart';
import 'package:warunk/app/features/customer/presentation/input_address/customer_input_address_screen.dart';
import 'package:warunk/core/dependency/dependency.dart';
import 'package:warunk/core/helper/dialog_helper.dart';
import 'package:warunk/core/helper/global_helper.dart';
import 'package:warunk/core/widgets/custom_dotted_divider.dart';
import 'package:warunk/core/widgets/outline_button_custom.dart';
import 'package:warunk/core/widgets/primary_button.dart';
import 'package:warunk/core/widgets/shadow_card.dart';
import 'package:warunk/core/widgets/sticky_bottom_bar.dart';
import 'package:warunk/main.dart';

class CustomerAddressScreen extends StatelessWidget {
  const CustomerAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<CustomerAddressBloc>()..add(CustomerAddressEventLoadAddresses()),
      child: BlocConsumer<CustomerAddressBloc, CustomerAddressState>(
        listener: (context, state) {
          if (state.errorMessage != null) {
            DialogHelper.showErrorSnackBar(
              context: context,
              text: state.errorMessage!,
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(title: const Text('Alamat Saya')),
            body: _bodyBuild(context),
            floatingActionButton: _fabBuild(context),
          );
        },
      ),
    );
  }

  Widget _bodyBuild(BuildContext context) {
    final state = context.watch<CustomerAddressBloc>().state;
    return SafeArea(
      child: Stack(
        children: [
          _bodyLayout(context, state),
          if (state.isLoading)
            Center(
              child: CircularProgressIndicator(
                color: GlobalHelper.getColorSchema(context).primary,
              ),
            ),
        ],
      ),
    );
  }

  Widget _fabBuild(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => _onPressAdd(context),
      child: const Icon(Icons.add),
    );
  }

  Widget _bodyLayout(BuildContext context, CustomerAddressState state) {
    return Stack(
      children: [
        SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(
            20,
            16,
            20,
            100,
          ), // Bottom padding for fixed button
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Address Cards ──────────────────────────────────────────
              ...state.addresses.map((address) {
                final isSelected = state.selectedAddressId == address.id;
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: _buildAddressCard(context, address, isSelected),
                );
              }),
            ],
          ),
        ),
      ],
    );
  }

  IconData _getIconForAddress(String label) {
    final lowerLabel = label.toLowerCase();
    if (lowerLabel.contains('rumah')) return Icons.home_outlined;
    if (lowerLabel.contains('kantor')) return Icons.business_outlined;
    return Icons.location_on_outlined;
  }

  Widget _buildAddressCard(
    BuildContext context,
    CustomerAddressEntity address,
    bool isSelected,
  ) {
    final iconData = _getIconForAddress(address.label);
    final colorSchema = GlobalHelper.getColorSchema(context);

    return GestureDetector(
      onTap: () => _onPressItem(context, address),
      child: ShadowCard(
        backgroundColor: isSelected
            ? colorSchema.primary.withValues(alpha: 0.02)
            : colorSchema.surface,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Icon Circle
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: colorSchema.primary.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(iconData, color: colorSchema.primary, size: 24),
                ),
                const SizedBox(width: 16),
                // Detail
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            address.recipientName,
                            style: GlobalHelper.getTextTheme(
                              context,
                              appTextStyle: AppTextStyle.TITLE_MEDIUM,
                            )?.copyWith(fontWeight: FontWeight.w800),
                          ),
                          const Spacer(),
                          if (address.isDefault)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: colorSchema.primary.withValues(
                                  alpha: 0.1,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                'Utama',
                                style:
                                    GlobalHelper.getTextTheme(
                                      context,
                                      appTextStyle: AppTextStyle.LABEL_SMALL,
                                    )?.copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: colorSchema.primary,
                                    ),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(
                            Icons.phone_outlined,
                            size: 14,
                            color: colorSchema.primary,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            address.phone,
                            style: GlobalHelper.getTextTheme(
                              context,
                              appTextStyle: AppTextStyle.BODY_SMALL,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 2),
                            child: Icon(
                              Icons.location_on_outlined,
                              size: 14,
                              color: colorSchema.primary,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              address.fullAddress,
                              style: GlobalHelper.getTextTheme(
                                context,
                                appTextStyle: AppTextStyle.BODY_SMALL,
                              )?.copyWith(height: 1.4),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),
            // Dotted Divider
            // const CustomDottedDivider(),
            // const SizedBox(height: 16),

            // // Action Buttons
            // isSelected
            //     ? PrimaryButton(
            //         onPressed: () {},
            //         icon: Icons.check_circle,
            //         label: 'Utama',
            //         height: 40,
            //       )
            //     : OutlineButtonCustom(
            //         onPressed: () => context.read<CustomerAddressBloc>().add(
            //           CustomerAddressEventSetDefaultAddress(address.id),
            //         ),
            //         icon: Icons.check_circle_outline,
            //         label: 'Jadikan Utama',
            //         height: 40,
            //       ),
          ],
        ),
      ),
    );
  }

  void _onPressItem(BuildContext context, CustomerAddressEntity item) async {
    final bloc = context.read<CustomerAddressBloc>();
    await navigatorKey.currentState?.push(
      MaterialPageRoute(
        builder: (context) => CustomerInputAddressScreen(addressId: item.id),
      ),
    );
    bloc.add(CustomerAddressEventLoadAddresses());
  }

  void _onPressAdd(BuildContext context) async {
    final bloc = context.read<CustomerAddressBloc>();
    await navigatorKey.currentState?.push(
      MaterialPageRoute(builder: (context) => CustomerInputAddressScreen()),
    );
    bloc.add(CustomerAddressEventLoadAddresses());
  }
}
