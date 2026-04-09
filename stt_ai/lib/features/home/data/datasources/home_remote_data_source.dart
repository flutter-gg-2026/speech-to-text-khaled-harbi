import 'package:injectable/injectable.dart';
import 'package:stt_ai/features/home/data/models/home_model.dart';
import 'package:stt_ai/core/errors/network_exceptions.dart';

abstract class BaseHomeRemoteDataSource {
  Future<HomeModel> getHome();
}

@LazySingleton(as: BaseHomeRemoteDataSource)
class HomeRemoteDataSource implements BaseHomeRemoteDataSource {
  HomeRemoteDataSource();

  @override
  Future<HomeModel> getHome() async {
    try {
      return HomeModel(id: 1, firstName: "Last Name", lastName: "First Name");
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}
