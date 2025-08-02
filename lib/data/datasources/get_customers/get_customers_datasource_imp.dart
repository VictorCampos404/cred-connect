import 'package:cred_connect/core/core.dart';
import 'package:cred_connect/data/datasources/get_customers/get_customers_datasource.dart';
import 'package:cred_connect/data/dtos/dtos.dart';

class GetCustomersDatasourceImp implements GetCustomersDatasource {
  final LocalDatabaseService _localDatabaseService;
  final UserSessionService _userSessionService;

  GetCustomersDatasourceImp(
    this._localDatabaseService,
    this._userSessionService,
  );

  @override
  Future<List<CustomerDto>> call() async {
    if (!_userSessionService.hasLogged) {
      throw SystemException(title: "Error!", message: "Access denied.");
    }

    final response = await _localDatabaseService.getAll('customers');

    final allCustomers = response
        .map((element) => CustomerDto.fromMap(element))
        .toList();

    final matchCustomers = allCustomers.where((element) {
      return element.userId == _userSessionService.userId;
    }).toList();

    return matchCustomers;
  }
}
