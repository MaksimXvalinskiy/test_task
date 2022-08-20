import 'package:test_app/data/datasource/local_datasource/local_datasource.dart';
import 'package:test_app/domain/entities/album_entity.dart';
import 'package:test_app/domain/entities/comment_entity.dart';
import 'package:test_app/domain/entities/photo_entity.dart';
import 'package:test_app/domain/entities/post_entity.dart';
import 'package:test_app/domain/entities/user_entity/user_entity.dart';
import 'package:test_app/domain/repositories/local_repository.dart';

class LocalRepositoryImplement extends LocalRepository{

  final LocalDatasource localDatasource;

  LocalRepositoryImplement({
    required this.localDatasource
  });

  @override
  Future<void> cacheAlbums(List<AlbumEntity> listAlbums) =>
      localDatasource.cacheAlbums(listAlbums);

  @override
  Future<void> cacheComments(List<CommentEntity> listComments) =>
      localDatasource.cacheComments(listComments);

  @override
  Future<void> cachePhoto(List<PhotoEntity> listPhotos) =>
      localDatasource.cachePhoto(listPhotos);

  @override
  Future<void> cachePosts(List<PostEntity> listPosts) =>
      localDatasource.cachePosts(listPosts);

  @override
  Future<void> cacheUsers(List<UserEntity> listUsers) =>
      localDatasource.cacheUsers(listUsers);

  @override
  Future<List<UserEntity>> getAllUsers() =>
      localDatasource.getAllUsers();

  @override
  Future<List<CommentEntity>> getCommentsFromPost(int postId) =>
      localDatasource.getCommentsFromPost(postId);

  @override
  Future<List<PhotoEntity>> getPhotoFromAlbum(int albumId) =>
      localDatasource.getPhotoFromAlbum(albumId);

  @override
  Future<List<AlbumEntity>> getUserAlbums(int userId) =>
      localDatasource.getUserAlbums(userId);

  @override
  Future<List<PostEntity>> getUserPosts(int userId) =>
      localDatasource.getUserPosts(userId);
  
}