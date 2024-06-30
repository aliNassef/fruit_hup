part of 'get_offers_cubit.dart';

@immutable
sealed class GetOffersState {}

final class GetOffersInitial extends GetOffersState {}

final class GetOffersLoaded extends GetOffersState {
  final OfferModel instanceOfOfferModel;

  GetOffersLoaded({required this.instanceOfOfferModel});
}

final class GetOffersLoading extends GetOffersState {}

final class GetOffersFailure extends GetOffersState {
  final String errMessage;

  GetOffersFailure({required this.errMessage});
}
