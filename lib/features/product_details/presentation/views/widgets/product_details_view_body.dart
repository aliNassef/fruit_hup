import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hup/features/cart/presentation/view_model/cart_cubit/cart_cubit.dart';
import 'package:fruit_hup/features/home/data/models/product_model.dart';
import '../../../../../core/shared/widgets/app_spacer.dart';
import '../../../../../core/shared/widgets/default_app_button.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/shared/widgets/cirrcle_arrow.dart';
import '../../../../../core/utils/app_images.dart';
import 'product_details_item.dart';
import 'product_info.dart';
import 'product_rating_and_review.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody(
      {super.key, required this.instanceOfProduct, required this.index});
  final ProductModel instanceOfProduct;
  final int index;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            children: [
              Image.asset(
                AppImages.productDetails,
                height: 370.h,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fill,
              ),
              Positioned(
                top: 100.h,
                right: 0,
                left: 0,
                child: CachedNetworkImage(
                  imageUrl: instanceOfProduct.image,
                  width: 221.w,
                  height: 167.h,
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator.adaptive(
                      backgroundColor: AppColors.mainColor,
                      valueColor:
                          AlwaysStoppedAnimation<Color>(AppColors.mainColor),
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              PositionedDirectional(
                top: 20.h,
                start: 20.w,
                child: CircleArrow(
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
          VerticalSpace(24),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ProductInfo(
                  instanceOfProduct: instanceOfProduct,
                ),
                VerticalSpace(16),
                ProductRatingAndReview(),
                VerticalSpace(9),
                Text(
                  'ينتمي إلى الفصيلة القرعية ولثمرته لُب حلو المذاق وقابل للأكل، وبحسب علم النبات فهي تعتبر ثمار لبيّة، تستعمل لفظة البطيخ للإشارة إلى النبات نفسه أو إلى الثمرة تحديداً',
                  style: AppStyles.textStyle13R.copyWith(
                    color: Color(0xff979899),
                  ),
                ),
                VerticalSpace(16),
                Row(
                  children: [
                    Expanded(
                      child: ProductDetailsItem(
                        title: Text(
                          'عام',
                          style: AppStyles.textStyle16B.copyWith(
                            color: Color(0xff23AA49),
                          ),
                        ),
                        subtitle: 'الصلاحيه',
                        image: AppImages.expieredDate,
                      ),
                    ),
                    HorizontalSpace(16),
                    Expanded(
                        child: ProductDetailsItem(
                      title: Text(
                        '100%',
                        style: AppStyles.textStyle16B.copyWith(
                          color: Color(0xff23AA49),
                        ),
                      ),
                      subtitle: 'اوجانيك',
                      image: AppImages.organic,
                    )),
                  ],
                ),
                VerticalSpace(16),
                Row(
                  children: [
                    Expanded(
                      child: ProductDetailsItem(
                        title: Text(
                          '80 كالوري',
                          style: AppStyles.textStyle16B.copyWith(
                            color: Color(0xff23AA49),
                          ),
                        ),
                        subtitle: '100 جرام',
                        image: AppImages.calories,
                      ),
                    ),
                    HorizontalSpace(16),
                    Expanded(
                        child: ProductDetailsItem(
                      title: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: '(256)',
                              style: AppStyles.textStyle13SB.copyWith(
                                color: Color(0xff979899),
                              ),
                            ),
                            TextSpan(
                              text: ' 4.8',
                              style: AppStyles.textStyle16B.copyWith(
                                color: Color(0xff23AA49),
                              ),
                            ),
                          ],
                        ),
                      ),
                      subtitle: 'Reviews',
                      image: AppImages.starReview,
                    )),
                  ],
                ),
                VerticalSpace(16),
                DefaultAppButton(
                  text: 'اضف للسلة',
                  onPressed: () {
                    context.read<CartCubit>().addProductToCart(
                          index: index,
                          quantity: 1,
                          img: instanceOfProduct.image,
                          price: instanceOfProduct.price,
                          name: instanceOfProduct.name,
                          measure: instanceOfProduct.measure,
                        );
                  },
                ),
                VerticalSpace(32),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
