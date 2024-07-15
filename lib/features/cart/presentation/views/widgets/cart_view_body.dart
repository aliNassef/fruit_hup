import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hup/core/utils/app_colors.dart';
import 'package:fruit_hup/core/utils/app_styles.dart';

import '../../../../../core/shared/widgets/app_spacer.dart';
import 'cart_item.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          color: Color(0xffEBF9F1),
          height: 40.h,
          width: MediaQuery.sizeOf(context).width,
          child: Text(
            'لديك 3 منتجات في سله التسوق',
            style: AppStyles.textStyle13R.copyWith(
              color: AppColors.mainColor,
            ),
          ),
        ),
        VerticalSpace(24),
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) => CartItem(),
            separatorBuilder: (context, index) => VerticalSpace(4),
            itemCount: 3,
          ),
        ),
      ],
    );
  }
}
