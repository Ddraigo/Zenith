import 'package:app_demo/src/features/profile/application/setting_service.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'setting_notifier.g.dart';

final pushNotificationProvider = StateProvider<bool>((ref) => false);
final darkModeProvider = StateProvider<bool>((ref) => false);

@riverpod
class SettingNotifier extends _$SettingNotifier {
  @override
  Future<void> build() async {}

  Future<void> logout() async {
    await ref.read(settingServiceProvider).logout();
  }
}
