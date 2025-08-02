import 'package:cred_connect/core/core.dart';
import 'package:cred_connect/data/data.dart';

class CreateAccountDatasourceImp implements CreateAccountDatasource {
  final LocalDatabaseService _localDatabaseService;

  CreateAccountDatasourceImp(this._localDatabaseService);

  @override
  Future<void> call({required UserDto user}) async {
    await _localDatabaseService.save("users", user.toMap());
  }
}
