import 'package:language_app/core/errors/failures.dart';
import 'package:language_app/features/home/domain/entities/home_item.dart';
import 'package:language_app/features/home/domain/repositories/home_repository.dart';

class GetHomeData {
  GetHomeData(this._repository);

  final HomeRepository _repository;

  Future<({Failure? failure, List<HomeItem>? items})> call() {
    return _repository.getHomeData();
  }
}
