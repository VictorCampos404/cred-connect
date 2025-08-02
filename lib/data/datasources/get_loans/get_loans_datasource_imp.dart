import 'package:cred_connect/core/core.dart';
import 'package:cred_connect/data/datasources/get_loans/get_loans_datasource.dart';
import 'package:cred_connect/data/dtos/dtos.dart';

class GetLoansDatasourceImp implements GetLoansDatasource {
  final LocalDatabaseService _localDatabaseService;
  final UserSessionService _userSessionService;

  GetLoansDatasourceImp(this._localDatabaseService, this._userSessionService);

  @override
  Future<List<LoanDto>> call() async {
    if (!_userSessionService.hasLogged) {
      throw SystemException(title: "Error!", message: "Access denied.");
    }

    final response = await _localDatabaseService.getAll('loans');

    final allLoans = response
        .map((element) => LoanDto.fromMap(element))
        .toList();

    final matchLoans = allLoans.where((element) {
      return element.userId == _userSessionService.userId;
    }).toList();

    return matchLoans;
  }
}
