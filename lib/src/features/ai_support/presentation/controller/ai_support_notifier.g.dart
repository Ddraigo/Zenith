// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_support_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AISupportNotifier)
final aISupportProvider = AISupportNotifierFamily._();

final class AISupportNotifierProvider
    extends $AsyncNotifierProvider<AISupportNotifier, AISupportResultModel> {
  AISupportNotifierProvider._({
    required AISupportNotifierFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'aISupportProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$aISupportNotifierHash();

  @override
  String toString() {
    return r'aISupportProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  AISupportNotifier create() => AISupportNotifier();

  @override
  bool operator ==(Object other) {
    return other is AISupportNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$aISupportNotifierHash() => r'3adca063a557ae8758cff302934680abed1d318f';

final class AISupportNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          AISupportNotifier,
          AsyncValue<AISupportResultModel>,
          AISupportResultModel,
          FutureOr<AISupportResultModel>,
          String
        > {
  AISupportNotifierFamily._()
    : super(
        retry: null,
        name: r'aISupportProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  AISupportNotifierProvider call(String flashcardId) =>
      AISupportNotifierProvider._(argument: flashcardId, from: this);

  @override
  String toString() => r'aISupportProvider';
}

abstract class _$AISupportNotifier
    extends $AsyncNotifier<AISupportResultModel> {
  late final _$args = ref.$arg as String;
  String get flashcardId => _$args;

  FutureOr<AISupportResultModel> build(String flashcardId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<AsyncValue<AISupportResultModel>, AISupportResultModel>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<AISupportResultModel>,
                AISupportResultModel
              >,
              AsyncValue<AISupportResultModel>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
