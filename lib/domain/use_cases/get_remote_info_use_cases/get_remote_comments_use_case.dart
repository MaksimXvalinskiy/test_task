import 'package:test_app/domain/entities/comment_entity.dart';
import '../../repositories/remote_repository.dart';

class GetRemoteCommentsUseCase{
  final RemoteRepository repository;

  GetRemoteCommentsUseCase({required this.repository});

  Future<List<CommentEntity>> call(int postId) =>
      repository.getCommentsFromPost(postId);
}