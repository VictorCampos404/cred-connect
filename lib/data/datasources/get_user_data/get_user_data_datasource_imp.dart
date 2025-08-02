import 'package:cred_connect/core/core.dart';
import 'package:cred_connect/data/data.dart';

class GetUserDataDatasourceImp implements GetUserDataDatasource {
  final LocalDatabaseService _localDatabaseService;

  GetUserDataDatasourceImp(this._localDatabaseService);

  @override
  Future<UserDto> call({required String id}) async {
    final response = await _localDatabaseService.getAll('users');

    final allUsers = response
        .map((element) => UserDto.fromMap(element))
        .toList();

    final matchUsers = allUsers.where((element) {
      return element.id == id;
    });

    if (matchUsers.isEmpty) {
      throw SystemException(title: "Erro!", message: "Usuário não encontrado.");
    }

    return matchUsers.first;
  }
}
