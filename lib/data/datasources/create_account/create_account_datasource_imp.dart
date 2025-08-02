import 'package:cred_connect/core/core.dart';
import 'package:cred_connect/data/data.dart';

class CreateAccountDatasourceImp implements CreateAccountDatasource {
  final LocalDatabaseService _localDatabaseService;

  CreateAccountDatasourceImp(this._localDatabaseService);

  @override
  Future<void> call({required UserDto user}) async {
    final response = await _localDatabaseService.getAll('users');

    final allUsers = response
        .map((element) => UserDto.fromMap(element))
        .toList();

    final matchUsers = allUsers.where((element) {
      return element.phone == user.phone;
    });

    if (matchUsers.isNotEmpty) {
      throw SystemException(
        title: "Celular já em uso!",
        message: "Esse celular já está em uso por outra conta",
      );
    }

    await _localDatabaseService.save("users", user.toMap());
  }
}
