import 'package:cred_connect/core/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    this.color,
    this.icon,
    this.enable,
    this.onTap,
    this.size,
    this.badged,
    this.badgedColor,
    this.padding,
    this.gradient,
    this.tooltip,
  });

  final Function()? onTap;
  final IconData? icon;
  final Color? color;
  final double? size;
  final bool? enable;
  final bool? badged;
  final Color? badgedColor;
  final EdgeInsets? padding;
  final Gradient? gradient;
  final String? tooltip;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip ?? '',
      child: AbsorbPointer(
        absorbing: !(enable ?? true),
        child: Material(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(360),
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(360),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(360),
                gradient: gradient,
              ),
              padding: padding ?? const EdgeInsets.all(Spaces.half),
              child: Icon(icon, color: color ?? AppColors.text, size: size),
            ),
          ),
        ),
      ),
    );
  }
}
