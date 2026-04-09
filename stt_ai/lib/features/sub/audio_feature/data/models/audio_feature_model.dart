import 'package:stt_ai/features/sub/audio_feature/domain/entities/audio_feature_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'audio_feature_model.freezed.dart';
part 'audio_feature_model.g.dart';

@freezed
abstract class AudioFeatureModel with _$AudioFeatureModel {
  const factory AudioFeatureModel({required String path}) = _AudioFeatureModel;
  // ==============================================================
  // ==============================================================

  factory AudioFeatureModel.fromJson(Map<String, Object?> json) =>
      _$AudioFeatureModelFromJson(json);
}

// ==============================================================
// ==============================================================
extension AudioFeatureModelMapper on AudioFeatureModel {
  AudioFeatureEntity toEntity() {
    return AudioFeatureEntity(path: path);
  }
}
