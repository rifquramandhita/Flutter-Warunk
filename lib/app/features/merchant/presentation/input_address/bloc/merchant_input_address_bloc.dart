import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_district.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_province.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_regency.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_location_get_placemark_use_case.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_merchant_get_use_case.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_merchant_update_location_use_case.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_region_get_district_use_case.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_region_get_province_use_case.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_region_get_regency_use_case.dart';
import 'package:warunk/core/network/data_state.dart';

part 'merchant_input_address_event.dart';
part 'merchant_input_address_state.dart';

class MerchantInputAddressBloc
    extends Bloc<MerchantInputAddressEvent, MerchantInputAddressState> {
  final MerchantMerchantGetUseCase _getUseCase;
  final MerchantMerchantUpdateLocationUseCase _updateLocationUseCase;
  final MerchantLocationGetPlacemarkUseCase _getPlacemarkUseCase;
  final MerchantRegionGetProvinceUseCase _getProvinceUseCase;
  final MerchantRegionGetRegencyUseCase _getRegencyUseCase;
  final MerchantRegionGetDistrictUseCase _getDistrictUseCase;

  MerchantInputAddressBloc(
    this._getUseCase,
    this._updateLocationUseCase,
    this._getPlacemarkUseCase,
    this._getProvinceUseCase,
    this._getRegencyUseCase,
    this._getDistrictUseCase,
  ) : super(const MerchantInputAddressState()) {
    on<MerchantInputAddressEventGet>(_onGet);
    on<MerchantInputAddressEventAddressChanged>(_onAddressChanged);
    on<MerchantInputAddressEventProvinceChanged>(_onProvinceChanged);
    on<MerchantInputAddressEventRegencyChanged>(_onRegencyChanged);
    on<MerchantInputAddressEventCityChanged>(
      (event, emit) => _onRegencyChanged(
        MerchantInputAddressEventRegencyChanged(event.regency),
        emit,
      ),
    );
    on<MerchantInputAddressEventDistrictChanged>(_onDistrictChanged);
    on<MerchantInputAddressEventPostalCodeChanged>(_onPostalCodeChanged);
    on<MerchantInputAddressEventLocationChanged>(_onLocationChanged);
    on<MerchantInputAddressEventSaved>(_onSaved);
  }

  Future<void> _onGet(
    MerchantInputAddressEventGet event,
    Emitter<MerchantInputAddressState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    final merchantResponse = await _getUseCase.call();
    final provinceResponse = await _getProvinceUseCase.call();

    final List<MerchantProvinceEntity> provinces =
        (provinceResponse.success && provinceResponse.data != null)
            ? provinceResponse.data!
            : [];

    if (merchantResponse.success && merchantResponse.data != null) {
      final merchant = merchantResponse.data!;
      final address = merchant.address ?? '';
      final postalCode = merchant.postalCode ?? '';
      final latitude = merchant.latitude ?? 0.0;
      final longitude = merchant.longitude ?? 0.0;

      MerchantProvinceEntity? selectedProvince;
      List<MerchantRegencyEntity> regencies = [];
      MerchantRegencyEntity? selectedRegency;
      List<MerchantDistrictEntity> districts = [];
      MerchantDistrictEntity? selectedDistrict;

      if (merchant.province != null && merchant.province!.trim().isNotEmpty) {
        selectedProvince = _findMatchingProvince(provinces, merchant.province!);
      }

      if (selectedProvince != null) {
        final regencyRes = await _getRegencyUseCase.call(selectedProvince.id);
        if (regencyRes.success && regencyRes.data != null) {
          regencies = regencyRes.data!;

          if (merchant.city != null && merchant.city!.trim().isNotEmpty) {
            selectedRegency = _findMatchingRegency(regencies, merchant.city!);
          }

          if (selectedRegency != null) {
            final districtRes =
                await _getDistrictUseCase.call(selectedRegency.id);
            if (districtRes.success && districtRes.data != null) {
              districts = districtRes.data!;

              if (merchant.district != null &&
                  merchant.district!.trim().isNotEmpty) {
                selectedDistrict = _findMatchingDistrict(
                  districts,
                  [merchant.district!],
                );
              }
            }
          }
        }
      }

      emit(
        state.copyWith(
          address: address,
          postalCode: postalCode,
          latitude: latitude,
          longitude: longitude,
          provinces: provinces,
          regencies: regencies,
          districts: districts,
          selectedProvince: selectedProvince,
          selectedRegency: selectedRegency,
          selectedDistrict: selectedDistrict,
          isInitialLoaded: true,
          isLoading: false,
        ),
      );
    } else {
      emit(
        state.copyWith(
          provinces: provinces,
          errorMessage: merchantResponse.message,
          isInitialLoaded: true,
          isLoading: false,
        ),
      );
    }
  }

  void _onAddressChanged(
    MerchantInputAddressEventAddressChanged event,
    Emitter<MerchantInputAddressState> emit,
  ) {
    emit(state.copyWith(address: event.address));
  }

  Future<void> _onProvinceChanged(
    MerchantInputAddressEventProvinceChanged event,
    Emitter<MerchantInputAddressState> emit,
  ) async {
    final province = event.province;
    if (province == state.selectedProvince) return;

    emit(
      state.copyWith(
        selectedProvince: province,
        clearSelectedProvince: province == null,
        clearSelectedRegency: true,
        clearSelectedDistrict: true,
        regencies: [],
        districts: [],
        isLoadingRegencies: province != null,
      ),
    );

    if (province != null) {
      final res = await _getRegencyUseCase.call(province.id);
      if (res.success && res.data != null) {
        emit(
          state.copyWith(
            regencies: res.data!,
            isLoadingRegencies: false,
          ),
        );
      } else {
        emit(
          state.copyWith(
            isLoadingRegencies: false,
            errorMessage: res.message,
          ),
        );
      }
    }
  }

  Future<void> _onRegencyChanged(
    MerchantInputAddressEventRegencyChanged event,
    Emitter<MerchantInputAddressState> emit,
  ) async {
    final regency = event.regency;
    if (regency == state.selectedRegency) return;

    emit(
      state.copyWith(
        selectedRegency: regency,
        clearSelectedRegency: regency == null,
        clearSelectedDistrict: true,
        districts: [],
        isLoadingDistricts: regency != null,
      ),
    );

    if (regency != null) {
      final res = await _getDistrictUseCase.call(regency.id);
      if (res.success && res.data != null) {
        emit(
          state.copyWith(
            districts: res.data!,
            isLoadingDistricts: false,
          ),
        );
      } else {
        emit(
          state.copyWith(
            isLoadingDistricts: false,
            errorMessage: res.message,
          ),
        );
      }
    }
  }

  void _onDistrictChanged(
    MerchantInputAddressEventDistrictChanged event,
    Emitter<MerchantInputAddressState> emit,
  ) {
    emit(
      state.copyWith(
        selectedDistrict: event.district,
        clearSelectedDistrict: event.district == null,
      ),
    );
  }

  void _onPostalCodeChanged(
    MerchantInputAddressEventPostalCodeChanged event,
    Emitter<MerchantInputAddressState> emit,
  ) {
    emit(state.copyWith(postalCode: event.postalCode));
  }

  Future<void> _onLocationChanged(
    MerchantInputAddressEventLocationChanged event,
    Emitter<MerchantInputAddressState> emit,
  ) async {
    emit(
      state.copyWith(
        longitude: event.longitude,
        latitude: event.latitude,
        isLoading: true,
      ),
    );

    // Pastikan daftar provinsi sudah tersedia
    List<MerchantProvinceEntity> provinces = state.provinces;
    if (provinces.isEmpty) {
      final provRes = await _getProvinceUseCase.call();
      if (provRes.success && provRes.data != null) {
        provinces = provRes.data!;
      }
    }

    final result = await _getPlacemarkUseCase.call(
      params: MerchantLocationGetPlacemarkParams(
        latitude: event.latitude,
        longitude: event.longitude,
      ),
    );

    if (result.success && result.data != null) {
      final placemark = result.data!;
      final newAddress =
          placemark.address.isNotEmpty ? placemark.address : state.address;
      final newPostalCode =
          placemark.postalCode.isNotEmpty
              ? placemark.postalCode
              : state.postalCode;

      MerchantProvinceEntity? matchedProvince;
      List<MerchantRegencyEntity> newRegencies = [];
      MerchantRegencyEntity? matchedRegency;
      List<MerchantDistrictEntity> newDistricts = [];
      MerchantDistrictEntity? matchedDistrict;

      // 1. Cocokkan Provinsi
      matchedProvince = _findMatchingProvince(provinces, placemark.province);

      // 2. Jika provinsi cocok, ambil data kabupaten/kota dan cocokkan
      if (matchedProvince != null) {
        final regRes = await _getRegencyUseCase.call(matchedProvince.id);
        if (regRes.success && regRes.data != null) {
          newRegencies = regRes.data!;
          matchedRegency = _findMatchingRegency(
            newRegencies,
            placemark.city,
            placemark.district,
          );

          // 3. Jika kabupaten/kota cocok, ambil data kecamatan dan cocokkan
          if (matchedRegency != null) {
            final distRes =
                await _getDistrictUseCase.call(matchedRegency.id);
            if (distRes.success && distRes.data != null) {
              newDistricts = distRes.data!;
              matchedDistrict = _findMatchingDistrict(
                newDistricts,
                [placemark.district, placemark.address],
              );
            }
          }
        }
      }

      emit(
        state.copyWith(
          address: newAddress,
          postalCode: newPostalCode,
          provinces: provinces,
          selectedProvince: matchedProvince,
          clearSelectedProvince: matchedProvince == null,
          regencies: newRegencies,
          selectedRegency: matchedRegency,
          clearSelectedRegency: matchedRegency == null,
          districts: newDistricts,
          selectedDistrict: matchedDistrict,
          clearSelectedDistrict: matchedDistrict == null,
          isLoading: false,
        ),
      );
    } else {
      emit(
        state.copyWith(
          provinces: provinces,
          isLoading: false,
        ),
      );
    }
  }

  Future<void> _onSaved(
    MerchantInputAddressEventSaved event,
    Emitter<MerchantInputAddressState> emit,
  ) async {
    if (!state.isValid) {
      emit(
        state.copyWith(
          errorMessage:
              'Data alamat toko belum lengkap. Pastikan titik lokasi, provinsi, kota, kecamatan, kode pos, dan alamat detail telah terisi.',
        ),
      );
      return;
    }

    emit(state.copyWith(isLoading: true));

    final response = await _updateLocationUseCase(
      address: state.address,
      districtId: state.selectedDistrict!.id,
      postalCode: state.postalCode,
      longitude: state.longitude,
      latitude: state.latitude,
    );

    if (response.success || response is SuccessState) {
      emit(state.copyWith(isLoading: false, isSuccess: true));
    } else {
      emit(state.copyWith(isLoading: false, errorMessage: response.message));
    }
  }

  // --- Matching Helpers ---
  static String _normalizeProvinceName(String input) {
    String s = input.trim().toLowerCase();
    s = s.replaceAll('provinsi ', '').replaceAll('propinsi ', '');

    const map = {
      'west java': 'jawa barat',
      'central java': 'jawa tengah',
      'east java': 'jawa timur',
      'special capital region of jakarta': 'dki jakarta',
      'jakarta': 'dki jakarta',
      'special region of yogyakarta': 'daerah istimewa yogyakarta',
      'yogyakarta': 'daerah istimewa yogyakarta',
      'di yogyakarta': 'daerah istimewa yogyakarta',
      'west kalimantan': 'kalimantan barat',
      'central kalimantan': 'kalimantan tengah',
      'south kalimantan': 'kalimantan selatan',
      'east kalimantan': 'kalimantan timur',
      'north kalimantan': 'kalimantan utara',
      'north sumatra': 'sumatera utara',
      'west sumatra': 'sumatera barat',
      'south sumatra': 'sumatera selatan',
      'north sulawesi': 'sulawesi utara',
      'central sulawesi': 'sulawesi tengah',
      'south sulawesi': 'sulawesi selatan',
      'southeast sulawesi': 'sulawesi tenggara',
      'west sulawesi': 'sulawesi barat',
      'west nusa tenggara': 'nusa tenggara barat',
      'east nusa tenggara': 'nusa tenggara timur',
      'north maluku': 'maluku utara',
      'west papua': 'papua barat',
      'southwest papua': 'papua barat daya',
      'south papua': 'papua selatan',
      'central papua': 'papua tengah',
      'highland papua': 'papua pegunungan',
      'riau islands': 'kepulauan riau',
      'bangka belitung': 'kepulauan bangka belitung',
      'bangka belitung islands': 'kepulauan bangka belitung',
      'nanggroe aceh darussalam': 'aceh',
    };
    return map[s] ?? s;
  }

  static MerchantProvinceEntity? _findMatchingProvince(
    List<MerchantProvinceEntity> provinces,
    String rawName,
  ) {
    if (rawName.trim().isEmpty) return null;
    final normalized = _normalizeProvinceName(rawName);

    // 1. Exact match with normalized
    for (final p in provinces) {
      final pNorm = _normalizeProvinceName(p.name);
      if (pNorm == normalized) return p;
    }

    // 2. Contains match
    for (final p in provinces) {
      final pNorm = _normalizeProvinceName(p.name);
      if (pNorm.contains(normalized) || normalized.contains(pNorm)) return p;
    }

    // 3. Word match (e.g. "jakarta" in "dki jakarta")
    final words =
        normalized.split(RegExp(r'\s+')).where((w) => w.length > 3).toList();
    for (final word in words) {
      for (final p in provinces) {
        final pNorm = _normalizeProvinceName(p.name);
        if (pNorm.contains(word)) return p;
      }
    }

    return null;
  }

  static String _cleanRegencyName(String input) {
    String s = input.trim().toLowerCase();
    s = s.replaceAll('kota administrasi ', '');
    s = s.replaceAll('kota ', '');
    s = s.replaceAll('kabupaten ', '');
    s = s.replaceAll('kab. ', '');
    s = s.replaceAll('regency', '');
    s = s.replaceAll('city', '');
    s = s.replaceAll('special capital region of ', '');
    s = s.replaceAll('south ', 'selatan ');
    s = s.replaceAll('north ', 'utara ');
    s = s.replaceAll('west ', 'barat ');
    s = s.replaceAll('east ', 'timur ');
    s = s.replaceAll('central ', 'pusat ');
    return s.trim();
  }

  static MerchantRegencyEntity? _findMatchingRegency(
    List<MerchantRegencyEntity> regencies,
    String rawCity, [
    String rawLocality = '',
  ]) {
    final candidates =
        [rawCity, rawLocality].where((s) => s.trim().isNotEmpty).toList();
    for (final raw in candidates) {
      final rawLower = raw.trim().toLowerCase();
      final cleaned = _cleanRegencyName(raw);

      final isKota = rawLower.contains('kota') || rawLower.contains('city');
      final isKab =
          rawLower.contains('kabupaten') ||
          rawLower.contains('kab.') ||
          rawLower.contains('regency');

      // 1. Preference based on kota vs kabupaten
      if (isKota || isKab) {
        for (final r in regencies) {
          final rCleaned = _cleanRegencyName(r.name);
          final rType =
              r.type?.toLowerCase() ??
              (r.name.toLowerCase().startsWith('kota') ? 'city' : 'regency');
          if (rCleaned == cleaned) {
            if (isKota &&
                (rType == 'city' || r.name.toLowerCase().startsWith('kota'))) {
              return r;
            }
            if (isKab &&
                (rType == 'regency' ||
                    r.name.toLowerCase().startsWith('kabupaten'))) {
              return r;
            }
          }
        }
      }

      // 2. Exact cleaned match
      for (final r in regencies) {
        final rCleaned = _cleanRegencyName(r.name);
        if (rCleaned == cleaned) return r;
      }

      // 3. Contains match
      for (final r in regencies) {
        final rCleaned = _cleanRegencyName(r.name);
        if (rCleaned.isNotEmpty && cleaned.isNotEmpty) {
          if (rCleaned.contains(cleaned) || cleaned.contains(rCleaned)) {
            return r;
          }
        }
      }
    }
    return null;
  }

  static String _cleanDistrictName(String input) {
    String s = input.trim().toLowerCase();
    s = s.replaceAll('kecamatan ', '');
    s = s.replaceAll('kec. ', '');
    s = s.replaceAll('district', '');
    s = s.replaceAll('kelurahan ', '');
    s = s.replaceAll('desa ', '');
    return s.trim();
  }

  static MerchantDistrictEntity? _findMatchingDistrict(
    List<MerchantDistrictEntity> districts,
    List<String> rawCandidates,
  ) {
    for (final raw in rawCandidates) {
      if (raw.trim().isEmpty) continue;
      final cleaned = _cleanDistrictName(raw);
      if (cleaned.isEmpty) continue;

      // 1. Exact cleaned match
      for (final d in districts) {
        final dCleaned = _cleanDistrictName(d.name);
        if (dCleaned == cleaned) return d;
      }

      // 2. Contains match
      for (final d in districts) {
        final dCleaned = _cleanDistrictName(d.name);
        if (dCleaned.isNotEmpty &&
            (dCleaned.contains(cleaned) || cleaned.contains(dCleaned))) {
          return d;
        }
      }
    }

    // 3. Word match: check if any district name is in the candidate strings
    for (final raw in rawCandidates) {
      final rawLower = raw.toLowerCase();
      for (final d in districts) {
        final dCleaned = _cleanDistrictName(d.name);
        if (dCleaned.length >= 3 && rawLower.contains(dCleaned)) {
          return d;
        }
      }
    }

    return null;
  }
}
