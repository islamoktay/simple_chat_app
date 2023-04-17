import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_chat_app/core/constants/app_content_texts.dart';
import 'package:simple_chat_app/core/constants/padding_constants.dart';
import 'package:simple_chat_app/core/dependency_injection/di.dart';
import 'package:simple_chat_app/core/theme/app_colors.dart';
import 'package:simple_chat_app/core/theme/custom_text_styles.dart';
import 'package:simple_chat_app/core/widgets/custom_button.dart';
import 'package:simple_chat_app/core/widgets/custom_text_form_field.dart';
import 'package:simple_chat_app/feature/auth/presentation/bloc/auth_bloc.dart';

class DialogForOTP extends StatelessWidget {
  const DialogForOTP({
    required this.onTapOk,
    super.key,
  });
  final VoidCallback onTapOk;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding: PaddingConstants.generalPadding,
        width: 335.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: BlocProvider.value(
          value: sl<AuthBloc>(),
          child: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 30.h),
                  Text(
                    AppContentTexts.enterOTP,
                    style: CustomTextStyles.authTitleStyle.copyWith(
                      color: AppColors.blackColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30.h),
                  CustomTextFormField(
                    textInputAction: TextInputAction.next,
                    controller: sl<AuthBloc>().otpController,
                    labelText: AppContentTexts.otp,
                    maxLines: 1,
                  ),
                  SizedBox(height: 30.h),
                  CustomButton(
                    text: AppContentTexts.ok,
                    onTap: onTapOk,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
