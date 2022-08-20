import 'package:test_app/domain/entities/comment_entity.dart';

import '../../repositories/local_repository.dart';

class CachingCommentsUseCase{
  final LocalRepository repository;

  CachingCommentsUseCase({required this.repository});

  Future<void> call(List<CommentEntity> listComments) =>
      repository.cacheComments(listComments);
}