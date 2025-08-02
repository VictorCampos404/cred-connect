import 'package:cred_connect/core/constants/constants.dart';
import 'package:cred_connect/core/core.dart';
import 'package:cred_connect/core/utils/app_router.dart';
import 'package:cred_connect/presentation/widgets/widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: CustomAppBar(
          leading: CustomIconButton(
            icon: CustomIcons.close_fill,
            onTap: () {
              AppRouter.pop();
            },
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(Spaces.x3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Sign into your\nAccount",
                    style: AppTextStyles.bold.copyWith(
                      fontSize: 35,
                      color: AppColors.primary,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: Spaces.x1,
                      bottom: Spaces.x7,
                    ),
                    child: Text(
                      "Log into your CredConnect account",
                      style: AppTextStyles.normal.copyWith(fontSize: 15),
                    ),
                  ),
                  CustomInput(
                    title: "Phone number",
                    hint: "+ 000 000 000 0000",
                    inputFormatters: [Masks.phoneMask],
                    textInputType: TextInputType.number,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: Spaces.x2),
                    child: CustomInput(
                      title: "Password",
                      hint: '*********',
                      isPassword: true,
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Have you forgotten your password?, ',
                          style: AppTextStyles.light.copyWith(fontSize: 15),
                        ),
                        TextSpan(
                          text: 'click here to recover it',
                          style: AppTextStyles.normal.copyWith(
                            color: AppColors.primary,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(Spaces.x2),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              PrimaryButton(text: "Log In", onTap: () {}),
              SizedBox(height: Spaces.x2),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Do you not have a CredConnect account? ',
                      style: AppTextStyles.light.copyWith(fontSize: 15),
                    ),
                    TextSpan(
                      text: 'Sign up here',
                      style: AppTextStyles.normal.copyWith(
                        color: AppColors.primary,
                        fontSize: 15,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          AppRouter.goToCreateAccountPage(popAndPush: true);
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
