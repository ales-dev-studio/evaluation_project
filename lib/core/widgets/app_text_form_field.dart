import 'package:evaluation_project/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    this.validator,
    this.controller,
    this.initialValue,
    this.labelText,
    this.errorText,
    this.focusNode,
    this.nextFocusNode,
    this.onChanged,
    this.onFieldSubmitted,
    this.textInputType,
    this.maxLine,
    this.isMaxLineNull = false,
    this.obSecure,
    this.maxLength,
    this.hinText,
    this.textInputAction,
    this.textStyle,
    this.suffixTextStyle,
    this.textDirection,
    this.inputFormatters,
    this.autoValidate = false,
    this.displayErrorState = true,
    this.onTap,
    this.suffixTextBackgroundColor,
    this.suffixText,
    this.prefixText,
    this.centerText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.autoFocus = false,
    this.isDark,
    this.hintStyle,
    this.displayCounterText = false,
    this.showBorder = true,
    this.enabled,
    this.borderRadius,
    this.contentPadding,
    this.fillColor,
    this.required = false,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final String? initialValue;
  final String? labelText;
  final String? errorText;
  final GestureTapCallback? onTap;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final ValueChanged<String>? onChanged;
  final TextInputType? textInputType;
  final int? maxLine;
  final bool isMaxLineNull;
  final bool? obSecure;
  final int? maxLength;
  final String? hinText;
  final TextStyle? textStyle;
  final TextStyle? suffixTextStyle;
  final TextStyle? hintStyle;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? textInputAction;
  final bool displayErrorState;
  final bool autoValidate;
  final Color? suffixTextBackgroundColor;
  final String? suffixText;
  final String? prefixText;
  final TextDirection? textDirection;
  final bool centerText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool autoFocus;
  final bool? isDark;
  final bool displayCounterText;
  final bool showBorder;
  final bool? enabled;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? contentPadding;
  final Color? fillColor;
  final bool required;

  @override
  Widget build(final BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      enabled: enabled ?? true,
      textAlign: centerText ? TextAlign.center : TextAlign.start,
      textDirection: textDirection,
      controller: controller,
      focusNode: focusNode,
      onChanged: onChanged,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onFieldSubmitted: onFieldSubmitted ?? selfSubmit,
      onTap: onTap,
      keyboardType: textInputType,
      inputFormatters: (textInputType == TextInputType.number ||
              textInputType == TextInputType.phone
          ? <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly,
              if (inputFormatters != null) ...inputFormatters!,
            ]
          : null),
      autocorrect: false,
      autofocus: autoFocus,
      maxLength: maxLength,
      obscureText: obSecure ?? false,
      maxLines: isMaxLineNull ? null : (maxLine ?? 1),
      textInputAction: textInputAction ??
          (nextFocusNode != null ? TextInputAction.next : TextInputAction.done),
      style: textStyle,
      decoration: InputDecoration(
        border: InputBorder.none,
        contentPadding: contentPadding,
        counterText: displayCounterText ? null : '',
        hintText: hinText,
        hintStyle: hintStyle,
        hintTextDirection: textDirection,
        fillColor: fillColor,
        filled: fillColor != null,
        prefixIcon: prefixIcon,
        suffixIconConstraints: const BoxConstraints(
          maxWidth: 200,
        ),
        labelText:
            labelText == null ? null : labelText! + (required ? ' * ' : ''),
        labelStyle: enabled == null
            ? null
            : enabled!
                ? null
                : TextStyle(
                    color: AppColors.blackColor.withOpacity(0.5),
                  ),
        errorText: errorText,
        errorStyle: TextStyle(fontSize: displayErrorState ? 13 : 0.0),
        suffixIcon: suffixIcon,
      ),
    );
  }

  void selfSubmit(final String value) {
    if (focusNode != null) {
      focusNode?.unfocus();
    }
    if (nextFocusNode != null) {
      nextFocusNode!.requestFocus();
    }
  }
}
