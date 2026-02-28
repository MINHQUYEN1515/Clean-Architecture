import 'package:language_app/core/errors/exceptions.dart';
import 'package:language_app/features/home/data/models/home_item_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<HomeItemModel>> getHomeData();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  @override
  Future<List<HomeItemModel>> getHomeData() async {
    try {
      await Future<void>.delayed(const Duration(milliseconds: 500));
      return [
        const HomeItemModel(
          id: '1',
          title: 'Welcome',
          subtitle: 'Home page',
        ),
      ];
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
