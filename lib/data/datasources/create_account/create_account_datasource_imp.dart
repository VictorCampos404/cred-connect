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
        title: "Phone already in use!",
        message: "This phone is already in use by another account",
      );
    }

    await _localDatabaseService.save("users", user.toMap());
  }
}
