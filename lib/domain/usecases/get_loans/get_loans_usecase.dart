import 'package:cred_connect/data/data.dart';

abstract class GetLoansUsecase {
  Future<List<LoanDto>> call();
}
