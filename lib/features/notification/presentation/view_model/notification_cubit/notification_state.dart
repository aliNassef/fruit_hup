part of 'notification_cubit.dart';

@immutable
sealed class NotificationState {}

final class NotificationInitial extends NotificationState {}

final class NotificationLoaded extends NotificationState {
  final List<NotificationModel> notificationList;

  NotificationLoaded({required this.notificationList});
}

final class NotificationLoading extends NotificationState {}

final class NotificationFailure extends NotificationState {
  final String errMessage;

  NotificationFailure({required this.errMessage});
}
