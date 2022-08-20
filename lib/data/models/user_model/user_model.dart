import 'package:test_app/data/models/user_model/address_model/address_model.dart';
import 'package:test_app/data/models/user_model/company_model.dart';
import 'package:test_app/domain/entities/user_entity/user_entity.dart';

class UserModel extends UserEntity{
  const UserModel({
    required id,
    required phone,
    required email,
    required address,
    required company,
    required userName,
    required website,
    required name
  }):super(
    id: id,
    phone: phone,
    email: email,
    address: address,
    company: company,
    userName: userName,
    website: website,
    name: name
  );

  factory UserModel.fromJSON(Map json){
    return UserModel(
        id: json['id'],
        phone: json['phone'],
        email: json['email'],
        address: AddressModel.fromJSON(json['address']),
        company: CompanyModel.fromJSON(json['company']),
        userName: json['username'],
        name: json['name'],
        website: json['website']
    );
  }

  static toJSON(UserEntity userEntity){
    return {
      'id': userEntity.id,
      'phone': userEntity.phone,
      'email': userEntity.email,
      "address": AddressModel.toJSON(userEntity.address),
      "company": CompanyModel.toJSON(userEntity.company),
      "username": userEntity.userName,
      "website": userEntity.website,
      "name": userEntity.name
    };
  }
}