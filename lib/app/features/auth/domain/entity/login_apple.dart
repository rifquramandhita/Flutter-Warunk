import 'package:warunk/app/features/auth/domain/entity/auth_device.dart';

class LoginAppleParam {
  final String email;
  final String name;
  final String role;
  final AuthDevice device;
  final String apkVersion;
  final String type;
  final String firebaseId;
  final String fcmToken;
  final String? appleId;

  const LoginAppleParam({
    required this.email,
    required this.name,
    required this.role,
    required this.device,
    required this.apkVersion,
    required this.type,
    required this.firebaseId,
    required this.fcmToken,
    this.appleId,
  });

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{
      'email': email,
      'name': name,
      'role': role,
      'device': device.toJson(),
      'apk_version': apkVersion,
      'type': type,
      'firebase_id': firebaseId,
      'fcm_token': fcmToken,
    };
    if (appleId != null && appleId!.isNotEmpty) {
      map['apple_id'] = appleId;
    }
    return map;
  }
}

