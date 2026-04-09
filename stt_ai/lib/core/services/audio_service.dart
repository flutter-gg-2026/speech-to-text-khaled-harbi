import 'dart:io';
import 'package:injectable/injectable.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import 'package:stt_ai/core/errors/failure.dart';
import 'package:uuid/v7.dart';

@lazySingleton
class AudioService {
  final _record = AudioRecorder();
  final _player = AudioPlayer();

  //! Permission
  void requestPermission() async {
    final hasPermission = await _record.hasPermission(request: true);
    if (!hasPermission) {
      throw PermissionFailure("Permission denied");
    }
  }

  //---------------------------------------------------------------------------------
  //---------------------------------------------------------------------------------

  //! Start recording

  //@ 6

  Future<void> startRecord() async {
    // To store the audio files
    final Directory tempDir = await getTemporaryDirectory();
    // Random path name for the files
    final name = UuidV7().generate();

    await _record.start(
      const RecordConfig(),
      path: '${tempDir.path}/$name.m4a',
    );
  }

  //---------------------------------------------------------------------------------
  //---------------------------------------------------------------------------------

  //! Stop recording

  Future<String?> stopRecording() async {
    final path = await _record.stop();
    print(path);
    return path;
  }

  //---------------------------------------------------------------------------------
  //---------------------------------------------------------------------------------

  //! Start playing the audio

  Future<void> startPlayerAudio({required String pathAudio}) async {
    await _player.setFilePath(pathAudio);
    await _player.play();
  }

  //---------------------------------------------------------------------------------
  //---------------------------------------------------------------------------------

  //! Stop playing the audio

  Future<void> stopPlayerAudio() async {
    await _player.stop();
  }
}
