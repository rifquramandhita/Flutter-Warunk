# Warunk Project Rules & Guidelines

This file serves as the main reference for AI agents and developers working on the `warunk` project. It outlines the architectural decisions, tools, and coding standards used in the application.

## 1. Architecture & Project Structure
- **Architecture**: Clean Architecture.
- **Core Modules/Features**:
  1. `auth`
  2. `customer`
  3. `merchant`
- **Entities/Models**: Every entity or model MUST be placed in the `entity` folder within its respective feature module (e.g., `lib/features/auth/entity/`).

## 2. State Management & Routing
- **State Management**: BLoC (Business Logic Component).
- **Routing/Navigation**: Navigation is handled globally using the `navigatorKey` variable located in `lib/main.dart`. 
  - **DILARANG KERAS** menggunakan `Navigator.push(context, ...)`, `Navigator.pop(context)`, atau `Navigator.of(context)`. 
  - **WAJIB** menggunakan `navigatorKey.currentState?.push(...)` atau `navigatorKey.currentState?.pop()`.
  - **PENGECUALIAN**: Navigasi kembali dari tombol back bawaan `AppBar` diperbolehkan berjalan secara otomatis (secara internal Flutter memanggil `Navigator.maybePop()`), sehingga Anda **TIDAK PERLU** membuat *custom leading widget* hanya untuk memanggil `navigatorKey.currentState?.pop()`.

## 3. Dependency Injection (DI)
- **Tool**: `get_it`.
- **Registration**: Every new BLoC, UseCase, Repository, API Service, and other injectable classes MUST be registered in `lib/core/dependency/dependency.dart`.

## 4. Styling & UI Components
- **Typography & Colors**: 
  - **DILARANG KERAS** melakukan hardcode `TextStyle(...)` secara langsung di UI files atau menggunakan class warna statis (misalnya `AppColors.primary`).
  - **WAJIB** mengambil *text style* dan warna dari `lib/core/helper/global_helper.dart`:
    - Untuk **Text Style**: Gunakan `GlobalHelper.getTextTheme(context, appTextStyle: AppTextStyle.XXX)` dengan `XXX` sesuai enum `AppTextStyle`.
    - Untuk **Warna**: Gunakan `GlobalHelper.getColorSchema(context).XXX` (contoh: `GlobalHelper.getColorSchema(context).primary`).
- **Reusable Widgets**: Widgets that are frequently used across different screens are stored in the `lib/core/widgets/` directory. Always check this folder before creating a new general-purpose widget.
- **Dialogs**: Any pop-up dialogs or modals must be displayed using the helper functions provided in `lib/core/helper/dialog_helper.dart`.
- **AppBar**: Untuk pembuatan `AppBar`, cukup gunakan format sederhana bawaan Flutter tanpa kustomisasi rumit. Contoh: `AppBar(title: Text('Judul'))`.
  - **DILARANG KERAS** melakukan *override* pada properti `leading` dengan widget kustom (seperti `GestureDetector` dan `Icon(Icons.arrow_back)`) hanya untuk memberikan tombol *back*. Biarkan Flutter memunculkan tombol *back* secara otomatis (default).

## 5. Constants & API
- **URLs & Paths**: All API endpoint paths and static URL configurations must be stored in `lib/core/constants/constant.dart`.

## 6. Repository, UseCase & API Requests
- **Return Type**: Semua method pada UseCase dan Repository **WAJIB** memiliki tipe kembalian `Future<DataState<T>>`.
- **API Service Return Type**: Semua response API (Retrofit) wajib memiliki tipe `Future<HttpResponse<dynamic>>` (contoh: `Future<HttpResponse<dynamic>> get();`).
- **API Handling**: Every API request inside a repository MUST be wrapped using the `handleResponse` helper function. 
  Contoh format:
  ```dart
  return handleResponse(() => _api.someMethod(), (responseData) async {
    // Parsing data atau proses tambahan
    return SomeEntity.fromJson(responseData);
  });
  ```
- **Manual DataState**: Jika fungsi pada repository tidak memanggil API (misalnya logika internal atau operasi lokal seperti download file), tetap gunakan `DataState` dengan me-return `SuccessState(data: ...)` untuk sukses, dan `ErrorState(message: ...)` jika terjadi _exception_ atau kegagalan.
- **UseCase Base Class**: Setiap class UseCase **DILARANG** meng-extends atau implements sebuah _base class_ (seperti `UseCase<Type, Params>`). Buat method (biasanya `call`) secara langsung dengan mengembalikan `Future<DataState<T>>`.

