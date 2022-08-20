import 'package:test_app/domain/entities/comment_entity.dart';

class CommentModel extends CommentEntity{
  const CommentModel({
    required postId,
    required id,
    required body,
    required email,
    required name
  }):super(
    postId: postId,
    id: id,
    body: body,
    email: email,
    name: name
  );

  factory CommentModel.fromJSON(Map json){
    return CommentModel(
        postId: json['postId'],
        id: json['id'],
        body: json['body'],
        email: json['email'],
        name: json['name']
    );
  }

  static toJSON(CommentEntity commentEntity){
    return {
      'postId': commentEntity.postId,
      "id": commentEntity.id,
      "body": commentEntity.body,
      "email": commentEntity.email,
      'name': commentEntity.name
    };
  }
}