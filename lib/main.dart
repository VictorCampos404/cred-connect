import 'package:cred_connect/start/app_root.dart';
import 'package:cred_connect/start/app_settings.dart';
import 'package:flutter/material.dart';

void main() async {
  await AppSettings.init();
  final root = AppRoot();
  runApp(root);
}
