import 'package:cred_connect/core/core.dart';
import 'package:cred_connect/data/data.dart';
import 'package:cred_connect/domain/domain.dart';
import 'package:flutter/foundation.dart';

class CreateLoanRepositoryImp implements CreateLoanRepository {
  final CreateLoanDatasource _createLoanDatasource;

  CreateLoanRepositoryImp(this._createLoanDatasource);

  @override
  Future<void> call({required LoanDto loan}) async {
    try {
      return await _createLoanDatasource(loan: loan);
    } on SystemException catch (e) {
      debugPrint(e.toString());
      rethrow;
    } catch (e) {
      debugPrint(e.toString());
      throw SystemException.unknow();
    }
  }
}
