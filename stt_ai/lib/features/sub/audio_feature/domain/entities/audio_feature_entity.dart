import 'package:equatable/equatable.dart';

class AudioFeatureEntity extends Equatable {
  final String path;

  const AudioFeatureEntity({required this.path});
  // ==============================================================

  @override
  List<Object?> get props => [path];
}
