import 'package:cred_connect/core/core.dart';
import 'package:cred_connect/data/data.dart';
import 'package:cred_connect/domain/domain.dart';
import 'package:flutter/foundation.dart';

class GetCustomersRepositoryImp implements GetCustomersRepository {
  final GetCustomersDatasource _getCustomersDatasource;

  GetCustomersRepositoryImp(this._getCustomersDatasource);

  @override
  Future<List<CustomerDto>> call() async {
    try {
      return await _getCustomersDatasource();
    } on SystemException catch (e) {
      debugPrint(e.toString());
      rethrow;
    } catch (e) {
      debugPrint(e.toString());
      throw SystemException.unknow();
    }
  }
}
