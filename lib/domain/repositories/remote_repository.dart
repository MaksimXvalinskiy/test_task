import '../entities/album_entity.dart';
import '../entities/comment_entity.dart';
import '../entities/photo_entity.dart';
import '../entities/post_entity.dart';
import '../entities/user_entity/user_entity.dart';

abstract class RemoteRepository{
  Future<List<UserEntity>> getAllUsers();
  Future<List<PostEntity>> getUserPosts(int userId);
  Future<List<AlbumEntity>> getUserAlbums(int userId);
  Future<List<CommentEntity>> getCommentsFromPost(int postId);
  Future<List<PhotoEntity>> getPhotoFromAlbum(int albumId);
  Future<void> addNewComment(CommentEntity commentEntity);
}