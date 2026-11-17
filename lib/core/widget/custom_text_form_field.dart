import 'package:beauty_product_store/core/constants/app_color.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final String? labelText;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
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

  const CustomTextFormField({
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
    this.filled = true,
    this.fillColor = Colors.white,
    this.hintStyle,
    this.inputStyle,
    this.labelStyle,
    this.borderColor,
    this.focusedBorderColor,
    this.errorBorderColor,
    this.obscureText,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    final isPasswordField = widget.obscureText ?? false;
    return TextFormField(
      controller: widget.controller,
      initialValue: widget.initialValue,
      obscureText: isPasswordField && !isPasswordVisible,
      readOnly: widget.readOnly,
      enabled: widget.enabled,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      maxLength: widget.maxLength,
      maxLines: isPasswordField ? 1 : widget.maxLines,
      minLines: widget.minLines,
      onChanged: widget.onChanged,
      onTap: widget.onTap,
      onEditingComplete: widget.onEditingComplete,
      validator: widget.validator,
      style:
          widget.inputStyle ??
          const TextStyle(color: Color(0xFF49362F), fontSize: 14),
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle:
            widget.labelStyle ??
            const TextStyle(color: Color(0xFF9A8980), fontSize: 14),
        floatingLabelStyle: const TextStyle(
          color: Color(0xFF9B796A),
          fontSize: 14,
        ),
        hintText: widget.hintText,
        hintStyle:
            widget.hintStyle ??
            const TextStyle(color: Color(0xFFB8ADA7), fontSize: 13),
        errorText: widget.errorText,
        prefixIcon: widget.prefixIcon,
        suffixIcon:
            widget.suffixIcon ??
            (isPasswordField
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                    icon: Icon(
                      isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: const Color(0xFF9A8980),
                    ),
                  )
                : null),
        contentPadding:
            widget.contentPadding ??
            const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        filled: widget.filled,
        fillColor: widget.fillColor ?? Colors.white,
        border:
            widget.border ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: widget.borderColor ?? Colors.grey.shade300,
              ),
            ),
        enabledBorder:
            widget.enabledBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: widget.borderColor ?? Colors.grey.shade300,
              ),
            ),
        focusedBorder:
            widget.focusedBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: widget.focusedBorderColor ?? const Color(0xFF9B796A),
                width: 1.5,
              ),
            ),
        errorBorder:
            widget.errorBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: widget.errorBorderColor ?? AppColors.error,
              ),
            ),
        focusedErrorBorder:
            widget.focusedErrorBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: widget.errorBorderColor ?? AppColors.error,
                width: 1.5,
              ),
            ),
      ),
    );
  }
}
