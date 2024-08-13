import 'package:flutter/material.dart';
import 'widgets/layout_view_body.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: LayoutViewBody()),
    );
  }
}
