import 'package:fake_store_api_pkg/fake_store_api_pkg.dart' as fake;
import 'package:fun_pro_pkg/fun_pro_pkg.dart';

import '../../../../../domain/entities.dart';

import '../../../abstraction/users_repository.dart';

import '../mappers/fake_users_mapper.dart';

final class FakeUsersApi implements UsersRepository {
  final fake.UsersApi _usersApi;

  final FakeUsersMapper _fakeUsersMapper;

  FakeUsersApi()
      : _usersApi = fake.UsersApi(),
        _fakeUsersMapper = const FakeUsersMapper();

  @override
  Future<Coin<List<UserEntity>, Exception>> getUsers() {
    return _usersApi.getUsers().then((coin) {
      return coin.flip(
        (users) => Coin.heads(_fakeUsersMapper.mapMultiple(users)),
        Coin.tails,
      );
    });
  }

  @override
  Future<Coin<UserEntity, Exception>> getUser(int id) {
    return _usersApi.getUser(id).then((coin) {
      return coin.flip(
        (user) => Coin.heads(_fakeUsersMapper.mapSingle(user)),
        Coin.tails,
      );
    });
  }
}
