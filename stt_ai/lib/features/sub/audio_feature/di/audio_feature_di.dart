import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'audio_feature_di.config.dart'; 

@InjectableInit(
  initializerName: 'initAudioFeatureSub',
   // Optional: specify the directory to scan for injectable annotations
  generateForDir: ['lib/features/sub/audio_feature'],
)
void configureAudioFeatureSub(GetIt getIt) {
  getIt.initAudioFeatureSub();
}
