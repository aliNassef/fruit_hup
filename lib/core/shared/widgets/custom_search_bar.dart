import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../functions/locale.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';
import '../../utils/app_styles.dart';
import '../../../generated/l10n.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar(
      {super.key, this.readOnly = false, this.searchControler});
  final bool readOnly;
  final TextEditingController? searchControler;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: DecoratedBox(
        position: DecorationPosition.background,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(0xffF9F9F9),
              blurRadius: 8,
              spreadRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: TextFormField(
          controller: searchControler,
          readOnly: readOnly,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            prefixIcon: isArabic()
                ? Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SvgPicture.asset(
                      AppImages.searchIcon,
                      height: 20.h,
                      width: 20.w,
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SvgPicture.asset(AppImages.settingIcon,
                        height: 20.h, width: 20.w),
                  ),
            // not arabic
            suffixIcon: !isArabic()
                ? Padding(
                    padding: const EdgeInsets.all(16),
                    child: SvgPicture.asset(AppImages.searchIcon,
                        height: 20.h, width: 20.w),
                  )
                : Padding(
                    padding: const EdgeInsets.all(16),
                    child: SvgPicture.asset(AppImages.settingIcon,
                        height: 20.h, width: 20.w),
                  ),
            hintText: S.of(context).searchFor,
            hintStyle:
                AppStyles.textStyle13R.copyWith(color: AppColors.gray400),
            border: buildBorderStyle(),

            enabledBorder: buildBorderStyle(),
            focusedBorder: buildBorderStyle(),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder buildBorderStyle() {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.white,
      ),
      borderRadius: BorderRadius.circular(16),
    );
  }
}
