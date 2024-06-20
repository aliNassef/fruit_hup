import 'package:flutter/material.dart';
import 'package:fruit_hup/constants.dart';
import 'package:fruit_hup/features/intro_screens/presentations/onboarding/views/widgets/page_view_item.dart';

class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
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
    );
  }
}
