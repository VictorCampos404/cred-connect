import 'package:cred_connect/domain/domain.dart';
import 'package:cred_connect/domain/usecases/get_balance/get_balance_usecase.dart';

class GetBalanceUsecaseImp implements GetBalanceUsecase {
  final GetBalanceRepository _getUserBalanceRepository;

  GetBalanceUsecaseImp(this._getUserBalanceRepository);

  @override
  Future<double> call() async {
    return await _getUserBalanceRepository();
  }
}
