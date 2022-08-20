import '../../entities/post_entity.dart';
import '../../repositories/local_repository.dart';


class GetCachedPostsUseCase{
  final LocalRepository repository;

  GetCachedPostsUseCase({required this.repository});

  Future<List<PostEntity>> call(int userId) =>
      repository.getUserPosts(userId);
}