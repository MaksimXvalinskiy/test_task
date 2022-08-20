part of 'list_users_cubit.dart';

@immutable
abstract class ListUsersState {}

class ListUsersInitial extends ListUsersState {}

class ListUsersLoaded extends ListUsersState {
  final List<UserEntity> listUsers;
  ListUsersLoaded({
    required this.listUsers
  });
}

class ListUserError extends ListUsersState{
  final String errorText;
  ListUserError({required this.errorText});
}