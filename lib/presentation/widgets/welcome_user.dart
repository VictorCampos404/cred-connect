import 'package:cred_connect/core/constants/constants.dart';
import 'package:flutter/cupertino.dart';

class WelcomeUser extends StatelessWidget {
  final String? userName;

  const WelcomeUser({super.key, this.userName});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello ${userName ?? ''}",
                style: AppTextStyles.bold.copyWith(fontSize: 25),
              ),
              Padding(
                padding: const EdgeInsets.only(top: Spaces.half),
                child: Text(
                  "Good morning, remember to check the incomes today",
                  style: AppTextStyles.light.copyWith(fontSize: 13),
                ),
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(360),
            border: Border.all(color: AppColors.text, width: 2),
          ),
          margin: EdgeInsets.only(left: Spaces.x2),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(360),
            child: Image.asset(AppImages.user, width: 42, height: 42),
          ),
        ),
      ],
    );
  }
}
