import 'package:test_app/domain/entities/photo_entity.dart';
import 'package:test_app/domain/entities/post_entity.dart';

class PhotoModel extends PhotoEntity{
  const PhotoModel({
    required albumId,
    required id,
    required title,
    required thumbnailUrl,
    required url
  }):super(
    albumId: albumId,
    id: id,
    title: title,
    thumbnailUrl: thumbnailUrl,
    url: url
  );

  factory PhotoModel.fromJSON(Map json){
    return PhotoModel(
        albumId: json['albumId'],
        id: json['id'],
        title: json['title'],
        thumbnailUrl: json['thumbnailUrl'],
        url: json['url']
    );
  }

  static toJSON(PhotoEntity photoEntity){
    return {
      "albumId": photoEntity.albumId,
      "id": photoEntity.id,
      "title": photoEntity.title,
      "thumbnailUrl": photoEntity.thumbnailUrl,
      "url": photoEntity.url
    };
  }
}