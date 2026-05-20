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

## 3. Dependency Injection (DI)
- **Tool**: `get_it`.
- **Registration**: Every new BLoC, UseCase, Repository, API Service, and other injectable classes MUST be registered in `lib/core/dependency/dependency.dart`.

## 4. Styling & UI Components
- **Typography & Colors**: All text styles (typography) and color palettes must be imported and used from `lib/core/helper/global_helper.dart`. Avoid hardcoding colors or styles in UI files.
- **Reusable Widgets**: Widgets that are frequently used across different screens are stored in the `lib/core/widgets/` directory. Always check this folder before creating a new general-purpose widget.
- **Dialogs**: Any pop-up dialogs or modals must be displayed using the helper functions provided in `lib/core/helper/dialog_helper.dart`.

## 5. Constants & API
- **URLs & Paths**: All API endpoint paths and static URL configurations must be stored in `lib/core/constants/constant.dart`.

## 6. Repository & API Requests
- **API Handling**: Every API request inside a repository MUST be wrapped using the `handleResponse` helper function. 
  Contoh format:
  ```dart
  return handleResponse(() => _api.someMethod(), (responseData) async {
    // Parsing data atau proses tambahan
    return SomeEntity.fromJson(responseData);
  });
  ```

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
  - Pada root `build()`, sediakan `BlocProvider` yang memanggil dependensi dari `get_it` (contoh: `sl<AuthLoginBloc>()`), kemudian gunakan `BlocConsumer` atau `BlocBuilder`.
  - **Pemisahan Code UI**: Jangan menulis semua kode UI dalam satu fungsi besar. Pecah komponen-komponen antarmuka ke dalam fungsi privat yang mengembalikan `Widget` (contoh: `_bodyBuild`, `_formLayout`, `_emailTextFieldLayout`).
  - Untuk membaca state pada fungsi-fungsi privat tersebut, gunakan: `final state = context.watch<NamaBloc>().state;`.
  - Untuk memicu event, gunakan: `context.read<NamaBloc>().add(NamaEvent());`.
- **BLoC (`..._bloc.dart`)**:
  - Gunakan standar dari `flutter_bloc` yaitu `Bloc<Event, State>`.
  - Daftarkan event pada *constructor* menggunakan pola handler terpisah: `on<NamaEvent>(_onNamaEvent)`.
  - *Inject* UseCase dan BLoC lain melalui *constructor*.
- **State (`..._state.dart`)**:
  - Wajib *extends* `Equatable`.
  - Gunakan properti standar (tanpa package `freezed`), berikan *default values* pada constructor.
  - Wajib menulis *method* `copyWith` untuk *state update*.
  - Sediakan properti seperti `isLoading` dan `String? errorMessage` untuk melacak proses *loading* dan menangkap pesan kegagalan.
- **Event (`..._event.dart`)**:
  - Gunakan *abstract class* sebagai class dasar (*base*).
  - Setiap aksi (seperti input teks, tombol ditekan) direpresentasikan dengan class baru yang mewarisi class dasar tersebut (contoh: `AuthEmailChanged`, `AuthLoginSubmitted`).
