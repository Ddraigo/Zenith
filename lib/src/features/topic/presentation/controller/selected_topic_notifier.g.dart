// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selected_topic_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SelectedTopicNotifier)
final selectedTopicProvider = SelectedTopicNotifierProvider._();

final class SelectedTopicNotifierProvider
    extends $NotifierProvider<SelectedTopicNotifier, int?> {
  SelectedTopicNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectedTopicProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectedTopicNotifierHash();

  @$internal
  @override
  SelectedTopicNotifier create() => SelectedTopicNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int?>(value),
    );
  }
}

String _$selectedTopicNotifierHash() =>
    r'f1d490436a5f549d7109ac8d7baacb7fdbc8be15';

abstract class _$SelectedTopicNotifier extends $Notifier<int?> {
  int? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<int?, int?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int?, int?>,
              int?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
