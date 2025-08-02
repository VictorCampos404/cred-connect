import 'package:cred_connect/core/core.dart';
import 'package:cred_connect/data/data.dart';

class LoginDatasourceImp implements LoginDatasource {
  final LocalDatabaseService _localDatabaseService;

  LoginDatasourceImp(this._localDatabaseService);

  @override
  Future<bool> call({required String phone, required String password}) async {
    final response = await _localDatabaseService.getAll('users');

    final allUsers =
        response.map((element) => UserDto.fromMap(element)).toList();

    final matchUsers = allUsers.where((element) {
      return element.phone == phone && element.password == password;
    });

    return matchUsers.isNotEmpty;
  }
}
