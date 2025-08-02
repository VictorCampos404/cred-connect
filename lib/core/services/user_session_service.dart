class UserSessionService {
  String? userId;

  bool get hasLogged => (userId ?? '').isNotEmpty;

  UserSessionService();

  void setUserId(String id) {
    userId = id;
  }

  void resetUserId() {
    userId = null;
  }
}
