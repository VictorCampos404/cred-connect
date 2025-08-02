import 'package:cred_connect/data/data.dart';
import 'package:cred_connect/domain/domain.dart';
import 'package:cred_connect/domain/usecases/create_loan/create_loan_usecase.dart';

class CreateLoanUsecaseImp implements CreateLoanUsecase {
  final CreateLoanRepository _createLoanRepository;

  CreateLoanUsecaseImp(this._createLoanRepository);

  @override
  Future<void> call({required LoanDto loan}) async {
    return await _createLoanRepository(loan: loan);
  }
}
