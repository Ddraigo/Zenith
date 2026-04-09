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

@ProviderFor(resolvedTopicId)
final resolvedTopicIdProvider = ResolvedTopicIdFamily._();

/// Resolve topicId thực tế từ selectedTopicId
/// - Nếu selectedTopicId > 0 → trả về nó
/// - Nếu selectedTopicId = 0 → lấy từ daily hoặc topic random

final class ResolvedTopicIdProvider
    extends $FunctionalProvider<AsyncValue<int>, int, FutureOr<int>>
    with $FutureModifier<int>, $FutureProvider<int> {
  /// Resolve topicId thực tế từ selectedTopicId
  /// - Nếu selectedTopicId > 0 → trả về nó
  /// - Nếu selectedTopicId = 0 → lấy từ daily hoặc topic random
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

String _$resolvedTopicIdHash() => r'6e66f26880413a4c152e457a2dad35f833904821';

/// Resolve topicId thực tế từ selectedTopicId
/// - Nếu selectedTopicId > 0 → trả về nó
/// - Nếu selectedTopicId = 0 → lấy từ daily hoặc topic random

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

  /// Resolve topicId thực tế từ selectedTopicId
  /// - Nếu selectedTopicId > 0 → trả về nó
  /// - Nếu selectedTopicId = 0 → lấy từ daily hoặc topic random

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

/// Lấy flashcards đã xử lý logic hôm nay/tất cả
/// - Nếu isDailyMode=true + selectedDate!=null → lấy daily flashcards của date + topic
/// - Nếu isDailyMode=false → lấy tất cả flashcards của topic

@ProviderFor(getFlashcards)
final getFlashcardsProvider = GetFlashcardsFamily._();

/// Lấy flashcards đã xử lý logic hôm nay/tất cả
/// - Nếu isDailyMode=true + selectedDate!=null → lấy daily flashcards của date + topic
/// - Nếu isDailyMode=false → lấy tất cả flashcards của topic

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
  /// Lấy flashcards đã xử lý logic hôm nay/tất cả
  /// - Nếu isDailyMode=true + selectedDate!=null → lấy daily flashcards của date + topic
  /// - Nếu isDailyMode=false → lấy tất cả flashcards của topic
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

/// Lấy flashcards đã xử lý logic hôm nay/tất cả
/// - Nếu isDailyMode=true + selectedDate!=null → lấy daily flashcards của date + topic
/// - Nếu isDailyMode=false → lấy tất cả flashcards của topic

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

  /// Lấy flashcards đã xử lý logic hôm nay/tất cả
  /// - Nếu isDailyMode=true + selectedDate!=null → lấy daily flashcards của date + topic
  /// - Nếu isDailyMode=false → lấy tất cả flashcards của topic

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

String _$formatDailyDateHash() => r'76717ab175d65e27827836ec6f1aa945b3cec956';

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
