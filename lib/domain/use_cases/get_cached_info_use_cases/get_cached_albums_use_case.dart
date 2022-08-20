import 'package:test_app/domain/entities/album_entity.dart';
import '../../repositories/local_repository.dart';

class GetCachedAlbumsUseCase{
  final LocalRepository repository;

  GetCachedAlbumsUseCase({required this.repository});

  Future<List<AlbumEntity>> call(int userId) =>
      repository.getUserAlbums(userId);
}