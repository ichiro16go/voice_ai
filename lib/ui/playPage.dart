import 'package:flutter/material.dart';
import '../view_models/playAudio.dart';

class PlayerPage extends StatefulWidget {
  @override
  _PlayerPageState createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  late PlayerViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = PlayerViewModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('再生アプリ'),
      ),
       body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () async {
                  if (_viewModel.isPlaying) {
                    await _viewModel.stopPlaying();
                  } else {
                    await _viewModel.startPlaying('audio.aac');
                  }
                  setState(() {}); // 状態が変わったらUIを更新
                },
                child: Text(_viewModel.isPlaying ? '再生停止' : '再生開始'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}