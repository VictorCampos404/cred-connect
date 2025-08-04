import 'package:cred_connect/core/constants/constants.dart';
import 'package:cred_connect/core/formaters/money_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomMoneyInput extends StatefulWidget {
  final Function(String)? onChanged;
  final bool? enable;
  final TextEditingController? controller;
  final bool? autofocus;
  final Function(String)? onSubmitted;
  final FocusNode? focusNode;
  final Function()? onTap;
  final bool? readOnly;

  const CustomMoneyInput({
    super.key,
    this.onChanged,
    this.enable = true,
    this.controller,
    this.autofocus = false,
    this.onSubmitted,
    this.focusNode,
    this.onTap,
    this.readOnly,
  });

  @override
  State<CustomMoneyInput> createState() => _CustomMoneyInputState();
}

class _CustomMoneyInputState extends State<CustomMoneyInput> {
  late bool obscure;

  @override
  void initState() {
    obscure = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: !widget.enable!,
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              key: widget.key,
              onTap: widget.onTap,

              focusNode: widget.focusNode,

              inputFormatters: [MoneyFormat.mask],
              controller: widget.controller,
              autofocus: widget.autofocus!,
              readOnly: !widget.enable! || (widget.readOnly ?? false),
              onFieldSubmitted: widget.onSubmitted,
              style: AppTextStyles.normal.copyWith(
                fontSize: 42,
                color: AppColors.primary,
              ),
              keyboardType: TextInputType.number,
              onChanged: widget.onChanged,

              textAlign: TextAlign.center,
              decoration: InputDecoration(
                counter: const SizedBox(),

                hintText: "৳ 0,00",
                hintStyle: AppTextStyles.normal.copyWith(
                  fontSize: 42,
                  color: AppColors.inputValue.withValues(alpha: 0.5),
                ),
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                border: InputBorder.none,
                errorBorder: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
