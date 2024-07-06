import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hup/core/service_locator.dart';
import 'package:fruit_hup/features/notification/data/repo/notification_repo_impl.dart';
import 'package:fruit_hup/features/notification/presentation/view_model/notification_cubit/notification_cubit.dart';
import 'widgets/notification_view_body.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key, this.message});
  final RemoteMessage? message;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            NotificationCubit(getIt.get<NotificationRepoImpl>())
              ..getNotifications(),
        child: SafeArea(
          child: NotificationViewBody(
            message: message,
          ),
        ),
      ),
    );
  }
}
