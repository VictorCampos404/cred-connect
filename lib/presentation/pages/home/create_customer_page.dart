import 'package:cred_connect/core/core.dart';
import 'package:cred_connect/core/utils/app_router.dart';
import 'package:cred_connect/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CreateCustomerPage extends StatefulWidget {
  const CreateCustomerPage({super.key});

  @override
  State<CreateCustomerPage> createState() => _CreateCustomerPageState();
}

class _CreateCustomerPageState extends State<CreateCustomerPage> {
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
                      "New customer",
                      style: AppTextStyles.medium.copyWith(fontSize: 15),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomInput(
                          title: "First name",
                          hint: "First name",
                        ),
                      ),
                      SizedBox(width: Spaces.x2),
                      Expanded(
                        child: CustomInput(
                          title: "Last name",
                          hint: "Last name",
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: Spaces.x2),
                    child: CustomInput(
                      title: "Date of birth",
                      hint: "0000/00/00",
                      inputFormatters: [Masks.dateMask],
                      textInputType: TextInputType.number,
                      required: true,
                    ),
                  ),
                  CustomInput(
                    title: "Gender",
                    hint: 'Select a gender',
                    required: true,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: Spaces.x2),
                    child: CustomInput(
                      title: "National ID (NID)",
                      hint: '000000000',
                      textInputType: TextInputType.number,
                      required: true,
                    ),
                  ),
                  CustomInput(
                    title: "Current address",
                    hint: 'address',
                    optional: true,
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
                  AppRouter.pop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
