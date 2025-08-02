import 'package:cred_connect/data/dtos/dtos.dart';
import 'package:cred_connect/domain/domain.dart';

class GetUserDataUsecaseImp implements GetUserDataUsecase {
  final GetUserDataRepository _getUserDataRepository;

  GetUserDataUsecaseImp(this._getUserDataRepository);

  @override
  Future<UserDto> call() async {
    return await _getUserDataRepository();
  }
}
