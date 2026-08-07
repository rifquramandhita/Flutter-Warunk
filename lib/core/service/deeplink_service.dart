import 'dart:async';
import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:warunk/core/dependency/dependency.dart';
import 'package:warunk/core/bloc/auth/auth_bloc.dart';
import 'package:warunk/main.dart';

class DeeplinkService {
  static final DeeplinkService _instance = DeeplinkService._internal();
  factory DeeplinkService() => _instance;
  DeeplinkService._internal();

  final AppLinks _appLinks = AppLinks();
  StreamSubscription<Uri>? _linkSubscription;

  void init() {
    // Check initial link if app was in cold state (terminated)
    _appLinks.getInitialLink().then((Uri? uri) {
      if (uri != null) {
        _handleDeepLink(uri);
      }
    });

    // Listen to incoming links if app is in background or foreground
    _linkSubscription = _appLinks.uriLinkStream.listen((Uri? uri) {
      if (uri != null) {
        _handleDeepLink(uri);
      }
    }, onError: (err) {
      // Handle error
    });
  }

  void _handleDeepLink(Uri uri) {
    if (uri.scheme == 'warunk' && uri.host == 'email-verification') {
      if (navigatorKey.currentState != null) {
        // Refresh authentication state to ensure we get the latest verification status
        sl<AuthBloc>().add(AuthEventInitial());
        // Navigate to home by popping all routes until the first one
        navigatorKey.currentState!.popUntil((route) => route.isFirst);
      }
    }
  }

  void dispose() {
    _linkSubscription?.cancel();
  }
}
