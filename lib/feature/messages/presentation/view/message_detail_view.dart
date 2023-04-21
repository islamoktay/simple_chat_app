import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_chat_app/core/constants/padding_constants.dart';
import 'package:simple_chat_app/core/dependency_injection/di.dart';
import 'package:simple_chat_app/core/theme/app_colors.dart';
import 'package:simple_chat_app/core/theme/custom_text_styles.dart';
import 'package:simple_chat_app/core/utils/message_listener/listen_messages.dart';
import 'package:simple_chat_app/core/widgets/custom_scaffold.dart';
import 'package:simple_chat_app/core/widgets/custom_text_form_field.dart';
import 'package:simple_chat_app/feature/home/data/model/user_model.dart';
import 'package:simple_chat_app/feature/messages/data/model/content_model.dart';
import 'package:simple_chat_app/feature/messages/presentation/bloc/messages_bloc.dart';
import 'package:simple_chat_app/feature/messages/presentation/widget/message_detail_appbar.dart';

class MessageDetailView extends StatelessWidget {
  const MessageDetailView({
    required this.userModel,
    super.key,
  });
  final UserModel userModel;
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: MessageDetailAppBar(user: userModel),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            bottom: MediaQuery.of(context).viewPadding.bottom + 70.h,
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: StreamBuilder<List<ContentModel>>(
                  stream:
                      ListenMessages.getUserMessage(uid: userModel.uid ?? ''),
                  builder: (context, snapshot) {
                    final contents = snapshot.data?.reversed.toList();
                    if (contents?.isEmpty ?? false) {
                      return const SizedBox.shrink();
                    } else {
                      return ListView.builder(
                        padding: PaddingConstants.generalPadding,
                        shrinkWrap: true,
                        reverse: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: contents?.length,
                        itemBuilder: (context, index) {
                          return Text(
                            contents?[index].text ?? '',
                            style: CustomTextStyles.mediumText.copyWith(
                              color: Colors.red,
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: 100.h,
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              color: AppColors.lightPinkColor.withOpacity(.5),
              padding: PaddingConstants.horizontalPadding,
              child: BlocProvider.value(
                value: sl<MessagesBloc>(),
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
          ),
        ],
      ),
    );
  }
}
