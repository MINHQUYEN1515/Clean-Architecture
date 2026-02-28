import 'package:equatable/equatable.dart';

class HomeItem extends Equatable {
  const HomeItem({
    required this.id,
    required this.title,
    this.subtitle,
  });

  final String id;
  final String title;
  final String? subtitle;

  @override
  List<Object?> get props => [id, title, subtitle];
}
