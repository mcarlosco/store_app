import '../../../data/repositories.dart';
import '../../../domain/commands.dart';
import '../../../domain/entities.dart';

import '../abstraction/notifier.dart';

final class UsersNotifier extends Notifier {
  final GetUsersCommand _getUsersCommand;
  final GetUserCommand _getUserCommand;

  List<UserEntity>? _users;
  UserEntity? _user;

  UsersNotifier(UsersRepository usersRepository)
      : _getUsersCommand = GetUsersCommand(usersRepository),
        _getUserCommand = GetUserCommand(usersRepository);

  List<UserEntity>? get users => _users;
  UserEntity? get user => _user;

  @override
  void initState() {
    getUsers().ignore();
  }

  Future<void> getUsers() {
    return _getUsersCommand.execute().then((coin) {
      coin.flip<void>((users) {
        _users = users;

        notifyListeners();
      }, handleException);
    });
  }

  Future<void> getUser(int id) {
    return _getUserCommand.execute(id).then((coin) {
      coin.flip<void>((user) {
        _user = user;

        notifyListeners();
      }, handleException);
    });
  }

  @override
  void resetState() {
    super.resetState();
    _users = null;
    _user = null;
  }
}
