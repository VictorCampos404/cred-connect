import 'package:cred_connect/core/core.dart';
import 'package:cred_connect/data/data.dart';
import 'package:cred_connect/domain/domain.dart';
import 'package:flutter/foundation.dart';

class GetUserDataRepositoryImp implements GetUserDataRepository {
  final GetUserDataDatasource _getUserDataDatasource;

  GetUserDataRepositoryImp(this._getUserDataDatasource);

  @override
  Future<UserDto> call() async {
    try {
      return await _getUserDataDatasource();
    } on SystemException catch (e) {
      debugPrint(e.toString());
      rethrow;
    } catch (e) {
      debugPrint(e.toString());
      throw SystemException.unknow();
    }
  }
}
