import 'dart:io';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:device_info_plus/device_info_plus.dart';

part 'auth_device.freezed.dart';
part 'auth_device.g.dart';

@freezed
sealed class AuthDevice with _$AuthDevice {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory AuthDevice.entity({
    required String brand,
    required String model,
    required String os,
  }) = AuthDeviceEntity;

  factory AuthDevice.fromJson(Map<String, dynamic> json) =>
      _$AuthDeviceFromJson(json);
}
