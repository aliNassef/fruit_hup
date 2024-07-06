// import 'dart:developer';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:dartz/dartz.dart';
// import 'package:fruit_hup/constants.dart';
// import 'package:fruit_hup/core/api/api_services.dart';
// import 'package:fruit_hup/core/error/failure.dart';
// import 'package:fruit_hup/features/notification/data/model/notification_model.dart';
// import 'notification_repo.dart';

// class NotificationRepoImpl extends NotificationRepo {
//   final ApiServices api;
//   NotificationRepoImpl({required this.api});
//   @override
//   Future<Either<List<NotificationModel>, Failure>> getNotifications() async {
//     try {
//       var data = await FirebaseFirestore.instance
//           .collection(AppConstants.notificationCollection)
//           .snapshots();
     
//       return Left(data);
//     } catch (e) {
//       return Right(Failure(errMessage: e.toString()));
//     }
//   }
// }
