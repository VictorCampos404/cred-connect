import 'package:flutter/material.dart';
import 'package:cred_connect/core/core.dart';
import 'package:cred_connect/core/utils/app_router.dart';
import 'package:cred_connect/presentation/widgets/widgets.dart';

class CreateLoanPage extends StatefulWidget {
  const CreateLoanPage({super.key});

  @override
  State<CreateLoanPage> createState() => _CreateLoanPageState();
}

class _CreateLoanPageState extends State<CreateLoanPage> {
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
            icon: CustomIcons.arrow_left_s_line,
            onTap: () {
              AppRouter.pop();
            },
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(Spaces.x2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: Spaces.x2),
                    child: Text(
                      "Amount and term",
                      style: AppTextStyles.medium.copyWith(fontSize: 15),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomInput(
                          title: "Loan Amount",
                          hint: "R\$ 0,00",
                        ),
                      ),
                      SizedBox(width: Spaces.x2),
                      Expanded(
                        child: CustomInput(
                          title: "Term (months)",
                          hint: "Select a term",
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: Spaces.x2),
                    child: CustomInput(
                      title: "Select customer",
                      hint: 'Select a customer',
                      required: true,
                      suffix: Padding(
                        padding: const EdgeInsets.all(Spaces.x2),
                        child: InkWell(
                          onTap: () {
                            AppRouter.goToCreateCustomerPage();
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "+ Add new",
                                style: AppTextStyles.normal.copyWith(
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  CustomInput(
                    title: "Interest rate (%)",
                    hint: '6.39 - Basic Loan',
                    textInputType: TextInputType.number,
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
                text: "Save new customer",
                onTap: () {
                  AppRouter.goToSuccessPage();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
