import 'package:cred_connect/core/core.dart';
import 'package:flutter/cupertino.dart';

class BalanceDisplay extends StatelessWidget {
  final double? balance;
  const BalanceDisplay({super.key, this.balance});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(Spaces.x3),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(
            "Lending pool",
            style: AppTextStyles.bold.copyWith(
              fontSize: 15,
              color: AppColors.pastelBlue,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: Spaces.x2_half,
              bottom: Spaces.x5_half,
            ),
            child: Text(
              MoneyFormat.value(balance ?? 0),
              style: AppTextStyles.medium.copyWith(
                fontSize: 32,
                color: AppColors.background,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.circular(36),
                ),
              ),
              Container(
                width: 6,
                height: 6,
                margin: EdgeInsets.symmetric(horizontal: Spaces.x1),
                decoration: BoxDecoration(
                  color: AppColors.pastelBlue,
                  borderRadius: BorderRadius.circular(36),
                ),
              ),
              Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                  color: AppColors.pastelBlue,
                  borderRadius: BorderRadius.circular(36),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
