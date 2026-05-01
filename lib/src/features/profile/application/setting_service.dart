
import 'package:app_demo/src/features/authentication/application/auth_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final settingServiceProvider = Provider<SettingService>(SettingService.new);
class SettingService {
  final Ref _ref;
  SettingService(this._ref);
  late final _authService = _ref.read(authServiceProvider);

  Future<void> logout()async{
    await _authService.signOut();
  }

  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    await _authService.changePassword(
      currentPassword: currentPassword,
      newPassword: newPassword,
    );
  }
}