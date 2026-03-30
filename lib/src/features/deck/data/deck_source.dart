import 'package:app_demo/src/features/deck/data/deck_dto.dart';
import 'package:app_demo/src/shared/http/supabase_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final deckSourceProvider = Provider<DeckSource>((ref){
  final source = ref.read(supabaseClientProvider);
  return DeckSource(source);
});

class DeckSource {

  final SupabaseClient _source;
  DeckSource(this._source);

  Future<void> creatDeck({
    required DeckDTO deck,
  }) async{
    try {
      final data = await _source
      .from('decks')
      .insert({
        'id': deck.id,
        'name': deck.name,
        'learning_type_id': deck.learningTypeId,
        'topic_id': deck.topicId,
        'level_id': deck.level,
        'description': deck.description,
        'cover_image_url': deck.imageUrl,
        'created_by': deck.createdBy,
        'is_system': deck.isSystem,
        'is_public':deck.isPublic,
        'is_active': deck.isActive,
        'created_at': deck.createdAt,
        'updated_at': deck.updatedAt,
      });
      
      if(data == null){

      }
      
    } catch (e) {
      throw SupabaseErrorHandle.handle(e);
    }
  }
}