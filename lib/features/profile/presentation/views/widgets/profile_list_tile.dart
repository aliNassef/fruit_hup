import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hup/core/shared/functions/locale.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_styles.dart';

class ProfileListTile extends StatelessWidget {
  const ProfileListTile({
    super.key,
    required this.icon,
    required this.text,
    this.onTap,
  });
  final String icon;
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Color(0xffF2F3F3),
            ),
          ),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: SvgPicture.asset(icon),
          title: Text(
            text,
            style: AppStyles.textStyle13SB.copyWith(
              color: Color(0xff949D9E),
            ),
          ),
          trailing: InkWell(
            onTap: () {},
            child: isArabic()
                ? SvgPicture.asset(AppImages.left_arrow_icon)
                : Image.asset(AppImages.right_arrow2),
          ),
        ),
      ),
    );
  }
}
