import 'package:cred_connect/data/data.dart';

abstract class GetLoansRepository {
  Future<List<LoanDto>> call();
}
