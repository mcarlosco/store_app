import 'package:fun_pro_pkg/fun_pro_pkg.dart';

import '../../../../data/repositories.dart';

import '../../../entities.dart';

import '../../abstraction/command.dart';

final class GetUserCommand
    implements Command<Future<Coin<UserEntity, Exception>>, int> {
  final UsersRepository _usersRepository;

  const GetUserCommand(this._usersRepository);

  @override
  execute(id) => _usersRepository.getUser(id);
}
