// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(QuizSessionNotifier)
final quizSessionProvider = QuizSessionNotifierFamily._();

final class QuizSessionNotifierProvider
    extends $AsyncNotifierProvider<QuizSessionNotifier, QuestionModel> {
  QuizSessionNotifierProvider._({
    required QuizSessionNotifierFamily super.from,
    required (QuizAttemptType, int, DateTime?) super.argument,
  }) : super(
         retry: null,
         name: r'quizSessionProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$quizSessionNotifierHash();

  @override
  String toString() {
    return r'quizSessionProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  QuizSessionNotifier create() => QuizSessionNotifier();

  @override
  bool operator ==(Object other) {
    return other is QuizSessionNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$quizSessionNotifierHash() =>
    r'992b984c8e637b10711afc7de342858436f8bdaf';

final class QuizSessionNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          QuizSessionNotifier,
          AsyncValue<QuestionModel>,
          QuestionModel,
          FutureOr<QuestionModel>,
          (QuizAttemptType, int, DateTime?)
        > {
  QuizSessionNotifierFamily._()
    : super(
        retry: null,
        name: r'quizSessionProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  QuizSessionNotifierProvider call(
    QuizAttemptType type,
    int topicId,
    DateTime? assignedDate,
  ) => QuizSessionNotifierProvider._(
    argument: (type, topicId, assignedDate),
    from: this,
  );

  @override
  String toString() => r'quizSessionProvider';
}

abstract class _$QuizSessionNotifier extends $AsyncNotifier<QuestionModel> {
  late final _$args = ref.$arg as (QuizAttemptType, int, DateTime?);
  QuizAttemptType get type => _$args.$1;
  int get topicId => _$args.$2;
  DateTime? get assignedDate => _$args.$3;

  FutureOr<QuestionModel> build(
    QuizAttemptType type,
    int topicId,
    DateTime? assignedDate,
  );
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<QuestionModel>, QuestionModel>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<QuestionModel>, QuestionModel>,
              AsyncValue<QuestionModel>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args.$1, _$args.$2, _$args.$3));
  }
}
