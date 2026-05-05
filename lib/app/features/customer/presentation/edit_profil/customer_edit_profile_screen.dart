import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/customer/presentation/edit_profil/bloc/customer_profile_bloc.dart';
import 'package:warunk/app/features/customer/presentation/edit_profil/bloc/customer_profile_event.dart';
import 'package:warunk/app/features/customer/presentation/edit_profil/bloc/customer_profile_state.dart';
import 'package:warunk/core/constants/app_colors.dart';
import 'package:warunk/core/widgets/custom_text_field.dart';
import 'package:warunk/core/widgets/primary_button.dart';
import 'package:warunk/core/widgets/shadow_card.dart';
import 'package:warunk/core/widgets/sticky_bottom_bar.dart';

class CustomerEditProfileScreen extends StatelessWidget {
  const CustomerEditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CustomerProfileBloc()..add(CustomerLoadProfile()),
      child: const _EditProfileView(),
    );
  }
}

class _EditProfileView extends StatelessWidget {
  const _EditProfileView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(Icons.arrow_back_rounded, color: AppColors.primary),
        ),
        title: const Text(
          'Edit Profil',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: AppColors.primary, // Green text for app bar title
          ),
        ),
      ),
      body: BlocConsumer<CustomerProfileBloc, CustomerProfileState>(
        listenWhen: (previous, current) =>
            previous.isSaving != current.isSaving ||
            previous.errorMessage != current.errorMessage,
        listener: (context, state) {
          if (state.errorMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage!),
                backgroundColor: Colors.red,
              ),
            );
          } else if (state.isSaving == false &&
              state.errorMessage == null &&
              ModalRoute.of(context)?.isCurrent == true) {
            // Optional: pop or show success message after save complete.
            // Since there's no success flag explicitly, if it was saving and now it's not, and no error, maybe it succeeded.
            // But let's keep it simple.
          }
        },
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            );
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(
              20,
              20,
              20,
              100,
            ), // Padding bottom for floating button
            child: Column(
              children: [
                // ── Avatar Section ───────────────────────────────────────────
                _buildAvatarSection(),
                const SizedBox(height: 32),

                // ── Form Section ─────────────────────────────────────────────
                _buildFormSection(context, state),
              ],
            ),
          );
        },
      ),
      // ── Fixed Bottom Button ──────────────────────────────────────────
      bottomSheet: BlocBuilder<CustomerProfileBloc, CustomerProfileState>(
        builder: (context, state) {
          return StickyBottomBar(
            child: PrimaryButton(
              label: 'Simpan Perubahan',
              isLoading: state.isSaving,
              onPressed: () {
                context.read<CustomerProfileBloc>().add(CustomerSaveProfile());
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildAvatarSection() {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            // Outer ring
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.primary.withValues(alpha: 0.2),
                  width: 2,
                ),
              ),
              child: Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  color: Color(0xFFB9E4C9),
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Text('👨🏻', style: TextStyle(fontSize: 60)),
                ),
              ),
            ),
            // Camera badge
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.greyBorder),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.camera_alt_outlined,
                  size: 16,
                  color: AppColors.primary,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        // Ubah Foto button
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: const Color(0xFFFFF8E1), // Light amber bg
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(
                Icons.camera_alt_outlined,
                size: 16,
                color: Color(0xFFF59E0B),
              ),
              SizedBox(width: 6),
              Text(
                'Ubah Foto',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFFF59E0B),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFormSection(BuildContext context, CustomerProfileState state) {
    return ShadowCard(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextField(
            label: 'Nama Lengkap',
            prefixIcon: Icons.person_outline,
            initialValue: state.name,
            onChanged: (value) => context.read<CustomerProfileBloc>().add(
              CustomerUpdateProfileField('name', value),
            ),
          ),
          const SizedBox(height: 16),
          CustomTextField(
            label: 'Email',
            prefixIcon: Icons.email_outlined,
            initialValue: state.email,
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) => context.read<CustomerProfileBloc>().add(
              CustomerUpdateProfileField('email', value),
            ),
          ),
          const SizedBox(height: 16),
          CustomTextField(
            label: 'No. HP',
            prefixIcon: Icons.phone_outlined,
            initialValue: state.phone,
            keyboardType: TextInputType.phone,
            onChanged: (value) => context.read<CustomerProfileBloc>().add(
              CustomerUpdateProfileField('phone', value),
            ),
          ),
          const SizedBox(height: 16),
          CustomTextField(
            label: 'Kota',
            prefixIcon: Icons.location_on_outlined,
            initialValue: state.city,
            onChanged: (value) => context.read<CustomerProfileBloc>().add(
              CustomerUpdateProfileField('city', value),
            ),
          ),
          const SizedBox(height: 16),
          CustomTextField(
            label: 'Tanggal Lahir',
            prefixIcon: Icons.calendar_today_outlined,
            initialValue: state.birthDate,
            onChanged: (value) => context.read<CustomerProfileBloc>().add(
              CustomerUpdateProfileField('birthDate', value),
            ),
          ),
          const SizedBox(height: 16),

          // Jenis Kelamin Dropdown
          const Text(
            'Jenis Kelamin',
            style: TextStyle(
              fontSize: 12,
              color: AppColors.greyText,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.greyBorder),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: state.gender,
                isExpanded: true,
                icon: const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: AppColors.primary,
                ),
                items: ['Laki-laki', 'Perempuan'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Row(
                      children: [
                        const Icon(
                          Icons.person_outline,
                          color: AppColors.primary,
                          size: 20,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          value,
                          style: const TextStyle(
                            fontSize: 14,
                            color: AppColors.textDark,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
                onChanged: (newValue) {
                  if (newValue != null) {
                    context.read<CustomerProfileBloc>().add(
                      CustomerUpdateProfileField('gender', newValue),
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
