import 'package:cred_connect/core/core.dart';
import 'package:cred_connect/data/data.dart';
import 'package:cred_connect/data/datasources/get_balance/get_balance_datasource.dart';

class GetBalanceDatasourceImp implements GetBalanceDatasource {
  final LocalDatabaseService _localDatabaseService;
  final UserSessionService _userSessionService;

  GetBalanceDatasourceImp(this._localDatabaseService, this._userSessionService);

  @override
  Future<double> call() async {
    return 100000;
  }
}
