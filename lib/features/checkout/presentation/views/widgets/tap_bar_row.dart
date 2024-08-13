import 'package:flutter/material.dart';
import 'tap_bar_check_out.dart';

class TapBarRow extends StatelessWidget {
  const TapBarRow({
    super.key,
    this.isActive2 = false,
    this.isActive3 = false,
    this.isActive4 = false,
  });
  final bool isActive2;
  final bool isActive3;
  final bool isActive4;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TapbarCheckOut(
          text: 'الشحن',
          isActive: true,
        ),
        TapbarCheckOut(
          text: 'العنوان',
          num: 2,
          isActive: isActive2,
        ),
        TapbarCheckOut(
          text: 'الدفع',
          num: 3,
          isActive: isActive3,
        ),
        TapbarCheckOut(
          text: 'المراجعه',
          num: 4,
          isActive: isActive4,
        ),
      ],
    );
  }
}
