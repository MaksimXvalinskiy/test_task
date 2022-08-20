import 'package:test_app/domain/entities/post_entity.dart';

import '../../domain/entities/comment_entity.dart';

class PostModel extends PostEntity{
  const PostModel({
    required userId,
    required id,
    required body,
    required title,
    required listComments
  }):super(
    userId: userId,
    id: id,
    body: body,
    title: title,
    listComments: listComments
  );

  factory PostModel.fromJSON(Map json, List<CommentEntity> listComments){
    return PostModel(
        userId: json['userId'],
        id: json['id'],
        body: json['body'],
        title: json['title'],
        listComments: listComments
    );
  }

  static toJSON(PostEntity postEntity){
    return {
      "userId": postEntity.userId,
      "id": postEntity.id,
      "body": postEntity.body,
      "title": postEntity.title
    };
  }
}