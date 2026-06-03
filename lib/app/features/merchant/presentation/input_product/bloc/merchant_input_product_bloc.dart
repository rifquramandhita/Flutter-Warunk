import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_product.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_product_category.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_product_variant.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_product_download_images_use_case.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_product_get_by_id_use_case.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_product_get_category_use_case.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_product_send_use_case.dart';
part 'merchant_input_product_event.dart';
part 'merchant_input_product_state.dart';

class MerchantInputProductBloc
    extends Bloc<MerchantInputProductEvent, MerchantInputProductState> {
  final MerchantProductGetByIdUseCase useCase;
  final MerchantProductSendUseCase sendUseCase;
  final MerchantProductDownloadImagesUseCase downloadImagesUseCase;
  final MerchantProductGetCategoryUseCase getCategoryUseCase;

  MerchantInputProductBloc({
    required this.useCase,
    required this.sendUseCase,
    required this.downloadImagesUseCase,
    required this.getCategoryUseCase,
  }) : super(const MerchantInputProductState()) {
    on<MerchantInputProductGet>(_onGet);
    on<MerchantInputProductLoadCategories>(_onLoadCategories);
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
    on<MerchantInputProductSameDimensionToggled>(_onSameDimensionToggled);
    // Variant definition handlers
    on<MerchantInputProductVariantAdded>(_onVariantAdded);
    on<MerchantInputProductVariantRemoved>(_onVariantRemoved);
    on<MerchantInputProductVariantNameChanged>(_onVariantNameChanged);
    on<MerchantInputProductVariantOptionAdded>(_onVariantOptionAdded);
    on<MerchantInputProductVariantOptionRemoved>(_onVariantOptionRemoved);
    on<MerchantInputProductVariantOptionNameChanged>(
      _onVariantOptionNameChanged,
    );
    // Combination handler
    on<MerchantInputProductCombinationChanged>(_onCombinationChanged);
  }

  // ── Helpers ──────────────────────────────────────────────────────────────────

  /// Build a stable sort-key string for a combination map.
  String _comboKey(Map<String, dynamic> combo) {
    final sorted = combo.entries.toList()
      ..sort((a, b) => a.key.compareTo(b.key));
    return sorted.map((e) => '${e.key}=${e.value}').join('&');
  }

  /// Compute the Cartesian product of all valid variant options and return a
  /// new combination list, preserving existing price/stock/etc. by key.
  List<MerchantProductVariantSendParam> _buildCombinations(
    List<VariantInput> variants,
    List<MerchantProductVariantSendParam> existing,
  ) {
    final validVariants = variants
        .where((v) => v.name.isNotEmpty && v.options.any((o) => o.isNotEmpty))
        .toList();

    if (validVariants.isEmpty) return [];

    // Cartesian product
    List<Map<String, dynamic>> combos = [{}];
    for (final v in validVariants) {
      final expanded = <Map<String, dynamic>>[];
      for (final prev in combos) {
        for (final opt in v.options.where((o) => o.isNotEmpty)) {
          expanded.add({...prev, v.name: opt});
        }
      }
      combos = expanded;
    }

    // Lookup existing combinations by key to preserve data
    final existingByKey = {
      for (final c in existing) _comboKey(c.variantCombination): c,
    };

    return combos.map((combo) {
      final key = _comboKey(combo);
      final prev = existingByKey[key];
      if (prev != null) {
        return prev.copyWith(variantCombination: combo);
      }
      return MerchantProductVariantSendParam(
        variantCombination: combo,
        price: 0,
        stock: 0,
        minPurchase: 1,
      );
    }).toList();
  }

  // ── Field handlers ───────────────────────────────────────────────────────────

  Future<void> _onGet(
    MerchantInputProductGet event,
    Emitter<MerchantInputProductState> emit,
  ) async {
    // Always load categories on init
    add(MerchantInputProductLoadCategories());

    if (event.id == null) return;
    emit(state.copyWith(isLoading: true));
    final response = await useCase(id: event.id!);
    if (response.success) {
      final product = response.data!;
      final networkUrls = product.images.map((e) => e.url).toList();

      // ── Rebuild variants & combinations from API response ──────────────────
      final apiVariants = product.variants; // List<MerchantProductVariantEntity>

      List<VariantInput> loadedVariants = [];
      List<MerchantProductVariantSendParam> loadedCombinations = [];

      if (apiVariants.isNotEmpty) {
        // 1. Collect all unique variant keys (in order of first appearance)
        final variantKeys = <String>[];
        for (final v in apiVariants) {
          for (final key in v.variantCombination.keys) {
            if (!variantKeys.contains(key)) variantKeys.add(key);
          }
        }

        // 2. For each key, collect unique option values (preserving order)
        loadedVariants = variantKeys.map((key) {
          final options = <String>[];
          for (final v in apiVariants) {
            final val = v.variantCombination[key]?.toString() ?? '';
            if (val.isNotEmpty && !options.contains(val)) options.add(val);
          }
          return VariantInput(name: key, options: options);
        }).toList();

        // 3. Convert entities → sendParam for combinations list
        loadedCombinations = apiVariants.map((v) {
          return MerchantProductVariantSendParam(
            variantCombination: v.variantCombination,
            price: v.price,
            stock: v.stock,
            minPurchase: v.minPurchase,
            weight: v.weight,
            length: v.length,
            width: v.width,
            height: v.height,
          );
        }).toList();
      }
      // ──────────────────────────────────────────────────────────────────────

      emit(
        state.copyWith(
          id: event.id,
          isLoading: networkUrls.isNotEmpty,
          name: product.name,
          price: product.price.toString(),
          category: product.category,
          stock: product.stock.toString(),
          minPurchase: product.minPurchase.toString(),
          description: product.description ?? '',
          isPublished: product.isPublished,
          isSameDimension: product.isSameDimension,
          weight: product.weight?.toString() ?? '',
          length: product.length?.toString() ?? '',
          width: product.width?.toString() ?? '',
          height: product.height?.toString() ?? '',
          variants: loadedVariants,
          combinations: loadedCombinations,
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


  Future<void> _onLoadCategories(
    MerchantInputProductLoadCategories event,
    Emitter<MerchantInputProductState> emit,
  ) async {
    emit(state.copyWith(isCategoriesLoading: true));
    final response = await getCategoryUseCase();
    if (response.success) {
      emit(state.copyWith(categories: response.data ?? []));
    }
    emit(state.copyWith(isCategoriesLoading: false));
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
  ) => emit(state.copyWith(name: event.value));

  void _onCategoryChanged(
    MerchantInputProductCategoryChanged event,
    Emitter<MerchantInputProductState> emit,
  ) => emit(state.copyWith(category: event.value));

  void _onPriceChanged(
    MerchantInputProductPriceChanged event,
    Emitter<MerchantInputProductState> emit,
  ) => emit(state.copyWith(price: event.value));

  void _onStockChanged(
    MerchantInputProductStockChanged event,
    Emitter<MerchantInputProductState> emit,
  ) => emit(state.copyWith(stock: event.value));

  void _onMinPurchaseChanged(
    MerchantInputProductMinPurchaseChanged event,
    Emitter<MerchantInputProductState> emit,
  ) => emit(state.copyWith(minPurchase: event.value));

  void _onDescriptionChanged(
    MerchantInputProductDescriptionChanged event,
    Emitter<MerchantInputProductState> emit,
  ) => emit(state.copyWith(description: event.value));

  void _onWeightChanged(
    MerchantInputProductWeightChanged event,
    Emitter<MerchantInputProductState> emit,
  ) => emit(state.copyWith(weight: event.value));

  void _onLengthChanged(
    MerchantInputProductLengthChanged event,
    Emitter<MerchantInputProductState> emit,
  ) => emit(state.copyWith(length: event.value));

  void _onWidthChanged(
    MerchantInputProductWidthChanged event,
    Emitter<MerchantInputProductState> emit,
  ) => emit(state.copyWith(width: event.value));

  void _onHeightChanged(
    MerchantInputProductHeightChanged event,
    Emitter<MerchantInputProductState> emit,
  ) => emit(state.copyWith(height: event.value));

  void _onIsPublishedToggled(
    MerchantInputProductIsPublishedToggled event,
    Emitter<MerchantInputProductState> emit,
  ) => emit(state.copyWith(isPublished: !state.isPublished));

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

    final hasVariant = state.hasVariants;
    final sendVariants = hasVariant ? state.combinations : null;

    final param = MerchantProductSendParam(
      sendId: state.id,
      name: state.name,
      slug: state.name.toLowerCase().replaceAll(' ', '-'),
      category: state.category,
      branch: 'default',
      description: state.description,
      stock: hasVariant
          ? (sendVariants?.fold<int>(0, (s, c) => s + c.stock) ?? 0)
          : (int.tryParse(state.stock) ?? 0),
      minPurchase: hasVariant
          ? (sendVariants?.isNotEmpty == true
                ? sendVariants!.first.minPurchase
                : 1)
          : (int.tryParse(state.minPurchase) ?? 1),
      price: hasVariant
          ? (sendVariants?.isNotEmpty == true ? sendVariants!.first.price : 0)
          : (int.tryParse(state.price) ?? 0),
      isPublished: state.isPublished,
      hasVariant: hasVariant,
      isSameDimension: state.isSameDimension,
      sendImages: state.imageUrls,
      weight: state.isSameDimension ? int.tryParse(state.weight) : null,
      length: state.isSameDimension ? int.tryParse(state.length) : null,
      width: state.isSameDimension ? int.tryParse(state.width) : null,
      height: state.isSameDimension ? int.tryParse(state.height) : null,
      sendVariants: sendVariants,
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

  void _onSameDimensionToggled(
    MerchantInputProductSameDimensionToggled event,
    Emitter<MerchantInputProductState> emit,
  ) => emit(state.copyWith(isSameDimension: !state.isSameDimension));

  // ── Variant definition handlers ──────────────────────────────────────────────

  void _onVariantAdded(
    MerchantInputProductVariantAdded event,
    Emitter<MerchantInputProductState> emit,
  ) {
    if (!state.canAddVariant) return; // max 2
    final updated = List<VariantInput>.from(state.variants)
      ..add(const VariantInput());
    final newCombinations = _buildCombinations(updated, state.combinations);
    emit(state.copyWith(variants: updated, combinations: newCombinations));
  }

  void _onVariantRemoved(
    MerchantInputProductVariantRemoved event,
    Emitter<MerchantInputProductState> emit,
  ) {
    final updated = List<VariantInput>.from(state.variants)
      ..removeAt(event.variantIndex);
    final newCombinations = _buildCombinations(updated, state.combinations);
    emit(state.copyWith(variants: updated, combinations: newCombinations));
  }

  void _onVariantNameChanged(
    MerchantInputProductVariantNameChanged event,
    Emitter<MerchantInputProductState> emit,
  ) {
    final updated = List<VariantInput>.from(state.variants);
    updated[event.variantIndex] = updated[event.variantIndex].copyWith(
      name: event.value,
    );
    final newCombinations = _buildCombinations(updated, state.combinations);
    emit(state.copyWith(variants: updated, combinations: newCombinations));
  }

  void _onVariantOptionAdded(
    MerchantInputProductVariantOptionAdded event,
    Emitter<MerchantInputProductState> emit,
  ) {
    final updated = List<VariantInput>.from(state.variants);
    final variant = updated[event.variantIndex];
    updated[event.variantIndex] = variant.copyWith(
      options: [...variant.options, ''],
    );
    final newCombinations = _buildCombinations(updated, state.combinations);
    emit(state.copyWith(variants: updated, combinations: newCombinations));
  }

  void _onVariantOptionRemoved(
    MerchantInputProductVariantOptionRemoved event,
    Emitter<MerchantInputProductState> emit,
  ) {
    final updated = List<VariantInput>.from(state.variants);
    final variant = updated[event.variantIndex];
    final opts = List<String>.from(variant.options)
      ..removeAt(event.optionIndex);
    updated[event.variantIndex] = variant.copyWith(options: opts);
    final newCombinations = _buildCombinations(updated, state.combinations);
    emit(state.copyWith(variants: updated, combinations: newCombinations));
  }

  void _onVariantOptionNameChanged(
    MerchantInputProductVariantOptionNameChanged event,
    Emitter<MerchantInputProductState> emit,
  ) {
    final updated = List<VariantInput>.from(state.variants);
    final variant = updated[event.variantIndex];
    final opts = List<String>.from(variant.options);
    opts[event.optionIndex] = event.value;
    updated[event.variantIndex] = variant.copyWith(options: opts);
    final newCombinations = _buildCombinations(updated, state.combinations);
    emit(state.copyWith(variants: updated, combinations: newCombinations));
  }

  // ── Combination handler ──────────────────────────────────────────────────────

  void _onCombinationChanged(
    MerchantInputProductCombinationChanged event,
    Emitter<MerchantInputProductState> emit,
  ) {
    final updated = List<MerchantProductVariantSendParam>.from(
      state.combinations,
    );
    updated[event.combinationIndex] = event.updated;
    emit(state.copyWith(combinations: updated));
  }
}
