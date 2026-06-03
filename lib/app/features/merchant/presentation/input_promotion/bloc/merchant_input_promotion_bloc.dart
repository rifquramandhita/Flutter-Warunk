import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_promotion.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_promotion_send_use_case.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_product.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_promotion_product_assignment.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_products_get_use_case.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_promotion_get_by_id_use_case.dart';
import 'package:warunk/core/network/data_state.dart';

part 'merchant_input_promotion_event.dart';
part 'merchant_input_promotion_state.dart';

class MerchantInputPromotionBloc
    extends Bloc<MerchantInputPromotionEvent, MerchantInputPromotionState> {
  final MerchantPromotionSendUseCase _sendUseCase;
  final MerchantProductsGetUseCase _getProductsUseCase;
  final MerchantPromotionGetByIdUseCase _getByIdUseCase;

  MerchantInputPromotionBloc(
    this._sendUseCase,
    this._getProductsUseCase,
    this._getByIdUseCase,
  ) : super(const MerchantInputPromotionState()) {
    on<MerchantInputPromotionTipeChangedEvent>(_onTipeChanged);
    on<MerchantInputPromotionTipeDiskonChangedEvent>(_onTipeDiskonChanged);
    on<MerchantInputPromotionNamaChangedEvent>(_onNamaChanged);
    on<MerchantInputPromotionNilaiChangedEvent>(_onNilaiChanged);
    on<MerchantInputPromotionMinBeliChangedEvent>(_onMinBeliChanged);
    on<MerchantInputPromotionMulaiChangedEvent>(_onMulaiChanged);
    on<MerchantInputPromotionSelesaiChangedEvent>(_onSelesaiChanged);
    on<MerchantInputPromotionKuotaChangedEvent>(_onKuotaChanged);
    on<MerchantInputPromotionKodeChangedEvent>(_onKodeChanged);
    on<MerchantInputPromotionTargetPenggunaChangedEvent>(_onTargetPenggunaChanged);
    on<MerchantInputPromotionIsShowToggledEvent>(_onIsShowToggled);
    on<MerchantInputPromotionIsUnlimitedUseToggledEvent>(_onIsUnlimitedUseToggled);
    on<MerchantInputPromotionFetchProductsEvent>(_onFetchProducts);
    on<MerchantInputPromotionFetchDetailEvent>(_onFetchDetail);
    on<MerchantInputPromotionAddProductRowEvent>(_onAddProductRow);
    on<MerchantInputPromotionRemoveProductRowEvent>(_onRemoveProductRow);
    on<MerchantInputPromotionProductSelectedEvent>(_onProductSelected);
    on<MerchantInputPromotionProductAllVariantsToggledEvent>(_onProductAllVariantsToggled);
    on<MerchantInputPromotionProductVariantToggledEvent>(_onProductVariantToggled);
    on<MerchantInputPromotionSavedEvent>(_onSaved);
  }

  void _onTipeChanged(
    MerchantInputPromotionTipeChangedEvent event,
    Emitter<MerchantInputPromotionState> emit,
  ) {
    emit(state.copyWith(tipe: event.value, nilai: ''));
  }

  void _onTipeDiskonChanged(
    MerchantInputPromotionTipeDiskonChangedEvent event,
    Emitter<MerchantInputPromotionState> emit,
  ) {
    emit(state.copyWith(tipeDiskon: event.value, nilai: ''));
  }

  void _onNamaChanged(
    MerchantInputPromotionNamaChangedEvent event,
    Emitter<MerchantInputPromotionState> emit,
  ) {
    emit(state.copyWith(nama: event.value));
  }

  void _onNilaiChanged(
    MerchantInputPromotionNilaiChangedEvent event,
    Emitter<MerchantInputPromotionState> emit,
  ) {
    emit(state.copyWith(nilai: event.value));
  }

  void _onMinBeliChanged(
    MerchantInputPromotionMinBeliChangedEvent event,
    Emitter<MerchantInputPromotionState> emit,
  ) {
    emit(state.copyWith(minBeli: event.value));
  }

  void _onMulaiChanged(
    MerchantInputPromotionMulaiChangedEvent event,
    Emitter<MerchantInputPromotionState> emit,
  ) {
    emit(state.copyWith(mulai: event.date));
  }

  void _onSelesaiChanged(
    MerchantInputPromotionSelesaiChangedEvent event,
    Emitter<MerchantInputPromotionState> emit,
  ) {
    emit(state.copyWith(selesai: event.date));
  }

  void _onKuotaChanged(
    MerchantInputPromotionKuotaChangedEvent event,
    Emitter<MerchantInputPromotionState> emit,
  ) {
    emit(state.copyWith(kuota: event.value));
  }

  void _onKodeChanged(
    MerchantInputPromotionKodeChangedEvent event,
    Emitter<MerchantInputPromotionState> emit,
  ) {
    emit(state.copyWith(kode: event.value));
  }

  void _onTargetPenggunaChanged(
    MerchantInputPromotionTargetPenggunaChangedEvent event,
    Emitter<MerchantInputPromotionState> emit,
  ) {
    emit(state.copyWith(targetPengguna: event.value));
  }

  void _onIsShowToggled(
    MerchantInputPromotionIsShowToggledEvent event,
    Emitter<MerchantInputPromotionState> emit,
  ) {
    emit(state.copyWith(isShow: !state.isShow));
  }

  void _onIsUnlimitedUseToggled(
    MerchantInputPromotionIsUnlimitedUseToggledEvent event,
    Emitter<MerchantInputPromotionState> emit,
  ) {
    emit(state.copyWith(isUnlimitedUse: !state.isUnlimitedUse));
  }

  Future<void> _onFetchProducts(
    MerchantInputPromotionFetchProductsEvent event,
    Emitter<MerchantInputPromotionState> emit,
  ) async {
    if (state.products.isNotEmpty) return;

    emit(state.copyWith(isProductsLoading: true));
    try {
      final response = await _getProductsUseCase();
      if (response is SuccessState) {
        emit(
          state.copyWith(
            products: response.data ?? [],
            isProductsLoading: false,
          ),
        );
      } else {
        emit(
          state.copyWith(
            isProductsLoading: false,
            errorMessage: response.message,
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(isProductsLoading: false, errorMessage: e.toString()),
      );
    }
  }

  Future<void> _onFetchDetail(
    MerchantInputPromotionFetchDetailEvent event,
    Emitter<MerchantInputPromotionState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, promoId: event.id));
    try {
      final response = await _getByIdUseCase(event.id);
      if (response is SuccessState && response.data != null) {
        final data = response.data!;
        
        List<String?> selectedProductIds = [];
        List<bool> selectedProductAllVariants = [];
        List<List<String>> selectedProductVariantIds = [];
        if (data.type == 'product' && data.productAssignments.isNotEmpty) {
          final Map<String, List<MerchantPromotionProductAssignmentEntity>> grouped = {};
          for (var e in data.productAssignments) {
            grouped.putIfAbsent(e.productId, () => []).add(e);
          }
          grouped.forEach((productId, assignments) {
            selectedProductIds.add(productId);
            final isAll = assignments.any((e) => e.allVariant);
            selectedProductAllVariants.add(isAll);
            if (isAll) {
              selectedProductVariantIds.add([]);
            } else {
              selectedProductVariantIds.add(assignments.map((e) => e.variantId).whereType<String>().toList());
            }
          });
        }

        emit(state.copyWith(
          isLoading: false,
          isDetailLoaded: true,
          tipe: data.type,
          tipeDiskon: data.discountType,
          nama: data.title,
          nilai: data.discount.toString(),
          minBeli: data.minPurchase.toString(),
          mulai: data.datetimeStart,
          selesai: data.datetimeEnd,
          kuota: data.maxUse?.toString() ?? '',
          kode: data.code ?? '',
          selectedProductIds: selectedProductIds,
          selectedProductAllVariants: selectedProductAllVariants,
          selectedProductVariantIds: selectedProductVariantIds,
          targetPengguna: data.eligibility,
          isShow: data.isShow,
          isUnlimitedUse: data.isUnlimitedUse,
        ));
      } else {
        emit(state.copyWith(isLoading: false, errorMessage: response.message));
      }
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  void _onAddProductRow(
    MerchantInputPromotionAddProductRowEvent event,
    Emitter<MerchantInputPromotionState> emit,
  ) {
    emit(
      state.copyWith(
        selectedProductIds: [...state.selectedProductIds, null],
        selectedProductAllVariants: [...state.selectedProductAllVariants, true],
        selectedProductVariantIds: [...state.selectedProductVariantIds, []],
      ),
    );
  }

  void _onRemoveProductRow(
    MerchantInputPromotionRemoveProductRowEvent event,
    Emitter<MerchantInputPromotionState> emit,
  ) {
    final ids = List<String?>.from(state.selectedProductIds);
    final allVars = List<bool>.from(state.selectedProductAllVariants);
    final varIds = List<List<String>>.from(state.selectedProductVariantIds);

    ids.removeAt(event.index);
    allVars.removeAt(event.index);
    varIds.removeAt(event.index);

    emit(state.copyWith(
      selectedProductIds: ids,
      selectedProductAllVariants: allVars,
      selectedProductVariantIds: varIds,
    ));
  }

  void _onProductSelected(
    MerchantInputPromotionProductSelectedEvent event,
    Emitter<MerchantInputPromotionState> emit,
  ) {
    final ids = List<String?>.from(state.selectedProductIds);
    final allVars = List<bool>.from(state.selectedProductAllVariants);
    final varIds = List<List<String>>.from(state.selectedProductVariantIds);

    ids[event.index] = event.productId;
    allVars[event.index] = true;
    varIds[event.index] = [];

    emit(state.copyWith(
      selectedProductIds: ids,
      selectedProductAllVariants: allVars,
      selectedProductVariantIds: varIds,
    ));
  }

  void _onProductAllVariantsToggled(
    MerchantInputPromotionProductAllVariantsToggledEvent event,
    Emitter<MerchantInputPromotionState> emit,
  ) {
    final allVars = List<bool>.from(state.selectedProductAllVariants);
    allVars[event.index] = !allVars[event.index];
    
    // If turning on all variants, clear selected variant ID
    final varIds = List<List<String>>.from(state.selectedProductVariantIds);
    if (allVars[event.index]) {
      varIds[event.index] = [];
    }

    emit(state.copyWith(
      selectedProductAllVariants: allVars,
      selectedProductVariantIds: varIds,
    ));
  }

  void _onProductVariantToggled(
    MerchantInputPromotionProductVariantToggledEvent event,
    Emitter<MerchantInputPromotionState> emit,
  ) {
    final varIds = List<List<String>>.from(state.selectedProductVariantIds);
    final currentList = List<String>.from(varIds[event.index]);
    
    if (currentList.contains(event.variantId)) {
      currentList.remove(event.variantId);
    } else {
      currentList.add(event.variantId);
    }
    
    varIds[event.index] = currentList;
    emit(state.copyWith(selectedProductVariantIds: varIds));
  }

  Future<void> _onSaved(
    MerchantInputPromotionSavedEvent event,
    Emitter<MerchantInputPromotionState> emit,
  ) async {
    if (!state.isValid) return;

    emit(state.copyWith(isLoading: true, errorMessage: null));

    try {
      final formatter = DateFormat('yyyy-MM-dd HH:mm:ss');

      final request = MerchantPromotionSendParam(
        code: !state.isShow ? state.kode.trim() : null,
        title: state.nama.trim(),
        isShow: state.isShow,
        type: state.tipe,
        datetimeStart: formatter.format(state.mulai!),
        datetimeEnd: formatter.format(state.selesai!),
        discountType: state.tipeDiskon,
        discount: int.tryParse(state.nilai) ?? 0,
        minPurchase: int.tryParse(state.minBeli) ?? 0,
        eligibility: state.targetPengguna,
        isUnlimitedUse: state.isUnlimitedUse,
        maxUse: state.isUnlimitedUse ? null : int.tryParse(state.kuota),
        merchantDatetimeStart: formatter.format(state.mulai!),
        merchantDatetimeEnd: formatter.format(state.selesai!),
        productAssignments: state.tipe == 'product'
            ? () {
                final assignments = <MerchantPromotionProductAssignmentParamEntity>[];
                for (int i = 0; i < state.selectedProductIds.length; i++) {
                  final id = state.selectedProductIds[i];
                  if (id != null) {
                    if (state.selectedProductAllVariants[i]) {
                      assignments.add(
                        MerchantPromotionProductAssignmentParamEntity(
                          productId: id,
                          allVariant: true,
                        ),
                      );
                    } else {
                      for (final variantId in state.selectedProductVariantIds[i]) {
                        assignments.add(
                          MerchantPromotionProductAssignmentParamEntity(
                            productId: id,
                            allVariant: false,
                            variantId: variantId,
                          ),
                        );
                      }
                    }
                  }
                }
                return assignments;
              }()
            : const [],
      );

      final response = await _sendUseCase.call(request: request, id: state.promoId);

      if (response is SuccessState) {
        emit(state.copyWith(isSuccess: true));
      } else {
        emit(state.copyWith(errorMessage: response.message));
      }
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }
}
