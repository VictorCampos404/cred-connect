import 'package:cred_connect/data/dtos/dtos.dart';

abstract class CreateLoanUsecase {
  Future<void> call({required LoanDto loan});
}
