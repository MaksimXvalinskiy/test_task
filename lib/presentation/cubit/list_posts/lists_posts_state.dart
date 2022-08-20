part of 'lists_posts_cubit.dart';

@immutable
abstract class ListsPostsState {}

class ListsPostsInitial extends ListsPostsState {}

class ListPostsLoaded extends ListsPostsState{
  final List<PostEntity> listPosts;
  ListPostsLoaded({required this.listPosts});
}