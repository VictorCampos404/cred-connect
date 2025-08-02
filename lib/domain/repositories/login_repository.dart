abstract class LoginRepository {
  Future<bool> call({required String phone, required String password});
}
