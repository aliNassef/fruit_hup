import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../constants.dart';
import '../../../../home/presentation/view_model/get_all_product_cubit/get_all_product_cubit.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/shared/widgets/app_spacer.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';

class HorizantalproductList extends StatelessWidget {
  const HorizantalproductList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllProductCubit, GetAllProductState>(
      builder: (context, state) {
        if (state is GetAllProductLoaded) {
          return SizedBox(
            height: 90.h,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: AppConstants.products.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(right: 8.0.w),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: 60.w,
                        height: 60.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xffF3F5F7),
                        ),
                        child: Image.network(
                          AppConstants.products[index].image,
                          height: 36.h,
                          width: 36.w,
                        ),
                      ),
                      VerticalSpace(2),
                      Text(
                        AppConstants.products[index].name,
                        style: AppStyles.textStyle13SB.copyWith(
                          color: AppColors.gray950,
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          );
        } else if (state is GetAllProductFailure) {
          return Center(
            child: Text(state.errMessage),
          );
        } else {
          return Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: ListView.builder(
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(right: 8.0.w),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 60.w,
                      height: 60.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                    ),
                    VerticalSpace(2),
                    Container(
                      width: 40.w,
                      height: 10.h,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
