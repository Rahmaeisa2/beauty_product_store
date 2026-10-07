import 'package:beauty_product_store/core/constants/app_color.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;

  final VoidCallback? onPressed;

  final Widget? icon;
  final Widget? child;

  final bool isLoading;
  final bool enabled;

  final double? width;
  final double? height;

  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? borderColor;

  final double borderWidth;
  final double borderRadius;

  final EdgeInsetsGeometry? padding;

  final TextStyle? textStyle;

  final double? elevation;
  final List<BoxShadow>? boxShadow;

  final BorderRadiusGeometry? customBorderRadius;

  final MainAxisAlignment alignment;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,

    this.icon,
    this.child,

    this.isLoading = false,
    this.enabled = true,

    this.width,
    this.height,

    this.backgroundColor,
    this.foregroundColor,
    this.borderColor,

    this.borderWidth = 1,
    this.borderRadius = 12,

    this.padding,

    this.textStyle,

    this.elevation,
    this.boxShadow,

    this.customBorderRadius,

    this.alignment = MainAxisAlignment.center,
  });

  @override
  Widget build(BuildContext context) {
    final bool isButtonEnabled =
        enabled && !isLoading && onPressed != null;

    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: isButtonEnabled ? onPressed : null,

        style: ElevatedButton.styleFrom(
          backgroundColor:
          backgroundColor ?? AppColors.secondary,

          foregroundColor:
          foregroundColor ?? Colors.white,

          disabledBackgroundColor:
          Colors.grey.shade300,

          disabledForegroundColor:
          Colors.grey.shade600,

          elevation: elevation ?? 0,

          padding: padding ??
              const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 14,
              ),

          shape: RoundedRectangleBorder(
            borderRadius:
            customBorderRadius ??
                BorderRadius.circular(borderRadius),

            side: BorderSide(
              color: borderColor ?? Colors.transparent,
              width: borderWidth,
            ),
          ),
        ),

        child: isLoading
            ? const SizedBox(
          width: 22,
          height: 22,
          child: CircularProgressIndicator(
            strokeWidth: 2,
          ),
        )
            : Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: alignment,
          children: [
            if (icon != null) ...[
              icon!,
              const SizedBox(width: 8),
            ],

            child ??
                Text(
                  text,
                  style: textStyle,
                ),
          ],
        ),
      ),
    );
  }}
