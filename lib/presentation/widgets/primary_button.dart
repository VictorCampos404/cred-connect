import 'package:cred_connect/core/constants/constants.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String? text;
  final Color? background;
  final bool? disable;
  final Function()? onTap;

  const PrimaryButton({
    super.key,
    this.text,
    this.background,
    this.disable,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: disable ?? false,
      child: Material(
        elevation: 2,
        color: (disable ?? false)
            ? AppColors.disable
            : background ?? AppColors.primary,
        borderRadius: BorderRadius.circular(5),
        child: InkWell(
          borderRadius: BorderRadius.circular(5),
          onTap: onTap,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(Spaces.x2),
              child: Text(
                (text ?? "").toUpperCase(),
                textAlign: TextAlign.center,
                style: AppTextStyles.bold.copyWith(
                  fontSize: 15,
                  color: AppColors.background,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
