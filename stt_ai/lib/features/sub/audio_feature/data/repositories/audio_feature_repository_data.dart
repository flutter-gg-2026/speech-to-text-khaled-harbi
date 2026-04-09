import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:stt_ai/core/errors/network_exceptions.dart';
import 'package:stt_ai/core/errors/failure.dart';
import 'package:stt_ai/features/sub/audio_feature/data/datasources/audio_feature_remote_data_source.dart';
import 'package:stt_ai/features/sub/audio_feature/data/models/audio_feature_model.dart';
import 'package:stt_ai/features/sub/audio_feature/domain/entities/audio_feature_entity.dart';
import 'package:stt_ai/features/sub/audio_feature/domain/repositories/audio_feature_repository_domain.dart';

@LazySingleton(as: AudioFeatureRepositoryDomain)
class AudioFeatureRepositoryData implements AudioFeatureRepositoryDomain {
  final BaseAudioFeatureRemoteDataSource remoteDataSource;

  AudioFeatureRepositoryData(this.remoteDataSource);

  // -------------------------------------------------------------------
  // -------------------------------------------------------------------

  //@ 4

  @override
  Future<Result<bool, Failure>> startRecording() async {
    try {
      final isRecording = await remoteDataSource.startRecording();
      return Success(isRecording);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }

  @override
  Future<Result<AudioFeatureEntity, Failure>> stopRecording() async {
    try {
      final response = await remoteDataSource.stopRecording();
      return Success(response.toEntity());
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }

  // -------------------------------------------------------------------
  // -------------------------------------------------------------------

  @override
  Future<Result<String, Failure>> transcribeAudio(String filePath) async {
    try {
      final textResult = await remoteDataSource.transcribeAudio(filePath);
      return Success(textResult);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}

  // -------------------------------------------------------------------
  // -------------------------------------------------------------------

