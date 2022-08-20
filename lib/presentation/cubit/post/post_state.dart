part of 'post_cubit.dart';

@immutable
abstract class PostState {}

class PostInitial extends PostState {}

class PostLoaded extends PostState {
  final List<CommentEntity> listComments;
  PostLoaded({required this.listComments});
}
class PostError extends PostState{
  final String error;
  PostError({required this.error});
}