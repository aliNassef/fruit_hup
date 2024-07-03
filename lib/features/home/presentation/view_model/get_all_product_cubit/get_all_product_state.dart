part of 'get_all_product_cubit.dart';

@immutable
sealed class GetAllProductState {}

final class GetAllProductInitial extends GetAllProductState {}

final class GetAllProductLoading extends GetAllProductState {}

final class GetAllProductLoaded extends GetAllProductState {}

final class GetAllProductFailure extends GetAllProductState {
  final String errMessage;

  GetAllProductFailure({required this.errMessage});
}
