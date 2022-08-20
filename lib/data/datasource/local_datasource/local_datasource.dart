import 'package:test_app/domain/entities/user_entity/user_entity.dart';
import '../../../domain/entities/album_entity.dart';
import '../../../domain/entities/comment_entity.dart';
import '../../../domain/entities/photo_entity.dart';
import '../../../domain/entities/post_entity.dart';

abstract class LocalDatasource{
  Future<List<UserEntity>> getAllUsers();
  Future<List<PostEntity>> getUserPosts(int userId);
  Future<List<AlbumEntity>> getUserAlbums(int userId);
  Future<List<CommentEntity>> getCommentsFromPost(int postId);
  Future<List<PhotoEntity>> getPhotoFromAlbum(int albumId);

  Future<void> cacheUsers(List<UserEntity> listUsers);
  Future<void> cachePosts(List<PostEntity> listPosts);
  Future<void> cacheAlbums(List<AlbumEntity> listAlbums);
  Future<void> cacheComments(List<CommentEntity> listComments);
  Future<void> cachePhoto(List<PhotoEntity> listPhotos);
}