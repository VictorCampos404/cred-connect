import 'dart:developer';

import 'package:cred_connect/core/core.dart';
import 'package:cred_connect/data/data.dart';
import 'package:cred_connect/domain/domain.dart';

class GetCustomersRepositoryImp implements GetCustomersRepository {
  final GetCustomersDatasource _getCustomersDatasource;

  GetCustomersRepositoryImp(this._getCustomersDatasource);

  @override
  Future<List<CustomerDto>> call() async {
    try {
      return await _getCustomersDatasource();
    } on SystemException catch (_) {
      rethrow;
    } catch (e) {
      log(e.toString());
      throw SystemException.unknow();
    }
  }
}
