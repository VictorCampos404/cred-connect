import 'package:cred_connect/core/core.dart';
import 'package:cred_connect/data/dtos/user_dto.dart';
import 'package:cred_connect/domain/domain.dart';
import 'package:flutter/material.dart';

class UserController extends ChangeNotifier {
  final CreateAccountUsecase _createAccountUsecase;
  final LoginUsecase _loginUsecase;
  final GetUserDataUsecase _getUserDataUsecase;

  late bool _isLoginLoading;
  bool get isLoginLoading => _isLoginLoading;

  TextEditingController phoneCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  bool get buttonLoginEnable =>
      phoneCtrl.text.isNotEmpty && passwordCtrl.text.isNotEmpty;

  late bool _isCreateAccountLoading;
  bool get isCreateAccountLoading => _isCreateAccountLoading;

  TextEditingController newNameCtrl = TextEditingController();
  TextEditingController newPhoneCtrl = TextEditingController();
  TextEditingController newPasswordCtrl = TextEditingController();
  TextEditingController newRepeatPasswordCtrl = TextEditingController();

  bool get buttonCreateAccountEnable =>
      newNameCtrl.text.isNotEmpty &&
      newPhoneCtrl.text.isNotEmpty &&
      newPasswordCtrl.text.isNotEmpty &&
      newPasswordCtrl.text == newRepeatPasswordCtrl.text;

  late UserDto? _currentUser;
  UserDto? get currentUser => _currentUser;

  UserController(
    this._createAccountUsecase,
    this._loginUsecase,
    this._getUserDataUsecase,
  ) {
    reset();
  }

  void reset() {
    resetLogin();
    resetCreateAccount();
    _currentUser = null;
    _isLoginLoading = false;
    _isCreateAccountLoading = false;
  }

  void resetLogin() {
    phoneCtrl = TextEditingController();
    passwordCtrl = TextEditingController();
    notifyListeners();
  }

  void resetCreateAccount() {
    newNameCtrl = TextEditingController();
    newPhoneCtrl = TextEditingController();
    newPasswordCtrl = TextEditingController();
    newRepeatPasswordCtrl = TextEditingController();
    notifyListeners();
  }

  void setStatus() {
    notifyListeners();
  }

  Future<RequestResult> login() async {
    _isLoginLoading = true;
    notifyListeners();

    try {
      final success = await _loginUsecase(
        phone: Masks.phoneMask.unmaskText(phoneCtrl.text),
        password: passwordCtrl.text,
      );

      if (success) {
        _currentUser = await _getUserDataUsecase();
      }

      _isLoginLoading = false;
      notifyListeners();

      return RequestResult(status: true);
    } on SystemException catch (error) {
      _isLoginLoading = false;
      notifyListeners();
      return error.toRequestResult();
    }
  }

  Future<RequestResult> createAccount() async {
    _isCreateAccountLoading = true;
    notifyListeners();

    try {
      await _createAccountUsecase(
        user: UserDto(
          name: newNameCtrl.text,
          phone: Masks.phoneMask.unmaskText(newPhoneCtrl.text),
          password: newPasswordCtrl.text,
          createdAt: DateTime.now(),
        ),
      );

      _isCreateAccountLoading = false;
      notifyListeners();

      return RequestResult(
        status: true,
        title: "Success in creating your account!",
        message: "Log in to access the dashboard",
      );
    } on SystemException catch (error) {
      _isCreateAccountLoading = false;
      notifyListeners();

      return error.toRequestResult();
    }
  }
}
