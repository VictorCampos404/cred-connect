import 'dart:developer';

import 'package:cred_connect/core/core.dart';
import 'package:cred_connect/data/data.dart';
import 'package:cred_connect/domain/domain.dart';

class CreateCustomerRepositoryImp implements CreateCustomerRepository {
  final CreateCustomerDatasource _createCustomerDatasource;

  CreateCustomerRepositoryImp(this._createCustomerDatasource);

  @override
  Future<void> call({required CustomerDto customer}) async {
    try {
      return await _createCustomerDatasource(customer: customer);
    } on SystemException catch (_) {
      rethrow;
    } catch (e) {
      log(e.toString());
      throw SystemException.unknow();
    }
  }
}
