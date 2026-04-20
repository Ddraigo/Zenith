// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shared_flashcard_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Resolve topicId thực tế từ selectedTopicId
/// - Nếu selectedTopicId > 0 → trả về nó
/// - Nếu selectedTopicId = 0 → lấy từ daily hoặc topic random

@ProviderFor(streakDay)
final streakDayProvider = StreakDayProvider._();

/// Resolve topicId thực tế từ selectedTopicId
/// - Nếu selectedTopicId > 0 → trả về nó
/// - Nếu selectedTopicId = 0 → lấy từ daily hoặc topic random

final class StreakDayProvider
    extends $FunctionalProvider<AsyncValue<int>, int, FutureOr<int>>
    with $FutureModifier<int>, $FutureProvider<int> {
  /// Resolve topicId thực tế từ selectedTopicId
  /// - Nếu selectedTopicId > 0 → trả về nó
  /// - Nếu selectedTopicId = 0 → lấy từ daily hoặc topic random
  StreakDayProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'streakDayProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$streakDayHash();

  @$internal
  @override
  $FutureProviderElement<int> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<int> create(Ref ref) {
    return streakDay(ref);
  }
}

String _$streakDayHash() => r'636e68c97875c8a4cf46a5875d394079c0796f85';

@ProviderFor(resolvedTopicId)
final resolvedTopicIdProvider = ResolvedTopicIdFamily._();

