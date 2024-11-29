import 'package:fun_pro_pkg/fun_pro_pkg.dart';

import '../../../../data/repositories.dart';

import '../../../entities.dart';

import '../../abstraction/command.dart';

final class GetUsersCommand
    implements Command<Future<Coin<List<UserEntity>, Exception>>, void> {
  final UsersRepository _usersRepository;

  const GetUsersCommand(this._usersRepository);

  @override
  execute([_]) => _usersRepository.getUsers();
}
