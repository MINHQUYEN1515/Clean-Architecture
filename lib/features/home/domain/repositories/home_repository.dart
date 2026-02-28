import 'package:language_app/core/errors/failures.dart';
import 'package:language_app/features/home/domain/entities/home_item.dart';

abstract class HomeRepository {
  Future<({Failure? failure, List<HomeItem>? items})> getHomeData();
}
