import 'package:test_app/data/models/user_model/address_model/geo_model.dart';
import 'package:test_app/domain/entities/user_entity/address_entity/address_entity.dart';

class AddressModel extends AddressEntity{
  const AddressModel({
    required street,
    required suite,
    required city,
    required zipcode,
    required geo
  }):super(
    street: street,
    suite: suite,
    city: city,
    zipcode: zipcode,
    geo: geo
  );

  factory AddressModel.fromJSON(Map json){
    return AddressModel(
        street: json['street'],
        suite: json['suite'],
        city: json["city"],
        zipcode: json['zipcode'],
        geo: GeoModel.fromJSON(json['geo'])
    );
  }

  static toJSON(AddressEntity addressEntity){
    return {
      "street": addressEntity.street,
      "suite": addressEntity.suite,
      "city": addressEntity.city,
      "zipcode": addressEntity.zipcode,
      "geo": GeoModel.toJSON(addressEntity.geo)
    };
  }
}