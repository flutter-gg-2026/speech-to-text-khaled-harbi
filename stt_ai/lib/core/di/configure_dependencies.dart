import 'package:get_it/get_it.dart';
import 'package:stt_ai/core/di/configure_dependencies.config.dart';
import 'package:injectable/injectable.dart';
import 'package:stt_ai/features/sub/audio_feature/di/audio_feature_di.dart';
import 'package:stt_ai/features/home/di/home_di.dart';

@InjectableInit(
  initializerName: 'init', 
  preferRelativeImports: true,
  asExtension: true, 
  generateForDir: ['lib/core'],
)

Future<void> configureDependencies() async {
  final getIt = GetIt.instance;
  getIt.init();
    configureAudioFeatureSub(getIt);
    configureHome(getIt);
}
