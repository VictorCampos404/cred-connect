import 'package:cred_connect/core/core.dart';
import 'package:cred_connect/data/data.dart';

class GetUserDataDatasourceImp implements GetUserDataDatasource {
  final LocalDatabaseService _localDatabaseService;
  final UserSessionService _userSessionService;

  GetUserDataDatasourceImp(
    this._localDatabaseService,
    this._userSessionService,
  );

  @override
  Future<UserDto> call() async {
    if (!_userSessionService.hasLogged) {
      throw SystemException(title: "Error!", message: "Access denied.");
    }

    final response = await _localDatabaseService.getAll('users');

    final allUsers = response
        .map((element) => UserDto.fromMap(element))
        .toList();

    final matchUsers = allUsers.where((element) {
      return element.id == _userSessionService.userId;
    });

    if (matchUsers.isEmpty) {
      throw SystemException(title: "Error!", message: "User not found.");
    }

    return matchUsers.first;
  }
}
