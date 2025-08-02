import 'package:cred_connect/core/constants/constants.dart';
import 'package:cred_connect/core/core.dart';
import 'package:cred_connect/core/utils/app_router.dart';
import 'package:cred_connect/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
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
                    "Create Account",
                    style: AppTextStyles.bold.copyWith(
                      fontSize: 35,
                      color: AppColors.primary,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: Spaces.x1,
                      bottom: Spaces.x2,
                    ),
                    child: Text(
                      "Open a CredConnect account with a few details.",
                      style: AppTextStyles.normal.copyWith(fontSize: 15),
                    ),
                  ),
                  CustomInput(title: "Full name", hint: "Name"),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: Spaces.x2),
                    child: CustomInput(
                      title: "Phone number",
                      hint: "+ 000 000 000 0000",
                      inputFormatters: [Masks.phoneMask],
                      textInputType: TextInputType.number,
                    ),
                  ),
                  CustomInput(
                    title: "Password",
                    hint: '*********',
                    isPassword: true,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: Spaces.x2),
                    child: CustomInput(
                      title: "Repeat password",
                      hint: '*********',
                      isPassword: true,
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
              PrimaryButton(text: "Create your account", onTap: () {}),
              SizedBox(height: Spaces.x2),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Do you already have a CredConnect account? ',
                      style: AppTextStyles.light.copyWith(fontSize: 15),
                    ),
                    TextSpan(
                      text: 'Sign in here',
                      style: AppTextStyles.normal.copyWith(
                        color: AppColors.primary,
                        fontSize: 15,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          AppRouter.goToLoginPage(popAndPush: true);
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
