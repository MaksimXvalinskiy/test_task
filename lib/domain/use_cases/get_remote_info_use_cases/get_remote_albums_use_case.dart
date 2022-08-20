import 'package:test_app/domain/entities/album_entity.dart';

import '../../repositories/remote_repository.dart';

class GetRemoteAlbumsUseCase{
  final RemoteRepository repository;

  GetRemoteAlbumsUseCase({required this.repository});

  Future<List<AlbumEntity>> call(int userId) =>
      repository.getUserAlbums(userId);
}