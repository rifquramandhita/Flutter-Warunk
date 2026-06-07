part of 'merchant_edit_profil_bloc.dart';

class MerchantEditProfilState extends Equatable {
  final String name;
  final String whatsappNumber;
  final String merchantCategoryId;
  final MerchantCategoryEntity? selectedCategory;
  final List<MerchantCategoryEntity> categories;
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
    this.selectedCategory,
    this.categories = const [],
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
    MerchantCategoryEntity? selectedCategory,
    List<MerchantCategoryEntity>? categories,
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
      selectedCategory: selectedCategory ?? this.selectedCategory,
      categories: categories ?? this.categories,
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
    selectedCategory,
    categories,
    photoFile,
    photoUrl,
    isLoading,
    isInitialLoaded,
    isSuccess,
    errorMessage,
  ];
}
