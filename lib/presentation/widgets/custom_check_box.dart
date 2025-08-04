import 'package:cred_connect/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({super.key, this.isCheck, this.onCheck, this.color});

  final bool? isCheck;
  final Function(bool)? onCheck;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onCheck != null
          ? () {
              onCheck!(!(isCheck ?? false));
            }
          : null,
      child: Container(
        width: 24,
        height: 24,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(
            width: 6,
            color: (isCheck ?? false)
                ? (color ?? AppColors.primary)
                : AppColors.disable,
          ),
          color: (isCheck ?? false) ? (color ?? AppColors.primary) : null,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        child: Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: (isCheck ?? false) ? AppColors.background : null,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),
        ),
      ),
    );
  }
}
