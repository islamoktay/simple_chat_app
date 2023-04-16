import 'package:flutter/material.dart';
import 'package:simple_chat_app/core/constants/border_radius_constants.dart';
import 'package:simple_chat_app/core/constants/padding_constants.dart';
import 'package:simple_chat_app/core/theme/app_colors.dart';
import 'package:simple_chat_app/core/theme/custom_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    required this.controller,
    super.key,
    this.onChanged,
    this.maxLines,
    this.validator,
    this.textInputAction,
    this.labelText,
    this.isObscureText,
  });
  final void Function(String)? onChanged;
  final TextEditingController controller;
  final int? maxLines;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final String? labelText;
  final ValueNotifier<bool>? isObscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autofocus: true,
      onChanged: onChanged,
      maxLines: maxLines,
      style: CustomTextStyles.mediumText,
      cursorColor: AppColors.blackColor,
      validator: validator,
      textInputAction: textInputAction,
      obscuringCharacter: '*',
      obscureText: isObscureText?.value ?? false,
      decoration: InputDecoration(
        labelStyle: CustomTextStyles.smallText.copyWith(
          color: AppColors.greyColor,
        ),
        labelText: labelText,
        contentPadding: PaddingConstants.generalPadding,
        enabledBorder: _borderStyle(),
        focusedBorder: _borderStyle(),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white, width: 2),
          borderRadius: BorderRadiusConstants.generalRadius,
        ),
        suffixIcon: _suffixIcon(),
      ),
    );
  }

  InkWell? _suffixIcon() {
    if (isObscureText == null) {
      return null;
    } else {
      if (isObscureText!.value) {
        return InkWell(
          onTap: () => isObscureText!.value = !isObscureText!.value,
          child: const Icon(
            Icons.visibility,
            color: AppColors.greyColor,
          ),
        );
      } else {
        return InkWell(
          onTap: () => isObscureText!.value = !isObscureText!.value,
          child: const Icon(
            Icons.visibility_off,
            color: AppColors.greyColor,
          ),
        );
      }
    }
  }

  OutlineInputBorder _borderStyle() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.greyColor),
      borderRadius: BorderRadiusConstants.generalRadius,
    );
  }
}
