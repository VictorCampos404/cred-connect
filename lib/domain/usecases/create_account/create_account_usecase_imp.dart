import 'package:cred_connect/data/data.dart';
import 'package:cred_connect/domain/domain.dart';
import 'package:cred_connect/domain/usecases/create_account/create_account_usecase.dart';

class CreateAccountUsecaseImp implements CreateAccountUsecase {
  final CreateAccountRepository _createAccountRepository;

  CreateAccountUsecaseImp(this._createAccountRepository);

  @override
  Future<void> call({required UserDto user}) async {
    return await _createAccountRepository(user: user);
  }
}
