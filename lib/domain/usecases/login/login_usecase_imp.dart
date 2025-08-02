import 'package:cred_connect/domain/domain.dart';
import 'package:cred_connect/domain/usecases/login/login_usecase.dart';

class LoginUsecaseImp implements LoginUsecase {
  final LoginRepository _loginRepository;

  LoginUsecaseImp(this._loginRepository);

  @override
  Future<bool> call({required String phone, required String password}) async {
    return await _loginRepository(phone: phone, password: password);
  }
}
