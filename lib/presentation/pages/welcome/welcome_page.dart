import 'package:cred_connect/core/core.dart';
import 'package:cred_connect/core/utils/app_router.dart';
import 'package:cred_connect/presentation/controllers/controllers.dart';
import 'package:cred_connect/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserController>(
      builder: (context, userController, _) {
        return Scaffold(
          backgroundColor: AppColors.background,
          body: SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(Spaces.x3),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      child: Image.asset(
                        AppImages.welcome,
                        width: 320,
                        height: 320,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: Spaces.x1),
                      child: Text(
                        "Welcome to CredConnect",
                        style: AppTextStyles.bold.copyWith(fontSize: 30),
                      ),
                    ),
                    Text(
                      "The loan bank for everyone.",
                      style: AppTextStyles.light.copyWith(fontSize: 17),
                    ),
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.only(
              top: Spaces.x2,
              left: Spaces.x2,
              right: Spaces.x2,
              bottom: Spaces.x4,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                PrimaryButton(
                  text: "create your free account",
                  onTap: () {
                    userController.resetCreateAccount();
                    AppRouter.goToCreateAccountPage();
                  },
                ),
                SizedBox(height: Spaces.x2),
                SecondaryButton(
                  text: "log into your account",
                  onTap: () {
                    userController.resetLogin();
                    AppRouter.goToLoginPage();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
