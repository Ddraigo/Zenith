// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flashcard_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Presentation Layer - State Management (Notifier)
/// Quản lý flashcards theo topicId

@ProviderFor(FlashcardNotifier)
final flashcardProvider = FlashcardNotifierProvider._();

/// Presentation Layer - State Management (Notifier)
/// Quản lý flashcards theo topicId
final class FlashcardNotifierProvider
    extends $AsyncNotifierProvider<FlashcardNotifier, List<FlashcardModel>> {
  /// Presentation Layer - State Management (Notifier)
  /// Quản lý flashcards theo topicId
  FlashcardNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'flashcardProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$flashcardNotifierHash();

  @$internal
  @override
  FlashcardNotifier create() => FlashcardNotifier();
}

String _$flashcardNotifierHash() => r'e38aeb127e7d31350613077de5b019ff342f4425';

/// Presentation Layer - State Management (Notifier)
/// Quản lý flashcards theo topicId

abstract class _$FlashcardNotifier
    extends $AsyncNotifier<List<FlashcardModel>> {
  FutureOr<List<FlashcardModel>> build();
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
    element.handleCreate(ref, build);
  }
}
