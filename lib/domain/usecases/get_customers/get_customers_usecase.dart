import 'package:cred_connect/data/data.dart';

abstract class GetCustomersUsecase {
  Future<List<CustomerDto>> call();
}
