import 'package:cred_connect/core/core.dart';
import 'package:cred_connect/data/data.dart';
import 'package:cred_connect/domain/domain.dart';
import 'package:flutter/foundation.dart';

class GetBalanceRepositoryImp implements GetBalanceRepository {
  final GetBalanceDatasource _getBalanceDatasource;

  GetBalanceRepositoryImp(this._getBalanceDatasource);

  @override
  Future<double> call() async {
    try {
      return await _getBalanceDatasource();
    } on SystemException catch (e) {
      debugPrint(e.toString());
      rethrow;
    } catch (e) {
      debugPrint(e.toString());
      throw SystemException.unknow();
    }
  }
}
