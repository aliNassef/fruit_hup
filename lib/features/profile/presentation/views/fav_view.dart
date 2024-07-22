import 'package:flutter/material.dart'; 
import 'package:fruit_hup/core/shared/widgets/app_spacer.dart';
import 'package:fruit_hup/core/shared/widgets/top_bar.dart';
import 'package:fruit_hup/generated/l10n.dart';
 
class FavView extends StatelessWidget {
  const FavView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              VerticalSpace(16),
              TopBar(
                text: S.of(context).fav,
                showTrailing: false,
              ),
              VerticalSpace(20),
              // Expanded(
              //   child: GridView.builder(
              //     physics: BouncingScrollPhysics(),
              //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //       crossAxisCount: 2,
              //       mainAxisSpacing: 8.h,
              //       crossAxisSpacing: 10.w,
              //       mainAxisExtent: 214.h,
              //     ),
              //     itemBuilder: (context, index) {
              //       return ProductItem(
              //         index: index,
              //         onTap: () {
              //           // Add to cart
              //           //   context.read<CartCubit>().addProductToCart(
              //           //         index: index,
              //           //         quantity: 1,
              //           //         img:s.image,
              //           //         price: AppConstants.products[index].price,
              //           //         name: AppConstants.products[index].name,
              //           //         measure: AppConstants.products[index].measure,
              //           //       );
              //           //    log('added to cart');
              //         },
              //         // instanceOfProduct: AppConstants.products[index],
              //       );
              //     },
              //     itemCount: 10,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
