import 'package:cred_connect/data/dtos/dtos.dart';

abstract class CreateCustomerDatasource {
  Future<void> call({required CustomerDto customer});
}
