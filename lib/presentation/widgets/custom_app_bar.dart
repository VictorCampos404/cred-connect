import 'package:cred_connect/core/constants/constants.dart';
import 'package:cred_connect/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final CustomIconButton? leading;

  const CustomAppBar({super.key, this.leading});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        systemNavigationBarColor: AppColors.background,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarColor: AppColors.background,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: SafeArea(
        child: Container(
          color: AppColors.background,
          padding: const EdgeInsets.only(
            top: Spaces.x4,
            left: Spaces.x2,
            right: Spaces.x2,
            bottom: Spaces.x2,
          ),
          child: Row(
            children: [
              if (leading != null)
                Padding(
                  padding: const EdgeInsets.only(right: Spaces.x2),
                  child: leading!,
                ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(0, 80);
}
