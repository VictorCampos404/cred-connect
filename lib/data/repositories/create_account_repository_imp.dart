import 'package:cred_connect/core/core.dart';
import 'package:cred_connect/data/data.dart';
import 'package:cred_connect/domain/domain.dart';
import 'package:flutter/foundation.dart';

class CreateAccountRepositoryImp implements CreateAccountRepository {
  final CreateAccountDatasource _createAccountDatasource;

  CreateAccountRepositoryImp(this._createAccountDatasource);

  @override
  Future<void> call({required UserDto user}) async {
    try {
      return await _createAccountDatasource(user: user);
    } on SystemException catch (e) {
      debugPrint(e.toString());
      rethrow;
    } catch (e) {
      debugPrint(e.toString());
      throw SystemException.unknow();
    }
  }
}
