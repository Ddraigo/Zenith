// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SettingNotifier)
final settingProvider = SettingNotifierProvider._();

final class SettingNotifierProvider
    extends $AsyncNotifierProvider<SettingNotifier, void> {
  SettingNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'settingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$settingNotifierHash();

  @$internal
  @override
  SettingNotifier create() => SettingNotifier();
}

String _$settingNotifierHash() => r'8ffd91c55d72645fe9b2c250d5021512f49cae2a';

abstract class _$SettingNotifier extends $AsyncNotifier<void> {
  FutureOr<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<void>, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, void>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
