import 'package:language_app/core/errors/exceptions.dart';
import 'package:language_app/core/errors/failures.dart';
import 'package:language_app/features/home/data/datasources/home_remote_data_source.dart';
import 'package:language_app/features/home/domain/entities/home_item.dart';
import 'package:language_app/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl(this._remoteDataSource);

  final HomeRemoteDataSource _remoteDataSource;

  @override
  Future<({Failure? failure, List<HomeItem>? items})> getHomeData() async {
    try {
      final items = await _remoteDataSource.getHomeData();
      return (failure: null, items: items);
    } on ServerException catch (e) {
      return (failure: ServerFailure(e.message), items: null);
    }
  }
}
