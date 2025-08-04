import 'package:cred_connect/core/core.dart';
import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PopUp {
  PopUp._();

  static void showResult({RequestResult? result}) {
    if (result == null) return;

    if (!result.status) {
      showError(result.title ?? '', message: result.message);
      return;
    }

    if ((result.title ?? '').isNotEmpty || (result.message ?? '').isNotEmpty) {
      showSuccess(result.title ?? '', message: result.message);
    }
  }

  static void showNotification(String title, {String? message}) {
    final context = Modular.routerDelegate.navigatorKey.currentContext;

    if (context == null) return;

    Flushbar(
      duration: const Duration(seconds: 4),
      icon: Icon(
        CustomIcons.notification_2_fill,
        color: AppColors.pastelOrange,
      ),
      boxShadows: <BoxShadow>[
        BoxShadow(
          color: AppColors.disable,
          blurRadius: 7.0,
          offset: const Offset(0.0, 0.75),
        ),
      ],
      backgroundColor: AppColors.background,
      borderRadius: BorderRadius.circular(5),
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      padding: const EdgeInsets.fromLTRB(20, 12, 16, 12),
      titleText: Text(
        title,
        style: AppTextStyles.bold.copyWith(
          fontSize: 18,
          color: AppColors.pastelOrange,
        ),
      ),
      messageText: message == null
          ? const SizedBox()
          : Text(message, style: AppTextStyles.normal),
      flushbarPosition: FlushbarPosition.TOP,
    ).show(context);
  }

  static void showError(String title, {String? message}) {
    final context = Modular.routerDelegate.navigatorKey.currentContext;

    if (context == null) return;

    Flushbar(
      duration: const Duration(seconds: 4),
      icon: Icon(CustomIcons.error_warning_fill, color: AppColors.required),
      boxShadows: <BoxShadow>[
        BoxShadow(
          color: AppColors.disable,
          blurRadius: 7.0,
          offset: const Offset(0.0, 0.75),
        ),
      ],
      backgroundColor: AppColors.background,
      borderRadius: BorderRadius.circular(5),
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      padding: const EdgeInsets.fromLTRB(20, 12, 16, 12),
      titleText: Text(
        title,
        style: AppTextStyles.bold.copyWith(
          fontSize: 18,
          color: AppColors.required,
        ),
      ),
      messageText: message == null
          ? const SizedBox()
          : Text(message, style: AppTextStyles.normal),
      flushbarPosition: FlushbarPosition.TOP,
    ).show(context);
  }

  static void showSuccess(String title, {String? message}) {
    final context = Modular.routerDelegate.navigatorKey.currentContext;

    if (context == null) return;

    Flushbar(
      duration: const Duration(seconds: 4),
      icon: Icon(CustomIcons.checkbox_circle_fill, color: AppColors.success),
      boxShadows: <BoxShadow>[
        BoxShadow(
          color: AppColors.disable,
          blurRadius: 7.0,
          offset: const Offset(0.0, 0.75),
        ),
      ],
      backgroundColor: AppColors.background,
      borderRadius: BorderRadius.circular(5),
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      padding: const EdgeInsets.fromLTRB(20, 12, 16, 12),
      titleText: Text(
        title,
        style: AppTextStyles.bold.copyWith(
          fontSize: 18,
          color: AppColors.success,
        ),
      ),
      messageText: message == null
          ? const SizedBox()
          : Text(message, style: AppTextStyles.normal),
      flushbarPosition: FlushbarPosition.TOP,
    ).show(context);
  }
}
