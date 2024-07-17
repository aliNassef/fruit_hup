import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/model/cart_model.dart';
import 'product_cart_row.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartItem,  });
  final CartModel cartItem;
 
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 3.h),
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xffF1F1F5),
        ),
      ),
      child: ProductCartRow( 
        cartItem: cartItem,
      ),
    );
  }
}
