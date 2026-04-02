// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word_list_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Presentation Layer - State Management (Notifier)
/// Quản lý flashcards theo topicId

@ProviderFor(WordListNotifier)
final wordListProvider = WordListNotifierFamily._();

/// Presentation Layer - State Management (Notifier)
/// Quản lý flashcards theo topicId
final class WordListNotifierProvider
    extends $AsyncNotifierProvider<WordListNotifier, List<FlashcardModel>> {
  /// Presentation Layer - State Management (Notifier)
  /// Quản lý flashcards theo topicId
  WordListNotifierProvider._({
    required WordListNotifierFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'wordListProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$wordListNotifierHash();

  @override
  String toString() {
    return r'wordListProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  WordListNotifier create() => WordListNotifier();

  @override
  bool operator ==(Object other) {
    return other is WordListNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$wordListNotifierHash() => r'9fcc21c7ce7b5c7a44281476d36168918beea446';

/// Presentation Layer - State Management (Notifier)
/// Quản lý flashcards theo topicId

final class WordListNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          WordListNotifier,
          AsyncValue<List<FlashcardModel>>,
          List<FlashcardModel>,
          FutureOr<List<FlashcardModel>>,
          int
        > {
  WordListNotifierFamily._()
    : super(
        retry: null,
        name: r'wordListProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Presentation Layer - State Management (Notifier)
  /// Quản lý flashcards theo topicId

  WordListNotifierProvider call(int topicId) =>
      WordListNotifierProvider._(argument: topicId, from: this);

  @override
  String toString() => r'wordListProvider';
}

/// Presentation Layer - State Management (Notifier)
/// Quản lý flashcards theo topicId

abstract class _$WordListNotifier extends $AsyncNotifier<List<FlashcardModel>> {
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
