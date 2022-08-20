import 'package:test_app/domain/repositories/remote_repository.dart';

import '../../entities/user_entity/user_entity.dart';

class GetRemoteUsersUseCase{
  final RemoteRepository repository;

  GetRemoteUsersUseCase({required this.repository});

  Future<List<UserEntity>> call() => repository.getAllUsers();
}