
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_chat_app/core/theme/custom_text_styles.dart';

class ChoosePhotoItem extends StatelessWidget {
  const ChoosePhotoItem({
    required this.onTap,
    required this.icon,
    required this.title,
    super.key,
  });
  final VoidCallback onTap;
  final IconData icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Icon(
            icon,
          ),
          SizedBox(width: 10.w),
          Text(
            title,
            style: CustomTextStyles.mediumText,
          )
        ],
      ),
    );
  }
}
