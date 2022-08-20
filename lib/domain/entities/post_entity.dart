import 'package:equatable/equatable.dart';
import 'package:test_app/domain/entities/comment_entity.dart';
class PostEntity extends Equatable{
  final int userId;
  final int id;
  final String title;
  final String body;
  final List<CommentEntity> listComments;
  const PostEntity({
    required this.userId,
    required this.id,
    required this.body,
    required this.title,
    required this.listComments
  });

  @override
  List<Object?> get props => [
    userId,
    id,
    title,
    body,
    listComments
  ];
}