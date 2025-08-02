import 'package:cred_connect/data/dtos/dtos.dart';

abstract class CreateAccountRepository {
  Future<void> call({required UserDto user});
}
