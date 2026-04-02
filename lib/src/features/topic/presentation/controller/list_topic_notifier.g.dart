// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_topic_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Presentation Layer - State Management (Notifier)
/// Nhiệm vụ:
/// - Gọi Service (business logic)
/// - Convert Future/Either → AsyncValue (tự động)
/// - Handle refresh/mutations

@ProviderFor(ListTopicNotifier)
final listTopicProvider = ListTopicNotifierProvider._();

/// Presentation Layer - State Management (Notifier)
/// Nhiệm vụ:
/// - Gọi Service (business logic)
/// - Convert Future/Either → AsyncValue (tự động)
/// - Handle refresh/mutations
final class ListTopicNotifierProvider
    extends $AsyncNotifierProvider<ListTopicNotifier, List<TopicModel>> {
  /// Presentation Layer - State Management (Notifier)
  /// Nhiệm vụ:
  /// - Gọi Service (business logic)
  /// - Convert Future/Either → AsyncValue (tự động)
  /// - Handle refresh/mutations
  ListTopicNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'listTopicProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$listTopicNotifierHash();

  @$internal
  @override
  ListTopicNotifier create() => ListTopicNotifier();
}

String _$listTopicNotifierHash() => r'86f06779c7b14935260e0a31afee97ead6034993';

/// Presentation Layer - State Management (Notifier)
/// Nhiệm vụ:
/// - Gọi Service (business logic)
/// - Convert Future/Either → AsyncValue (tự động)
/// - Handle refresh/mutations

abstract class _$ListTopicNotifier extends $AsyncNotifier<List<TopicModel>> {
  FutureOr<List<TopicModel>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<TopicModel>>, List<TopicModel>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<TopicModel>>, List<TopicModel>>,
              AsyncValue<List<TopicModel>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
