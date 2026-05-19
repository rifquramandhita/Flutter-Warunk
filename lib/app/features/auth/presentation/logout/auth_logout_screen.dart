import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/auth/presentation/logout/bloc/auth_logout_bloc.dart';
import 'package:warunk/app/features/auth/presentation/logout/bloc/auth_logout_event.dart';
import 'package:warunk/app/features/auth/presentation/logout/bloc/auth_logout_state.dart';
import 'package:warunk/core/dependency/dependency.dart';
import 'package:warunk/core/helper/dialog_helper.dart';
import 'package:warunk/core/widgets/loading_app_widget.dart';
import 'package:warunk/main.dart';
import 'package:warunk/theme/app_colors.dart';

class AuthLogoutScreen extends StatelessWidget {
  const AuthLogoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthLogoutBloc>(),
      child: BlocConsumer<AuthLogoutBloc, AuthLogoutState>(
        listener: (context, state) {
          if (state.errorMessage != null) {
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
          return Scaffold(body: _bodyBuild(context));
        },
      ),
    );
  }

  Widget _bodyBuild(BuildContext context) {
    final state = context.watch<AuthLogoutBloc>().state;
    return SafeArea(
      child: Stack(
        children: [
          _bodyLayout(context),
          (state.isLoading) ? LoadingAppWidget() : SizedBox(),
        ],
      ),
    );
  }

  Widget _bodyLayout(BuildContext context) {
    return Stack(
      children: [
        // Background color
        Container(
          color: const Color(0xFF69C189),
          height: double.infinity,
          width: double.infinity,
        ),

        // Top Navigation Icons
        Positioned(
          top: 16,
          left: 16,
          child: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: const Icon(Icons.arrow_back, color: Colors.white, size: 28),
          ),
        ),
        Positioned(
          top: 16,
          right: 16,
          child: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: const Icon(Icons.close, color: Colors.white, size: 28),
          ),
        ),

        // Content
        Column(
          children: [
            const SizedBox(height: 60),
            _headerLayout(),
            const SizedBox(height: 40),
            Expanded(child: _cardLayout(context)),
          ],
        ),
      ],
    );
  }

  Widget _headerLayout() {
    return Column(
      children: const [
        Icon(Icons.storefront, color: Colors.white, size: 80),
        SizedBox(height: 16),
        Text(
          'WARUNK',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w900,
            color: Colors.white,
            letterSpacing: 2,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Warung Lokal, Hidup Lokal',
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _cardLayout(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.all(32),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _illustrationLayout(),
          const SizedBox(height: 32),
          _titleLayout(),
          const SizedBox(height: 12),
          _subtitleLayout(),
          const Spacer(),
          _logoutButtonLayout(context),
          const SizedBox(height: 16),
          _cancelButtonLayout(context),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _illustrationLayout() {
    return Container(
      width: 120,
      height: 120,
      decoration: const BoxDecoration(
        color: Color(0xFFE8F5F1),
        shape: BoxShape.circle,
      ),
      child: const Icon(
        Icons.meeting_room_outlined,
        size: 60,
        color: Color(0xFF69C189),
      ),
    );
  }

  Widget _titleLayout() {
    return const Text(
      'Yakin ingin keluar?',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColors.textDark,
      ),
    );
  }

  Widget _subtitleLayout() {
    return const Text(
      'Anda akan keluar dari akun Anda.',
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 14, color: AppColors.greyText),
    );
  }

  Widget _logoutButtonLayout(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: () =>
            context.read<AuthLogoutBloc>().add(AuthLogoutEventLogout()),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF5CB874),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          elevation: 0,
        ),
        child: const Text(
          'Ya, Logout',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _cancelButtonLayout(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: TextButton(
        onPressed: () => Navigator.of(context).pop(),
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: const Text(
          'Batal',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.textDark,
          ),
        ),
      ),
    );
  }
}
