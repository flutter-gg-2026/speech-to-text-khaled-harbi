import 'package:multiple_result/multiple_result.dart';
import 'package:stt_ai/core/errors/failure.dart';
import 'package:stt_ai/features/home/domain/entities/home_entity.dart';

abstract class HomeRepositoryDomain {
    Future<Result<HomeEntity, Failure>> getHome();
}
