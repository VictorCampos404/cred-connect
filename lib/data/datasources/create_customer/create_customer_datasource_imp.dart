import 'package:cred_connect/core/core.dart';
import 'package:cred_connect/data/data.dart';
import 'package:cred_connect/domain/usecases/get_customers/get_customers_usecase.dart';

class CreateCustomerDatasourceImp implements CreateCustomerDatasource {
  final LocalDatabaseService _localDatabaseService;
  final UserSessionService _userSessionService;
  final GetCustomersUsecase _getCustomersUsecase;

  CreateCustomerDatasourceImp(
    this._localDatabaseService,
    this._userSessionService,
    this._getCustomersUsecase,
  );

  @override
  Future<void> call({required CustomerDto customer}) async {
    if (!_userSessionService.hasLogged) {
      throw SystemException(title: "Error!", message: "Access denied.");
    }

    final allCustomers = await _getCustomersUsecase();

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
