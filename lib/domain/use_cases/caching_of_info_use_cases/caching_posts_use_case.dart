import '../../entities/post_entity.dart';
import '../../repositories/local_repository.dart';

class CachingPostsUseCase{
  final LocalRepository repository;

  CachingPostsUseCase({required this.repository});

  Future<void> call(List<PostEntity> listPosts) =>
      repository.cachePosts(listPosts);
}