// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flashcard_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Presentation Layer - State Management (Notifier)
/// Quản lý flashcards theo topicId và assignedDate

@ProviderFor(FlashcardNotifier)
final flashcardProvider = FlashcardNotifierFamily._();

/// Presentation Layer - State Management (Notifier)
/// Quản lý flashcards theo topicId và assignedDate
final class FlashcardNotifierProvider
    extends $AsyncNotifierProvider<FlashcardNotifier, List<FlashcardModel>> {
  /// Presentation Layer - State Management (Notifier)
  /// Quản lý flashcards theo topicId và assignedDate
  FlashcardNotifierProvider._({
    required FlashcardNotifierFamily super.from,
    required (int, {DateTime? assignedDate}) super.argument,
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
        '$argument';
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

String _$flashcardNotifierHash() => r'8ecb416cc61c3cfafb7a1d622f06fa0aa7ded5d1';

/// Presentation Layer - State Management (Notifier)
/// Quản lý flashcards theo topicId và assignedDate

final class FlashcardNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          FlashcardNotifier,
          AsyncValue<List<FlashcardModel>>,
          List<FlashcardModel>,
          FutureOr<List<FlashcardModel>>,
          (int, {DateTime? assignedDate})
        > {
  FlashcardNotifierFamily._()
    : super(
        retry: null,
        name: r'flashcardProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Presentation Layer - State Management (Notifier)
  /// Quản lý flashcards theo topicId và assignedDate

  FlashcardNotifierProvider call(int topicId, {DateTime? assignedDate}) =>
      FlashcardNotifierProvider._(
        argument: (topicId, assignedDate: assignedDate),
        from: this,
      );

  @override
  String toString() => r'flashcardProvider';
}

/// Presentation Layer - State Management (Notifier)
/// Quản lý flashcards theo topicId và assignedDate

abstract class _$FlashcardNotifier
    extends $AsyncNotifier<List<FlashcardModel>> {
  late final _$args = ref.$arg as (int, {DateTime? assignedDate});
  int get topicId => _$args.$1;
  DateTime? get assignedDate => _$args.assignedDate;

  FutureOr<List<FlashcardModel>> build(int topicId, {DateTime? assignedDate});
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
    element.handleCreate(
      ref,
      () => build(_$args.$1, assignedDate: _$args.assignedDate),
    );
  }
}
