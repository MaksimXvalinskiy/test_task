import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_app/presentation/cubit/list_users/list_users_cubit.dart';

import '../../../domain/entities/comment_entity.dart';
import '../../../domain/entities/post_entity.dart';

part 'lists_posts_state.dart';

class ListPostsCubit extends Cubit<ListsPostsState> {
  ListPostsCubit() : super(ListsPostsInitial());

  void getInfo(List<PostEntity> listPosts){
    emit(ListPostsLoaded(listPosts: listPosts));
  }

  void refreshCommentsCount(
      int index,
      List<CommentEntity> listComments,
      List<PostEntity> listPosts
      ){
    List<PostEntity> newListPost = [];
    for(int i = 0; i < listPosts.length; i++){
      if(i == index){
        newListPost.add(PostEntity(
            userId: listPosts[i].userId,
            id: listPosts[i].id,
            body: listPosts[i].body,
            title: listPosts[i].title,
            listComments: listComments
        )
        );
      }
      else{
        newListPost.add(listPosts[i]);
      }
    }
    emit(ListPostsLoaded(listPosts: newListPost));
  }
}
