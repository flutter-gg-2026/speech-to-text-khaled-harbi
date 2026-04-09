import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:stt_ai/core/extensions/font_extensions.dart';
import 'package:stt_ai/features/sub/audio_feature/presentation/cubit/audio_feature_cubit.dart';
import 'package:stt_ai/features/sub/audio_feature/presentation/cubit/audio_feature_state.dart';

class AudioFeatureFeatureWidget extends StatelessWidget {
  const AudioFeatureFeatureWidget({super.key, required this.getPath});
  final Function(String) getPath;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AudioFeatureCubit(GetIt.I.get()),
      child: Builder(
        builder: (context) {
          final cubit = context.read<AudioFeatureCubit>();
          return GestureDetector(
            onLongPress: () async {
              //@ 1
              await cubit.startRecordingMethod();
            },
            onLongPressUp: () async {
              await cubit.stopRecordingMethod();
            },
            child: BlocBuilder<AudioFeatureCubit, AudioFeatureState>(
              builder: (context, state) {
                // ==============================================================
                // ==============================================================
                if (state is AudioFeatureRecordingState && state.path != null) {
                  getPath(state.path!);
                }
                // ==============================================================
                // ==============================================================

                return Column(
                  mainAxisAlignment: .center,
                  children: [
                    Container(
                      height: 10.sizeSW(min: 100, max: 200),
                      width: 10.sizeSW(min: 100, max: 200),
                      decoration: BoxDecoration(
                        // ==============================================================
                        // ==============================================================
                        color: state is AudioFeatureRecordingState
                            ? state.isRecording
                                  ? Colors.redAccent
                                  : Colors.blueAccent
                            : Colors.blueAccent,
                        // ==============================================================
                        // ==============================================================
                        shape: .circle,
                      ),
                      child: Icon(Icons.mic, color: Colors.white),
                    ),
                    SizedBox(height: 32),

                    // ==============================================================
                    // ==============================================================
                    if (state is AudioFeatureTranscribingState)
                      const CircularProgressIndicator(),

                    // ==============================================================
                    // ==============================================================
                    if (state is AudioFeatureTranscriptionSuccessState)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Text(
                          state.text,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),

                    // ==============================================================
                    // ==============================================================
                    if (state is AudioFeatureErrorState)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Text(
                          state.message,
                          style: const TextStyle(color: Colors.red),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    // ==============================================================
                    // ==============================================================
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
