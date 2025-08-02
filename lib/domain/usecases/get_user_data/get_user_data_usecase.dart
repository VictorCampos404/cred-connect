import 'package:cred_connect/data/data.dart';

abstract class GetUserDataUsecase {
  Future<UserDto> call();
}
