import 'package:cred_connect/data/data.dart';
import 'package:cred_connect/domain/domain.dart';
import 'package:cred_connect/domain/usecases/create_customer/create_customer_usecase.dart';

class CreateCustomerUsecaseImp implements CreateCustomerUsecase {
  final CreateCustomerRepository _createCustomerRepository;

  CreateCustomerUsecaseImp(this._createCustomerRepository);

  @override
  Future<void> call({required CustomerDto customer}) async {
    return await _createCustomerRepository(customer: customer);
  }
}
