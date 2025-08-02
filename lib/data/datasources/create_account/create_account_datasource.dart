import 'package:cred_connect/data/dtos/dtos.dart';

abstract class CreateAccountDatasource {
  Future<void> call({required UserDto user});
}
