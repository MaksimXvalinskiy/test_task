import 'package:test_app/data/datasource/remote_datasource/remote_datasource.dart';
import 'package:test_app/domain/entities/album_entity.dart';
import 'package:test_app/domain/entities/comment_entity.dart';
import 'package:test_app/domain/entities/photo_entity.dart';
import 'package:test_app/domain/entities/post_entity.dart';
import 'package:test_app/domain/entities/user_entity/user_entity.dart';
import 'package:test_app/domain/repositories/remote_repository.dart';

class RemoteRepositoryImplement extends RemoteRepository{
  final RemoteDatasource remoteDatasource;

  RemoteRepositoryImplement({
    required this.remoteDatasource
  });

  @override
  Future<void> addNewComment(CommentEntity commentEntity) =>
      remoteDatasource.addNewComment(commentEntity);

  @override
  Future<List<AlbumEntity>> getUserAlbums(int userId) =>
      remoteDatasource.getUserAlbums(userId);

  @override
  Future<List<UserEntity>> getAllUsers() =>
      remoteDatasource.getAllUsers();

  @override
  Future<List<CommentEntity>> getCommentsFromPost(int postId) =>
      remoteDatasource.getCommentsFromPost(postId);

  @override
  Future<List<PhotoEntity>> getPhotoFromAlbum(int albumId) =>
      remoteDatasource.getPhotoFromAlbum(albumId);

  @override
  Future<List<PostEntity>> getUserPosts(int userId) =>
      remoteDatasource.getUserPosts(userId);

}