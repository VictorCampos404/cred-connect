import 'package:cred_connect/core/constants/app_colors.dart';
import 'package:cred_connect/core/constants/constants.dart';
import 'package:cred_connect/core/utils/app_router.dart';
import 'package:cred_connect/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AmountPage extends StatefulWidget {
  const AmountPage({super.key});

  @override
  State<AmountPage> createState() => _AmountPageState();
}

class _AmountPageState extends State<AmountPage> {
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
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(Spaces.x2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: Spaces.x1),
                    child: Text(
                      "Simulate Loan",
                      style: AppTextStyles.medium.copyWith(
                        fontSize: 30,
                        color: AppColors.text.withValues(alpha: 0.5),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: Spaces.x2,
                      bottom: Spaces.x4,
                    ),
                    child: Text(
                      "Enter the amount you wish to borrow",
                      style: AppTextStyles.light.copyWith(fontSize: 17),
                    ),
                  ),
                  CustomMoneyInput(),
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
                text: "Continue",
                onTap: () {
                  AppRouter.goToCreateLoanPage();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
