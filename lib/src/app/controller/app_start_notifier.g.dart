// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_start_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AppStartNotifier)
final appStartProvider = AppStartNotifierProvider._();

final class AppStartNotifierProvider
    extends $AsyncNotifierProvider<AppStartNotifier, AppStartState> {
  AppStartNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appStartProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appStartNotifierHash();

  @$internal
  @override
  AppStartNotifier create() => AppStartNotifier();
}

String _$appStartNotifierHash() => r'98e5c6c19aaed5b5dc776b1ad4e33af1d82eb107';

abstract class _$AppStartNotifier extends $AsyncNotifier<AppStartState> {
  FutureOr<AppStartState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<AppStartState>, AppStartState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<AppStartState>, AppStartState>,
              AsyncValue<AppStartState>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
