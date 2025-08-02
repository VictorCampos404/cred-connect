import 'package:cred_connect/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomInput extends StatefulWidget {
  final String? hint;
  final String? title;
  final TextInputType? textInputType;
  final Function(String)? onChanged;
  final bool? enable;
  final bool? isPassword;
  final bool? multLine;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization? textCapitalization;
  final bool? autofocus;
  final Function(String)? onSubmitted;
  final FocusNode? focusNode;
  final int maxLines;
  final TextStyle? hintTextStyle;
  final Widget? suffix;
  final Widget? outSuffix;
  final Widget? prefix;
  final Function()? onTap;
  final bool? readOnly;
  final String? prefixText;
  final bool? required;
  final bool? optional;

  const CustomInput({
    super.key,
    this.hint,
    this.title,
    this.textInputType,
    this.onChanged,
    this.enable = true,
    this.isPassword = false,
    this.multLine = false,
    this.maxLines = 6,
    this.controller,
    this.inputFormatters,
    this.textCapitalization = TextCapitalization.none,
    this.autofocus = false,
    this.onSubmitted,
    this.focusNode,
    this.hintTextStyle,
    this.suffix,
    this.outSuffix,
    this.prefix,
    this.onTap,
    this.readOnly,
    this.prefixText,
    this.required,
    this.optional,
  });

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: Spaces.x1),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      if (widget.title != null)
                        Expanded(
                          child: Text(
                            widget.title ?? '',
                            style: AppTextStyles.normal.copyWith(fontSize: 15),
                          ),
                        ),
                      if (widget.required ?? false)
                        Text(
                          'Required',
                          style: AppTextStyles.normal.copyWith(
                            fontSize: 15,
                            color: AppColors.required,
                          ),
                        ),
                      if (widget.optional ?? false)
                        Text(
                          'Optional',
                          style: AppTextStyles.normal.copyWith(
                            fontSize: 15,
                            color: AppColors.inputValue,
                          ),
                        ),
                    ],
                  ),
                ),
                TextFormField(
                  key: widget.key,
                  onTap: widget.onTap,
                  maxLines: widget.multLine! ? widget.maxLines : 1,
                  focusNode: widget.focusNode,
                  textCapitalization: widget.textCapitalization!,
                  inputFormatters: widget.inputFormatters,
                  controller: widget.controller,
                  autofocus: widget.autofocus!,
                  readOnly: !widget.enable! || (widget.readOnly ?? false),
                  obscuringCharacter: '*',
                  onFieldSubmitted: widget.onSubmitted,
                  style: AppTextStyles.normal.copyWith(
                    fontSize: 13,
                    color: AppColors.inputValue,
                  ),
                  keyboardType: widget.textInputType,
                  onChanged: widget.onChanged,
                  obscureText: widget.isPassword! && obscure,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.inputFilled,
                    prefixIcon: widget.prefix,
                    prefixText: widget.prefixText,
                    counter: const SizedBox(),
                    suffixIcon: widget.isPassword!
                        ? obscure
                              ? IconButton(
                                  icon: Icon(
                                    CustomIcons.eye_2_fill,
                                    color: AppColors.text,
                                  ),
                                  onPressed: () => setState(() {
                                    obscure = !obscure;
                                  }),
                                )
                              : IconButton(
                                  icon: Icon(
                                    CustomIcons.eye_close_line,
                                    color: AppColors.text,
                                  ),
                                  onPressed: () => setState(() {
                                    obscure = !obscure;
                                  }),
                                )
                        : widget.suffix,
                    hintText: widget.hint,
                    hintStyle: AppTextStyles.normal.copyWith(
                      fontSize: 13,
                      color: AppColors.inputValue.withValues(alpha: 0.5),
                    ),
                    prefixStyle: AppTextStyles.normal.copyWith(
                      fontSize: 13,
                      color: AppColors.inputValue,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: const BorderSide(
                        color: AppColors.primary,
                        width: 1.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                        color: AppColors.inputBorder,
                        width: 1.0,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                        color: AppColors.inputBorder,
                        width: 1.0,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                        color: AppColors.inputBorder,
                        width: 1.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (widget.outSuffix != null) widget.outSuffix ?? const SizedBox(),
        ],
      ),
    );
  }
}
