import 'package:flutter_sound/flutter_sound.dart';

class PlayerViewModel {
  late FlutterSoundPlayer _player;
  bool _isPlaying = false;

  PlayerViewModel() {
    _player = FlutterSoundPlayer();
    _initializePlayer();
  }

  Future<void> _initializePlayer() async {
    await _player.openPlayer();
  }

  Future<void> startPlaying(String filePath) async {
    await _player.startPlayer(
      fromURI: filePath,
      codec: Codec.aacADTS,
    );
    _isPlaying = true;
  }

  Future<void> stopPlaying() async {
    await _player.stopPlayer();
    _isPlaying = false;
  }

  bool get isPlaying => _isPlaying;

  void dispose() {
    _player.closePlayer();
  }
}