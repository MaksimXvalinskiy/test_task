import 'package:test_app/domain/entities/user_entity/user_entity.dart';
import 'package:test_app/domain/repositories/local_repository.dart';

class GetCachedUsersUseCase{
  final LocalRepository repository;

  GetCachedUsersUseCase({required this.repository});

  Future<List<UserEntity>> call() => repository.getAllUsers();
}