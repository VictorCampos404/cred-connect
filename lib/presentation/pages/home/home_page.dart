import 'package:cred_connect/core/utils/app_router.dart';
import 'package:cred_connect/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:cred_connect/core/constants/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: Spaces.x2),
              child: Align(child: Image.asset(AppImages.logo, width: 119)),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(Spaces.x2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: Spaces.x2,
                          bottom: Spaces.x2,
                        ),
                        child: WelcomeUser(userName: "Aisha"),
                      ),
                      BalanceDisplay(balance: 15000),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: Spaces.x4,
                          bottom: Spaces.x5,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: ItemButton(
                                text: "New Loan",
                                icon: AppImages.newLoan,
                                background: AppColors.pastelgreen,
                                onTap: () {
                                  AppRouter.goToAmountPage();
                                },
                              ),
                            ),
                            SizedBox(width: Spaces.x2),
                            Expanded(
                              child: ItemButton(
                                text: "Collect",
                                icon: AppImages.money,
                                background: AppColors.pastelOrange,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsGeometry.only(
                          bottom: Spaces.x2_half,
                        ),
                        child: Text(
                          "Tips for better work",
                          style: AppTextStyles.bold.copyWith(fontSize: 17),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsGeometry.only(bottom: Spaces.x2),
                        child: ItemButton(
                          text: "How to collect payment",
                          icon: AppImages.wallet,
                          border: true,
                        ),
                      ),
                      ItemButton(
                        text: "Manage clients and groups",
                        icon: AppImages.manage,
                        border: true,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: HomeTabBar(),
    );
  }
}
