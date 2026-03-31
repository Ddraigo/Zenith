// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flashcard_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(FlashcardNotifier)
final flashcardProvider = FlashcardNotifierFamily._();

final class FlashcardNotifierProvider
    extends $AsyncNotifierProvider<FlashcardNotifier, List<FlashcardModel>> {
  FlashcardNotifierProvider._({
    required FlashcardNotifierFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'flashcardProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$flashcardNotifierHash();

  @override
  String toString() {
    return r'flashcardProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  FlashcardNotifier create() => FlashcardNotifier();

  @override
  bool operator ==(Object other) {
    return other is FlashcardNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$flashcardNotifierHash() => r'90abcac396fe644fa8b02f801f0e543529e09d29';

final class FlashcardNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          FlashcardNotifier,
          AsyncValue<List<FlashcardModel>>,
          List<FlashcardModel>,
          FutureOr<List<FlashcardModel>>,
          int
        > {
  FlashcardNotifierFamily._()
    : super(
        retry: null,
        name: r'flashcardProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FlashcardNotifierProvider call(int topicId) =>
      FlashcardNotifierProvider._(argument: topicId, from: this);

  @override
  String toString() => r'flashcardProvider';
}

abstract class _$FlashcardNotifier
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
