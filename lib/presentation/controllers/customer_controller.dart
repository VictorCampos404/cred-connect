import 'package:cred_connect/core/core.dart';
import 'package:cred_connect/data/data.dart';
import 'package:cred_connect/domain/usecases/usecases.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class CustomerController extends ChangeNotifier {
  final GetCustomersUsecase _getCustomersUsecase;
  final CreateCustomerUsecase _createCustomerUsecase;

  late bool _isGetCustomersLoading;
  bool get isGetCustomersLoading => _isGetCustomersLoading;

  late List<CustomerDto> _customers;
  List<CustomerDto> get customers => _customers;

  late bool _isCreateCustomerLoading;
  bool get isCreateCustomerLoading => _isCreateCustomerLoading;

  TextEditingController firstNameCtrl = TextEditingController();
  TextEditingController lastNameCtrl = TextEditingController();
  TextEditingController birthDateCtrl = TextEditingController();
  TextEditingController nidCtrl = TextEditingController();
  TextEditingController adressCtrl = TextEditingController();

  late GenderType? _gender;
  GenderType? get gender => _gender;

  bool get buttonCreateCustomerEnable =>
      firstNameCtrl.text.isNotEmpty &&
      lastNameCtrl.text.isNotEmpty &&
      birthDateCtrl.text.isNotEmpty &&
      nidCtrl.text.isNotEmpty;

  CustomerController(this._getCustomersUsecase, this._createCustomerUsecase) {
    reset();
  }

  void reset() {
    resetCreateCustomer();
    _isGetCustomersLoading = false;
    _customers = [];
    _isCreateCustomerLoading = false;
  }

  void resetCreateCustomer() {
    firstNameCtrl = TextEditingController();
    lastNameCtrl = TextEditingController();
    birthDateCtrl = TextEditingController();
    nidCtrl = TextEditingController();
    adressCtrl = TextEditingController();
    _gender = null;
    notifyListeners();
  }

  void setStatus() {
    notifyListeners();
  }

  void setGender(value) {
    _gender = value;
    notifyListeners();
  }

  String getCustomerName(id) {
    final customer = _customers.firstWhereOrNull((element) => element.id == id);

    if (customer != null) {
      return '${customer.firstName} ${customer.lastName}';
    }

    return '';
  }

  Future<RequestResult> getCustomers() async {
    _isGetCustomersLoading = true;
    notifyListeners();

    try {
      _customers = await _getCustomersUsecase();

      _isGetCustomersLoading = false;
      notifyListeners();

      return RequestResult(status: true);
    } on SystemException catch (error) {
      _isGetCustomersLoading = false;
      notifyListeners();
      return error.toRequestResult();
    }
  }

  Future<RequestResult> createCustomer() async {
    _isCreateCustomerLoading = true;
    notifyListeners();

    try {
      await _createCustomerUsecase(
        customer: CustomerDto(
          firstName: firstNameCtrl.text,
          lastName: lastNameCtrl.text,
          birthDate: birthDateCtrl.text.toDateTimeOrThrow(),
          gender: gender,
          nid: nidCtrl.text,
          address: adressCtrl.text,
          createdAt: DateTime.now(),
        ),
      );

      _customers = await _getCustomersUsecase();

      _isCreateCustomerLoading = false;
      notifyListeners();

      return RequestResult(status: true);
    } on SystemException catch (error) {
      _isCreateCustomerLoading = false;
      notifyListeners();
      return error.toRequestResult();
    }
  }
}
