import 'dart:developer' as developer;

import 'package:app_demo/src/core/provider/current_user_id_notifire.dart';
import 'package:app_demo/src/features/profile/application/profile_service.dart';
import 'package:app_demo/src/features/profile/domain/profile_model.dart';
import 'package:app_demo/src/shared/utils/validator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../shared/http/app_exception.dart';

part 'profile_notifier.g.dart';

final updateErrorProvider = StateProvider<AppException?>((ref) => null);

final hasProfileProvider = FutureProvider<bool>((ref) async {
  final userId = ref.watch(currentUserIdProvider);
  return ref.read(profileServiceProvider).hasProfile(userId);
});


class ProfileFormState {
  final String? nameError;
  final String? dayOfBirthError;

  const ProfileFormState({
    required this.nameError,
    required this.dayOfBirthError,
  });

  bool get isValid => nameError == null && dayOfBirthError == null;
}

@riverpod
class ProfileNotifier extends _$ProfileNotifier {
  static const String missingProfileMessage = 'Hồ sơ cá nhân chưa được tạo.';

  @override
  Future<ProfileModel> build() async {
    // keep provider alive to avoid frequent dispose/recreate fetches
    try {
      ref.keepAlive();
    } catch (_) {}
    developer.log('ProfileNotifier: build() called');
    final result = await ref.read(profileServiceProvider).getUserProfile();
    return result.fold(
      ifLeft: (e) => throw e,
      ifRight: (profile) => profile,
    );
  }

  Future<bool> createProfile(ProfileModel draft) async {
    final formState = validateForm(
      userName: draft.userName,
      dayOfBirth: draft.dayOfBirth,
    );

    if (!formState.isValid) return false;

    final result = await ref.read(profileServiceProvider).createNewProfile(draft);
    return result.fold(
      ifLeft: (e) {
        ref.read(updateErrorProvider.notifier).state = e;
        developer.log('createProfile failed', error: e);
        return false;
      },
      ifRight: (created) {
        ref.read(updateErrorProvider.notifier).state = null;
        state = AsyncData(created);
        return true;
      },
    );
  }

  Future<bool> submitUpdate(ProfileModel draft) async {
    // state = const AsyncLoading();

    final formState = validateForm(
      userName: draft.userName,
      dayOfBirth: draft.dayOfBirth,
    );

    if (!formState.isValid) return false;

    final result = await ref
        .read(profileServiceProvider)
        .updateUserProfile(userProfile: draft);
    return result.fold(
      ifLeft: (e) {
        ref.read(updateErrorProvider.notifier).state = e;
        developer.log('submitUpdate failed', error: e);
        return false;
      },
      ifRight: (updated) {
        ref.read(updateErrorProvider.notifier).state = null;
        state = AsyncData(updated);
        return true;
      },
    );
  }

  String? validateDayOfBirth(DateTime? value) {
    if (value == null) return 'Ngày sinh không được trống';
    if (value.isAfter(DateTime.now())) return 'Ngày sinh không thể ở tương lai';
    return null;
  }

  String? validateUserName(String? name) {
    if (!Validator.isValidValue(name)) return 'Không được để trống';
    return null;
  }

  ProfileFormState validateForm({
    required String userName,
    required DateTime? dayOfBirth,
  }) {
    return ProfileFormState(
      nameError: validateUserName(userName),
      dayOfBirthError: validateDayOfBirth(dayOfBirth),
    );
  }

  // void setProfile(ProfileModel draft){
  //   state = state.whenData(
  //     (current) => current.copyWith(
  //       userName: draft.userName,
  //       gender: draft.gender,
  //       dayOfBirth: draft.dayOfBirth,
  //       avatarUrl: draft.avatarUrl,
  //     )
  //   );
  // }
}
