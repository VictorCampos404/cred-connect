import 'package:cred_connect/data/data.dart';
import 'package:cred_connect/domain/domain.dart';
import 'package:cred_connect/domain/usecases/get_customers/get_customers_usecase.dart';

class GetCustomersUsecaseImp implements GetCustomersUsecase {
  final GetCustomersRepository _getCustomersRepository;

  GetCustomersUsecaseImp(this._getCustomersRepository);

  @override
  Future<List<CustomerDto>> call() async {
    return await _getCustomersRepository();
  }
}
