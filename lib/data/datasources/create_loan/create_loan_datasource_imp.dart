import 'package:cred_connect/core/core.dart';
import 'package:cred_connect/data/data.dart';
import 'package:cred_connect/data/datasources/create_loan/create_loan_datasource.dart';

class CreateLoanDatasourceImp implements CreateLoanDatasource {
  final LocalDatabaseService _localDatabaseService;
  final UserSessionService _userSessionService;

  CreateLoanDatasourceImp(this._localDatabaseService, this._userSessionService);

  @override
  Future<void> call({required LoanDto loan}) async {
    if (!_userSessionService.hasLogged) {
      throw SystemException(title: "Error!", message: "Access denied.");
    }

    loan.userId = _userSessionService.userId;

    await _localDatabaseService.save("loans", loan.toMap());
  }
}
