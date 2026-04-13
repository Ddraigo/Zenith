// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_result_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(QuizResultNotifier)
final quizResultProvider = QuizResultNotifierFamily._();

final class QuizResultNotifierProvider
    extends
        $AsyncNotifierProvider<
          QuizResultNotifier,
          List<QuizAttemptItemsModel>
        > {
  QuizResultNotifierProvider._({
    required QuizResultNotifierFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'quizResultProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$quizResultNotifierHash();

  @override
  String toString() {
    return r'quizResultProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  QuizResultNotifier create() => QuizResultNotifier();

  @override
  bool operator ==(Object other) {
    return other is QuizResultNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$quizResultNotifierHash() =>
    r'd095e0076ed25155781c1922d4980ffef8c0e35d';

final class QuizResultNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          QuizResultNotifier,
          AsyncValue<List<QuizAttemptItemsModel>>,
          List<QuizAttemptItemsModel>,
          FutureOr<List<QuizAttemptItemsModel>>,
          String
        > {
  QuizResultNotifierFamily._()
    : super(
        retry: null,
        name: r'quizResultProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  QuizResultNotifierProvider call({required String quizAttempId}) =>
      QuizResultNotifierProvider._(argument: quizAttempId, from: this);

  @override
  String toString() => r'quizResultProvider';
}

abstract class _$QuizResultNotifier
    extends $AsyncNotifier<List<QuizAttemptItemsModel>> {
  late final _$args = ref.$arg as String;
  String get quizAttempId => _$args;

  FutureOr<List<QuizAttemptItemsModel>> build({required String quizAttempId});
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<List<QuizAttemptItemsModel>>,
              List<QuizAttemptItemsModel>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<QuizAttemptItemsModel>>,
                List<QuizAttemptItemsModel>
              >,
              AsyncValue<List<QuizAttemptItemsModel>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(quizAttempId: _$args));
  }
}
