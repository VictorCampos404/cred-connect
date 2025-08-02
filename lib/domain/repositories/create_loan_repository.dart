import 'package:cred_connect/data/dtos/dtos.dart';

abstract class CreateLoanRepository {
  Future<void> call({required LoanDto loan});
}
