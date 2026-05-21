import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_product.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_product_download_images_use_case.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_product_get_by_id_use_case.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_product_send_use_case.dart';
part 'merchant_input_product_event.dart';
part 'merchant_input_product_state.dart';

class MerchantInputProductBloc
    extends Bloc<MerchantInputProductEvent, MerchantInputProductState> {
  final MerchantProductGetByIdUseCase useCase;
  final MerchantProductSendUseCase sendUseCase;
  final MerchantProductDownloadImagesUseCase downloadImagesUseCase;

  MerchantInputProductBloc({
    required this.useCase,
    required this.sendUseCase,
    required this.downloadImagesUseCase,
  }) : super(const MerchantInputProductState()) {
    on<MerchantInputProductGet>(_onGet);
    on<MerchantInputProductDownloadImages>(_onDownloadImages);
    on<MerchantInputProductNameChanged>(_onNameChanged);
    on<MerchantInputProductCategoryChanged>(_onCategoryChanged);
    on<MerchantInputProductPriceChanged>(_onPriceChanged);
    on<MerchantInputProductStockChanged>(_onStockChanged);
    on<MerchantInputProductMinPurchaseChanged>(_onMinPurchaseChanged);
    on<MerchantInputProductDescriptionChanged>(_onDescriptionChanged);
    on<MerchantInputProductWeightChanged>(_onWeightChanged);
    on<MerchantInputProductLengthChanged>(_onLengthChanged);
    on<MerchantInputProductWidthChanged>(_onWidthChanged);
    on<MerchantInputProductHeightChanged>(_onHeightChanged);
    on<MerchantInputProductIsPublishedToggled>(_onIsPublishedToggled);
    on<MerchantInputProductPhotoTapped>(_onPhotoTapped);
    on<MerchantInputProductPhotoRemoved>(_onPhotoRemoved);
    on<MerchantInputProductSaved>(_onSaved);
  }

  Future<void> _onGet(
    MerchantInputProductGet event,
    Emitter<MerchantInputProductState> emit,
  ) async {
    if (event.id == null) return;
    emit(state.copyWith(isLoading: true));
    final response = await useCase(id: event.id!);
    if (response.success) {
      final product = response.data!;
      final networkUrls = product.images.map((e) => e.url).toList();

      emit(
        state.copyWith(
          id: event.id,
          isLoading: networkUrls.isNotEmpty,
          name: product.name,
          price: product.price.toString(),
          category: product.category,
          stock: product.stock.toString(),
          minPurchase: product.minPurchase.toString(),
          description: product.description,
          isPublished: product.isPublished,
          weight: product.weight?.toString() ?? '',
          length: product.length?.toString() ?? '',
          width: product.width?.toString() ?? '',
          height: product.height?.toString() ?? '',
        ),
      );

      if (networkUrls.isNotEmpty) {
        add(MerchantInputProductDownloadImages(networkUrls));
      }
    } else {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: response.message.isNotEmpty
              ? response.message
              : 'Gagal mengambil data produk',
        ),
      );
    }
  }

  Future<void> _onDownloadImages(
    MerchantInputProductDownloadImages event,
    Emitter<MerchantInputProductState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final response = await downloadImagesUseCase(urls: event.urls);
    if (response.success) {
      emit(state.copyWith(imageUrls: response.data));
    } else {
      emit(state.copyWith(errorMessage: response.message));
    }

    emit(state.copyWith(isLoading: false));
  }

  void _onNameChanged(
    MerchantInputProductNameChanged event,
    Emitter<MerchantInputProductState> emit,
  ) {
    emit(state.copyWith(name: event.value));
  }

  void _onCategoryChanged(
    MerchantInputProductCategoryChanged event,
    Emitter<MerchantInputProductState> emit,
  ) {
    emit(state.copyWith(category: event.value));
  }

  void _onPriceChanged(
    MerchantInputProductPriceChanged event,
    Emitter<MerchantInputProductState> emit,
  ) {
    emit(state.copyWith(price: event.value));
  }

  void _onStockChanged(
    MerchantInputProductStockChanged event,
    Emitter<MerchantInputProductState> emit,
  ) {
    emit(state.copyWith(stock: event.value));
  }

  void _onMinPurchaseChanged(
    MerchantInputProductMinPurchaseChanged event,
    Emitter<MerchantInputProductState> emit,
  ) {
    emit(state.copyWith(minPurchase: event.value));
  }

  void _onDescriptionChanged(
    MerchantInputProductDescriptionChanged event,
    Emitter<MerchantInputProductState> emit,
  ) {
    emit(state.copyWith(description: event.value));
  }

  void _onWeightChanged(
    MerchantInputProductWeightChanged event,
    Emitter<MerchantInputProductState> emit,
  ) {
    emit(state.copyWith(weight: event.value));
  }

  void _onLengthChanged(
    MerchantInputProductLengthChanged event,
    Emitter<MerchantInputProductState> emit,
  ) {
    emit(state.copyWith(length: event.value));
  }

  void _onWidthChanged(
    MerchantInputProductWidthChanged event,
    Emitter<MerchantInputProductState> emit,
  ) {
    emit(state.copyWith(width: event.value));
  }

  void _onHeightChanged(
    MerchantInputProductHeightChanged event,
    Emitter<MerchantInputProductState> emit,
  ) {
    emit(state.copyWith(height: event.value));
  }

  void _onIsPublishedToggled(
    MerchantInputProductIsPublishedToggled event,
    Emitter<MerchantInputProductState> emit,
  ) {
    emit(state.copyWith(isPublished: !state.isPublished));
  }

  Future<void> _onPhotoTapped(
    MerchantInputProductPhotoTapped event,
    Emitter<MerchantInputProductState> emit,
  ) async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      final updated = List<String>.from(state.imageUrls)..add(image.path);
      emit(state.copyWith(imageUrls: updated));
    }
  }

  void _onPhotoRemoved(
    MerchantInputProductPhotoRemoved event,
    Emitter<MerchantInputProductState> emit,
  ) {
    final updated = List<String>.from(state.imageUrls)..removeAt(event.index);
    emit(state.copyWith(imageUrls: updated));
  }

  Future<void> _onSaved(
    MerchantInputProductSaved event,
    Emitter<MerchantInputProductState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    final param = MerchantProductSendParam(
      sendId: state.id,
      name: state.name,
      slug: state.name.toLowerCase().replaceAll(' ', '-'),
      category: state.category,
      branch: 'default',
      description: state.description,
      stock: int.tryParse(state.stock) ?? 0,
      minPurchase: int.tryParse(state.minPurchase) ?? 1,
      price: int.tryParse(state.price) ?? 0,
      isPublished: state.isPublished,
      hasVariant: false,
      isSameDimension: true,
      sendImages: state.imageUrls,
      weight: int.tryParse(state.weight),
      length: int.tryParse(state.length),
      width: int.tryParse(state.width),
      height: int.tryParse(state.height),
    );

    final result = await sendUseCase(param);

    if (result.success) {
      emit(state.copyWith(isSuccess: true));
    } else {
      emit(
        state.copyWith(
          errorMessage: result.message.isNotEmpty
              ? result.message
              : 'Gagal menyimpan produk',
        ),
      );
    }
    emit(state.copyWith(isLoading: false));
  }
}
