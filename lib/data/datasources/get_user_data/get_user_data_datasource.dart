import 'package:cred_connect/data/dtos/dtos.dart';

abstract class GetUserDataDatasource {
  Future<UserDto> call();
}
