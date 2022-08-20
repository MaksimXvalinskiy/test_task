import 'package:test_app/domain/entities/user_entity/company_entity.dart';

class CompanyModel extends CompanyEntity{
  const CompanyModel({
    required name,
    required catchPhrase,
    required bs}):super(
      name: name,
      catchPhrase: catchPhrase,
      bs: bs
  );

  factory CompanyModel.fromJSON(Map json){
    return CompanyModel(
        name: json['name'],
        catchPhrase: json['catchPhrase'],
        bs: json['bs']
    );
  }

  static toJSON(CompanyEntity companyEntity){
    return{
      'name': companyEntity.name,
      'catchPhrase': companyEntity.catchPhrase,
      'bs': companyEntity.bs
    };
  }
}