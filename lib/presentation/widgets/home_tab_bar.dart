import 'package:cred_connect/core/constants/constants.dart';
import 'package:flutter/material.dart';

class HomeTabBar extends StatelessWidget {
  const HomeTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: Spaces.x2,
        horizontal: Spaces.x3,
      ),
      decoration: BoxDecoration(
        color: AppColors.background,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            offset: Offset(-2, 0),
            blurRadius: 8,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: Spaces.half),
                child: Image.asset(AppImages.homeIcon, height: 30),
              ),
              Text(
                "Home",
                style: AppTextStyles.light.copyWith(
                  fontSize: 13,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: Spaces.half),
                child: Image.asset(AppImages.newLoanIcon, height: 30),
              ),
              Text(
                "New Loan",
                style: AppTextStyles.light.copyWith(
                  fontSize: 13,
                  color: AppColors.pastelBlue2,
                ),
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: Spaces.half),
                child: Image.asset(AppImages.upcomingIcon, height: 30),
              ),
              Text(
                "Upcoming",
                style: AppTextStyles.light.copyWith(
                  fontSize: 13,
                  color: AppColors.pastelBlue2,
                ),
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: Spaces.half),
                child: Image.asset(AppImages.earningsIcon, height: 30),
              ),
              Text(
                "Earnings",
                style: AppTextStyles.light.copyWith(
                  fontSize: 13,
                  color: AppColors.pastelBlue2,
                ),
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: Spaces.half),
                child: Image.asset(AppImages.clientsIcon, height: 30),
              ),
              Text(
                "Clients",
                style: AppTextStyles.light.copyWith(
                  fontSize: 13,
                  color: AppColors.pastelBlue2,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
