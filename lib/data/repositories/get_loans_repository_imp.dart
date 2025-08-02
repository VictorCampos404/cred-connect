import 'package:cred_connect/core/core.dart';
import 'package:cred_connect/data/data.dart';
import 'package:cred_connect/domain/domain.dart';
import 'package:flutter/foundation.dart';

class GetLoansRepositoryImp implements GetLoansRepository {
  final GetLoansDatasource _getLoansDatasource;

  GetLoansRepositoryImp(this._getLoansDatasource);

  @override
  Future<List<LoanDto>> call() async {
    try {
      return await _getLoansDatasource();
    } on SystemException catch (e) {
      debugPrint(e.toString());
      rethrow;
    } catch (e) {
      debugPrint(e.toString());
      throw SystemException.unknow();
    }
  }
}
