import 'dart:io';
import 'package:firebase_app_installations/firebase_app_installations.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:warunk/app/features/auth/domain/entity/auth_device.dart';
import 'package:warunk/app/features/auth/domain/entity/login.dart';
import 'package:warunk/app/features/auth/domain/repository/auth_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class AuthLoginUseCase {
  final AuthRepository _repository;

  AuthLoginUseCase({required AuthRepository repository})
    : _repository = repository;

  Future<DataState> call({
    required String email,
    required String password,
  }) async {
    final fcmToken = await FirebaseMessaging.instance.getToken() ?? '';

    final packageInfo = await PackageInfo.fromPlatform();
    final apkVersion = packageInfo.version;

    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    String brand = 'Unknown';
    String model = 'Unknown';
    String os = 'Unknown';
    String type = 'Unknown';

    try {
      if (Platform.isAndroid) {
        final AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        brand = androidInfo.brand;
        model = androidInfo.model;
        os = 'Android ${androidInfo.version.release}';
        type = 'android';
      } else if (Platform.isIOS) {
        final IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        brand = 'Apple';
        model = iosInfo.utsname.machine;
        os = '${iosInfo.systemName} ${iosInfo.systemVersion}';
        type = 'ios';
      }
    } catch (_) {}

    final param = LoginParam(
      email: email,
      password: password,
      fcmToken: fcmToken,
      apkVersion: apkVersion,
      type: '',
      firebaseId: await FirebaseInstallations.instance.getId(),
      device: AuthDeviceEntity(brand: brand, model: model, os: os),
    );
    return await _repository.login(param: param);
  }
}
