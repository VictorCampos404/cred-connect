import 'package:cred_connect/core/core.dart';
import 'package:cred_connect/core/utils/app_router.dart';
import 'package:cred_connect/core/utils/pop_up.dart';
import 'package:cred_connect/presentation/controllers/controllers.dart';
import 'package:cred_connect/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:provider/provider.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserController>(
      builder: (context, userController, _) {
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
                  if (userController.isCreateAccountLoading) return;

                  AppRouter.pop();
                },
              ),
            ),
            body: userController.isCreateAccountLoading
                ? Center(child: CircularProgressIndicator())
                : SafeArea(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(Spaces.x2),
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
                                style: AppTextStyles.normal.copyWith(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            CustomInput(
                              title: "Full name",
                              hint: "Name",
                              controller: userController.newNameCtrl,
                              onChanged: (value) {
                                userController.setStatus();
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: Spaces.x2,
                              ),
                              child: CustomInput(
                                title: "Phone number",
                                hint: "+ 000 000 000 0000",
                                controller: userController.newPhoneCtrl,
                                inputFormatters: [Masks.phoneMask],
                                textInputType: TextInputType.number,
                                onChanged: (value) {
                                  userController.setStatus();
                                },
                              ),
                            ),
                            CustomInput(
                              title: "Password",
                              hint: '*********',
                              isPassword: true,
                              controller: userController.newPasswordCtrl,
                              onChanged: (value) {
                                userController.setStatus();
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: Spaces.x2),
                              child: CustomInput(
                                title: "Repeat password",
                                hint: '*********',
                                controller:
                                    userController.newRepeatPasswordCtrl,
                                isPassword: true,
                                onChanged: (value) {
                                  userController.setStatus();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
            bottomNavigationBar: userController.isCreateAccountLoading
                ? null
                : Padding(
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
                          disable: !userController.buttonCreateAccountEnable,
                          text: "Create your account",
                          onTap: () async {
                            final result = await userController.createAccount();

                            if (result.status) {
                              userController.resetLogin();
                              AppRouter.goToLoginPage(popAndPush: true);
                              await Future.delayed(Duration(milliseconds: 200));
                            }

                            PopUp.showResult(result: result);
                          },
                        ),
                        SizedBox(height: Spaces.x2),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    'Do you already have a CredConnect account? ',
                                style: AppTextStyles.light.copyWith(
                                  fontSize: 15,
                                ),
                              ),
                              TextSpan(
                                text: 'Sign in here',
                                style: AppTextStyles.normal.copyWith(
                                  color: AppColors.primary,
                                  fontSize: 15,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    userController.resetLogin();
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
      },
    );
  }
}
