import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:simple_chat_app/core/theme/app_colors.dart';
import 'package:simple_chat_app/core/theme/custom_text_styles.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const _Initial()) {}

  final TextEditingController signInMailController = TextEditingController();
  final TextEditingController signInPasswordController =
      TextEditingController();
  final TextEditingController registerMailController = TextEditingController();
  final TextEditingController registerPasswordController =
      TextEditingController();
  final TextEditingController registerPasswordVerifierController =
      TextEditingController();

  List<Widget> returnPersistentList({
    required String textOne,
    required String textTwo,
    required VoidCallback onTap,
  }) {
    return [
      InkWell(
        onTap: onTap,
        child: Text(
          textOne,
          style: CustomTextStyles.smallText,
        ),
      ),
      InkWell(
        onTap: onTap,
        child: Text(
          textTwo,
          style: CustomTextStyles.smallText
              .copyWith(color: AppColors.darkPurpleColor),
        ),
      ),
    ];
  }
}
