import 'package:cred_connect/core/core.dart';
import 'package:cred_connect/data/data.dart';
import 'package:cred_connect/domain/domain.dart';
import 'package:flutter/foundation.dart';

class LoginRepositoryImp implements LoginRepository {
  final LoginDatasource _loginDatasource;

  LoginRepositoryImp(this._loginDatasource);

  @override
  Future<bool> call({required String phone, required String password}) async {
    try {
      return await _loginDatasource(phone: phone, password: password);
    } on SystemException catch (e) {
      debugPrint(e.toString());
      rethrow;
    } catch (e) {
      debugPrint(e.toString());
      throw SystemException.unknow();
    }
  }
}
