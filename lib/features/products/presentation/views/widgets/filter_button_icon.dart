
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/app_images.dart';

class FilterButtonIcon extends StatelessWidget {
  const FilterButtonIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.white.withOpacity(0.1),
        border: Border.all(
          color: Color(0xffCACECE66).withOpacity(.4),
        ),
      ),
      child: SvgPicture.asset(
        AppImages.filter_icon,
        alignment: Alignment.center,
      ),
    );
  }
}
