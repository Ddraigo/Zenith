// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_word_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DailyWordNotifier)
final dailyWordProvider = DailyWordNotifierFamily._();

final class DailyWordNotifierProvider
    extends
        $AsyncNotifierProvider<DailyWordNotifier, List<UserDailyWordModel>> {
  DailyWordNotifierProvider._({
    required DailyWordNotifierFamily super.from,
    required DateTime super.argument,
  }) : super(
         retry: null,
         name: r'dailyWordProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$dailyWordNotifierHash();

  @override
  String toString() {
    return r'dailyWordProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  DailyWordNotifier create() => DailyWordNotifier();

  @override
  bool operator ==(Object other) {
    return other is DailyWordNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$dailyWordNotifierHash() => r'8bda334ff306ee016df537e2876d486af7bdc801';

final class DailyWordNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          DailyWordNotifier,
          AsyncValue<List<UserDailyWordModel>>,
          List<UserDailyWordModel>,
          FutureOr<List<UserDailyWordModel>>,
          DateTime
        > {
  DailyWordNotifierFamily._()
    : super(
        retry: null,
        name: r'dailyWordProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  DailyWordNotifierProvider call(DateTime assignedDate) =>
      DailyWordNotifierProvider._(argument: assignedDate, from: this);

  @override
  String toString() => r'dailyWordProvider';
}

abstract class _$DailyWordNotifier
    extends $AsyncNotifier<List<UserDailyWordModel>> {
  late final _$args = ref.$arg as DateTime;
  DateTime get assignedDate => _$args;

  FutureOr<List<UserDailyWordModel>> build(DateTime assignedDate);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<List<UserDailyWordModel>>,
              List<UserDailyWordModel>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<UserDailyWordModel>>,
                List<UserDailyWordModel>
              >,
              AsyncValue<List<UserDailyWordModel>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
