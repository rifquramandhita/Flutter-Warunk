import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/customer/presentation/address/bloc/customer_address_bloc.dart';
import 'package:warunk/app/features/customer/presentation/address/bloc/customer_address_event.dart';
import 'package:warunk/app/features/customer/presentation/address/bloc/customer_address_state.dart';
import 'package:warunk/theme/app_colors.dart';
import 'package:warunk/core/widgets/custom_dotted_divider.dart';
import 'package:warunk/core/widgets/outline_button_custom.dart';
import 'package:warunk/core/widgets/primary_button.dart';
import 'package:warunk/core/widgets/shadow_card.dart';
import 'package:warunk/core/widgets/sticky_bottom_bar.dart';

class CustomerAddressScreen extends StatelessWidget {
  const CustomerAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CustomerAddressBloc()..add(CustomerLoadAddresses()),
      child: const _AddressView(),
    );
  }
}

class _AddressView extends StatelessWidget {
  const _AddressView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 8.0, bottom: 8.0),
          child: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.greyBorder),
              ),
              child: const Icon(
                Icons.arrow_back_rounded,
                color: AppColors.primary,
                size: 20,
              ),
            ),
          ),
        ),
        title: const Text(
          'Alamat Saya',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: AppColors.primary,
          ),
        ),
      ),
      body: Stack(
        children: [
          BlocBuilder<CustomerAddressBloc, CustomerAddressState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(color: AppColors.primary),
                );
              }

              return SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(
                  20,
                  16,
                  20,
                  100,
                ), // Bottom padding for fixed button
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Kelola alamat pengiriman untuk memudahkan\ntransaksi belanja Anda.',
                      style: TextStyle(
                        fontSize: 13,
                        color: AppColors.greyText,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 20),

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
              );
            },
          ),

          // ── Fixed Bottom Button ──────────────────────────────────────────
          StickyBottomBar(
            child: PrimaryButton(
              onPressed: () {
                // TODO: Tambah Alamat Baru
              },
              icon: Icons.add_circle_outline,
              label: 'Tambah Alamat Baru',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddressCard(
    BuildContext context,
    CustomerAddressItem address,
    bool isSelected,
  ) {
    return ShadowCard(
      backgroundColor: isSelected
          ? AppColors.primary.withValues(alpha: 0.02)
          : Colors.white,
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
                  color: AppColors.primary.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(address.icon, color: AppColors.primary, size: 24),
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
                          address.name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: AppColors.textDark,
                          ),
                        ),
                        const Spacer(),
                        if (address.isPrimary)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.primary.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text(
                              'Utama',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w700,
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(
                          Icons.phone_outlined,
                          size: 14,
                          color: AppColors.primary,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          address.phone,
                          style: const TextStyle(
                            fontSize: 13,
                            color: AppColors.textDark,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 2),
                          child: Icon(
                            Icons.location_on_outlined,
                            size: 14,
                            color: AppColors.primary,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            address.address,
                            style: const TextStyle(
                              fontSize: 13,
                              color: AppColors.textDark,
                              height: 1.4,
                            ),
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
          const CustomDottedDivider(),
          const SizedBox(height: 16),

          // Action Buttons
          Row(
            children: [
              Expanded(
                child: OutlineButtonCustom(
                  onPressed: () {},
                  icon: Icons.edit_outlined,
                  label: 'Edit',
                  height: 40,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: isSelected
                    ? PrimaryButton(
                        onPressed: () {},
                        icon: Icons.check_circle,
                        label: 'Dipilih',
                        height: 40,
                      )
                    : OutlineButtonCustom(
                        onPressed: () => context
                            .read<CustomerAddressBloc>()
                            .add(CustomerSelectAddress(address.id)),
                        icon: Icons.check_circle_outline,
                        label: 'Pilih',
                        height: 40,
                      ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