final class ResolvedTopicIdProvider
    extends $FunctionalProvider<AsyncValue<int>, int, FutureOr<int>>
    with $FutureModifier<int>, $FutureProvider<int> {
  ResolvedTopicIdProvider._({
    required ResolvedTopicIdFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'resolvedTopicIdProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$resolvedTopicIdHash();

  @override
  String toString() {
    return r'resolvedTopicIdProvider'
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
    return resolvedTopicId(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ResolvedTopicIdProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$resolvedTopicIdHash() => r'682788c2b084f7eaf89d4fd5be6a61a1eca592b4';

final class ResolvedTopicIdFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<int>, int> {
  ResolvedTopicIdFamily._()
    : super(
        retry: null,
        name: r'resolvedTopicIdProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ResolvedTopicIdProvider call(int selectedTopicId) =>
      ResolvedTopicIdProvider._(argument: selectedTopicId, from: this);

  @override
  String toString() => r'resolvedTopicIdProvider';
}

@ProviderFor(getTopicList)
final getTopicListProvider = GetTopicListProvider._();

final class GetTopicListProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<TopicModel>>,
          List<TopicModel>,
          FutureOr<List<TopicModel>>
        >
    with $FutureModifier<List<TopicModel>>, $FutureProvider<List<TopicModel>> {
  GetTopicListProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getTopicListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getTopicListHash();

  @$internal
  @override
  $FutureProviderElement<List<TopicModel>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<TopicModel>> create(Ref ref) {
    return getTopicList(ref);
  }
}

String _$getTopicListHash() => r'ee3bef9516f1bca86524996eba2823dc93233861';

@ProviderFor(getFlashcards)
final getFlashcardsProvider = GetFlashcardsFamily._();

final class GetFlashcardsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<FlashcardModel>>,
          List<FlashcardModel>,
          FutureOr<List<FlashcardModel>>
        >
    with
        $FutureModifier<List<FlashcardModel>>,
        $FutureProvider<List<FlashcardModel>> {
  GetFlashcardsProvider._({
    required GetFlashcardsFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'getFlashcardsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$getFlashcardsHash();

  @override
  String toString() {
    return r'getFlashcardsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<FlashcardModel>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<FlashcardModel>> create(Ref ref) {
    final argument = this.argument as int;
    return getFlashcards(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is GetFlashcardsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getFlashcardsHash() => r'de80bf1d34468653e4390d935cbbbb51fba8430e';

final class GetFlashcardsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<FlashcardModel>>, int> {
  GetFlashcardsFamily._()
    : super(
        retry: null,
        name: r'getFlashcardsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GetFlashcardsProvider call(int selectedTopicId) =>
      GetFlashcardsProvider._(argument: selectedTopicId, from: this);

  @override
  String toString() => r'getFlashcardsProvider';
}

@ProviderFor(getDailyTopicsGrouped)
final getDailyTopicsGroupedProvider = GetDailyTopicsGroupedFamily._();

final class GetDailyTopicsGroupedProvider
    extends
        $FunctionalProvider<
          AsyncValue<Map<DateTime, List<DailyWordSummaryModel>>>,
          Map<DateTime, List<DailyWordSummaryModel>>,
          FutureOr<Map<DateTime, List<DailyWordSummaryModel>>>
        >
    with
        $FutureModifier<Map<DateTime, List<DailyWordSummaryModel>>>,
        $FutureProvider<Map<DateTime, List<DailyWordSummaryModel>>> {
  GetDailyTopicsGroupedProvider._({
    required GetDailyTopicsGroupedFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'getDailyTopicsGroupedProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$getDailyTopicsGroupedHash();

  @override
  String toString() {
    return r'getDailyTopicsGroupedProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Map<DateTime, List<DailyWordSummaryModel>>>
  $createElement($ProviderPointer pointer) => $FutureProviderElement(pointer);

  @override
  FutureOr<Map<DateTime, List<DailyWordSummaryModel>>> create(Ref ref) {
    final argument = this.argument as int;
    return getDailyTopicsGrouped(ref, dayRange: argument);
  }

  @override
  bool operator ==(Object other) {
    return other is GetDailyTopicsGroupedProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getDailyTopicsGroupedHash() =>
    r'9ee98ca8fb3a86ab60fd13bc1a5d03c50f409eee';

final class GetDailyTopicsGroupedFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<Map<DateTime, List<DailyWordSummaryModel>>>,
          int
        > {
  GetDailyTopicsGroupedFamily._()
    : super(
        retry: null,
        name: r'getDailyTopicsGroupedProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GetDailyTopicsGroupedProvider call({required int dayRange}) =>
      GetDailyTopicsGroupedProvider._(argument: dayRange, from: this);

  @override
  String toString() => r'getDailyTopicsGroupedProvider';
}

@ProviderFor(getDailyAllTopicsGrouped)
final getDailyAllTopicsGroupedProvider = GetDailyAllTopicsGroupedProvider._();

final class GetDailyAllTopicsGroupedProvider
    extends
        $FunctionalProvider<
          AsyncValue<Map<DateTime, List<DailyWordSummaryModel>>>,
          Map<DateTime, List<DailyWordSummaryModel>>,
          FutureOr<Map<DateTime, List<DailyWordSummaryModel>>>
        >
    with
        $FutureModifier<Map<DateTime, List<DailyWordSummaryModel>>>,
        $FutureProvider<Map<DateTime, List<DailyWordSummaryModel>>> {
  GetDailyAllTopicsGroupedProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getDailyAllTopicsGroupedProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getDailyAllTopicsGroupedHash();

  @$internal
  @override
  $FutureProviderElement<Map<DateTime, List<DailyWordSummaryModel>>>
  $createElement($ProviderPointer pointer) => $FutureProviderElement(pointer);

  @override
  FutureOr<Map<DateTime, List<DailyWordSummaryModel>>> create(Ref ref) {
    return getDailyAllTopicsGrouped(ref);
  }
}

String _$getDailyAllTopicsGroupedHash() =>
    r'ca37817c61a544749298b6dcdcf9b5df60324732';

@ProviderFor(formatDailyDate)
final formatDailyDateProvider = FormatDailyDateFamily._();

final class FormatDailyDateProvider
    extends $FunctionalProvider<String, String, String>
    with $Provider<String> {
  FormatDailyDateProvider._({
    required FormatDailyDateFamily super.from,
    required DateTime super.argument,
  }) : super(
         retry: null,
         name: r'formatDailyDateProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$formatDailyDateHash();

  @override
  String toString() {
    return r'formatDailyDateProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<String> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  String create(Ref ref) {
    final argument = this.argument as DateTime;
    return formatDailyDate(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is FormatDailyDateProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$formatDailyDateHash() => r'78db5831906faa0a47fee0a388839915a7fc0dfa';

final class FormatDailyDateFamily extends $Family
    with $FunctionalFamilyOverride<String, DateTime> {
  FormatDailyDateFamily._()
    : super(
        retry: null,
        name: r'formatDailyDateProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FormatDailyDateProvider call(DateTime date) =>
      FormatDailyDateProvider._(argument: date, from: this);

  @override
  String toString() => r'formatDailyDateProvider';
}
