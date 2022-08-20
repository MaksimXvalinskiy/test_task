import 'package:test_app/domain/entities/album_entity.dart';

import '../../domain/entities/photo_entity.dart';

class AlbumModel extends AlbumEntity{
  const AlbumModel({
    required userId,
    required id,
    required title,
    required listPhoto
  }):super(
    userId: userId,
    id: id,
    title: title,
    listPhoto: listPhoto
  );

  factory AlbumModel.fromJSON(Map json, List<PhotoEntity> listPhoto){
    return AlbumModel(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
        listPhoto: listPhoto
    );
  }

  static toJSON(AlbumEntity albumEntity){
    return{
      "userId": albumEntity.userId,
      "id": albumEntity.id,
      "title": albumEntity.title
    };
  }
}