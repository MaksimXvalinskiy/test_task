import 'package:test_app/domain/entities/album_entity.dart';

import '../../repositories/local_repository.dart';

class CachingAlbumsUseCase{
  final LocalRepository repository;

  CachingAlbumsUseCase({required this.repository});

  Future<void> call(List<AlbumEntity> listAlbums) =>
      repository.cacheAlbums(listAlbums);
}