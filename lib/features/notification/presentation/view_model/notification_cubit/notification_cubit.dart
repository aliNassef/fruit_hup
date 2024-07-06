import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruit_hup/features/notification/data/model/notification_model.dart';
import 'package:meta/meta.dart';

import '../../../../../constants.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationInitial());
  final notifications = FirebaseFirestore.instance
      .collection(AppConstants.notificationCollection);
  getNotifications() async {
    emit(NotificationLoading());

    notifications.snapshots().listen(
      (event) {
        AppConstants.notifications.clear();
        for (var doc in event.docs) {
          AppConstants.notifications.add(NotificationModel.fromJson(doc));
        }
        print(AppConstants.notifications[0].body);
        emit(NotificationLoaded(notificationList: AppConstants.notifications));
      },
    );
  }
}
