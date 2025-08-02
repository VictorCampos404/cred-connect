import 'package:cred_connect/core/constants/constants.dart';
import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final String? text;
  final bool? disable;
  final Function()? onTap;

  const SecondaryButton({super.key, this.text, this.disable, this.onTap});

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: disable ?? false,
      child: Material(
        elevation: 2,
        color: (disable ?? false) ? AppColors.disable : AppColors.background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: BorderSide(color: AppColors.buttonBorder, width: 1),
        ),
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
                style: AppTextStyles.bold.copyWith(fontSize: 15),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
