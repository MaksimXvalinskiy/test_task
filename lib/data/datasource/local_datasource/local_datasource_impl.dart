import 'package:test_app/config/utils/app_constants.dart';
import 'package:test_app/data/datasource/local_datasource/local_datasource.dart';
import 'package:test_app/data/models/album_model.dart';
import 'package:test_app/data/models/comment_model.dart';
import 'package:test_app/data/models/post_model.dart';
import 'package:test_app/data/models/user_model/user_model.dart';
import 'package:test_app/domain/entities/album_entity.dart';
import 'package:test_app/domain/entities/comment_entity.dart';
import 'package:test_app/domain/entities/photo_entity.dart';
import 'package:test_app/domain/entities/post_entity.dart';
import 'package:test_app/domain/entities/user_entity/user_entity.dart';
import 'package:hive/hive.dart';

import '../../models/photo_model.dart';

class LocalDatasourceImplement extends LocalDatasource{
  @override
  Future<void> cacheAlbums(List<AlbumEntity> listAlbums) async{
    final List<Map<String, dynamic>> listMap = [];
    for(int i = 0; i < listAlbums.length; i++){
      await cachePhoto(listAlbums[i].listPhoto);
      listMap.add(AlbumModel.toJSON(listAlbums[i]));
    }
    (await Hive.openBox(AppConstantsLocal.ALBUMS)).put(
        listAlbums[0].userId,
        listMap
    );
  }

  @override
  Future<void> cacheComments(List<CommentEntity> listComments) async{
    final List<Map<String, dynamic>> listMap = [];
    for(int i = 0; i < listComments.length; i++){
      listMap.add(CommentModel.toJSON(listComments[i]));
    }
    (await Hive.openBox(AppConstantsLocal.COMMENTS)).put(
        listComments[0].postId,
        listMap
    );
  }

  @override
  Future<void> cachePhoto(List<PhotoEntity> listPhotos) async{
    final List<Map<String, dynamic>> listMap = [];
    for(int i = 0; i < listPhotos.length; i++){
      listMap.add(PhotoModel.toJSON(listPhotos[i]));
    }
    (await Hive.openBox(AppConstantsLocal.PHOTOS)).put(
        listPhotos[0].albumId,
        listMap
    );
  }

  @override
  Future<void> cachePosts(List<PostEntity> listPosts) async{
    final List<Map<String, dynamic>> listMap = [];
    print("ddddddddddd");
    for(int i = 0; i < listPosts.length; i++){
      await cacheComments(listPosts[i].listComments);
      listMap.add(PostModel.toJSON(listPosts[i]));
    }
    (await Hive.openBox(AppConstantsLocal.POSTS)).put(
        listPosts[0].userId,
        listMap
    );
  }

  @override
  Future<void> cacheUsers(List<UserEntity> listUsers) async{
    final List<Map<String, dynamic>> listMap = [];
    for(int i = 0; i < listUsers.length; i++){
      listMap.add(UserModel.toJSON(listUsers[i]));
    }
    (await Hive.openBox(AppConstantsLocal.USERS)).put(
        AppConstantsLocal.USERS,
        listMap
    );
  }

  @override
  Future<List<AlbumEntity>> getUserAlbums(int userId) async{
    final List<dynamic> map =
        (await Hive.openBox(AppConstantsLocal.ALBUMS)).get(userId) ?? [];
    final List<AlbumEntity> listAlbums = [];
    for(int i = 0; i < map.length; i++ ){
      listAlbums.add(
          AlbumModel.fromJSON(map[i], await getPhotoFromAlbum(map[i]["id"]))
      );
    }
    return listAlbums;
  }

  @override
  Future<List<UserEntity>> getAllUsers() async{
    final List<dynamic> map =
        (await Hive.openBox(AppConstantsLocal.USERS)).get(AppConstantsLocal.USERS)?? [];
    final List<UserEntity> listUsers = [];
    for(int i = 0; i < map.length; i++ ){
      listUsers.add(UserModel.fromJSON(map[i]));
    }
    return listUsers;
  }

  @override
  Future<List<CommentEntity>> getCommentsFromPost(int postId) async{
    final List<dynamic> map =
        (await Hive.openBox(AppConstantsLocal.COMMENTS)).get(postId) ?? [];
    final List<CommentEntity> listComments = [];
    for(int i = 0; i < map.length; i++ ){
      listComments.add(CommentModel.fromJSON(map[i]));
    }
    return listComments;
  }

  @override
  Future<List<PhotoEntity>> getPhotoFromAlbum(int albumId) async{
    final List<dynamic> map =
        (await Hive.openBox(AppConstantsLocal.PHOTOS)).get(albumId) ?? [];
    final List<PhotoEntity> listPhotos = [];
    for(int i = 0; i < map.length; i++ ){
      listPhotos.add(PhotoModel.fromJSON(map[i]));
    }
    return listPhotos;
  }

  @override
  Future<List<PostEntity>> getUserPosts(int userId) async{
    final List<dynamic> map =
        (await Hive.openBox(AppConstantsLocal.POSTS)).get(userId) ?? [];
    final List<PostEntity> listPosts = [];
    for(int i = 0; i < map.length; i++ ){
      listPosts.add(
        PostModel.fromJSON(
          map[i],
          await getCommentsFromPost(map[i]["id"])
        )
      );
    }
    return listPosts;
  }
  
}