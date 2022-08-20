import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_app/domain/entities/comment_entity.dart';
import 'package:test_app/domain/use_cases/get_cached_info_use_cases/get_cached_albums_use_case.dart';
import 'package:test_app/domain/use_cases/get_cached_info_use_cases/get_chaced_posts_use_case.dart';
import 'package:test_app/presentation/cubit/list_posts/lists_posts_cubit.dart';

import '../../../config/utils/helpers.dart';
import '../../../domain/entities/album_entity.dart';
import '../../../domain/entities/post_entity.dart';
import '../../../domain/use_cases/caching_of_info_use_cases/caching_albums_use_case.dart';
import '../../../domain/use_cases/caching_of_info_use_cases/caching_posts_use_case.dart';
import '../../../domain/use_cases/get_remote_info_use_cases/get_remote_albums_use_case.dart';
import '../../../domain/use_cases/get_remote_info_use_cases/get_remote_posts_use_case.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final GetRemoteAlbumsUseCase getRemoteAlbumsUseCase;
  final GetCachedAlbumsUseCase getCachedAlbumsUseCase;
  final GetCachedPostsUseCase getCachedPostsUseCase;
  final GetRemotePostsUseCase getRemotePostsUseCase;
  final CachingPostsUseCase cachingPostsUseCase;
  final CachingAlbumsUseCase cachingAlbumsUseCase;
  UserCubit({
    required this.getRemotePostsUseCase,
    required this.getRemoteAlbumsUseCase,
    required this.getCachedAlbumsUseCase,
    required this.getCachedPostsUseCase,
    required this.cachingPostsUseCase,
    required this.cachingAlbumsUseCase,
  }) : super(UserInitial());

  Future<void> getInfo(int uid) async{
    try{
      List<PostEntity> listPosts = await getCachedPostsUseCase(uid);
      List<AlbumEntity> listAlbums = await getCachedAlbumsUseCase(uid);
      if (listPosts.isEmpty || listAlbums.isEmpty) {
        if(! await Helper.checkInternetConnection())
          throw Exception('Нет подключения к интернету');
        if(listPosts.isEmpty) listPosts = await getRemotePostsUseCase(uid);
        if(listAlbums.isEmpty) listAlbums = await getRemoteAlbumsUseCase(uid);
        cachingPostsUseCase(listPosts);
        cachingAlbumsUseCase(listAlbums);
        emit(UserLoaded(listAlbum: listAlbums, listPosts: listPosts));
      }else{
        emit(UserLoaded(listAlbum: listAlbums, listPosts: listPosts));
      }
     }catch(e){
       emit(UserError(error: e.toString()));
     }
  }

  void refreshCommentsCount(
      int index,
      List<CommentEntity> listComments,
      UserLoaded state
      ){
    List<PostEntity> newListPost = [];
    for(int i = 0; i < state.listPosts.length; i++){
      if(i == index){
        newListPost.add(PostEntity(
            userId: state.listPosts[i].userId,
            id: state.listPosts[i].id,
            body: state.listPosts[i].body,
            title: state.listPosts[i].title,
            listComments: listComments
          )
        );
      }
      else{
        newListPost.add(state.listPosts[i]);
      }
    }
    emit(UserLoaded(listPosts: newListPost, listAlbum: state.listAlbum));
  }

  void refreshListPosts(List<PostEntity> listPosts, List<AlbumEntity> listAlbum){
    emit(UserLoaded(listPosts: listPosts, listAlbum: listAlbum));
  }
}
