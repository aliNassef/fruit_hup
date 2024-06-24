import 'package:flutter/material.dart';
import '../../../../../../constants.dart';
import 'page_view_item.dart';

class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: PageView.builder(
        physics: BouncingScrollPhysics(),
        // children: [
        //   PageViewItem1(),
        //   PageViewItem2(),
        // ],
        itemCount: introPages.length,
        itemBuilder: (context, index) {
          return PageViewItem(
            currentIndex: index,
            instance: introPages[index],
          );
        },
      ),
    );
  }
}
