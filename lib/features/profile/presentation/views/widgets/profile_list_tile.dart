import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hup/core/shared/functions/locale.dart';
import 'package:fruit_hup/core/utils/app_colors.dart';
import 'package:fruit_hup/generated/l10n.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_styles.dart';

class ProfileListTile extends StatelessWidget {
  const ProfileListTile({
    super.key,
    required this.icon,
    required this.text,
    this.onTap,
    this.showLang = false,
  });
  final String icon;
  final String text;
  final void Function()? onTap;
  final bool showLang;
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
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: AppStyles.textStyle13SB.copyWith(
                  color: Color(0xff949D9E),
                ),
              ),
              showLang
                  ? Text(
                      S.of(context).lang,
                      style: AppStyles.textStyle13R
                          .copyWith(color: AppColors.gray950),
                    )
                  : const SizedBox(),
            ],
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
