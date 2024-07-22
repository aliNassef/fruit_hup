part of 'fav_cubit.dart';

@immutable
sealed class FavState {}

final class FavInitial extends FavState {}

final class AddToFav extends FavState {}

final class FavLoaded extends FavState {
  final List<ProductModel> products;

  FavLoaded({required this.products});
}

final class FavLoading extends FavState {}

final class FavFailure extends FavState {}
