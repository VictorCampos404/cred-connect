import 'package:cred_connect/data/data.dart';

abstract class GetCustomersRepository {
  Future<List<CustomerDto>> call();
}
