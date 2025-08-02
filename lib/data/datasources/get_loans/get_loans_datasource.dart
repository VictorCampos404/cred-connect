import 'package:cred_connect/data/dtos/dtos.dart';

abstract class GetLoansDatasource {
  Future<List<LoanDto>> call();
}
