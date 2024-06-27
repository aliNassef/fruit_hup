import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_images.dart';

class OffersCarsuralSlider extends StatelessWidget {
  const OffersCarsuralSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 160.h,
        width: MediaQuery.sizeOf(context).width,
        child: CarouselSlider(
          options: CarouselOptions(
            aspectRatio: 2.16,
            height: 160.h,
          ),
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    // color: Colors.amber,
                    image: DecorationImage(
                      image: AssetImage(
                        AppImages.demoHome,
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ));
  }
}
