import 'package:cred_connect/core/constants/constants.dart';
import 'package:flutter/material.dart';

class ItemButton extends StatelessWidget {
  final String? text;
  final String? icon;
  final Color? background;
  final bool? border;
  final Function()? onTap;

  const ItemButton({
    super.key,
    this.text,
    this.icon,
    this.background,
    this.onTap,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: border ?? false ? 1 : 0,
      color: background ?? AppColors.background,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: border ?? false
            ? BorderSide(color: AppColors.buttonBorder, width: 1)
            : BorderSide.none,
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(Spaces.x2),
          child: Row(
            children: [
              if (icon != null)
                Padding(
                  padding: const EdgeInsets.only(right: Spaces.x2),
                  child: Image.asset(icon!, height: 32),
                ),
              Expanded(
                child: Text(
                  text ?? "",
                  style: AppTextStyles.normal.copyWith(fontSize: 17),
                ),
              ),
              if (border ?? false)
                Icon(
                  CustomIcons.arrow_right_s_line,
                  size: 28,
                  color: AppColors.text,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
