import 'package:cred_connect/data/dtos/dtos.dart';

abstract class CreateAccountUsecase {
  Future<void> call({required UserDto user});
}
