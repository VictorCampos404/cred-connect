import 'dart:developer';

import 'package:cred_connect/core/core.dart';
import 'package:cred_connect/data/data.dart';
import 'package:cred_connect/domain/domain.dart';

class GetBalanceRepositoryImp implements GetBalanceRepository {
  final GetBalanceDatasource _getBalanceDatasource;

  GetBalanceRepositoryImp(this._getBalanceDatasource);

  @override
  Future<double> call() async {
    try {
      return await _getBalanceDatasource();
    } on SystemException catch (_) {
      rethrow;
    } catch (e) {
      log(e.toString());
      throw SystemException.unknow();
    }
  }
}
