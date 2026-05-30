import 'dart:io';

class CustomerProfilUpdateParam {
  final File? photo;
  final String name;
  final String email;
  final String phone;
  final String? gender;
  final String? birthDate;

  CustomerProfilUpdateParam({
    this.photo,
    required this.name,
    required this.email,
    required this.phone,
    this.gender,
    this.birthDate,
  });
}
