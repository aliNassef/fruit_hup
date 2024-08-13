import 'package:firebase_auth/firebase_auth.dart';
 import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';
import '../../../features/auth/sign_in/presentation/views/sign_in_view.dart';
import '../../../features/layout/presentation/views/layout_view.dart';

class LayoutOrLogin extends StatelessWidget {
  const LayoutOrLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshots) {
        if (snapshots.connectionState == ConnectionState.active) {
          User? user = snapshots.data; // null safety code?;
          if (user == null) {
            return const SignInView();
          } else {
            return const LayoutView();
          }
        }
        return CircularProgressIndicator(
          color: AppColors.mainColor,
        );
      },
    );
  }
}
