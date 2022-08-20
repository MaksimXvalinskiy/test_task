import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_app/presentation/screens/post_screen.dart';

import '../../../config/utils/helpers.dart';
import '../../../domain/entities/comment_entity.dart';
import '../../../domain/use_cases/caching_of_info_use_cases/caching_comments_use_case.dart';
import '../../../domain/use_cases/get_remote_info_use_cases/get_remote_comments_use_case.dart';
import '../../../domain/use_cases/send_info_use_cases/send_comment_use_case.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  final SendCommentUseCase sendCommentUseCase;
  final CachingCommentsUseCase cachingCommentUseCase;
  PostCubit({
    required this.sendCommentUseCase,
    required this.cachingCommentUseCase
  }) : super(PostInitial());

  Future<void> getComments(List<CommentEntity> listComment) async{
    emit(PostLoaded(listComments: listComment));
  }

  Future<void> addNewComment(
        int postId,
        String email,
        String name,
        String body,
        PostLoaded state
      ) async{
    try{
      CommentEntity newComment = CommentEntity(
          postId: postId,
          id: state.listComments.length,
          body: body,
          email: email,
          name: name
      );
      if(! await Helper.checkInternetConnection())
        throw Exception('Нет подключения к интернету');
      await sendCommentUseCase(newComment);
      state.listComments.add(newComment);
      cachingCommentUseCase(state.listComments);
      emit(PostLoaded(listComments: state.listComments));
    }catch(e){
      emit(PostError(error: e.toString()));
    }
  }
}
