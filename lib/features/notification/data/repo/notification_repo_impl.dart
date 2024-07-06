import 'package:dartz/dartz.dart';
import 'package:fruit_hup/core/api/api_services.dart';
import 'package:fruit_hup/core/error/failure.dart';
import 'package:fruit_hup/features/notification/data/model/notification_model.dart';

import 'notification_repo.dart';

class NotificationRepoImpl extends NotificationRepo {
  final ApiServices api;

  NotificationRepoImpl({required this.api});
  @override
  Future<Either<List<NotificationModel>, Failure>> getNotifications() async {
    try {
      List<NotificationModel> notifications = [];
      var response = await api.getNotifications();
      for (var item in response) {
        notifications.add(NotificationModel.fromJson(item));
      }
      return Left(notifications);
    } catch (e) {
      return Right(Failure(errMessage: e.toString()));
    }
  }
}
