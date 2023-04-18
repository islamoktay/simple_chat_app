import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_chat_app/core/constants/app_content_texts.dart';
import 'package:simple_chat_app/core/constants/padding_constants.dart';
import 'package:simple_chat_app/core/dependency_injection/di.dart';
import 'package:simple_chat_app/core/widgets/custom_button.dart';
import 'package:simple_chat_app/core/widgets/custom_scaffold.dart';
import 'package:simple_chat_app/core/widgets/custom_text_form_field.dart';
import 'package:simple_chat_app/feature/auth/presentation/widgets/auth_title_body.dart';
import 'package:simple_chat_app/feature/home/presentation/bloc/home_bloc.dart';
import 'package:simple_chat_app/feature/home/presentation/widgets/choose_photo_body.dart';

class CreateUserView extends StatelessWidget {
  const CreateUserView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: BlocProvider.value(
        value: sl<HomeBloc>(),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return Column(
              children: [
                const AuthTitleBody(
                  title: AppContentTexts.createUser,
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding: PaddingConstants.generalPadding,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const ChoosePhotoBody(),
                      SizedBox(height: 20.h),
                      CustomTextFormField(
                        textInputAction: TextInputAction.done,
                        controller: sl<HomeBloc>().nameController,
                        labelText: AppContentTexts.name,
                        maxLines: 1,
                      ),
                      SizedBox(height: 20.h),
                      CustomButton(
                        text: AppContentTexts.save,
                        onTap: () => sl<HomeBloc>()
                            .add(const HomeEvent.createUserModel()),
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
