import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/app_images.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CircleAvatar(
          radius: 37,
          backgroundImage: AssetImage(
            AppImages.demoProfilr,
          ),
        ),
        PositionedDirectional(
          bottom: -16,
          start: 21.5,
          child: CircleAvatar(
            radius: 16,
            backgroundColor: Color(0xffF9F9F9),
            child: SvgPicture.asset(
              AppImages.camera_icon,
            ),
          ),
        )
      ],
    );
  }
}
