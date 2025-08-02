import 'package:cred_connect/data/dtos/dtos.dart';

abstract class GetCustomersDatasource {
  Future<List<CustomerDto>> call();
}
