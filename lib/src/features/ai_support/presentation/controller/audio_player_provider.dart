import 'package:flutter_riverpod/legacy.dart';
import 'package:just_audio/just_audio.dart';

final audioPlayerProvider = StateProvider.autoDispose<AudioPlayer>((ref) {
  final player = AudioPlayer();
  
  ref.onDispose(() {
    player.dispose();
  });
  
  return player;
});
