import 'package:cred_connect/core/core.dart';
import 'package:cred_connect/core/utils/app_router.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2), () {
      AppRouter.goToWelcomePage();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Center(child: Image.asset(AppImages.logo, width: 178)),
      ),
    );
  }
}
