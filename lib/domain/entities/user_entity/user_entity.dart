import 'package:equatable/equatable.dart';
import 'package:test_app/domain/entities/user_entity/company_entity.dart';
import 'address_entity/address_entity.dart';

class UserEntity extends Equatable{
  final int id;
  final String userName;
  final String name;
  final String email;
  final AddressEntity address;
  final String phone;
  final String website;
  final CompanyEntity company;

  const UserEntity({
    required this.id,
    required this.phone,
    required this.email,
    required this.address,
    required this.company,
    required this.userName,
    required this.website,
    required this.name
  });

  @override
  List<Object?> get props => [
    id,
    userName,
    email,
    address,
    phone,
    website,
    company,
    name
  ];
}