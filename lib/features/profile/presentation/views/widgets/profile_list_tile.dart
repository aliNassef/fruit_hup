import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hup/core/utils/app_router.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_styles.dart';

class ProfileListTile extends StatelessWidget {
  const ProfileListTile({
    super.key,
    required this.icon,
    required this.text,
  });
  final String icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push(AppRouter.MyProfile);
      },
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
            child: SvgPicture.asset(AppImages.left_arrow_icon),
          ),
        ),
      ),
    );
  }
}
