// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:stt_ai/core/services/audio_service.dart' as _i611;
import 'package:stt_ai/features/sub/audio_feature/data/datasources/audio_feature_remote_data_source.dart'
    as _i278;
import 'package:stt_ai/features/sub/audio_feature/data/repositories/audio_feature_repository_data.dart'
    as _i759;
import 'package:stt_ai/features/sub/audio_feature/domain/repositories/audio_feature_repository_domain.dart'
    as _i555;
import 'package:stt_ai/features/sub/audio_feature/domain/use_cases/audio_feature_use_case.dart'
    as _i1063;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initAudioFeatureSub({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i278.BaseAudioFeatureRemoteDataSource>(
      () => _i278.AudioFeatureRemoteDataSource(gh<_i611.AudioService>()),
    );
    gh.lazySingleton<_i555.AudioFeatureRepositoryDomain>(
      () => _i759.AudioFeatureRepositoryData(
        gh<_i278.BaseAudioFeatureRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i1063.AudioFeatureUseCase>(
      () =>
          _i1063.AudioFeatureUseCase(gh<_i555.AudioFeatureRepositoryDomain>()),
    );
    return this;
  }
}
