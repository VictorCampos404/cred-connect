abstract class LoginDatasource {
  Future<bool> call({required String phone, required String password});
}
