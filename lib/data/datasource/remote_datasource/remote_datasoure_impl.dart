import 'dart:convert';

import 'package:test_app/config/utils/app_constants.dart';
import 'package:test_app/data/datasource/remote_datasource/remote_datasource.dart';
import 'package:test_app/data/models/comment_model.dart';
import 'package:test_app/data/models/post_model.dart';
import 'package:test_app/data/models/user_model/user_model.dart';
import 'package:test_app/domain/entities/album_entity.dart';
import 'package:test_app/domain/entities/comment_entity.dart';
import 'package:test_app/domain/entities/photo_entity.dart';
import 'package:test_app/domain/entities/post_entity.dart';
import 'package:test_app/domain/entities/user_entity/user_entity.dart';
import 'package:http/http.dart' as http;

import '../../models/album_model.dart';
import '../../models/photo_model.dart';

class RemoteDatasourceImplement extends RemoteDatasource{
  @override
  Future<List<PostEntity>> getUserPosts(int userId) async{
    final List<PostEntity> listPosts = [];
    var query = json.decode((
        await http.get(
            Uri.parse(AppConstantsRemote.REQUEST_POSTS_FROM_USER + userId.toString())
        )
    ).body);
    for(int i = 0; i < query.length; i++){
      listPosts.add(
          PostModel.fromJSON(
              query[i],
              await getCommentsFromPost(query[i]['id'])
          )
      );
    }
    return listPosts;
  }

  @override
  Future<List<UserEntity>> getAllUsers() async{
    final List<UserEntity> listUsers = [];
    var query = json.decode((
        await http.get(
            Uri.parse(AppConstantsRemote.REQUEST_ALL_USERS)
        )
    ).body);
    for(int i = 0; i < query.length; i++){
      listUsers.add(UserModel.fromJSON(query[i]));
    }
    return listUsers;
  }

  @override
  Future<List<AlbumEntity>> getUserAlbums(int userId) async{
    final List<AlbumEntity> listAlbums = [];
    var query = json.decode((
        await http.get(
           Uri.parse(AppConstantsRemote.REQUEST_ALBUMS_FROM_USER + userId.toString())
        )
    ).body);
    for(int i = 0; i < query.length; i++){
      listAlbums.add(
          AlbumModel.fromJSON(query[i], await getPhotoFromAlbum(query[i]['id']))
      );
    }
    return listAlbums;
  }

  @override
  Future<List<CommentEntity>> getCommentsFromPost(int postId) async{
    final List<CommentEntity> listComments = [];
    var query = json.decode((
        await http.get(
            Uri.parse(AppConstantsRemote.REQUEST_COMMENTS_FROM_POST + postId.toString()
            )
        )
    ).body);
    for(int i = 0; i < query.length; i++){
      listComments.add(CommentModel.fromJSON(query[i]));
    }
    return listComments;
  }

  @override
  Future<List<PhotoEntity>> getPhotoFromAlbum(int albumId) async{
    final List<PhotoEntity> listPhotos = [];
    var query = json.decode((
        await http.get(
            Uri.parse(
                AppConstantsRemote.REQUEST_PHOTOS_FROM_ALBUM + albumId.toString()
            )
        )
    ).body);
    for(int i = 0; i < query.length; i++){
      listPhotos.add(PhotoModel.fromJSON(query[i]));
    }
    return listPhotos;
  }

  @override
  Future<void> addNewComment(CommentEntity commentEntity) async{
    await http.post(Uri.parse(AppConstantsRemote.ADD_NEW_COMMENT),
      body: json.encode({
        "body": commentEntity.body,
        "postId": commentEntity.postId,
        "email": commentEntity.email,
        "name": commentEntity.name
      }),
      headers: {
        'Content-type': 'application/json; charset=UTF-8',
      },

    );
  }

}