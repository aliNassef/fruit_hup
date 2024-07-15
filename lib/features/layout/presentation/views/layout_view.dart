import 'package:flutter/material.dart';
import 'package:fruit_hup/features/layout/presentation/views/widgets/layout_view_body.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutViewBody(),
    );
  }
}
