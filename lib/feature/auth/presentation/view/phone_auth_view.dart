import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_chat_app/core/constants/app_content_texts.dart';
import 'package:simple_chat_app/core/constants/padding_constants.dart';
import 'package:simple_chat_app/core/dependency_injection/di.dart';
import 'package:simple_chat_app/core/widgets/custom_button.dart';
import 'package:simple_chat_app/core/widgets/custom_scaffold.dart';
import 'package:simple_chat_app/core/widgets/custom_text_form_field.dart';
import 'package:simple_chat_app/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:simple_chat_app/feature/auth/presentation/widgets/auth_title_body.dart';

class PhoneAuthView extends StatelessWidget {
  const PhoneAuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: BlocProvider.value(
        value: sl<AuthBloc>(),
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return Column(
              children: [
                const AuthTitleBody(
                  title: AppContentTexts.phoneAuth,
                  isBackButton: true,
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding: PaddingConstants.generalPadding,
                  child: Column(
                    children: [
                      CustomTextFormField(
                        textInputAction: TextInputAction.done,
                        controller: sl<AuthBloc>().phoneNumberController,
                        labelText: AppContentTexts.phoneNumber,
                        maxLines: 1,
                      ),
                      SizedBox(height: 20.h),
                      CustomButton(
                        onTap: () => sl<AuthBloc>().add(
                          AuthEvent.signInPhone(
                            context: context,
                          ),
                        ),
                        text: AppContentTexts.sendCode,
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
