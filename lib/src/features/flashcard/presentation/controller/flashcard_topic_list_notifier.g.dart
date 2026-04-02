// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flashcard_topic_list_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(FlashcardTopicListNotifier)
final flashcardTopicListProvider = FlashcardTopicListNotifierProvider._();

final class FlashcardTopicListNotifierProvider
    extends
        $AsyncNotifierProvider<FlashcardTopicListNotifier, List<TopicModel>> {
  FlashcardTopicListNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'flashcardTopicListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$flashcardTopicListNotifierHash();

  @$internal
  @override
  FlashcardTopicListNotifier create() => FlashcardTopicListNotifier();
}

String _$flashcardTopicListNotifierHash() =>
    r'57fedbaafeb3326fa4e69568f9553bd9454163d1';

abstract class _$FlashcardTopicListNotifier
    extends $AsyncNotifier<List<TopicModel>> {
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
