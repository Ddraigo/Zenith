// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statistics_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(StatisticsNotifier)
final statisticsProvider = StatisticsNotifierProvider._();

final class StatisticsNotifierProvider
    extends $AsyncNotifierProvider<StatisticsNotifier, StatisticsViewData> {
  StatisticsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'statisticsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$statisticsNotifierHash();

  @$internal
  @override
  StatisticsNotifier create() => StatisticsNotifier();
}

String _$statisticsNotifierHash() =>
    r'01507e9c65c6ab2909d05cd1d775552f41940aa5';

abstract class _$StatisticsNotifier extends $AsyncNotifier<StatisticsViewData> {
  FutureOr<StatisticsViewData> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<StatisticsViewData>, StatisticsViewData>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<StatisticsViewData>, StatisticsViewData>,
              AsyncValue<StatisticsViewData>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
