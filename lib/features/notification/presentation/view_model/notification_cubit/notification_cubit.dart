import 'package:bloc/bloc.dart';
import 'package:fruit_hup/features/notification/data/model/notification_model.dart';
import 'package:fruit_hup/features/notification/data/repo/notification_repo.dart';
import 'package:meta/meta.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit(this.notificationRepo) : super(NotificationInitial());
  final NotificationRepo notificationRepo;

  getNotifications() async {
    emit(NotificationLoading());
    await notificationRepo.getNotifications().asStream().listen(
      (event) {
        event.fold((l) {
          emit(NotificationLoaded(notificationList: l));
        }, (r) {
          emit(NotificationFailure(errMessage: r.errMessage));
        });
      },
    );
  }
}
