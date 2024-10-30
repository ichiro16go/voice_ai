import 'package:flutter/material.dart';
import '../view_models/record.dart';
import 'dart:async';

class RecordPage extends StatefulWidget {
  @override
  _RecordPageState createState() => _RecordPageState();
}

class _RecordPageState extends State<RecordPage> {
  late RecorderViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = RecorderViewModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('録音時間: ${_viewModel.recordingTime}'),
        ElevatedButton(
          onPressed: () async {
            if (_viewModel.isRecording) {
              await _viewModel.stopRecording();
            } else {
              await _viewModel.startRecording();
            }
            setState(() {}); // 状態が変わった後にUIを更新
          },
          child: Text(_viewModel.isRecording ? '録音終了' : '録音開始'),
        ),
        ElevatedButton(
          onPressed: _viewModel.pauseRecording,
          child: const Text('一時停止'),
        ),
      ],
    )));
  }
}
