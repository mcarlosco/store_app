import 'address_entity.dart';
import 'human_name_entity.dart';

final class UserEntity {
  final int id;
  final String email;
  final String username;
  final String password;
  final HumanNameEntity name;
  final AddressEntity address;
  final String phone;

  const UserEntity({
    required this.id,
    required this.email,
    required this.username,
    required this.password,
    required this.name,
    required this.address,
    required this.phone,
  });
}
