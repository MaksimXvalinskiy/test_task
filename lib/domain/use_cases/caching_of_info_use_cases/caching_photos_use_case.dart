import 'package:test_app/domain/entities/photo_entity.dart';
import 'package:test_app/domain/repositories/local_repository.dart';

class CachingPhotosUseCase{
  final LocalRepository repository;

  CachingPhotosUseCase({required this.repository});

  Future<void> call(List<PhotoEntity> listPhotos) =>
      repository.cachePhoto(listPhotos);
}