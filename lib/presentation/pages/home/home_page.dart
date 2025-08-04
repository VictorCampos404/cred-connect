import 'package:cred_connect/core/utils/app_router.dart';
import 'package:cred_connect/presentation/controllers/controllers.dart';
import 'package:cred_connect/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:cred_connect/core/constants/constants.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Future.microtask(() async {
      final loanController = Modular.get<LoanController>();

      await Future.wait([
        loanController.getBalance(),
        loanController.getLoans(),
      ]);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<UserController, LoanController>(
      builder: (context, userController, loanController, _) {
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
                  child: loanController.isLoading
                      ? Center(child: CircularProgressIndicator())
                      : SingleChildScrollView(
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
                                  child: WelcomeUser(
                                    userName:
                                        userController.currentUser?.name ?? '',
                                  ),
                                ),
                                BalanceDisplay(balance: loanController.balance),
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
                                            loanController.resetCreateLoan();
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
                                    style: AppTextStyles.bold.copyWith(
                                      fontSize: 17,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsGeometry.only(
                                    bottom: Spaces.x2,
                                  ),
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
      },
    );
  }
}