## 7. Presentation Layer & BLoC Naming Convention
- **Directory Structure**: Setiap screen/halaman dan state management-nya diletakkan dengan struktur: `lib/app/features/[feature_name]/presentation/[action_name]/`.
- **File Naming**: Gunakan prefix nama fitur dan nama aksi.
  - **Screen**: `[feature_name]_[action_name]_screen.dart`
  - **BLoC Folder**: Buat folder `bloc/` di dalam folder aksi.
  - **BLoC**: `[feature_name]_[action_name]_bloc.dart`
  - **State**: `[feature_name]_[action_name]_state.dart`
  - **Event**: `[feature_name]_[action_name]_event.dart`
- **Contoh (Fitur Login di Modul Auth)**:
  ```text
  lib/app/features/auth/presentation/login/
  ├── auth_login_screen.dart
  └── bloc/
      ├── auth_login_bloc.dart
      ├── auth_login_event.dart
      └── auth_login_state.dart
  ```

## 8. Coding Style & Code Separation (Presentation & BLoC)
- **Screen (`..._screen.dart`)**:
  - Selalu *extends* `StatelessWidget`.
  - Pada root `build()`, sediakan `BlocProvider` yang memanggil dependensi dari `get_it` (contoh: `sl<AuthLoginBloc>()`), kemudian wajib menggunakan `BlocConsumer` untuk meng-handle `state.errorMessage` (menampilkan snackbar) dan mengembalikan layout utama.
  - **DILARANG** menggunakan properti `listenWhen` pada `BlocConsumer` maupun `BlocListener`. Biarkan *listener* berjalan untuk semua perubahan state, lalu gunakan *if-condition* di dalam blok `listener` untuk mengeksekusi logika tertentu.
  - **Struktur Root UI Wajib (HANYA BOLEH 1 CLASS)**:
    - **DILARANG KERAS** memecah body screen ke dalam class baru (misal: membuat class `_NamaView extends StatelessWidget`). Seluruh layout harus berada di dalam satu class screen utama.
    ```dart
    class NamaScreen extends StatelessWidget {
      const NamaScreen({super.key});

      @override
      Widget build(BuildContext context) {
        return BlocProvider(
          create: (context) => sl<NamaBloc>(),
          child: BlocConsumer<NamaBloc, NamaState>(
            listener: (context, state) {
              if (state.errorMessage != null) {
                DialogHelper.showErrorSnackBar(context: context, text: state.errorMessage!);
              }
            },
            builder: (context, state) {
              return Scaffold(body: _bodyBuild(context));
            },
          ),
        );
      }
      
      Widget _bodyBuild(BuildContext context) {
        final state = context.watch<NamaBloc>().state;
        return SafeArea(
          child: Stack(
            children: [
              _bodyLayout(context),
              (state.isLoading) ? const LoadingAppWidget() : const SizedBox(),
            ],
          ),
        );
      }
      
      Widget _bodyLayout(BuildContext context) {
        return Container();
      }
    }
    ```
  - **Pemisahan Code UI**: Jangan menulis semua kode UI dalam satu fungsi besar. Pecah komponen-komponen antarmuka ke dalam fungsi privat yang mengembalikan `Widget` (mulai dari `_bodyBuild`, `_bodyLayout`, hingga sub-komponen seperti `_emailTextFieldLayout`). Jangan menggunakan class terpisah untuk memecah UI utama.
  - **Cara Menampilkan Loading**:
    - **DILARANG KERAS** menggunakan `CircularProgressIndicator` secara langsung di UI *screen*.
    - **WAJIB** menggunakan `LoadingAppWidget()` dari `lib/core/widgets/loading_app_widget.dart`.
    - Implementasikan dengan menaruhnya di dalam `Stack` pada root UI (contoh: `if (state.isLoading) const LoadingAppWidget()`).
  - Untuk membaca state pada fungsi-fungsi privat tersebut, gunakan: `final state = context.watch<NamaBloc>().state;`.
  - Untuk memicu event, gunakan: `context.read<NamaBloc>().add(NamaEvent());`.
- **BLoC (`..._bloc.dart`)**:
  - Gunakan standar dari `flutter_bloc` yaitu `Bloc<Event, State>`.
  - Daftarkan event pada *constructor* menggunakan pola handler terpisah dengan menghapus prefix BLoC pada nama fungsi handler (contoh: `on<MerchantInputProductStarted>(_onStarted);`, bukan `_onMerchantInputProductStarted` atau menggunakan inline closures/arrow functions).
  - *Inject* UseCase dan BLoC lain melalui *constructor*.
  - **Pemanggilan UseCase**: Saat memanggil UseCase, pattern yang digunakan harus mengikuti alur berikut (menyalakan loading, memanggil usecase, menangani hasil, dan mematikan loading):
    ```dart
    emit(state.copyWith(isLoading: true));
    final param = RegisterSendParam(
      name: state.name,
      // ... field lainnya
    );

    final response = await _useCase.call(param: param);

    if (response is SuccessState) { // atau DataSuccess, menyesuaikan tipe return
      emit(state.copyWith(isSuccess: true));
    } else {
      emit(state.copyWith(errorMessage: response.message));
    }
    emit(state.copyWith(isLoading: false));
    ```
