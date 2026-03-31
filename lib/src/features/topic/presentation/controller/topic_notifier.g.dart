// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topic_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TopicNotifier)
final topicProvider = TopicNotifierProvider._();

final class TopicNotifierProvider
    extends $AsyncNotifierProvider<TopicNotifier, List<TopicModel>> {
  TopicNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'topicProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$topicNotifierHash();

  @$internal
  @override
  TopicNotifier create() => TopicNotifier();
}

String _$topicNotifierHash() => r'6b7de0f6d9cfd69ecdab19df13a38b50e14621ff';

abstract class _$TopicNotifier extends $AsyncNotifier<List<TopicModel>> {
  FutureOr<List<TopicModel>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<TopicModel>>, List<TopicModel>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<TopicModel>>, List<TopicModel>>,
              AsyncValue<List<TopicModel>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
