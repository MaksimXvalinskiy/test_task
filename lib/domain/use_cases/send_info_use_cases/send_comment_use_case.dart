import 'package:test_app/domain/entities/comment_entity.dart';
import '../../repositories/remote_repository.dart';

class SendCommentUseCase{
  final RemoteRepository repository;

  SendCommentUseCase({required this.repository});

  Future<void> call(CommentEntity commentEntity) =>
      repository.addNewComment(commentEntity);
}