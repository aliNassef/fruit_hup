import '../../../data/models/order_model.dart';

class GetordersState {}

final class GetordersInitial extends GetordersState {}

final class GetordersLoading extends GetordersState {}

final class GetordersLoaded extends GetordersState {
  final List<OrderModel> orders;

  GetordersLoaded({required this.orders});
}

final class GetordersFailure extends GetordersState {
  final String errMessage;

  GetordersFailure({required this.errMessage});
}
