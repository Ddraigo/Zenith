// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ProfileNotifier)
final profileProvider = ProfileNotifierProvider._();

final class ProfileNotifierProvider
    extends $AsyncNotifierProvider<ProfileNotifier, ProfileModel> {
  ProfileNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'profileProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$profileNotifierHash();

  @$internal
  @override
  ProfileNotifier create() => ProfileNotifier();
}

String _$profileNotifierHash() => r'b1bab4188bd4c36d59750ff50de964b90fe8307f';

abstract class _$ProfileNotifier extends $AsyncNotifier<ProfileModel> {
  FutureOr<ProfileModel> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<ProfileModel>, ProfileModel>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<ProfileModel>, ProfileModel>,
              AsyncValue<ProfileModel>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
