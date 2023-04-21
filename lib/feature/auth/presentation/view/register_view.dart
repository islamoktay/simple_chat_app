import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_chat_app/core/constants/app_content_texts.dart';
import 'package:simple_chat_app/core/constants/padding_constants.dart';
import 'package:simple_chat_app/core/dependency_injection/di.dart';
import 'package:simple_chat_app/core/widgets/custom_button.dart';
import 'package:simple_chat_app/core/widgets/custom_scaffold.dart';
import 'package:simple_chat_app/core/widgets/custom_text_form_field.dart';
import 'package:simple_chat_app/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:simple_chat_app/feature/auth/presentation/widgets/auth_title_body.dart';

class RegisterView extends HookWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    final password = useState(true);
    final passwordVerifier = useState(true);

    return CustomScaffold(
      persistentFooterButtons: sl<AuthBloc>().returnPersistentList(
        textOne: AppContentTexts.haveAccount,
        textTwo: AppContentTexts.login,
        onTap: () => context.router.pop(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AuthTitleBody(
              title: AppContentTexts.register,
              isBackButton: true,
            ),
            Padding(
              padding: PaddingConstants.generalPadding,
              child: Column(
                children: [
                  SizedBox(height: 20.h),
                  CustomTextFormField(
                    textInputAction: TextInputAction.next,
                    controller: sl<AuthBloc>().registerMailController,
                    labelText: AppContentTexts.email,
                    maxLines: 1,
                  ),
                  SizedBox(height: 20.h),
                  CustomTextFormField(
                    textInputAction: TextInputAction.next,
                    controller: sl<AuthBloc>().registerPasswordController,
                    labelText: AppContentTexts.password,
                    maxLines: 1,
                    isObscureText: password,
                  ),
                  SizedBox(height: 20.h),
                  CustomTextFormField(
                    textInputAction: TextInputAction.done,
                    controller:
                        sl<AuthBloc>().registerPasswordVerifierController,
                    labelText: AppContentTexts.repeatPassword,
                    maxLines: 1,
                    isObscureText: passwordVerifier,
                  ),
                  SizedBox(height: 20.h),
                  CustomButton(
                    onTap: () => sl<AuthBloc>().add(
                      const AuthEvent.registerEmail(),
                    ),
                    text: AppContentTexts.register,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
