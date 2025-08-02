import 'package:cred_connect/core/core.dart';
import 'package:cred_connect/data/data.dart';
import 'package:cred_connect/data/datasources/create_customer/create_customer_datasource.dart';

class CreateCustomerDatasourceImp implements CreateCustomerDatasource {
  final LocalDatabaseService _localDatabaseService;
  final UserSessionService _userSessionService;

  CreateCustomerDatasourceImp(
    this._localDatabaseService,
    this._userSessionService,
  );

  @override
  Future<void> call({required CustomerDto customer}) async {
    if (!_userSessionService.hasLogged) {
      throw SystemException(title: "Error!", message: "Access denied.");
    }

    final response = await _localDatabaseService.getAll('customers');

    final allCustomers = response
        .map((element) => CustomerDto.fromMap(element))
        .toList();

    final matchCustomers = allCustomers.where((element) {
      return element.nid == customer.nid;
    }).toList();

    if (matchCustomers.isNotEmpty) {
      throw SystemException(
        title: "Customer already registred!",
        message: "Try using another NID.",
      );
    }

    customer.userId = _userSessionService.userId;

    await _localDatabaseService.save("customers", customer.toMap());
  }
}
