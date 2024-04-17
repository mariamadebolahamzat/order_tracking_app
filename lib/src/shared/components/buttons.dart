import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:order_tracking_app/src/shared/constants/sizing_extension.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.label,
    this.onTap,
    this.height,
    this.labelStyle,
    this.padding,
    this.borderRadius,
    this.minWidth,
    this.textColor,
    this.isLoading = false,
  });

  final String label;
  final VoidCallback? onTap;

  // configuration parameters
  final double? height;
  final double? borderRadius;
  final TextStyle? labelStyle;
  final EdgeInsets? padding;
  final double? minWidth;
  final bool isLoading;

  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: isLoading,
      child: Semantics(
        label: '$label Text Button',
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(16.rsp)),
          child: MaterialButton(
            onPressed: onTap,
            color: Theme.of(context).colorScheme.secondary,
            focusColor: Colors.transparent,
            disabledColor: const Color(0xff7a7878),
            textColor: Theme.of(context).colorScheme.primary,
            hoverColor: Theme.of(context).buttonTheme.colorScheme?.secondary,
            elevation: 0.0,
            focusElevation: 0.0,
            highlightElevation: 0.0,
            shape: borderRadius == null
                ? null
                : RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(borderRadius!))),
            height: height ?? 55,
            padding: padding,
            minWidth: double.infinity,
            child: isLoading
                ? CupertinoActivityIndicator(
                    color: Theme.of(context).colorScheme.background,
                    radius: 12,
                  )
                : Text(
                    label,
                    style: (labelStyle ?? Theme.of(context).textTheme.bodyMedium)?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
