// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topic_flashcard_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Presentation Layer - State Management (Notifier)
/// Quản lý flashcards theo topicId

@ProviderFor(TopicFLashcardNotifier)
final topicFLashcardProvider = TopicFLashcardNotifierFamily._();

/// Presentation Layer - State Management (Notifier)
/// Quản lý flashcards theo topicId
final class TopicFLashcardNotifierProvider
    extends
        $AsyncNotifierProvider<TopicFLashcardNotifier, List<FlashcardModel>> {
  /// Presentation Layer - State Management (Notifier)
  /// Quản lý flashcards theo topicId
  TopicFLashcardNotifierProvider._({
    required TopicFLashcardNotifierFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'topicFLashcardProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$topicFLashcardNotifierHash();

  @override
  String toString() {
    return r'topicFLashcardProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  TopicFLashcardNotifier create() => TopicFLashcardNotifier();

  @override
  bool operator ==(Object other) {
    return other is TopicFLashcardNotifierProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$topicFLashcardNotifierHash() =>
    r'6af115d93b4a6e9349a0988071ba0af23aa8df1c';

/// Presentation Layer - State Management (Notifier)
/// Quản lý flashcards theo topicId

final class TopicFLashcardNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          TopicFLashcardNotifier,
          AsyncValue<List<FlashcardModel>>,
          List<FlashcardModel>,
          FutureOr<List<FlashcardModel>>,
          int
        > {
  TopicFLashcardNotifierFamily._()
    : super(
        retry: null,
        name: r'topicFLashcardProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Presentation Layer - State Management (Notifier)
  /// Quản lý flashcards theo topicId

  TopicFLashcardNotifierProvider call(int topicId) =>
      TopicFLashcardNotifierProvider._(argument: topicId, from: this);

  @override
  String toString() => r'topicFLashcardProvider';
}

/// Presentation Layer - State Management (Notifier)
/// Quản lý flashcards theo topicId

abstract class _$TopicFLashcardNotifier
    extends $AsyncNotifier<List<FlashcardModel>> {
  late final _$args = ref.$arg as int;
  int get topicId => _$args;

  FutureOr<List<FlashcardModel>> build(int topicId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<AsyncValue<List<FlashcardModel>>, List<FlashcardModel>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<FlashcardModel>>,
                List<FlashcardModel>
              >,
              AsyncValue<List<FlashcardModel>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}

@ProviderFor(getFlashcardCountByTopic)
final getFlashcardCountByTopicProvider = GetFlashcardCountByTopicFamily._();

final class GetFlashcardCountByTopicProvider
    extends $FunctionalProvider<AsyncValue<int>, int, FutureOr<int>>
    with $FutureModifier<int>, $FutureProvider<int> {
  GetFlashcardCountByTopicProvider._({
    required GetFlashcardCountByTopicFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'getFlashcardCountByTopicProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$getFlashcardCountByTopicHash();

  @override
  String toString() {
    return r'getFlashcardCountByTopicProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<int> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<int> create(Ref ref) {
    final argument = this.argument as int;
    return getFlashcardCountByTopic(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is GetFlashcardCountByTopicProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getFlashcardCountByTopicHash() =>
    r'c97954ba0c8a9812ae4b54a5a38ea0d385ff94e5';

final class GetFlashcardCountByTopicFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<int>, int> {
  GetFlashcardCountByTopicFamily._()
    : super(
        retry: null,
        name: r'getFlashcardCountByTopicProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GetFlashcardCountByTopicProvider call(int topicId) =>
      GetFlashcardCountByTopicProvider._(argument: topicId, from: this);

  @override
  String toString() => r'getFlashcardCountByTopicProvider';
}
