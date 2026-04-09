import 'package:multiple_result/multiple_result.dart';
import 'package:stt_ai/core/errors/failure.dart';
import 'package:stt_ai/features/sub/audio_feature/domain/entities/audio_feature_entity.dart';

abstract class AudioFeatureRepositoryDomain {
  Future<Result<bool, Failure>> startRecording();
  Future<Result<AudioFeatureEntity, Failure>> stopRecording();
  Future<Result<String, Failure>> transcribeAudio(String filePath);
}
