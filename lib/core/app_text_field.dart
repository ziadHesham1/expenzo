import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

class AppTextField extends StatelessWidget {
  final String? labelText;
  final int? width;
  final String? initialValue;
  final int maxLines;
  //final TextEditingController textController;
  final Function(String?)? onSaved;
  final Function(String)? onChanged;
  final Function()? onTap;
  final Function(String?)? onFieldSubmitted;
  final void Function()? onEditingComplete;
  final String? Function(String?)? validator;
  final bool isObscureText;
  final bool hasBorder;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  //final bool hasIcon;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final bool? enabled;

  const AppTextField({
    super.key,
    this.labelText,
    this.width,
    //required this.textController,
    this.onSaved,
    this.validator,
    this.isObscureText = false,
    this.suffixIcon,
    this.keyboardType,
    this.onChanged,
    this.textCapitalization = TextCapitalization.none,
    this.initialValue,
    // this.hasIcon = false,
    this.maxLines = 1,
    this.controller,
    this.prefixIcon,
    this.hasBorder = true,
    this.onFieldSubmitted,
    this.textInputAction,
    this.focusNode,
    this.textAlign,
    this.onEditingComplete,
    this.textDirection,
    this.enabled,
    this.onTap,
  });

  OutlineInputBorder buildBorder({Color? color}) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: color ?? const Color.fromARGB(255, 200, 198, 198),
        width: 0.5,
      ),
      borderRadius: BorderRadius.circular(10),
    );
  }

  OutlineInputBorder buildErrorBorder({Color? color}) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: color ?? Colors.red,
        width: 0.5,
      ),
      gapPadding: 14,
      borderRadius: BorderRadius.circular(10),
    );
  }

  InputDecoration decoration() {
    return InputDecoration(
      filled: true,
      fillColor: Colors.white,
      focusColor: Colors.white,
      alignLabelWithHint: true,
      prefixIcon: prefixIcon,
      prefixIconColor: AppColors.primary,
      errorMaxLines: 5,
      contentPadding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 15.w),
      // labelStyle: AppTextStyles.style12Blue,
      /* TextStyle(
        color: AppColors.primary,
        fontSize: 12.sp,
      ), */
      // labelText: labelText,
      suffixIcon: suffixIcon,
      suffixIconColor: AppColors.primary,
      border: hasBorder ? buildBorder() : null,
      enabledBorder: hasBorder ? buildBorder() : null,
      focusedBorder: hasBorder ? buildBorder() : null,
      errorBorder: hasBorder ? buildErrorBorder() : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    // final bool isArabic = AppConstants.isCurrentLocaleArabic();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            labelText ?? '',
            // style: AppTextStyles.style16,
          ),
        ),
        Container(
          // width: width ?? AppConstants.App_screen_width * 0.8,
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            selectionHeightStyle: BoxHeightStyle.max,
            onTap: onTap,
            enabled: enabled,
            textDirection: textDirection,
            // textAlign:
            // textAlign ?? (isArabic ? TextAlign.right : TextAlign.left),
            focusNode: focusNode,
            controller: controller,
            textCapitalization: textCapitalization,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: onChanged,
            onEditingComplete: onEditingComplete,
            onFieldSubmitted: onFieldSubmitted,
            keyboardType: keyboardType,
            obscureText: isObscureText,
            //controller: textController,
            onSaved: onSaved,
            validator: validator,
            maxLines: maxLines,
            initialValue: initialValue,
            textInputAction: textInputAction ?? TextInputAction.next,
            decoration: decoration(),
            // ),
          ),
        ),
      ],
    );
  }
}
