import 'package:fun_pro_pkg/fun_pro_pkg.dart';

import '../../../domain/entities.dart';

abstract interface class UsersRepository {
  const UsersRepository();

  Future<Coin<List<UserEntity>, Exception>> getUsers();

  Future<Coin<UserEntity, Exception>> getUser(int id);
}
