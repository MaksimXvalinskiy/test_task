import 'package:test_app/domain/entities/user_entity/address_entity/geo_entity.dart';

class GeoModel extends GeoEntity{
  const GeoModel({
    required lat,
    required lng
  }):super(
    lat: lat,
    lng: lng
  );

  factory GeoModel.fromJSON(Map json){
    return GeoModel(
        lat: double.parse(json['lat']),
        lng: double.parse(json['lng'])
    );
  }

  static toJSON(GeoEntity geoEntity){
      return {
        'lat': geoEntity.lat.toString(),
        'lng': geoEntity.lng.toString()
      };
  }
}