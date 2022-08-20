import 'package:test_app/domain/entities/comment_entity.dart';
import '../../repositories/local_repository.dart';

class GetCachedCommentsUseCase{
  final LocalRepository repository;

  GetCachedCommentsUseCase({required this.repository});

  Future<List<CommentEntity>> call(int postId) =>
      repository.getCommentsFromPost(postId);
}