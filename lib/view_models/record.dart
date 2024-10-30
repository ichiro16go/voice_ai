import 'package:flutter_sound/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';

class RecorderViewModel {
  late FlutterSoundRecorder _recorder;
  bool _isRecording = false;
  String _recordingTime = "00:00:00";

  RecorderViewModel() {
    _recorder = FlutterSoundRecorder();
    _initializeRecorder();
  }

  Future<void> _initializeRecorder() async {
    await Permission.microphone.request();
    await _recorder.openRecorder();
  }

  Future<void> startRecording() async {
    await _recorder.startRecorder(
      toFile: 'audio.aac',
      codec: Codec.aacMP4,
    );
    _isRecording = true;
    print(_isRecording);
  }

  Future<void> stopRecording() async {
    await _recorder.stopRecorder();
    _isRecording = false;
    print(_isRecording);
  }

  Future<void> pauseRecording() async {
    await _recorder.pauseRecorder();
  }

  bool get isRecording => _isRecording;
  String get recordingTime => _recordingTime;

  void dispose() {
    _recorder.closeRecorder();
  }
}
