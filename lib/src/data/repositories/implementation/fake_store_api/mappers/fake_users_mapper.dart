import 'package:fake_store_api_pkg/fake_store_api_pkg.dart' as fake;

import '../../../../../domain/entities.dart';

final class FakeUsersMapper {
  const FakeUsersMapper();

  UserEntity mapSingle(fake.UserModel user) => UserEntity(
        id: user.id,
        email: user.email,
        username: user.username,
        password: user.password,
        name: HumanNameEntity(
          firstname: user.name.firstname,
          lastname: user.name.lastname,
        ),
        address: AddressEntity(
          country: '',
          state: '',
          city: user.address.city,
          street: user.address.street,
          number: user.address.number,
          zipcode: user.address.zipcode,
          geolocation: GeolocationEntity(
            latitude: user.address.geolocation.lat,
            longitude: user.address.geolocation.long,
          ),
        ),
        phone: user.phone,
      );

  List<UserEntity> mapMultiple(List<fake.UserModel> users) =>
      users.map(mapSingle).toList(growable: false);
}
