import 'package:equatable/equatable.dart';
class GeoEntity extends Equatable{
  final double lat;
  final double lng;
  const GeoEntity({
   required this.lat,
   required this.lng
  });
  @override
  List<Object?> get props => [
    lat,
    lng
  ];
}