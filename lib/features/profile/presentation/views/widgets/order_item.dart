import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../data/models/order_model.dart';
import 'expansion_tile_title.dart';
import 'timeline.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({
    super.key, required this.orderModel,
  });
  final OrderModel orderModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: ExpansionTile(
        childrenPadding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 10.h),
        collapsedBackgroundColor: Color(0xffF2F3F3).withOpacity(0.5),
        tilePadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 19.h),
        trailing: Icon(
          Icons.keyboard_arrow_down_sharp,
          size: 30,
        ),
        backgroundColor: Color(0xffF2F3F3).withOpacity(0.5),
        title: ExpansionTileTitle(
          orderModel: orderModel,
        ),
        children: [
          TimeLine(
              isFirst: true,
              title: 'تتبع الطلب',
              subTitle: '22 مارس , 2024',
              isDone: true,
              isConnected: false),
          TimeLine(
              title: 'قبول الطلب',
              subTitle: '22 مارس , 2024',
              isDone: true,
              isConnected: true),
          TimeLine(
              title: 'تم شحن الطلب',
              subTitle: '22 مارس , 2024',
              isDone: true,
              isConnected: true),
          TimeLine(
              title: 'خرج للتوصيل',
              subTitle: 'تم التسليم',
              isDone: false,
              isConnected: false),
          TimeLine(
              title: 'تم تسليم',
              subTitle: 'قيد الانتظار',
              isDone: false,
              isConnected: false),
        ],
      ),
    );
  }
}
