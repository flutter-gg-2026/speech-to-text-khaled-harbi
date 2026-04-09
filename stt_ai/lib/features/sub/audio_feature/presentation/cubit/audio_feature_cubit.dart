import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stt_ai/features/sub/audio_feature/domain/use_cases/audio_feature_use_case.dart';
import 'package:stt_ai/features/sub/audio_feature/presentation/cubit/audio_feature_state.dart';

class AudioFeatureCubit extends Cubit<AudioFeatureState> {
  final AudioFeatureUseCase _audioFeatureUseCase;

  AudioFeatureCubit(this._audioFeatureUseCase)
    : super(AudioFeatureInitialState());

  // --------------------------------------------------------------------------
  // --------------------------------------------------------------------------

  //! Start recording

  //@ 2

  Future<void> startRecordingMethod() async {
    final isRecording = await _audioFeatureUseCase.startRecording();
    isRecording.when(
      (success) {
        emit(AudioFeatureRecordingState(isRecording: true));
      },
      (whenError) {
        emit(AudioFeatureErrorState(message: whenError.message));
      },
    );
  }

  // --------------------------------------------------------------------------
  // --------------------------------------------------------------------------

  //! Stop recording

  Future<void> stopRecordingMethod() async {
    final result = await _audioFeatureUseCase.stopRecording();
    result.when(
      // Audio recording successful
      (success) async {
        emit(
          AudioFeatureRecordingState(isRecording: false, path: success.path),
        );

        // Loading indicator
        emit(AudioFeatureTranscribingState());

        // Send tha file for audio transcription
        final transcribeResult = await _audioFeatureUseCase.transcribeAudio(
          success.path,
        );
        transcribeResult.when(
          // transcription successful
          (text) => emit(AudioFeatureTranscriptionSuccessState(text)),
          // transcription failed
          (failure) => emit(AudioFeatureErrorState(message: failure.message)),
        );
      },

      // Audio recording failed
      (whenError) {
        emit(AudioFeatureErrorState(message: whenError.message));
      },
    );
  }

  // --------------------------------------------------------------------------
  // --------------------------------------------------------------------------
}
