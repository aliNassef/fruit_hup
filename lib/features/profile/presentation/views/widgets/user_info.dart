import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/cache/cache_helper.dart';
import '../../../../../core/service_locator.dart';
import '../../../../../core/shared/widgets/app_spacer.dart';
import '../../../../../core/utils/app_styles.dart';
import 'profile_image.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const ProfileImage(),
        const HorizontalSpace(24),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              getIt.get<CacheHelper>().getData(key: AppConstants.username),
              style: AppStyles.textStyle13B.copyWith(
                color: Color(0xff131F46),
              ),
            ),
            Text(
              getIt.get<CacheHelper>().getData(key: AppConstants.useremail),
              style: AppStyles.textStyle13R.copyWith(
                color: Color(0xff888FA0),
              ),
            ),
          ],
        )
      ],
    );
  }
}
