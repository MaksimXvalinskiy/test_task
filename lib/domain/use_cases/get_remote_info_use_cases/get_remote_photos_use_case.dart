import '../../entities/photo_entity.dart';
import '../../repositories/remote_repository.dart';

class GetRemotePhotosUseCase{
  final RemoteRepository repository;

  GetRemotePhotosUseCase({required this.repository});

  Future<List<PhotoEntity>> call(int albumId) =>
      repository.getPhotoFromAlbum(albumId);
}