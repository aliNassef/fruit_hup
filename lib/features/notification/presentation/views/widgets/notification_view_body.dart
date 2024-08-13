import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_router.dart';
import '../../view_model/notification_cubit/notification_cubit.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/shared/widgets/app_spacer.dart';
import '../../../../../core/shared/widgets/top_bar.dart';
import '../../../../../generated/l10n.dart';
import 'notification_item.dart';

class NotificationViewBody extends StatefulWidget {
  const NotificationViewBody({super.key, this.message});
  final RemoteMessage? message;

  @override
  State<NotificationViewBody> createState() => _NotificationViewBodyState();
}

class _NotificationViewBodyState extends State<NotificationViewBody> {
  @override
  void initState() {
    super.initState();
    context.read<NotificationCubit>().getNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationCubit, NotificationState>(
      builder: (context, state) {
        if (state is NotificationLoaded) {
          return Column(
            children: [
         const     VerticalSpace(16),
              TopBar(
                text: S.of(context).notification,
                onTap: () {
                  if (context.canPop()) {
                    context.pop();
                  } else {
                    context.go(AppRouter.homeView);
                  }
                },
              ),
       const       VerticalSpace(16),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return NotificationItem(
                        instanceOfNotification: state.notificationList[index],
                      );
                    },
                    separatorBuilder: (context, index) =>const VerticalSpace(16),
                    itemCount: state.notificationList.length,
                  ),
                ),
              ),
              //   Text(message!.notification!.title.toString()),
            ],
          );
        } else if (state is NotificationFailure) {
          return Center(child: Text(state.errMessage));
        } else {
          return const Center(child: CircularProgressIndicator(
            color: AppColors.mainColor,
          ));
        }
      },
    );
  }
}
