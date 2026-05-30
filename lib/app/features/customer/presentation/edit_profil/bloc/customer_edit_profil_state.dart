import 'dart:io';
import 'package:equatable/equatable.dart';

class CustomerEditProfilState extends Equatable {
  final bool isLoading;
  final bool isSaving;
  final bool isSuccess;
  final String name;
  final String email;
  final String phone;
  final String? errorMessage;
  final File? photoFile;
  final String? photoUrl;

  const CustomerEditProfilState({
    this.isLoading = false,
    this.isSaving = false,
    this.isSuccess = false,
    this.name = '',
    this.email = '',
    this.phone = '',
    this.errorMessage,
    this.photoFile,
    this.photoUrl,
  });

  CustomerEditProfilState copyWith({
    bool? isLoading,
    bool? isSaving,
    bool? isSuccess,
    String? name,
    String? email,
    String? phone,
    String? errorMessage,
    File? photoFile,
    String? photoUrl,
  }) {
    return CustomerEditProfilState(
      isLoading: isLoading ?? this.isLoading,
      isSaving: isSaving ?? this.isSaving,
      isSuccess: isSuccess ?? this.isSuccess,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      errorMessage: errorMessage,
      photoFile: photoFile ?? this.photoFile,
      photoUrl: photoUrl ?? this.photoUrl,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    isSaving,
    isSuccess,
    name,
    email,
    phone,
    errorMessage,
    photoFile,
    photoUrl,
  ];
}
