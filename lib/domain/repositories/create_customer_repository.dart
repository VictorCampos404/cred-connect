import 'package:cred_connect/data/dtos/dtos.dart';

abstract class CreateCustomerRepository {
  Future<void> call({required CustomerDto customer});
}
