import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fruit_hup/core/shared/functions/toast_dialog.dart';
import 'package:fruit_hup/features/cart/presentation/view_model/cart_cubit/cart_cubit.dart';
import '../../../../../core/shared/widgets/app_spacer.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../data/models/product_model.dart';

class ProductItem extends StatelessWidget {
  const ProductItem(
      {super.key, required this.instanceOfProduct, this.onTap, this.index});
  final ProductModel instanceOfProduct;
  final void Function()? onTap;
  final int? index;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 214.h,
          width: 163.w,
          decoration: BoxDecoration(color: AppColors.fillProductColor),
        ),
        Positioned(
          right: 8.w,
          top: 8.h,
          child: InkWell(
            onTap: () {},
            child: Icon(
              FontAwesomeIcons.heart,
              color: Color(0xff292D32),
              size: 20,
            ),
          ),
        ),
        Positioned(
          bottom: 80.h,
          left: 0,
          right: 0,
          child: CachedNetworkImage(
            imageUrl: instanceOfProduct.image,
            placeholder: (context, url) => Center(
              child: CircularProgressIndicator(
                color: AppColors.mainColor,
              ),
            ),
            height: 100.h,
            width: 50.w,
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
        Positioned(
          bottom: 15.h,
          right: 8.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    instanceOfProduct.name,
                    style: AppStyles.textStyle13SB,
                  ),
                  VerticalSpace(4),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '${instanceOfProduct.price}جنية /',
                          style: AppStyles.textStyle13B
                              .copyWith(color: AppColors.orange500),
                        ),
                        TextSpan(
                          text: instanceOfProduct.measure,
                          style: AppStyles.textStyle13SB
                              .copyWith(color: AppColors.orange300),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              HorizontalSpace(20),
              BlocConsumer<CartCubit, CartState>(
                listener: (context, state) {
                  if (state is AddedProductToCart && state.index == index) {
                    showToast(text: 'تمت الاضافة للسلة');
                  }
                },
                builder: (context, state) {
                  return CircleAvatar(
                    backgroundColor: AppColors.mainColor,
                    child: InkWell(
                      onTap: onTap,
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        )
      ],
    );
  }
}
