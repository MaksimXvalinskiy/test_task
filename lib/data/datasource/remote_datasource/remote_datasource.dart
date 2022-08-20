import 'package:test_app/domain/entities/album_entity.dart';
import 'package:test_app/domain/entities/comment_entity.dart';
import 'package:test_app/domain/entities/photo_entity.dart';
import 'package:test_app/domain/entities/post_entity.dart';
import 'package:test_app/domain/entities/user_entity/user_entity.dart';

abstract class RemoteDatasource{
  Future<List<UserEntity>> getAllUsers();
  Future<List<PostEntity>> getUserPosts(int userId);
  Future<List<AlbumEntity>> getUserAlbums(int userId);
  Future<List<CommentEntity>> getCommentsFromPost(int postId);
  Future<List<PhotoEntity>> getPhotoFromAlbum(int albumId);
  Future<void> addNewComment(CommentEntity commentEntity);
}