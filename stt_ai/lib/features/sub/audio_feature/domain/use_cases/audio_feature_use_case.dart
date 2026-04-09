import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:stt_ai/core/errors/failure.dart';
import 'package:stt_ai/features/sub/audio_feature/domain/entities/audio_feature_entity.dart';
import 'package:stt_ai/features/sub/audio_feature/domain/repositories/audio_feature_repository_domain.dart';

@lazySingleton
class AudioFeatureUseCase {
  final AudioFeatureRepositoryDomain _repositoryData;

  AudioFeatureUseCase(this._repositoryData);

  //@ 3

  Future<Result<bool, Failure>> startRecording() async {
    return _repositoryData.startRecording();
  }
  // ==============================================================

  Future<Result<AudioFeatureEntity, Failure>> stopRecording() async {
    return _repositoryData.stopRecording();
  }
  // ==============================================================

  Future<Result<String, Failure>> transcribeAudio(String filePath) async {
    return _repositoryData.transcribeAudio(filePath);
  }
  // ==============================================================
}
