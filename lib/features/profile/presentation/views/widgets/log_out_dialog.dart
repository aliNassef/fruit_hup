import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../view_model/profile_cubit/profile_cubit.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../generated/l10n.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      title: Text(
        S.of(context).doYOuWantToLogout,
        textAlign: TextAlign.center,
        style: AppStyles.textStyle16B.copyWith(color: AppColors.gray950),
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: AppColors.mainColor,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: AppColors.mainColor),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                minimumSize: Size(100, 40),
              ),
              onPressed: () {
                context.read<ProfileCubit>().logout();
                Navigator.of(context).pop(true);
              },
              child: Text(
                S.of(context).confirm,
                style: AppStyles.textStyle16B.copyWith(color: Colors.white),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: AppColors.mainColor),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                minimumSize: Size(100, 40),
              ),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text(
                S.of(context).cancel,
                style:
                    AppStyles.textStyle16B.copyWith(color: AppColors.mainColor),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
