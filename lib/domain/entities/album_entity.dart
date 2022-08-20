import 'package:equatable/equatable.dart';
import 'package:test_app/domain/entities/photo_entity.dart';
class AlbumEntity extends Equatable{
  final int userId;
  final int id;
  final String title;
  final List<PhotoEntity> listPhoto;
  const AlbumEntity({
    required this.userId,
    required this.id,
    required this.title,
    required this.listPhoto
  });
  @override
  List<Object?> get props => [
    userId,
    id,
    title,
    listPhoto
  ];
}