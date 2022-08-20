part of 'user_cubit.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

class UserLoaded extends UserState {
  final List<PostEntity> listPosts;
  final List<AlbumEntity> listAlbum;
  UserLoaded({
    required this.listPosts,
    required this.listAlbum
  });
}
class UserError extends UserState{
  final String error;
  UserError({required this.error});
}