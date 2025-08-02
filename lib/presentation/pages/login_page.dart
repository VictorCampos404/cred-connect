import 'package:cred_connect/domain/usecases/usecases.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            Modular.get<LoginUsecase>()(phone: "123", password: "senha123");
          },
          child: Text("Login"),
        ),
      ),
    );
  }
}
