import 'package:cred_connect/core/core.dart';
import 'package:cred_connect/data/data.dart';
import 'package:cred_connect/domain/domain.dart';
import 'package:flutter/material.dart';

class LoanController extends ChangeNotifier {
  final GetBalanceUsecase _getBalanceUsecase;
  final CreateLoanUsecase _createLoanUsecase;
  final GetLoansUsecase _getLoansUsecase;

  bool get isLoading => _isGetBalanceLoading || _isGetLoansLoading;

  late bool _isGetBalanceLoading;
  bool get isGetBalanceLoading => _isGetBalanceLoading;

  late double _balance;
  double get balance => _balance;

  late bool _isGetLoansLoading;
  bool get isGetLoansLoading => _isGetLoansLoading;

  late List<LoanDto> _loans;
  List<LoanDto> get loans => _loans;

  late bool _isCreateLoanLoading;
  bool get isCreateLoanLoading => _isCreateLoanLoading;

  TextEditingController amountCtrl = TextEditingController();

  late String? _customerId;
  String? get customerId => _customerId;

  late TermType? _term;
  TermType? get term => _term;

  bool get buttonCreateLoanEnable =>
      amountCtrl.text.isNotEmpty && _customerId != null && _term != null;

  LoanController(
    this._getBalanceUsecase,
    this._createLoanUsecase,
    this._getLoansUsecase,
  ) {
    reset();
  }

  void reset() {
    resetCreateLoan();
    _balance = 0;
    _isGetBalanceLoading = false;
    _isGetLoansLoading = false;
    _loans = [];
    _isCreateLoanLoading = false;
  }

  void resetCreateLoan() {
    amountCtrl = TextEditingController();
    _customerId = null;
    _term = null;
    notifyListeners();
  }

  void setStatus() {
    notifyListeners();
  }

  void setTerm(value) {
    _term = value;
    notifyListeners();
  }

  void setCustomerId(value) {
    _customerId = value;
    notifyListeners();
  }

  Future<RequestResult> getBalance() async {
    _isGetBalanceLoading = true;
    notifyListeners();

    try {
      _balance = await _getBalanceUsecase();

      _isGetBalanceLoading = false;
      notifyListeners();

      return RequestResult(status: true);
    } on SystemException catch (error) {
      _isGetBalanceLoading = false;
      notifyListeners();
      return error.toRequestResult();
    }
  }

  Future<RequestResult> getLoans() async {
    _isGetLoansLoading = true;
    notifyListeners();

    try {
      _loans = await _getLoansUsecase();

      _isGetLoansLoading = false;
      notifyListeners();

      return RequestResult(status: true);
    } on SystemException catch (error) {
      _isGetLoansLoading = false;
      notifyListeners();
      return error.toRequestResult();
    }
  }

  Future<RequestResult> createLoan() async {
    _isCreateLoanLoading = true;
    notifyListeners();

    try {
      await _createLoanUsecase(
        loan: LoanDto(
          amount: MoneyFormat.unFormat(amountCtrl.text),
          customerId: _customerId,
          term: _term,
          interestRate: 0.0639,
          createdAt: DateTime.now(),
        ),
      );

      _loans = await _getLoansUsecase();
      _balance = await _getBalanceUsecase();

      _isCreateLoanLoading = false;
      notifyListeners();

      return RequestResult(status: true);
    } on SystemException catch (error) {
      _isCreateLoanLoading = false;
      notifyListeners();
      return error.toRequestResult();
    }
  }
}
