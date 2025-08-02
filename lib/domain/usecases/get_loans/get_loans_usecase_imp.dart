import 'package:cred_connect/data/data.dart';
import 'package:cred_connect/domain/domain.dart';

import 'package:cred_connect/domain/usecases/get_loans/get_loans_usecase.dart';

class GetLoansUsecaseImp implements GetLoansUsecase {
  final GetLoansRepository _getLoansRepository;

  GetLoansUsecaseImp(this._getLoansRepository);

  @override
  Future<List<LoanDto>> call() async {
    return await _getLoansRepository();
  }
}
