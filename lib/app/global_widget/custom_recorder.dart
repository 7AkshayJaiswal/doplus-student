import 'dart:async';
import 'dart:io' as io;
import 'package:file/local.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:another_audio_recorder/another_audio_recorder.dart';
import 'package:student/app/helper/asset_helper.dart';
import 'package:student/app/helper/button_helper.dart';
import 'package:student/app/helper/color_helper.dart';
import 'package:lottie/lottie.dart';
import 'package:path_provider/path_provider.dart';

class CustomRecorder extends StatefulWidget {
  final Function(Recording recording) onRecordDone;

  const CustomRecorder({
    super.key,
    required this.onRecordDone,
  });

  @override
  State<CustomRecorder> createState() => _CustomRecorderState();
}

class _CustomRecorderState extends State<CustomRecorder> {
  AnotherAudioRecorder? _recorder;
  Recording? _current;
  Recording? savedRecording;
  RecordingStatus _currentStatus = RecordingStatus.Unset;
  bool startRec = false;

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (_currentStatus == RecordingStatus.Initialized)
          IconButton.outlined(
            style: ButtonHelper.iconButtonModernStyle,
            onPressed: _start,
            icon: Icon(
              Icons.mic,
              color: ColorHelper.primary,
            ),
          ),
        if (_currentStatus == RecordingStatus.Recording)
          IconButton.outlined(
            style: ButtonHelper.iconButtonModernStyle,
            onPressed: _pause,
            icon: const Icon(
              Icons.pause,
            ),
          ),
        if (_currentStatus == RecordingStatus.Paused)
          IconButton.outlined(
            style: ButtonHelper.iconButtonModernStyle,
            onPressed: _resume,
            icon: const Icon(
              Icons.play_arrow_rounded,
            ),
          ),
        if (_currentStatus != RecordingStatus.Initialized)
        Lottie.asset(
          AssetHelper.audioRecorder,
          animate: _currentStatus == RecordingStatus.Recording,
          height: 60,
        ),
        if (startRec)
          IconButton.outlined(
            style: ButtonHelper.iconButtonModernStyle,
            onPressed: _stop,
            icon: const Icon(
              Icons.stop,
            ),
          ),
        if (_currentStatus == RecordingStatus.Stopped && savedRecording != null)
        Row(
          children: [
            if (_currentStatus == RecordingStatus.Stopped)
              IconButton.outlined(
                style: ButtonHelper.iconButtonModernStyle,
                onPressed: _init,
                icon: Icon(
                  Icons.refresh_rounded,
                  color: ColorHelper.primary.withOpacity(0.4),
                ),
              ),
            if (savedRecording != null)
              IconButton.outlined(
                style: ButtonHelper.iconButtonModernStyle,
                onPressed: _send,
                icon: Icon(
                  Icons.check,
                  color: ColorHelper.success.withOpacity(0.4),
                ),
              ),
          ],
        )
      ],
    );
  }

  _init() async {
    try {
      if (await AnotherAudioRecorder.hasPermissions) {
        String customPath = '/another_audio_recorder_';
        io.Directory appDocDirectory;
//        io.Directory appDocDirectory = await getApplicationDocumentsDirectory();
        if (io.Platform.isIOS) {
          appDocDirectory = await getApplicationDocumentsDirectory();
        } else {
          appDocDirectory = (await getExternalStorageDirectory())!;
        }

        // can add extension like ".mp4" ".wav" ".m4a" ".aac"
        customPath = appDocDirectory.path +
            customPath +
            DateTime.now().millisecondsSinceEpoch.toString();

        // .wav <---> AudioFormat.WAV
        // .mp4 .m4a .aac <---> AudioFormat.AAC
        // AudioFormat is optional, if given value, will overwrite path extension when there is conflicts.
        _recorder =
            AnotherAudioRecorder(customPath, audioFormat: AudioFormat.AAC);

        await _recorder?.initialized;
        // after initialization
        var current = await _recorder?.current(channel: 0);
        print(current);
        // should be "Initialized", if all working fine
        setState(() {
          _current = current;
          _currentStatus = current!.status!;
          savedRecording = null;
          print(_currentStatus);
        });
      } else {
        return SnackBar(content: Text("You must accept permissions"));
      }
    } catch (e) {
      print(e);
    }
  }

  _start() async {
    try {
      await _recorder?.start();
      var recording = await _recorder?.current(channel: 0);
      setState(() {
        _current = recording;
        startRec = true;
      });

      const tick = const Duration(milliseconds: 50);
      Timer.periodic(tick, (Timer t) async {
        if (_currentStatus == RecordingStatus.Stopped) {
          t.cancel();
        }
        var current = await _recorder?.current(channel: 0);
        // print(current.status);
        setState(() {
          _current = current;
          _currentStatus = _current!.status!;
        });
      });
    } catch (e) {
      print(e);
    }
  }

  _resume() async {
    await _recorder?.resume();
    setState(() {});
  }

  _pause() async {
    await _recorder?.pause();
    setState(() {});
  }

  _stop() async {
    print("Stop recording: ---");
    var result = await _recorder?.stop();
    print("Stop recording: ${result?.path}");
    print("Stop recording: ${result?.duration}");
    File file = const LocalFileSystem().file(result?.path);
    print("File length: ${await file.length()}");
    setState(() {
      startRec = false;
      _current = result;
      _currentStatus = _current!.status!;
      savedRecording = result;
    });
  }

  _send() async {
    widget.onRecordDone(_current!);
    _init();
  }
}
