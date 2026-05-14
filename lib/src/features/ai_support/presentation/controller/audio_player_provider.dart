import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';

class AudioPlayerController {
  final AudioPlayer _player = AudioPlayer();
  Future<void> _serial = Future.value();
  String? _lastUrl;

  Future<void> playUrl(String url) {
    if (url.isEmpty) return Future.value();
    _serial = _serial.then((_) async {
      try {
        if (_lastUrl == url && _player.processingState != ProcessingState.idle) {
          await _player.seek(Duration.zero);
          await _player.play();
          return;
        }
        await _player.stop();
        await _player.setUrl(url);
        await _player.play();
        _lastUrl = url;
      } on PlayerInterruptedException {
        //
      }
    });
    return _serial;
  }

  void dispose() => _player.dispose();
}

final audioPlayerControllerProvider =
    Provider.autoDispose<AudioPlayerController>((ref) {
  final controller = AudioPlayerController();

  ref.onDispose(controller.dispose);

  return controller;
});
