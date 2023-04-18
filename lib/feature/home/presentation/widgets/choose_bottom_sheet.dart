import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:simple_chat_app/core/constants/app_content_texts.dart';
import 'package:simple_chat_app/core/constants/border_radius_constants.dart';
import 'package:simple_chat_app/core/constants/padding_constants.dart';
import 'package:simple_chat_app/core/dependency_injection/di.dart';
import 'package:simple_chat_app/core/theme/app_colors.dart';
import 'package:simple_chat_app/feature/home/presentation/bloc/home_bloc.dart';
import 'package:simple_chat_app/feature/home/presentation/widgets/choose_photo_item.dart';

class ChoosePhotoBottomSheet extends StatelessWidget {
  const ChoosePhotoBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: PaddingConstants.generalPadding,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadiusConstants.generalRadius,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 10.h),
          ChoosePhotoItem(
            onTap: () => sl<HomeBloc>().add(
              const HomeEvent.choosePhoto(ImageSource.camera),
            ),
            title: AppContentTexts.camera,
            icon: Icons.photo_camera,
          ),
          const Divider(),
          ChoosePhotoItem(
            onTap: () => sl<HomeBloc>().add(
              const HomeEvent.choosePhoto(ImageSource.gallery),
            ),
            title: AppContentTexts.library,
            icon: Icons.photo_library,
          ),
          SizedBox(
            height: MediaQuery.of(context).padding.bottom,
          )
        ],
      ),
    );
  }
}
