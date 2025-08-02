import 'package:cred_connect/data/dtos/dtos.dart';
import 'package:cred_connect/domain/domain.dart';
import 'package:cred_connect/domain/usecases/get_user_data/get_user_data_usecase.dart';

class GetUserDataUsecaseImp implements GetUserDataUsecase {
  final GetUserDataRepository _getUserDataRepository;

  GetUserDataUsecaseImp(this._getUserDataRepository);

  @override
  Future<UserDto> call({required String id}) async {
    return await _getUserDataRepository(id: id);
  }
}
