import 'package:cred_connect/core/core.dart';
import 'package:cred_connect/data/data.dart';
import 'package:cred_connect/domain/usecases/get_balance/get_balance_usecase.dart';

class CreateLoanDatasourceImp implements CreateLoanDatasource {
  final LocalDatabaseService _localDatabaseService;
  final UserSessionService _userSessionService;
  final GetBalanceUsecase _getBalanceUsecase;

  CreateLoanDatasourceImp(
    this._localDatabaseService,
    this._userSessionService,
    this._getBalanceUsecase,
  );

  @override
  Future<void> call({required LoanDto loan}) async {
    if (!_userSessionService.hasLogged) {
      throw SystemException(title: "Error!", message: "Access denied.");
    }

    final balance = await _getBalanceUsecase();

    if (balance < (loan.amount ?? 0)) {
      throw SystemException(
        title: "Error!",
        message: "No balance for the loan",
      );
    }

    loan.userId = _userSessionService.userId;

    await _localDatabaseService.save("loans", loan.toMap());
  }
}
