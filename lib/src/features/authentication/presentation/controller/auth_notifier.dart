import 'package:app_demo/src/features/authentication/application/auth_service.dart';
import 'package:app_demo/src/features/authentication/data/auth_repository.dart';
import 'package:app_demo/src/shared/utils/validator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_notifier.g.dart';

@riverpod
class AuthNotifier extends _$AuthNotifier {
  @override

  FutureOr<void> build() {
  }

  String? validateEmail(String value) {
    if (value.trim().isEmpty) {
      return 'Email không được để trống';
    }
    if (!Validator.isValidEmail(value)) {
      return 'Email không hợp lệ';
    }
    return null;
  }

  /// Validate password
  String? validatePassword(String value) {
    if (value.trim().isEmpty) {
      return 'Mật khẩu không được để trống';
    }
    if (!Validator.isValidPassword(value)) {
      return 'Mật khẩu phải có hơn 4 kí tự';
    }
    return null;
  }

  bool isValidForm(String email, String password){
    return Validator.isValidValue(email) &&
          Validator.isValidValue(password);
  }

  /// Handle login - delegates to AuthService with proper error handling
  Future<void> login(String email, String password) async {
    
    if(!isValidForm(email, password)) return;

    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(authServiceProvider).login(email, password),
    );
  }

  /// Handle logout
  Future<void> logout() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(authRepositoryProvider).signOut(),
    );
  }
}