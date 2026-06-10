import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/auth/presentation/login/auth_login_screen.dart';
import 'package:warunk/app/features/auth/presentation/splash/auth_splash_screen.dart';
import 'package:warunk/app/features/customer/presentation/shell/customer_shell_screen.dart';
import 'package:warunk/app/features/merchant/presentation/shell/merchant_shell_screen.dart';
import 'package:warunk/core/bloc/auth/auth_bloc.dart';
import 'package:warunk/core/dependency/dependency.dart';
import 'package:warunk/core/enum/role.dart';
import 'package:warunk/core/helper/global_helper.dart';
import 'package:warunk/core/service/notification_service.dart';
import 'package:warunk/core/widgets/loading_app_widget.dart';
import 'package:warunk/firebase_options.dart';
import 'package:warunk/theme/app_theme.dart';

bool isProduction = false;
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await NotificationService.init();

  if (!kDebugMode) {
    FlutterError.onError = (errorDetails) {
      FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
    };
    // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };
  }

  await initializeDateFormatting('id', null);
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
        BlocProvider(create: (_) => sl<AuthBloc>()..add(AuthEventInitial())),
      ],
      child: MaterialApp(
        title: 'Warunk',
        debugShowCheckedModeBanner: !isProduction,
        navigatorKey: navigatorKey,
        theme: AppTheme.lightTheme,
        home: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state.showSplash) {
              return const AuthSplashScreen();
            }
            if (state.isLoading) {
              return const Scaffold(body: LoadingAppWidget());
            }
            return state.isAuthenticated
                ? (state.role == RoleEnum.merchant)
                      ? const MerchantShellScreen()
                      : const CustomerShellScreen()
                : const AuthLoginScreen();
          },
        ),
      ),
    );
  }
}
