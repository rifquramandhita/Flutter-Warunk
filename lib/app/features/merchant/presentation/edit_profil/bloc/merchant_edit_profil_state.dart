part of 'merchant_edit_profil_bloc.dart';

class MerchantEditProfilState extends Equatable {
  final String name;
  final String whatsappNumber;
  final String merchantCategoryId;
  final File? photoFile;
  final String? photoUrl;
  final bool isLoading;
  final bool isInitialLoaded;
  final bool isSuccess;
  final String? errorMessage;

  const MerchantEditProfilState({
    this.name = '',
    this.whatsappNumber = '',
    this.merchantCategoryId = '',
    this.photoFile,
    this.photoUrl,
    this.isLoading = false,
    this.isInitialLoaded = false,
    this.isSuccess = false,
    this.errorMessage,
  });

  MerchantEditProfilState copyWith({
    String? name,
    String? whatsappNumber,
    String? merchantCategoryId,
    File? photoFile,
    String? photoUrl,
    bool? isLoading,
    bool? isInitialLoaded,
    bool? isSuccess,
    String? errorMessage,
  }) {
    return MerchantEditProfilState(
      name: name ?? this.name,
      whatsappNumber: whatsappNumber ?? this.whatsappNumber,
      merchantCategoryId: merchantCategoryId ?? this.merchantCategoryId,
      photoFile: photoFile ?? this.photoFile,
      photoUrl: photoUrl ?? this.photoUrl,
      isLoading: isLoading ?? this.isLoading,
      isInitialLoaded: isInitialLoaded ?? this.isInitialLoaded,
      isSuccess: isSuccess ?? false,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    name,
    whatsappNumber,
    merchantCategoryId,
    photoFile,
    photoUrl,
    isLoading,
    isInitialLoaded,
    isSuccess,
    errorMessage,
  ];
}
