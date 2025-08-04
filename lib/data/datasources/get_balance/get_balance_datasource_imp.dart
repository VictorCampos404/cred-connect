import 'package:cred_connect/data/data.dart';
import 'package:cred_connect/data/datasources/get_balance/get_balance_datasource.dart';
import 'package:cred_connect/domain/usecases/get_loans/get_loans_usecase.dart';

class GetBalanceDatasourceImp implements GetBalanceDatasource {
  final GetLoansUsecase _getLoansUsecase;

  GetBalanceDatasourceImp(this._getLoansUsecase);

  @override
  Future<double> call() async {
    //Valor mockado definido pelo teste
    final totalAvaliable = 100000.0;

    final loans = await _getLoansUsecase();

    double totalLoans = 0;

    for (int i = 0; i < loans.length; i++) {
      totalLoans += loans[i].amount ?? 0;
    }

    return totalAvaliable - totalLoans;
  }
}
