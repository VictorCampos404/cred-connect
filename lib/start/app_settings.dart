import 'package:cred_connect/core/constants/routes.dart';
import 'package:cred_connect/start/app_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppSettings {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    Modular.init(AppModule());

    Modular.setInitialRoute(Routes.createLoanPage);
  }
}
