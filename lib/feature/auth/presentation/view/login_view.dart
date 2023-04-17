import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_chat_app/core/constants/app_content_texts.dart';
import 'package:simple_chat_app/core/constants/login_method_constants.dart';
import 'package:simple_chat_app/core/constants/padding_constants.dart';
import 'package:simple_chat_app/core/dependency_injection/di.dart';
import 'package:simple_chat_app/core/router/router_path.dart';
import 'package:simple_chat_app/core/widgets/custom_button.dart';
import 'package:simple_chat_app/core/widgets/custom_scaffold.dart';
import 'package:simple_chat_app/core/widgets/custom_text_form_field.dart';
import 'package:simple_chat_app/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:simple_chat_app/feature/auth/presentation/widgets/auth_title_body.dart';
import 'package:simple_chat_app/feature/auth/presentation/widgets/login_method_button.dart';
import 'package:simple_chat_app/feature/auth/presentation/widgets/or_login_with_body.dart';

class LoginView extends HookWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final password = useState(true);
    return CustomScaffold(
      persistentFooterButtons: sl<AuthBloc>().returnPersistentList(
        textOne: AppContentTexts.dontHaveAccount,
        textTwo: AppContentTexts.register,
        onTap: () => context.router.pushNamed(RouterPath.registerView),
      ),
      body: BlocProvider.value(
        value: sl<AuthBloc>(),
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  const AuthTitleBody(
                    title: AppContentTexts.authSignInTitle,
                  ),
                  Padding(
                    padding: PaddingConstants.generalPadding,
                    child: Column(
                      children: [
                        SizedBox(height: 20.h),
                        CustomTextFormField(
                          textInputAction: TextInputAction.next,
                          controller: sl<AuthBloc>().signInMailController,
                          labelText: AppContentTexts.email,
                          maxLines: 1,
                        ),
                        SizedBox(height: 20.h),
                        CustomTextFormField(
                          textInputAction: TextInputAction.done,
                          controller: sl<AuthBloc>().signInPasswordController,
                          labelText: AppContentTexts.password,
                          isObscureText: password,
                          maxLines: 1,
                        ),
                        SizedBox(height: 20.h),
                        CustomButton(
                          onTap: () => sl<AuthBloc>().add(
                            const AuthEvent.signInEmail(),
                          ),
                          text: AppContentTexts.login,
                        ),
                        const OrLoginWithBody(),
                        GridView.builder(
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: LoginMethods.methodTexts.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 3,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          itemBuilder: (context, index) => LoginMethodButton(
                            loginMethodModel: LoginMethodModel(
                              icon: LoginMethods.methodIcons[index],
                              title: LoginMethods.methodTexts[index],
                              onTap: LoginMethods.onTapList[index],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
