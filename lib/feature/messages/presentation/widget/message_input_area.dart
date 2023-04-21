import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_chat_app/core/constants/padding_constants.dart';
import 'package:simple_chat_app/core/dependency_injection/di.dart';
import 'package:simple_chat_app/core/theme/app_colors.dart';
import 'package:simple_chat_app/core/widgets/custom_text_form_field.dart';
import 'package:simple_chat_app/feature/home/data/model/user_model.dart';
import 'package:simple_chat_app/feature/messages/presentation/bloc/messages_bloc.dart';

class MessageInputArea extends StatelessWidget {
  const MessageInputArea({
    required this.userModel,
    super.key,
  });

  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Container(
        height: 100.h,
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        color: AppColors.lightPinkColor.withOpacity(.5),
        padding: PaddingConstants.horizontalPadding,
        child: BlocProvider.value(
          value: sl<MessagesBloc>()
            ..add(MessagesEvent.markAsReadMessages(uid: userModel.uid ?? '')),
          child: BlocBuilder<MessagesBloc, MessagesState>(
            builder: (context, state) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomTextFormField(
                      textInputAction: TextInputAction.newline,
                      controller: sl<MessagesBloc>().messageController,
                      maxLines: 2,
                      minLines: 1,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  InkWell(
                    onTap: () => sl<MessagesBloc>().add(
                      MessagesEvent.sendMessage(user: userModel),
                    ),
                    child: const Icon(
                      Icons.send,
                      color: AppColors.lightPurpleColor,
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
