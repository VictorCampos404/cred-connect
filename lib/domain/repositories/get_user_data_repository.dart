import 'package:cred_connect/data/dtos/dtos.dart';

abstract class GetUserDataRepository {
  Future<UserDto> call({required String id});
}
