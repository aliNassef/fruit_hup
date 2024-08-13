
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/app_colors.dart';

class LayoutActiveIcon extends StatelessWidget {
  const LayoutActiveIcon({
    super.key, required this.img,
  }); 
  final String img;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 15,
      backgroundColor: AppColors.mainColor,
      child: SvgPicture.asset(
    img  ,
        colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
      ),
    );
  }
}