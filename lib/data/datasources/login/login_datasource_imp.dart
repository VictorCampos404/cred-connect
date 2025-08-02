import 'package:cred_connect/core/core.dart';
import 'package:cred_connect/data/data.dart';

class LoginDatasourceImp implements LoginDatasource {
  final LocalDatabaseService _localDatabaseService;
  final UserSessionService _userSessionService;

  LoginDatasourceImp(this._localDatabaseService, this._userSessionService);

  @override
  Future<bool> call({required String phone, required String password}) async {
    final response = await _localDatabaseService.getAll('users');

    final allUsers = response
        .map((element) => UserDto.fromMap(element))
        .toList();

    final matchUsers = allUsers.where((element) {
      return element.phone == phone && element.password == password;
    });

    if (matchUsers.isEmpty) {
      throw SystemException(
        title: "Error logging in!",
        message: "Incorrect password or user not found.",
      );
    }

    _userSessionService.setUserId(matchUsers.first.id ?? '');

    return true;
  }
}
