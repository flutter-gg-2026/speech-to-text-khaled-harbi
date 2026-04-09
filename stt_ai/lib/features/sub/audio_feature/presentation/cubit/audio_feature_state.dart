import 'package:equatable/equatable.dart';

abstract class AudioFeatureState extends Equatable {
  const AudioFeatureState();

  @override
  List<Object?> get props => [];
}

class AudioFeatureInitialState extends AudioFeatureState {}

class AudioFeatureSuccessState extends AudioFeatureState {}

class AudioFeatureErrorState extends AudioFeatureState {
  final String message;
  const AudioFeatureErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}

class AudioFeatureRecordingState extends AudioFeatureState {
  final bool isRecording;
  final String? path;

  const AudioFeatureRecordingState({required this.isRecording, this.path});

  @override
  List<Object?> get props => [isRecording, path];
}

class AudioFeatureTranscribingState extends AudioFeatureState {}

class AudioFeatureTranscriptionSuccessState extends AudioFeatureState {
  final String text;
  const AudioFeatureTranscriptionSuccessState(this.text);
}
