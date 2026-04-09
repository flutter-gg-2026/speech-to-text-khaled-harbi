import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stt_ai/features/home/presentation/cubit/home_cubit.dart';
import 'package:stt_ai/features/home/presentation/cubit/home_state.dart';
import 'package:stt_ai/features/sub/audio_feature/presentation/pages/audio_feature_feature_widget.dart';

class HomeFeatureScreen extends StatelessWidget {
  const HomeFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Audio Transcription',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        mainAxisAlignment: .center,
        children: [
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              // ==============================================================
              // ==============================================================

              if (state is HomeSuccessState && state.path != null) {
                return Text(state.path!);
              }
              return SizedBox.shrink();
            },
          ),
          // ==============================================================
          // ==============================================================
          Center(
            child: AudioFeatureFeatureWidget(
              getPath: (value) {
                cubit.updatePath(path: value);
              },
            ),
          ),
        ],
      ),
    );
  }
}
