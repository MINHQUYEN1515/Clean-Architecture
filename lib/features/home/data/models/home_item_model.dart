import 'package:language_app/features/home/domain/entities/home_item.dart';

class HomeItemModel extends HomeItem {
  const HomeItemModel({
    required super.id,
    required super.title,
    super.subtitle,
  });

  factory HomeItemModel.fromJson(Map<String, dynamic> json) {
    return HomeItemModel(
      id: json['id'] as String,
      title: json['title'] as String,
      subtitle: json['subtitle'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'subtitle': subtitle,
    };
  }
}
