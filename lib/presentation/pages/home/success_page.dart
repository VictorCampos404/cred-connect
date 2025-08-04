import 'package:cred_connect/core/constants/constants.dart';
import 'package:cred_connect/core/utils/app_router.dart';
import 'package:cred_connect/presentation/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class SuccessPage extends StatefulWidget {
  const SuccessPage({super.key});

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(Spaces.x3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  child: Image.asset(
                    AppImages.checkCircle,
                    width: 160,
                    height: 160,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: Spaces.x1),
                  child: Text(
                    "Congratulations!",
                    style: AppTextStyles.medium.copyWith(fontSize: 34),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: Spaces.x2),
                  child: Text(
                    "Your Request was completed successfully",
                    style: AppTextStyles.light.copyWith(fontSize: 13),
                  ),
                ),
                Text(
                  "Remember to ensure timely payments.",
                  style: AppTextStyles.bold.copyWith(fontSize: 13),
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
              text: "Done",
              background: AppColors.success,
              onTap: () {
                AppRouter.goToHomePage();
              },
            ),
          ],
        ),
      ),
    );
  }
}
