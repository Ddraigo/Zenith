import 'package:app_demo/src/features/topic/data/topic_dto.dart';
import 'package:app_demo/src/shared/http/app_exception.dart';
import 'package:app_demo/src/shared/http/supabase_provider.dart';
import 'package:dart_either/dart_either.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final topicSourceProvider = Provider<TopicSource>((ref) {
  final client = ref.read(supabaseClientProvider);
  return TopicSource(client);
});

class TopicSource {
  final SupabaseClient _client;
  TopicSource(this._client);

  Future<Either<AppException, List<TopicDTO>>> fetchTopics() {
    return Either.catchFutureError(
      (error, stackTrace) => SupabaseErrorHandle.handle(error),
      () async {
        final data = await _client
            .from('topics')
            .select('*')
            .order('id', ascending: true);
        final topics = (data as List<dynamic>)
            .map((e) => TopicDTO.fromJson(e as Map<String, dynamic>))
            .toList();
        return topics;
      },
    );
  }

  Future<Either<AppException, TopicDTO>> fetchTopicById({required int id}) {
    return Either.catchFutureError(
      (error, stackTrace) => SupabaseErrorHandle.handle(error),
      () async {
        final data = await _client
            .from('topics')
            .select('*')
            .eq('id', id)
            .single();
        return TopicDTO.fromJson(data);
      },
    );
  }
}
