import 'dart:developer';

import 'package:cred_connect/core/core.dart';
import 'package:cred_connect/data/data.dart';
import 'package:cred_connect/domain/domain.dart';

class GetLoansRepositoryImp implements GetLoansRepository {
  final GetLoansDatasource _getLoansDatasource;

  GetLoansRepositoryImp(this._getLoansDatasource);

  @override
  Future<List<LoanDto>> call() async {
    try {
      return await _getLoansDatasource();
    } on SystemException catch (_) {
      rethrow;
    } catch (e) {
      log(e.toString());
      throw SystemException.unknow();
    }
  }
}
