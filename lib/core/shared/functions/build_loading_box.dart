import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

Future<dynamic> buildLoadingBox(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return SizedBox(
        height: 50,
        width: 50,
        child: AlertDialog(
          alignment: Alignment.center,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 50,
                width: 50,
                child: Center(
                  child: CircularProgressIndicator(
                    color: AppColors.mainColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
