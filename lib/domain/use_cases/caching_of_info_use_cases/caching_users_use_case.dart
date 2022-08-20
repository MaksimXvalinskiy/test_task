import '../../entities/user_entity/user_entity.dart';
import '../../repositories/local_repository.dart';

class CachingUsersUseCase{
  final LocalRepository repository;

  CachingUsersUseCase({required this.repository});

  Future<void> call(List<UserEntity> listUsers) =>
      repository.cacheUsers(listUsers);
}