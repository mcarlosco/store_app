import 'geolocation_entity.dart';

final class AddressEntity {
  final String country;
  final String state;
  final String city;
  final String street;
  final int number;
  final String zipcode;
  final GeolocationEntity geolocation;

  const AddressEntity({
    required this.country,
    required this.state,
    required this.city,
    required this.street,
    required this.number,
    required this.zipcode,
    required this.geolocation,
  });
}
