import '../../entities/photo_entity.dart';
import '../../repositories/local_repository.dart';


class GetCachedPhotosUseCase{
  final LocalRepository repository;

  GetCachedPhotosUseCase({required this.repository});

  Future<List<PhotoEntity>> call(int albumId) =>
      repository.getPhotoFromAlbum(albumId);
}