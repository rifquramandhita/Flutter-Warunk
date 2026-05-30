import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/customer/presentation/edit_profil/bloc/customer_edit_profil_bloc.dart';
import 'package:warunk/app/features/customer/presentation/edit_profil/bloc/customer_edit_profil_event.dart';
import 'package:warunk/app/features/customer/presentation/edit_profil/bloc/customer_edit_profil_state.dart';
import 'package:warunk/core/widgets/custom_text_field.dart';
import 'package:warunk/core/widgets/primary_button.dart';
import 'package:warunk/core/widgets/shadow_card.dart';
import 'package:warunk/core/widgets/sticky_bottom_bar.dart';
import 'package:warunk/core/dependency/dependency.dart';
import 'package:warunk/core/helper/global_helper.dart';
import 'package:warunk/core/helper/dialog_helper.dart';
import 'package:warunk/main.dart';

class CustomerEditProfileScreen extends StatelessWidget {
  const CustomerEditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<CustomerEditProfilBloc>()..add(CustomerEditProfilEventLoad()),
      child: BlocConsumer<CustomerEditProfilBloc, CustomerEditProfilState>(
        listener: (context, state) {
          if (state.errorMessage != null) {
            DialogHelper.showErrorSnackBar(
              context: context,
              text: state.errorMessage!,
            );
          } else if (state.isSuccess) {
            DialogHelper.showSnackBar(
              context: context,
              text: 'Profil berhasil diperbarui',
              color: GlobalHelper.getColorSchema(context).primary,
            );
            navigatorKey.currentState?.pop(true);
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: GlobalHelper.getColorSchema(context).surface,
            appBar: AppBar(title: const Text('Edit Profil')),
            body: _bodyBuild(context),
          );
        },
      ),
    );
  }

  Widget _bodyBuild(BuildContext context) {
    final state = context.watch<CustomerEditProfilBloc>().state;
    return SafeArea(
      child: Stack(
        children: [
          if (!state.isLoading) _bodyLayout(context),
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

  Widget _bodyLayout(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 100),
      child: Column(
        children: [
          _buildAvatarSection(context),
          const SizedBox(height: 32),
          _buildFormSection(context),
          const SizedBox(height: 20),
          PrimaryButton(
            label: 'Simpan Perubahan',
            isLoading: context.watch<CustomerEditProfilBloc>().state.isSaving,
            onPressed: () {
              context.read<CustomerEditProfilBloc>().add(
                CustomerEditProfilEventSave(),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildAvatarSection(BuildContext context) {
    final state = context.watch<CustomerEditProfilBloc>().state;
    final colorSchema = GlobalHelper.getColorSchema(context);

    Widget imageWidget;
    if (state.photoFile != null) {
      imageWidget = Image.file(
        state.photoFile!,
        fit: BoxFit.cover,
        width: 100,
        height: 100,
      );
    } else if (state.photoUrl != null && state.photoUrl!.isNotEmpty) {
      imageWidget = Image.network(
        state.photoUrl!,
        fit: BoxFit.cover,
        width: 100,
        height: 100,
        errorBuilder: (context, error, stackTrace) => Center(
          child: Text(
            '👨🏻',
            style: GlobalHelper.getTextTheme(
              context,
              appTextStyle: AppTextStyle.DISPLAY_MEDIUM,
            ),
          ),
        ),
      );
    } else {
      imageWidget = Center(
        child: Text(
          '👨🏻',
          style: GlobalHelper.getTextTheme(
            context,
            appTextStyle: AppTextStyle.DISPLAY_MEDIUM,
          ),
        ),
      );
    }

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: colorSchema.primary.withValues(alpha: 0.2),
              width: 2,
            ),
          ),
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: colorSchema.primaryContainer,
              shape: BoxShape.circle,
            ),
            child: ClipOval(child: imageWidget),
          ),
        ),
        const SizedBox(height: 16),
        GestureDetector(
          onTap: () => context.read<CustomerEditProfilBloc>().add(
            CustomerEditProfilEventPhotoPicked(),
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: colorSchema.secondaryContainer,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.camera_alt_outlined,
                  size: 16,
                  color: colorSchema.onSecondaryContainer,
                ),
                const SizedBox(width: 6),
                Text(
                  'Ubah Foto',
                  style:
                      GlobalHelper.getTextTheme(
                        context,
                        appTextStyle: AppTextStyle.LABEL_SMALL,
                      )?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: colorSchema.onSecondaryContainer,
                      ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFormSection(BuildContext context) {
    final state = context.watch<CustomerEditProfilBloc>().state;
    return ShadowCard(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextField(
            label: 'Nama Lengkap',
            prefixIcon: Icons.person_outline,
            initialValue: state.name,
            onChanged: (value) => context.read<CustomerEditProfilBloc>().add(
              CustomerEditProfilEventNameChanged(value),
            ),
          ),
          const SizedBox(height: 16),
          CustomTextField(
            label: 'Email',
            prefixIcon: Icons.email_outlined,
            initialValue: state.email,
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) => context.read<CustomerEditProfilBloc>().add(
              CustomerEditProfilEventEmailChanged(value),
            ),
          ),
          const SizedBox(height: 16),
          CustomTextField(
            label: 'No. HP',
            prefixIcon: Icons.phone_outlined,
            initialValue: state.phone,
            keyboardType: TextInputType.phone,
            onChanged: (value) => context.read<CustomerEditProfilBloc>().add(
              CustomerEditProfilEventPhoneChanged(value),
            ),
          ),
        ],
      ),
    );
  }
}
