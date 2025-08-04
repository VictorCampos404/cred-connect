import 'package:cred_connect/core/core.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppRouter {
  static bool get canPop => Modular.routerDelegate.canPop();

  static pop() {
    if (!canPop) return;

    return Modular.to.pop();
  }

  static goToWelcomePage() async {
    return Modular.to.pushNamed(Routes.welcomePage);
  }

  static goToLoginPage({bool popAndPush = false}) async {
    if (popAndPush) {
      return Modular.to.popAndPushNamed(Routes.loginPage);
    }

    return Modular.to.pushNamed(Routes.loginPage);
  }

  static goToCreateAccountPage({bool popAndPush = false}) async {
    if (popAndPush) {
      return Modular.to.popAndPushNamed(Routes.createAccountPage);
    }

    return Modular.to.pushNamed(Routes.createAccountPage);
  }

  static goToHomePage() async {
    return Modular.to.pushNamedAndRemoveUntil(Routes.homePage, (_) => false);
  }

  static goToAmountPage() async {
    return Modular.to.pushNamed(Routes.amountPage);
  }

  static goToCreateCustomerPage() async {
    return Modular.to.pushNamed(Routes.createCustomerPage);
  }

  static goToCreateLoanPage() async {
    return Modular.to.pushNamed(Routes.createLoanPage);
  }

  static goToSuccessPage() async {
    return Modular.to.pushNamed(Routes.successPage);
  }
}
