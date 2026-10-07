import 'package:beauty_product_store/core/constants/app_color.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final String? labelText;
  final String? hintText;

  final Widget? prefixIcon;
  final Widget? suffixIcon;
  bool isPasswordVisible = false;

  final bool readOnly;
  final bool enabled;
  final bool isRequired;

  final TextEditingController? controller;
  final String? initialValue;

  final TextInputType keyboardType;
  final TextInputAction textInputAction;

  final int? maxLength;
  final int maxLines;
  final int minLines;

  final String? errorText;

  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final VoidCallback? onTap;
  final VoidCallback? onEditingComplete;

  final EdgeInsetsGeometry? contentPadding;
final bool? obscureText;
final bool hasBorder;
  final InputBorder? border;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? errorBorder;
  final InputBorder? focusedErrorBorder;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final Color? errorBorderColor;
  final bool filled;
  final Color? fillColor;

  final TextStyle? hintStyle;
  final TextStyle? inputStyle;
  final TextStyle? labelStyle;

   CustomTextFormField({
    super.key,
    this.labelText,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,

    this.readOnly = false,
    this.enabled = true,
    this.isRequired = true,
    this.controller,
    this.initialValue,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.maxLength,
    this.maxLines = 1,
    this.minLines = 1,
    this.errorText,
    this.validator,
    this.onChanged,
    this.onTap,
    this.onEditingComplete,
    this.contentPadding,
    this.hasBorder = true,
    this.border,
    this.enabledBorder,
    this.focusedBorder,
    this.errorBorder,
    this.focusedErrorBorder,
    this.filled = false,
    this.fillColor,
    this.hintStyle,
    this.inputStyle,
    this.labelStyle, this.borderColor, this.focusedBorderColor, this.errorBorderColor,  this.obscureText,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      initialValue: widget.initialValue,

      obscureText: isPasswordVisible,
      readOnly: widget.readOnly,
      enabled: widget.enabled,

      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,

      maxLength: widget.maxLength,
      maxLines:  widget.maxLines,
      minLines: widget.minLines,
      onChanged: widget.onChanged,
      onTap: widget.onTap,
      onEditingComplete: widget.onEditingComplete,

      validator: widget.validator,

      style: widget.inputStyle,

      decoration: InputDecoration(

        labelText: widget.labelText,
        labelStyle: widget.labelStyle,

        hintText: widget.hintText,
        hintStyle: widget.hintStyle,

        errorText: widget.errorText,

        prefixIcon: widget.prefixIcon,
        suffixIcon:  InkWell(
          onTap: () {
            setState(() {
              isPasswordVisible = !isPasswordVisible;
            });
            },
      child: Icon(
        isPasswordVisible
            ? Icons.visibility
            : Icons.visibility_off,
      ),
    ),

        contentPadding: widget.contentPadding ??
            const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),

        filled: widget.filled,
        fillColor: widget.fillColor,

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: widget.borderColor ??AppColors.grey,
            ),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: widget.focusedBorderColor ?? AppColors.background,
              width: 2,
            ),
          ),

          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: widget.errorBorderColor ?? AppColors.error,
            ),
          ),



    ));
  }
}
