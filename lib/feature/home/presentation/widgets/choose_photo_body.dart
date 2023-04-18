import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_chat_app/core/dependency_injection/di.dart';
import 'package:simple_chat_app/core/theme/app_colors.dart';
import 'package:simple_chat_app/feature/home/presentation/bloc/home_bloc.dart';
import 'package:simple_chat_app/feature/home/presentation/widgets/choose_bottom_sheet.dart';

class ChoosePhotoBody extends StatelessWidget {
  const ChoosePhotoBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: sl<HomeBloc>(),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state.chosenPhoto != null) {
            return CircleAvatar(
              radius: 150.h / 2,
              foregroundImage: FileImage(state.chosenPhoto!),
            );
          } else {
            return InkWell(
              onTap: () async => showModalBottomSheet(
                backgroundColor: Colors.transparent,
                context: context,
                isScrollControlled: true,
                builder: (context) => const ChoosePhotoBottomSheet(),
              ),
              child: Icon(
                Icons.account_circle_outlined,
                color: AppColors.lightPinkColor,
                size: 150.h,
              ),
            );
          }
        },
      ),
    );
  }
}
