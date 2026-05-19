import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/auth/presentation/login/auth_login_screen.dart';
import 'package:warunk/app/features/auth/presentation/splash/auth_splash_screen.dart';
import 'package:warunk/app/features/customer/presentation/shell/customer_shell.dart';
import 'package:warunk/core/bloc/auth/auth_bloc.dart';
import 'package:warunk/core/dependency/dependency.dart';
import 'package:warunk/core/helper/global_helper.dart';
import 'package:warunk/core/widgets/loading_app_widget.dart';
import 'package:warunk/theme/app_theme.dart';
import 'package:warunk/main.dart';

bool isProduction = false;
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependency();
  isProduction = await GlobalHelper.isProduction();
  runApp(const WarunkApp());
}

class WarunkApp extends StatelessWidget {
  const WarunkApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<AuthBloc>()..add(AuthEventCheck())),
      ],
      child: MaterialApp(
        title: 'Warunk',
        debugShowCheckedModeBanner: !isProduction,
        navigatorKey: navigatorKey,
        theme: AppTheme.lightTheme,
        home: FutureBuilder(
          future: Future.delayed(const Duration(seconds: 3)),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const AuthSplashScreen();
            }
            return BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                if (state.isLoading) return Scaffold(body: LoadingAppWidget());
                return state.isAuthenticated
                    ? const CustomerShell()
                    : const AuthLoginScreen();
              },
            );
          },
        ),
      ),
    );
  }
}
