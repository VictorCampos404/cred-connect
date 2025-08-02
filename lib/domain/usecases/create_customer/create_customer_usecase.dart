import 'package:cred_connect/data/dtos/dtos.dart';

abstract class CreateCustomerUsecase {
  Future<void> call({required CustomerDto customer});
}
