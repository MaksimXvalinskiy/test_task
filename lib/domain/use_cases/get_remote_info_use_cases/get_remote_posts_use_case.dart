import '../../entities/post_entity.dart';
import '../../repositories/remote_repository.dart';

class GetRemotePostsUseCase{
  final RemoteRepository repository;

  GetRemotePostsUseCase({required this.repository});

  Future<List<PostEntity>> call(int userId) =>
      repository.getUserPosts(userId);
}