- **State (`..._state.dart`)**:
  - **DILARANG KERAS** menggunakan package `freezed`.
  - Wajib *extends* `Equatable`.
  - Gunakan properti standar, berikan *default values* pada constructor.
  - Wajib menulis *method* `copyWith` untuk *state update*.
  - Pada `copyWith`, untuk variabel nullable seperti `errorMessage`, **JANGAN** menggunakan fallback `?? this.errorMessage` (misal: tulislah `errorMessage: errorMessage,` alih-alih `errorMessage: errorMessage ?? this.errorMessage`). Hal ini bertujuan agar pesan error bisa di-reset menjadi `null`.
  - Sediakan properti seperti `isLoading` dan `String? errorMessage` untuk melacak proses *loading* dan menangkap pesan kegagalan.
- **Event (`..._event.dart`)**:
  - Gunakan *abstract class* atau *sealed class* sebagai class dasar (*base*).
  - Setiap aksi (seperti input teks, tombol ditekan) direpresentasikan dengan class baru yang mewarisi class dasar tersebut, dan **wajib mengandung kata "Event"** di dalam penamaannya (contoh: `AuthEventEmailChanged`, `AuthEventLoginSubmitted`, `MerchantProductEventFetchStarted`).

## 9. Naming Convention (Prefix Modul)
- **Prefix Modul**: Setiap class dan nama file (termasuk Entity, Service, BLoC, Event, State, Screen, dll) wajib memiliki prefix sesuai dengan nama modulnya (misal: pada modul `merchant`, nama class menjadi `MerchantProduct`, dan nama file menjadi `merchant_product.dart`). Jika class/file tersebut sudah memiliki nama yang sama persis dengan nama modul (misal class `Merchant` pada modul `merchant`), maka tidak perlu ditambahkan prefix yang berulang.
- **Khusus Entity (@freezed)**: Gunakan *sealed class* dengan *factory* `entity` yang mengembalikan `[Prefix][NamaClass]Entity`.
  - **Anotasi JSON**: Setiap *factory* constructor di dalam class `@freezed` yang menggunakan anotasi `@JsonSerializable` **WAJIB** menyertakan parameter `includeIfNull: false` (kecuali untuk entitas UI lokal yang murni tidak diserialisasi menjadi JSON).
- **Contoh**:
  ```dart
  @freezed
  sealed class MerchantProduct with _$MerchantProduct {
    @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
    const factory MerchantProduct.entity({
      required String id,
      required String name,
      // ... field lainnya
    }) = MerchantProductEntity;

    factory MerchantProduct.fromJson(Map<String, dynamic> json) =>
        _$MerchantProductFromJson(json);
  }
  ```

## 10. Commit Conventions & AI Generation Rules
- **Format**: Gunakan format Conventional Commits (misal: `feat`, `fix`, `chore`, `refactor`, dll).
- **Scope Modul**: Wajib menyertakan nama modul utama yang diubah di dalam tanda kurung sebagai *scope*. Contoh modul: `auth`, `customer`, `merchant`, atau `core`.
- **Contoh**:
  - `feat(auth): add reset password screen`
  - `fix(merchant): resolve null pointer on product list`
  - `chore(core): update flutter dependencies`
- **Aturan Generasi AI**: Saat AI diminta untuk men-generate commit message, AI **hanya boleh membaca dan memperhitungkan perubahan pada file yang berstatus "staged" (`git diff --cached`)**. Perubahan pada file yang *unstaged* harus diabaikan sepenuhnya dan tidak boleh dimasukkan ke dalam ringkasan commit.

## 11. Terminologi & Standar Data UI
- **Standar Istilah**:
  - Gunakan istilah **"Wishlist"** dan **DILARANG** menggunakan "Favorit" untuk menyeragamkan bahasa UI di seluruh aplikasi.
- **Standar Data**:
  - **DILARANG KERAS** menggunakan data *mock* atau melakukan *hardcode* angka statis pada komponen UI (seperti jumlah transaksi, jumlah wishlist, dll).
  - Semua bentuk data angka/statistik yang tampil di UI **WAJIB** bersumber dari *response* API yang relevan (menggunakan *UseCase* seperti `CustomerOrderGetUseCase` atau `CustomerWishlistsGetUseCase`).
