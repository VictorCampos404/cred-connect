import 'dart:developer';

import 'package:cred_connect/core/core.dart';
import 'package:cred_connect/data/data.dart';
import 'package:cred_connect/domain/domain.dart';

class LoginRepositoryImp implements LoginRepository {
  final LoginDatasource _loginDatasource;

  LoginRepositoryImp(this._loginDatasource);

  @override
  Future<bool> call({required String phone, required String password}) async {
    try {
      return await _loginDatasource(phone: phone, password: password);
    } on SystemException catch (_) {
      rethrow;
    } catch (e) {
      log(e.toString());
      throw SystemException.unknow();
    }
  }
}
