import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:stt_ai/core/errors/network_exceptions.dart';
import 'package:stt_ai/core/services/audio_service.dart';
import 'package:stt_ai/features/sub/audio_feature/data/models/audio_feature_model.dart';

abstract class BaseAudioFeatureRemoteDataSource {
  Future<bool> startRecording();
  Future<AudioFeatureModel> stopRecording();
  Future<String> transcribeAudio(String filePath);
}

// -------------------------------------------------------------------
// -------------------------------------------------------------------

@LazySingleton(as: BaseAudioFeatureRemoteDataSource)
class AudioFeatureRemoteDataSource implements BaseAudioFeatureRemoteDataSource {
  final AudioService _audioService;
  final Dio _dio = Dio();

  AudioFeatureRemoteDataSource(this._audioService);

  // -------------------------------------------------------------------
  // -------------------------------------------------------------------

  //@ 5

  @override
  Future<bool> startRecording() async {
    try {
      await _audioService.startRecord();
      return true;
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }

  // -------------------------------------------------------------------
  // -------------------------------------------------------------------

  @override
  Future<AudioFeatureModel> stopRecording() async {
    try {
      final audio = await _audioService.stopRecording();

      return AudioFeatureModel(path: audio!);
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }

  // -------------------------------------------------------------------
  // -------------------------------------------------------------------

  @override
  Future<String> transcribeAudio(String filePath) async {
    try {
      // Headers are extra information sent with an HTTP request
      final headers = {'x-gladia-key': 'b56e5deb-35b8-4fc0-9e83-cfa9e069a755'};

      // ======================
      // ======================

      // STEP 1: Upload the file to Gladia
      // Prepare the audio file to send it to the API
      // each part represents a metadata + data
      // fromMap() creates a FormData object from a Map
      // Audio file is a single part, but multipart are required by the API
      final formData = FormData.fromMap({
        'audio': await MultipartFile.fromFile(filePath),
        // Another part might be 'language': 'en',
      });

      // Send Upload Audio Request
      final uploadResponse = await _dio.post(
        // Upload API
        'https://api.gladia.io/v2/upload',
        // Multipart data
        data: formData,
        // headers
        options: Options(headers: headers),
      );
      // Uploaded audioUrl response
      // API doesn't accept files directly
      // it expects URL of the audio file
      final audioUrl = uploadResponse.data['audio_url'];

      // ======================
      // ======================

      // STEP 2: Start the transcription process
      // returns status not the actual result
      final transcribeResponse = await _dio.post(
        // Transcribe API
        'https://api.gladia.io/v2/pre-recorded',
        // audioUrl variable
        data: {'audio_url': audioUrl},
        // headers
        options: Options(headers: headers),
      );

      // Gladia gives a specific URL to track the process
      // And to check the transcription status
      final resultUrl = transcribeResponse.data['result_url'];

      // ======================
      // ======================

      // STEP 3: Poll until the process is "done"
      // Infinite loop to keep checking
      while (true) {
        // Wait 3 seconds between checks to prevent spam to the API
        await Future.delayed(const Duration(seconds: 3));

        // This request will have the actual result
        final pollResponse = await _dio.get(
          resultUrl,
          options: Options(headers: headers),
        );
        // contains the requests status
        final status = pollResponse.data['status'];

        // gladia documentation
        if (status == 'done') {
          // fetch the transcribed audio
          return pollResponse
                  .data['result']['transcription']['full_transcript'] ??
              "No text found.";
        } else if (status == 'error') {
          throw Exception(
            "Gladia Transcription Error: ${pollResponse.data['error']}",
          );
        }
        // If status is "queued" or "processing", the loop continues and waits again
      }
    } on DioException catch (e) {
      // Catch actual network failures rather than the 400 error
      throw FailureExceptions.getException(
        e.response?.data.toString() ?? e.message ?? "Network Error",
      );
    } catch (error) {
      throw FailureExceptions.getException(error.toString());
    }
  }
}
