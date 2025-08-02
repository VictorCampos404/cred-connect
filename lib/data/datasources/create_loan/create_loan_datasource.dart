import 'package:cred_connect/data/dtos/dtos.dart';

abstract class CreateLoanDatasource {
  Future<void> call({required LoanDto loan});
}
